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

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                var chkusr = "select * from EmployerLogin where Username ='" + txtUserName.Text + "' and Password='" +
                             txtPassword.Text + "'";

                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    if (dr.HasRows)
                    {
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