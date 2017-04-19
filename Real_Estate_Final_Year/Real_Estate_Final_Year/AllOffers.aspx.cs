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
    public partial class AllOffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRptrProperty();
            }
        }

        private void BindRptrProperty()
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
                rptrProperty.DataSource = ds;
                rptrProperty.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Redirect(ex.Message);
            }
        }
    }
}