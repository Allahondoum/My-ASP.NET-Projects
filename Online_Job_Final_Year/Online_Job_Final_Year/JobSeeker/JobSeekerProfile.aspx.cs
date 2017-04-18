using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.JobSeeker
{
    public partial class JobSeekerProfile : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        public string SeekerFname => lblFirstName.Text;

        public string SeekerLname => lblLastName.Text;

        public string SeekerEmail => lblEmail.Text;

        public string SeekerPhone => lblPhone.Text;

        public string SeekerGender => lblGender.Text;

        public string SeekerLocation => lblLocation.Text;

        public string SeekerDOB => lblDOB.Text;

        public string SeekerSpecialization => lblSepcialization.Text;

        public string SeekerSalary => lblSalary.Text;

        public string SeekerEducation => lblHighestEdu.Text;

        public string SeekerExperience => lblYearOfExp.Text;


        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["SeekerUsrname"] != null)
            //{


            try
            {
                var chkusr = "select * from JobSeekerProfile where Username='" + (string) Session["SeekerUsrname"] + "'";
                con.Open();
                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    //string dob = ;
                    var dt = Convert.ToDateTime(dr["DOB"].ToString());

                    var birth = dt.ToString("dd/MM/yyyy");


                    //ToString("dd-MM-yyyy");

                    //string birth = ((DateTime)(dob)).


                    lblFirstName.Text = dr["Fname"].ToString();
                    lblLastName.Text = dr["Lname"].ToString();
                    lblEmail.Text = dr["Email"].ToString();
                    lblDOB.Text = birth;
                    lblGender.Text = dr["Gender"].ToString();
                    lblHighestEdu.Text = dr["HighestEducation"].ToString();
                    lblLocation.Text = dr["Location"].ToString();
                    lblPhone.Text = dr["Phone"].ToString();
                    lblSepcialization.Text = dr["Specialization"].ToString();
                    lblYearOfExp.Text = dr["YearOfExperience"].ToString();
                    lblSalary.Text = dr["Salary"].ToString();


                    Session["SeekerName"] = dr["Fname"].ToString();
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
            }
            /* }
             else
             {
                 Response.Redirect("~/Login.aspx");
             }*/
        }
    }
}