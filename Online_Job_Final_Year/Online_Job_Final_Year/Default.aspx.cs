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
        MyGlobalClasses mgc = new MyGlobalClasses();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mgc.bindLocation(drplocation);

                var ds = GetDataSet();
                var catds = GetCategoryDataSet();
                var loc = GetLocationDataSet();


                rptrJobByCategory.DataSource = catds;
                rptrJobByLocation.DataSource = loc;
                rptrJobByCompany.DataSource = ds;
                rptrLiveActivity.DataSource = catds;

                rptrLiveActivity.DataBind();
                rptrJobByLocation.DataBind();
                rptrJobByCompany.DataBind();
                rptrJobByCategory.DataBind();
            }

        }

        protected void search_Click(object sender, EventArgs e)
        {
        }
        private DataSet GetDataSet()
        {
            var dal =
            new SqlDataAdapter(
                "SELECT * FROM EmployerProfile", con);
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
        private DataSet GetLocationDataSet()
        {
            var dal =
            new SqlDataAdapter(
                "SELECT * FROM Location", con);
            var ds = new DataSet();
            dal.Fill(ds);

            // lblSearchTitle.Text = "All Jobs";


            return ds;
        }
        //Properties to be referenced in the result page
        public string Job => txtJobs.Text;
        public string Location => drplocation.SelectedItem.Text;

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
        /*
        protected void search_OnClick(object sender, EventArgs e)
        {
            con.Open();
            var qry = "select * from PostedJobs where JobTitle like '%"+txtJobs.Text+ "%' or Specialization like '%" + txtJobs.Text + "%' and Location like '%"+drplocation.SelectedItem+"%'";

            var cmd = new SqlCommand(qry,con);
            var dr = cmd.ExecuteReader();
        }*/

        protected void search_OnClick(object sender, EventArgs e)
        {
            if (drplocation.SelectedValue == "0")
            {
                lblSelectError.Text = "Select a location.";
            }
        }
    }
}