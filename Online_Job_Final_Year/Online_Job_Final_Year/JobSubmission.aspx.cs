using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Job_Final_Year
{
    public partial class JobSubmission : System.Web.UI.Page
    {
        private readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
      
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
                Response.Redirect("");
            }
        }

        protected void GetSeekerData()
        {
            var qry = "select * from JobSeekerProfile where Username ='"+ (string)Session["SeekerUsrname"] + "'";
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
                Session["CandID"] = Convert.ToInt32(dr["SeekerID"].ToString());
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
         
           foreach (RepeaterItem empId in rptrJobSummary.Items)
           {
               var empid = Convert.ToInt32((Label) empId.FindControl("lblEmpID"));
          
           try
           {
                //var add = "insert into SubmittedJob(JobID,SeekerID,EmployerID,AppliedDate,CoverLetter) values (@Jobid, @Seekid,@Empid,@AppliedDate,@letter)";
                var seekid = Convert.ToInt32(Session["CandID"]);
                


                var jobid = Convert.ToInt32(Request.QueryString[0]);
                var seekname = FirstName.Text + " " + LastName.Text;
                con.Open();

                var cmd = new SqlCommand("insrtSubJobs", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Jobid", jobid);
                cmd.Parameters.AddWithValue("@Seekid", seekid);
                cmd.Parameters.AddWithValue("@Empid", empid);
                cmd.Parameters.AddWithValue("@letter", txtCoverLetter.Text);
                
                    

                cmd.ExecuteNonQuery();
                con.Close();
                    Response.Write("Submission successful");
                }
           catch (Exception ex)
           {
              Response.Write(ex.Message);
           }

            }
        }
    }
}