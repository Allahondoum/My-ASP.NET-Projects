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
    public partial class PropertyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["item"] != null)
            {
                if (!IsPostBack)
                {
                    BindPropDetails();
                }
            }
            else
            {
                Response.Redirect("~/AllOffers.aspx");
           }

        }

        private void BindPropDetails()
        {
            try
            {
                var proId = Convert.ToInt32(Request.QueryString["item"]);
                SqlConnection con =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());

                var dal =
                new SqlDataAdapter(
                    "select * from AddedProperties where ProID = "+ proId + "", con);
                var ds = new DataSet();
                dal.Fill(ds);
                rptrPropDetails.DataSource = ds;
                rptrPropDetails.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Redirect(ex.Message);
            }
        }
    }
}