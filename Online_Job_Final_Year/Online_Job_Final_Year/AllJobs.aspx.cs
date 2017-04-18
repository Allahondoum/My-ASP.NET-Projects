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
    public partial class AllJobs : System.Web.UI.Page
    {
        private readonly SqlConnection con =
    new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {
            
                try
                {
                    var ds = GetDataSet();
                    grdViewJobs.DataSource = ds;
                    grdViewJobs.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);

                }

        }
        private DataSet GetDataSet()
        {
            var dal =
            new SqlDataAdapter(
                "select * from PostedJobs", con);
            var ds = new DataSet();
            dal.Fill(ds);

            lblSearchTitle.Text = "All Jobs";


            return ds;
        }

        protected void grdViewJobs_PageIndexChanged(object sender, EventArgs e)
        {
            grdViewJobs.PageIndex = 1;
        }
    }
}