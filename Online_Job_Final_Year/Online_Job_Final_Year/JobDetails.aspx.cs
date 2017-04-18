using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            var jobid = Convert.ToInt32(Request.QueryString["item"]);

            var dal =
            new SqlDataAdapter(
                "select * from PostedJobs where JobID ='"+ jobid + "'", con);
            var ds = new DataSet();
            dal.Fill(ds);

           // lblSearchTitle.Text = "All Jobs";


            return ds;
        }

        //protected void btnAppply_OnClick(object sender, EventArgs e)
        //{
        //    var ds = GetDataSet();
        //    rptrJobDetails.DataSource = ds;
           
        //    var jobid = Convert.ToInt32(Request.QueryString["item"]);
        //    //< a class="btn btn-primary" href="JobSubmission.aspx?item=<%# Eval("JobID")%>&item1=<%# Eval("JobTitle")%>">Apply</a>
        //    string itm = Server.UrlEncode(Eval("JobID").ToString());
            

        //    Response.Redirect("JobSubmission.aspx?item="+jobid+"&item2="+itm);
        //}
    }
}