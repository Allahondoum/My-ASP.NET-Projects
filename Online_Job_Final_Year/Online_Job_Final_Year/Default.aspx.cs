using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Job_Final_Year
{
    public partial class Default : Page
    {
        private readonly SqlConnection con =
    new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {
            var ds = GetDataSet();
            var catds = GetCategoryDataSet();
            rptrJobByCategory.DataSource = catds;
            rptrJobByLocation.DataSource = ds;
            rptrJobByCompany.DataSource = ds;
            rptrLiveActivity.DataSource = ds;

            rptrLiveActivity.DataBind();
            rptrJobByLocation.DataBind();
            rptrJobByCompany.DataBind();
            rptrJobByCategory.DataBind();
        }

        protected void search_Click(object sender, EventArgs e)
        {
        }
        private DataSet GetDataSet()
        {
            var dal =
            new SqlDataAdapter(
                "SELECT * FROM PostedJobs", con);
            var ds = new DataSet();
            dal.Fill(ds);

           // lblSearchTitle.Text = "All Jobs";


            return ds;
        }
        private DataSet GetCategoryDataSet()
        {
            var dal =
            new SqlDataAdapter(
                "SELECT * FROM Specialization", con);
            var ds = new DataSet();
            dal.Fill(ds);

            // lblSearchTitle.Text = "All Jobs";


            return ds;
        }
        public string Job => txtJobs.Text;
        public string Location => drplocation.SelectedValue;

        protected void rptrJobByCategory_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            var repeater = sender as Repeater;
            if (repeater != null && repeater.Items.Count > 3)
            {
                ((Repeater) sender).Controls.RemoveAt(3);
            }
        }

        protected void rptrJobByLocation_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var repeater = sender as Repeater;
            if (repeater != null && repeater.Items.Count > 3)
            {
                ((Repeater) sender).Controls.RemoveAt(3);
            }
        }

        protected void rptrJobByCompany_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var repeater = sender as Repeater;
            if (repeater != null && repeater.Items.Count > 3)
            {
                ((Repeater)sender).Controls.RemoveAt(3);
            }
        }
    }
}