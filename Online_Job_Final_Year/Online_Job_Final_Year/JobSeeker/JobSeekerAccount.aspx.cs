using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.JobSeeker
{
    public partial class JobSeekerAccount : Page
    {
        MyGlobalClasses gc = new MyGlobalClasses();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SeekerUsrname"] != null)
                AccountUpdateMultiView.ActiveViewIndex = 0;
            else
                Response.Redirect("~/Login.aspx");
        }

        protected void btn_Update_Account(object sender, EventArgs e)
        {
            var pass = gc.Encrypt(txtCurrentPass.Text);
            var repass = gc.Encrypt(txtNewPass.Text);
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
                var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


                var chkusr = "select Username from JobSeeKerProfile where Username ='" + (string) Session["SeekerUsrname"] +
                             "'";
                cnn.Open();
                var cmd1 = new SqlCommand(chkusr, cnn);
                var dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    if (pass == (string) Session["CompareSeekerPass"])
                    {
                        cnn.Close();
                        conn.Open();
                        var UpdateEmployerLogin =
                            "UPDATE JobSeeKerProfile SET Username = @Username,Password = @Password WHERE Username = '" +
                            (string) Session["SeekerUsrname"] + "'";
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
                    Response.Redirect("~/JobSeeker/JobSeekerProfile.aspx");
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
            Session.Remove("SeekerUsrname");
            Session.RemoveAll();
            Response.Redirect("~/Login.aspx");
        }

        protected void btn_Cancel(object sender, EventArgs e)
        {
            Response.Redirect("~/JobSeeker/JobSeekerProfile.aspx");
        }
    }
}