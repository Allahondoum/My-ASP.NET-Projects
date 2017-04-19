using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisMultiView.ActiveViewIndex = 0;
        }

        protected void btnRegUser_Click(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());


                var chkusr = "select Username from UserLogin where Username ='" + txtUsername.Text + "'";
                cnn.Open();
                var cmd1 = new SqlCommand(chkusr, cnn);
                var dr = cmd1.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write(
                        "<script>alert('The username you chose as already been taken try another one.')</script>");

                    cnn.Close();
                }
                else
                {
                    con.Open();
                    var AddUserInfo =
                        "INSERT INTO UserRegistration(FirstName, LastName,Gender,Username,DOB,Email,Phone, Address, Location,Category) VALUES (@Fname, @Lname, @Gender, @Username, @DOB, @Email, @Phone,@Address, @Location, @Category)";
                    var AddLoginInfo =
                        "INSERT INTO UserLogin(Username,Password,Category) VALUES (@Username,@Password,@Category)";

                    //Creating SqlCommand objects for the two statements
                    var cmd2 = new SqlCommand(AddUserInfo, con);
                    var cmd3 = new SqlCommand(AddLoginInfo, con);

                    //Adding to the UserLogin Table
                    cmd3.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd3.Parameters.AddWithValue("@Password", txtPass.Text);
                    cmd3.Parameters.AddWithValue("@Category", txtCategory.SelectedValue);


                    //Inserting to the UserIfnoTable
                    cmd2.Parameters.AddWithValue("@Fname", txtFname.Text);
                    cmd2.Parameters.AddWithValue("@Lname", txtLName.Text);
                    cmd2.Parameters.AddWithValue("@Gender", drpGender.SelectedValue);
                    cmd2.Parameters.AddWithValue("@DOB", txtDOB.Text);
                    cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd2.Parameters.AddWithValue("@Location", txtLocation.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Category", txtCategory.SelectedValue);
                    

                    cmd3.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    
                    con.Close();
                    RegisMultiView.ActiveViewIndex = 1;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                
            }
            

        }

        protected void btn_BackToLogin(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}