using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Employers
{
    public partial class EditProfile : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            EditProfileMultiView.ActiveViewIndex = 0;
            try
            {
                var prevPage = (EmployersProfile)Page.PreviousPage;
                if (prevPage != null)
                {

                    txtFirstName.Text = prevPage.empFname;
                    txtLastName.Text = prevPage.empLname;
                    txtEmail.Text = prevPage.email;
                    txtPhone.Text = prevPage.phone;
                    txtCompanyName.Text = prevPage.compname;
                    txtCompanyWeb.Text = prevPage.website;
                    txtspeciality.Text = prevPage.special;
                    txtTypeOfEmployer.Text = prevPage.typeOfEmp;
                    txtNumberOfEmployee.Text = prevPage.numofemp;
                    txtCountry.Text = prevPage.location;

                }
                else
                {
                    Response.Redirect("~/Employers/EmployersProfile.aspx");

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
               
            }
            

           
        }

        protected void btnClose(object sender, EventArgs e)
        {
            Response.Redirect("~/Employers/EmployersProfile.aspx");
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employers/EmployersProfile.aspx");
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            try
            {
                //var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
                var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


                var chkusr = "select Username from EmployerProfile where Username ='" +
                             (string)Session["EmployerUsername"] + "'";
                con.Open();
                var cmd1 = new SqlCommand(chkusr, con);
                var dr = cmd1.ExecuteReader();

                if (dr.HasRows)
                {
                    con.Close();
                    conn.Open();
                    var updateEmployer =
                        "UPDATE EmployerProfile SET Fname = @Fname, Lname = @Lname, Email = @Email, Phone = @Phone, CompanyName = @CompanyName, CompanyWebsite = @CompanyWebsite, Specialization = @Specialization, TypeOfEmployer = @TypeOfEmployer, NumberOfEmployees = @NumberOfEmployees,Location = @Location WHERE Username = '" +
                        (string)Session["EmployerUsername"] + "'";
                    var cmd2 = new SqlCommand(updateEmployer, conn);

                    cmd2.Parameters.AddWithValue("@Fname", txtFirstName.Text);
                    cmd2.Parameters.AddWithValue("@Lname", txtLastName.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                    cmd2.Parameters.AddWithValue("@CompanyWebsite", txtCompanyWeb.Text);
                    cmd2.Parameters.AddWithValue("@Specialization", txtspeciality.SelectedValue);
                    cmd2.Parameters.AddWithValue("@TypeOfEmployer", txtTypeOfEmployer.SelectedValue);
                    cmd2.Parameters.AddWithValue("@NumberOfEmployees", txtNumberOfEmployee.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Location", txtCountry.SelectedValue);


                    cmd2.ExecuteNonQuery();
                    conn.Close();
                    EditProfileMultiView.ActiveViewIndex = 1;
                }
                else
                {
                    Response.Write("<script>alert('The account you are trying to update does no exist.')</script>");
                    con.Close();
                    //Response.Redirect("~/Employers/EmployersProfile.aspx");
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