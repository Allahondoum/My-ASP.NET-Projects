using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Employers
{
    public partial class EmployerAccount : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmployerUsername"] != null)
                AccountUpdateMultiView.ActiveViewIndex = 0;
            else
                Response.Redirect("~/Employers/EmployersProfile.aspx");
        }

        protected void btn_Cancel(object sender, EventArgs e)
        {
            Response.Redirect("~/Employers/EmployersProfile.aspx");
        }

        protected void btn_Update_Account(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
                var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


                var chkusr = "select Username from EmployerLogin where Username ='" +
                             (string) Session["EmployerUsername"] + "'";
                cnn.Open();
                var cmd1 = new SqlCommand(chkusr, cnn);
                var dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    if (txtCurrentPass.Text == (string) Session["ComparePass"])
                    {
                        cnn.Close();
                        conn.Open();
                        var UpdateEmployerLogin =
                            "UPDATE EmployerLogin SET Username = @Username,Password = @Password WHERE Username = '" +
                            (string) Session["EmployerUsername"] + "'";
                        //string UpdateProfileUsername = "UPDATE EmployerProfile SET Username = @Username WHERE UserID = '" + (string)Session["ID"] + "'";

                        var cmd2 = new SqlCommand(UpdateEmployerLogin, conn);
                        //SqlCommand cmd3 = new SqlCommand(UpdateProfileUsername, conn);

                        //Update Login info
                        cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                        cmd2.Parameters.AddWithValue("@Password", txtNewPass.Text);

                        //Update Profile username
                        //cmd3.Parameters.AddWithValue("@Username", txtUsername.Text);


                        cmd2.ExecuteNonQuery();
                        //cmd3.ExecuteNonQuery();
                        conn.Close();
                        AccountUpdateMultiView.ActiveViewIndex = 1;
                    }
                    else
                    {
                        FailureText.Text = "The password does not match!!";
                    }
                }
                else
                {
                    Response.Write("<script>alert('The account you are trying to update does no exist.')</script>");
                    cnn.Close();
                    Response.Redirect("~/Employers/EmployersProfile.aspx");
                }

                cnn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Session.Remove("EmployerUsername");
            Session.RemoveAll();
            Response.Redirect("~/EmployerLogin.aspx");
        }
    }
}