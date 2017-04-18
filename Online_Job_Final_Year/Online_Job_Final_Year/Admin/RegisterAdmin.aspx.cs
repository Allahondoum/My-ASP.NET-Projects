using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Admin
{
    public partial class RegisterAdmin : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminUsrname"] != null)
            //{
                RegisAdminMultiView.ActiveViewIndex = 0;
            //}
            //else
            //{
            //    Response.Redirect("~/AdminLogin.aspx.cs");
            //}
        }

        protected void btnRegAdmin_Click(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


                var chkusr = "select Username from SeekerLogin where Username ='" + txtUsername.Text + "'";
                cnn.Open();
                var cmd1 = new SqlCommand(chkusr, cnn);
                var dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    /*txtUsernameErrMess.Text = "The username you chose as already been taken try another one";
                    txtUsernameErrMess.Visible = true;*/
                    Response.Write(
                        "<script>alert('The username you chose as already been taken try another one.')</script>");

                    cnn.Close();
                }
                else
                {
                    con.Open();
                    var AddAdminProfileInfo =
                        "INSERT INTO AdminProfile(FirstName, LastName, Username, Email, Phone, DOB, AdminAddress, Gender, Accreditation) VALUES (@FirstName, @LastName, @Username, @Email, @Phone, @DOB, @AdminAddress, @Gender, @Accreditation)";
                    var AddAdminLoginInfo = "INSERT INTO AdminLogin(Username,Password) VALUES (@Username,@Password)";

                    //Creating SqlCommand objects for the two statements
                    var cmd2 = new SqlCommand(AddAdminProfileInfo, con);
                    var cmd3 = new SqlCommand(AddAdminLoginInfo, con);

                    //@FirstName, @LastName, @Username, @Email, @Phone, @DOB, @AdminAddress, @Gender, @Accreditation
                    //Adding to the SeekerLogin Table
                    cmd3.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd3.Parameters.AddWithValue("@Password", txtPass.Text);


                    //Inserting to the JobSeekerProfile Table
                    cmd2.Parameters.AddWithValue("@FirstName", txtFname.Text);
                    cmd2.Parameters.AddWithValue("@LastName", txtLName.Text);
                    cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@DOB", txtDOB.Text);
                    cmd2.Parameters.AddWithValue("@AdminAddress", txtAddress.Text);
                    cmd2.Parameters.AddWithValue("@Gender", drpGender.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Accreditation", drpRole.SelectedValue);

                    cmd3.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();

                    con.Close();
                    RegisAdminMultiView.ActiveViewIndex = 1;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_BackToLogin(object sender, EventArgs e)
        {
        }
    }
}