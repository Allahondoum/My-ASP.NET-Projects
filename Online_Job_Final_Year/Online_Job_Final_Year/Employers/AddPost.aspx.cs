using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Employers
{
    public partial class AddPost : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            SubmitJobMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Next(object sender, EventArgs e)
        {
            SubmitJobMultiView.ActiveViewIndex = 1;
        }

        protected void btn_Goto_Step1(object sender, EventArgs e)
        {
            SubmitJobMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Goto_Summary(object sender, EventArgs e)
        {
            lblJobTitle.Text = txtJobTitle.Text;
            lblCategory.Text = txtCategory.SelectedValue;
            lblDesc.Text = txtDescription.Text;
            lblRequirement.Text = txtQualiRequirement.Text;
            lblJobType.Text = txtJobType.SelectedValue;
            lblJobLevel.Text = txtLevel.SelectedValue;
            lblLocation.Text = txtLocation.SelectedValue;
            lblSpecialization.Text = txtspeciality.SelectedValue;
            lblMiniRequirement.Text = txtMiniQualif.SelectedValue;
            lblYearOfExp.Text = txtPreferedYearOfExp.SelectedValue;
            lblSalary.Text = txtSalary.SelectedValue;
            lblExpDate.Text = txtExpiryDate.Text;


            SubmitJobMultiView.ActiveViewIndex = 1;
        }

        protected void btn_Goto_Step2(object sender, EventArgs e)
        {
            SubmitJobMultiView.ActiveViewIndex = 1;
        }

        protected void btn_Finish(object sender, EventArgs e)
        {
            var pl = new EmployersProfile();

            var Uname = (string) Session["EmployerUsername"];
            var compName = (string) Session["CompName"];
            try
            {
                con.Open();
                var AddJob =
                    "INSERT INTO PostedJobs(Username, CompanyName, JobTitle, Category, Description, Requirement, JobLevel, JobType, Specialization, MiniQualif, Location, Salary, Experience, Deadline) VALUES (@Username, @CompanyName, @JobTitle, @Category, @Description, @Requirement, @JobLevel, @JobType, @Specialization, @MiniQualif, @Location, @Salary, @Experience, @Deadline)";
                var cmd2 = new SqlCommand(AddJob, con);

                cmd2.Parameters.AddWithValue("@Username", Uname);
                cmd2.Parameters.AddWithValue("@CompanyName", compName);
                cmd2.Parameters.AddWithValue("@JobTitle", txtJobTitle.Text);
                cmd2.Parameters.AddWithValue("@Category", txtCategory.SelectedValue);
                cmd2.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd2.Parameters.AddWithValue("@Requirement", txtQualiRequirement.Text);
                cmd2.Parameters.AddWithValue("@JobLevel", txtLevel.SelectedValue);
                cmd2.Parameters.AddWithValue("@JobType", txtJobType.SelectedValue);
                cmd2.Parameters.AddWithValue("@Specialization", txtspeciality.SelectedValue);
                cmd2.Parameters.AddWithValue("@MiniQualif", txtMiniQualif.SelectedValue);
                cmd2.Parameters.AddWithValue("@Location", txtLocation.SelectedValue);
                cmd2.Parameters.AddWithValue("@Salary", txtSalary.SelectedValue);
                cmd2.Parameters.AddWithValue("@Experience", txtPreferedYearOfExp.SelectedValue);
                cmd2.Parameters.AddWithValue("@Deadline", txtExpiryDate.Text);


                cmd2.ExecuteNonQuery();
                con.Close();
                SubmitJobMultiView.ActiveViewIndex = 2;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}