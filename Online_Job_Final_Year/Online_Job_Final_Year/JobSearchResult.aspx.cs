using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace Online_Job_Final_Year.Jobs
{
    public partial class SearchResult : System.Web.UI.Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
        MyGlobalClasses gc = new MyGlobalClasses();

        protected void Page_Load(object sender, EventArgs e)
        {
            gc.bindLocation(drpLocation);
            gc.bindSpecialization(drpSpecial);
            Default prv = this.PreviousPage;
            if (prv != null && prv.IsCrossPagePostBack)
            {
                try
                {
                    //SearchResultData();
                    SearchResultGetDataSet();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);

                }

            }
            else
            {
                try
                {
                    var ds = GetDataSet();
                    SearchRslt.DataSource = ds;
                    SearchRslt.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);

                }

            }
            if (Request.QueryString["item"] != null)
            {

                    BindJobByCompanies();
            }
            else if(Request.QueryString["name"] != null)
            {
                BindJobByLoc();
            }
            else if (Request.QueryString["cat"] != null)
            {
                BindJobByCategory();
            }
        }

        private void SearchResultGetDataSet()
        {


            Default prv = this.PreviousPage;
            var jobname = prv.Job;
            var joblocation = prv.Location;

            //var qry = "select * from PostedJobs where Specialization = '" + jobname + "' and Location = '"+ joblocation + "'";
            //var qr = "select * from PostedJobs where Specialization like '%" + jobname + "%' and Location like '%" + joblocation + "%'";

            var qr = "select * from PostedJobs where JobTitle like '%" + jobname + "%' or Specialization like '%" + jobname + "%' and Location = '" + joblocation + "'";


            // var all = "select * from PostedJobs";
            var sda = new SqlDataAdapter(qr, con);
                var dt = new DataTable();
                sda.Fill(dt);
                SearchRslt.DataSource = dt;
                SearchRslt.DataBind();

            lblSearchTitle.Text = "Search result for "+jobname+" in "+joblocation;
             con.Close();
        }

        private void BindJobByCompanies()
        {
            try
            {
                con.Open();
                var compName = Request.QueryString["item"];

                var qry = "select * from PostedJobs where CompanyName = '" + compName + "'";
                var dal =
                new SqlDataAdapter(qry, con);
                var ds = new DataSet();
                dal.Fill(ds);
                SearchRslt.DataSource = ds;
                SearchRslt.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private void BindJobByLoc()
        {
            try
            {
                con.Open();
                var locName = Request.QueryString["name"];

                var qry = "select * from PostedJobs where Location = '" + locName + "'";
                var dal =
                new SqlDataAdapter(qry, con);
                var ds = new DataSet();
                dal.Fill(ds);
                SearchRslt.DataSource = ds;
                SearchRslt.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private void BindJobByCategory()
        {
            try
            {
                con.Open();
                var catName = Request.QueryString["cat"];

                var qry = "select * from PostedJobs where Location = '" + catName + "'";
                var dal =
                new SqlDataAdapter(qry, con);
                var ds = new DataSet();
                dal.Fill(ds);
                SearchRslt.DataSource = ds;
                SearchRslt.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private void SearchResultData()
        {
            Default prv = this.PreviousPage;
            var jobname = prv.Job;
            var joblocation = prv.Location;

            var find = "select * from PostedJobs where Specialization like '% + @jobname + %' and Location like '% + @joblocation + %'";
            SqlCommand cmd = new SqlCommand(find, con);
            cmd.Parameters.Add("@jobname", SqlDbType.NVarChar).Value = jobname;
            cmd.Parameters.Add("@joblocation", SqlDbType.NVarChar).Value = joblocation;
            con.Open();
            cmd.ExecuteNonQuery();

            var da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();

            da.Fill(ds);
            SearchRslt.DataSource = ds;
            SearchRslt.DataBind();

            con.Close();
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

        protected void SearchRslt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (SearchRslt.Items.Count >= 1) return;
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lblEmpty = (Label)e.Item.FindControl("lblEmptymss");

                lblEmpty.Text = "0 result found for this search";
                lblEmpty.Visible = true;
                //Label lblEmpty = (Label)e.Item.FindControl("lblEmptymss");
            }
        }

        protected void pagerlnk_OnClick(object sender, EventArgs e)
        {

        }
    }
}