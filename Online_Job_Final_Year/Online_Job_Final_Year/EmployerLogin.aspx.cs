using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year
{
    public partial class EmployerLogin : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        MyGlobalClasses gc = new MyGlobalClasses();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["CookEmpUname"] != null && Request.Cookies["CookEmpPass"] != null)
                {
                    txtUserName.Text = Request.Cookies["CookEmpUname"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["CookEmpPass"].Value;
                    RememberMe.Checked = true;
                }
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var pass = gc.Encrypt(txtPassword.Text);
            try
            {
                con.Open();
                var chkusr = "select * from EmployerLogin where Username ='" + txtUserName.Text + "' and Password='" +
                            pass + "'";

                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    if (dr.HasRows)
                    {
                        if (RememberMe.Checked)
                        {
                            Response.Cookies["CookEmpUname"].Value = txtUserName.Text;
                            Response.Cookies["CookEmpPass"].Value = pass;

                            Response.Cookies["CookEmpUname"].Expires = DateTime.Now.AddDays(1);
                            Response.Cookies["CookEmpPass"].Expires = DateTime.Now.AddDays(1);
                        }
                        else
                        {
                            Response.Cookies["CookEmpUname"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["CookEmpPass"].Expires = DateTime.Now.AddDays(-1);
                        }
                        //Session["EmployerName"] = dr["Fname"].ToString();
                        Session["EmployerUsername"] = dr["Username"].ToString();
                        Session["ComparePass"] = dr["Password"].ToString();
                        //Session["ID"] = dr["EmpID"].ToString();
                        Response.Redirect("~/Employers/EmployersProfile.aspx");
                    }
                    else
                    {
                        FailureText.Text = "wrong username and password.";
                    }
                }
                else
                {
                    FailureText.Text = "wrong username and password.";
                }


                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}