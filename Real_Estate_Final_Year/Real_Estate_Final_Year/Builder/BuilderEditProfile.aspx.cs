using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year.Builder
{
    public partial class BuilderEditProfile : System.Web.UI.Page
    {
       private readonly SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            EditProfileMultiView.ActiveViewIndex = 0;
            GetBuilderDetails();
        }         

        protected void btnClose_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Builder/BuilderProfile.aspx");
        }

        private void GetBuilderDetails()
        {
            var prv = PreviousPage;
            if (prv != null)
            {
                txtFname.Text = prv.BuilderFname;
                txtLName.Text = prv.BuilderLname;
                txtDOB.Text = prv.Builderdob;
                txtEmail.Text = prv.BuilderEmail;
                txtAddress.Text = prv.BuilderAddress;
                txtLocation.Text = prv.BuilderLocation;
                txtPhone.Text = prv.BuilderPhone;
                drpGender.Text = prv.BuilderGender;
                
            }
            else
            {
                Response.Redirect("~/Builder/BuilderProfile.aspx");
            }
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                _con.Open();
                var qry = "UPDATE UserRegistration SET FirstName = @fname, LastName = @lname, Gender = @gender, DOB = @dob, Email = @email, Phone = @phone, Address = @adress, Location = @location WHERE '" + (string)Session["BuilderUsrname"] + "'";

                var cmd = new SqlCommand(qry, _con);
                cmd.Parameters.AddWithValue("@fname", txtFname.Text);
                cmd.Parameters.AddWithValue("@fname", txtLName.Text);
                cmd.Parameters.AddWithValue("@gender", drpGender.SelectedValue);
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@adress", txtAddress.Text);
                cmd.Parameters.AddWithValue("@location", txtLocation.SelectedValue);

                cmd.ExecuteNonQuery();
                _con.Close();
                EditProfileMultiView.ActiveViewIndex = 1;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}