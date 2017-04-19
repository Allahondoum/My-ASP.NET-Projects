using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RptrFeaturedProp();
            }
        }
        private void RptrFeaturedProp()
        {
            try
            {
                SqlConnection con =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());

                var dal =
                new SqlDataAdapter(
                    "select * from AddedProperties", con);
                var ds = new DataSet();
                dal.Fill(ds);
                rptrFeaturedProperty.DataSource = ds;
                rptrFeaturedProperty.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Redirect(ex.Message);
            }
        }

        protected void rptrFeaturedProperty_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var repeater = sender as Repeater;
            if (repeater != null && repeater.Items.Count > 3)
            {
                ((Repeater)sender).Controls.RemoveAt(3);
            }
        }
    }
}