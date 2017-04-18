using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Employers
{
    public partial class ViewMyJobs : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            var ds = geDataSet();
            ViewPostedJobs.DataSource = ds;
            ViewPostedJobs.DataBind();
        }

        private DataSet geDataSet()
        {
            var da =
                new SqlDataAdapter(
                    "select * from PostedJobs where Username ='" + (string) Session["EmployerUsername"] + "'", con);
            var ds = new DataSet();
            da.Fill(ds);


            return ds;
        }
    }
}