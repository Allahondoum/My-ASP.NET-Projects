using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Online_Job_Final_Year
{
    public partial class JobDetails : System.Web.UI.Page
    {
        private readonly  SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var ds = GetDataSet();
                rptrJobDetails.DataSource = ds;
                rptrJobDetails.DataBind();
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

        }

        private DataSet GetDataSet()
        {

            int jobid = Convert.ToInt32(Request.QueryString["item"]);
            var dal =
            new SqlDataAdapter(
                "select * from PostedJobs where JobID ='"+ jobid + "'", con);
            var ds = new DataSet();
            dal.Fill(ds);


            return ds;
        }

        protected void btnApply_OnClick(object sender, EventArgs e)
        {
            int jobid = Convert.ToInt32(Request.QueryString["item"]);
            Response.Redirect("SubmissionForm.aspx?item="+jobid);
        }
    }
}