using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year
{
    public partial class AdminLogin : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                var chkusr = "select * from AdminLogin where Username ='" + txtUserName.Text + "' and Password ='" +
                             txtPassword.Text + "'";

                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                    if (dr.HasRows)
                    {
                        if (RemberMe.Checked)
                        {
                            Response.Cookies["CookAdminUname"].Value = txtUserName.Text;
                            Response.Cookies["CookAdminPassword"].Value = txtPassword.Text;

                            Response.Cookies["CookAdminUname"].Expires = DateTime.Now.AddDays(10);
                            Response.Cookies["CookAdminPassword"].Expires = DateTime.Now.AddDays(10);
                        }
                        else
                        {
                            Response.Cookies["CookAdminUname"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["CookAdminPassword"].Expires = DateTime.Now.AddDays(-1);
                        }
                        //Session["SeekerName"] = dr["Fname"].ToString();
                        Session["AdminUsrname"] = dr["Username"].ToString();
                        Session["CompareAdminPass"] = dr["Password"].ToString();
                        Response.Redirect("~/Admin/Dashboard.aspx");
                    }
                    else
                    {
                        FailureText.Text = "This account doesn't exist in our database.";
                    }
                else
                    FailureText.Text = "wrong username or password.";
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}