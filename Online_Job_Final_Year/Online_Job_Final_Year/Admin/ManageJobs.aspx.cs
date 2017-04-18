using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Admin
{
    public partial class ManagePost : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminUsrname"] != null)
            //{
            if (!IsPostBack)
            {
                BindrptrPostedJobbs();
            }
            //}
            //else
            //{
            //    Response.Redirect("~/AdminLogin.aspx.cs");
            //}
        }
        private void BindrptrPostedJobbs()
        {
            try
            {
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                string find = "select * from PostedJobs";
                con.Open();
                SqlCommand cmd = new SqlCommand(find, con);



                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds);
                rptrPostedJobs.DataSource = ds;
                rptrPostedJobs.DataBind();

                con.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);

            }

        }
    }
}