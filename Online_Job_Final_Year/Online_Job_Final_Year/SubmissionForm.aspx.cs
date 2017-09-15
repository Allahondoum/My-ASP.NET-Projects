using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Online_Job_Final_Year
{
    public partial class SubmissionForm : System.Web.UI.Page
    {
        private readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
        MyGlobalClasses gc = new MyGlobalClasses();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["SeekerUsrname"] != null)
                {
                    try
                    {
                        var ds = GetDataSet();
                        rptrJobSummary.DataSource = ds;
                        rptrJobSummary.DataBind();
                        GetSeekerData();
                        gc.bindLocation(drpSeekerCountry);
                    }
                    catch (Exception ex)
                    {

                        Response.Write(ex.Message);
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("JobDetails.aspx");
            }
        }
        private int seekerID;
        protected void GetSeekerData()
        {
            var qry = "select * from JobSeekerProfile where Username ='" + (string)Session["SeekerUsrname"] + "'";
            con.Open();
            var cmd = new SqlCommand(qry, con);
            var dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                FirstName.Text = dr["Fname"].ToString();
                LastName.Text = dr["Lname"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                drpSeekerCountry.Text = dr["Location"].ToString();
                HighestEducation.Text = dr["HighestEducation"].ToString();
                YearOfExperience.Text = dr["YearOfExperience"].ToString();
                seekerID = Convert.ToInt32(dr["SeekerID"].ToString());
            }
            else
            {
                // Response.Write("No information to display");
            }

            con.Close();
        }
        private DataSet GetDataSet()
        {
            var jobid = Convert.ToInt32(Request.QueryString[0]);


            var dal =
            new SqlDataAdapter(
                "select * from PostedJobs where JobID ='" + jobid + "'", con);
            var ds = new DataSet();
            var dt = new DataTable();

            dal.Fill(ds);
            // lblSearchTitle.Text = "All Jobs";


            return ds;
        }
        protected void btnSubmitApplication_OnClick(object sender, EventArgs e)
        {
            lblalert.Visible = true;

        }
    }
}