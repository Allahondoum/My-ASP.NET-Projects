using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.JobSeeker
{
    public partial class EditJobSeekerProfile : Page
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
        MyGlobalClasses gc = new MyGlobalClasses();

        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["SeekerUsrname"] != null)
           {
            EditProfileMultiView.ActiveViewIndex = 0;
                gc.bindLocation(Location);
                gc.bindSpecialization(Specialization);

            var prevPage = PreviousPage;


            if (prevPage != null)
            {
                txtFirstName.Text = prevPage.SeekerFname;
                txtLastName.Text = prevPage.SeekerLname;
                txtPhone.Text = prevPage.SeekerPhone;
                txtEmail.Text = prevPage.SeekerEmail;
                DOB.Text = prevPage.SeekerDOB;
                gender.Text = prevPage.SeekerGender;
                Location.Text = prevPage.SeekerLocation;
                Specialization.Text = prevPage.SeekerSpecialization;
                HighestEducation.Text = prevPage.SeekerEducation;
                YearOfExperience.Text = prevPage.SeekerExperience;
                Salary.Text = prevPage.SeekerSalary;


                /*try
                {
                    string chkusr = "select * from JobSeekerProfile where Username='" + (string)Session["SeekerUsrname"] + "'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(chkusr, con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read() == true)
                    {
                        txtFirstName.Text = dr["Fname"].ToString();
                        txtLastName.Text = dr["Lname"].ToString();
                        txtEmail.Text = dr["Email"].ToString();
                        txtPhone.Text = dr["Phone"].ToString();
                        DOB.Text = dr["DOB"].ToString();
                        gender.Text = dr["Gender"].ToString();
                        Location.Text = dr["Location"].ToString();
                        Specialization.Text = dr["Specialization"].ToString();
                        HighestEducation.Text = dr["HighestEducation"].ToString();
                        YearOfExperience.Text = dr["YearOfExperience"].ToString();
                        Salary.Text = dr["Salary"].ToString();
                    }
                    else
                    {
                        Response.Write("No information to display");
                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                    Response.Redirect(ex.Message);
                }*/
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
                var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


                var chkusr = "select Username from JobSeekerProfile where Username ='" +
                             (string) Session["SeekerUsrname"] + "'";
                cnn.Open();
                var cmd1 = new SqlCommand(chkusr, cnn);
                var dr = cmd1.ExecuteReader();

                if (dr.HasRows)
                {
                    cnn.Close();
                    conn.Open();
                    var updateJobSeeker =
                        "UPDATE JobSeeKerProfile SET Fname = @Fname, Lname = @Lname, Email = @Email, Phone = @Phone, DOB = @DOB, Gender = @Gender, Location = @Location, Specialization = @Specialization, HighestEducation = @HighestEducation,YearOfExperience = @YearOfExperience, Salary=@Salary WHERE Username = '" +
                        (string) Session["SeekerUsrname"] + "'";
                    var cmd2 = new SqlCommand(updateJobSeeker, conn);

                    cmd2.Parameters.AddWithValue("@Fname", txtFirstName.Text);
                    cmd2.Parameters.AddWithValue("@Lname", txtLastName.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@DOB", DOB.Text);
                    cmd2.Parameters.AddWithValue("@Gender", gender.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Location", Location.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Specialization", Specialization.SelectedValue);
                    cmd2.Parameters.AddWithValue("@HighestEducation", HighestEducation.SelectedValue);
                    cmd2.Parameters.AddWithValue("@YearOfExperience", YearOfExperience.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Salary", Salary.SelectedValue);


                    cmd2.ExecuteNonQuery();
                    conn.Close();
                    EditProfileMultiView.ActiveViewIndex = 1;
                }
                else
                {
                    Response.Write("<script>alert('The account are trying to update does no exist.')</script>");
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

        protected void btnClose(object sender, EventArgs e)
        {
            Response.Redirect("~/JobSeeker/JobSeekerProfile.aspx");
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/JobSeeker/JobSeekerProfile.aspx");
        }
    }
}