using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year.Builder
{
    public partial class ViewListedProperties : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            BindListedProperty();
            
        }

        private void BindListedProperty()
        {
            try
            {
                con.Open();
                var qry = "select * from AddedProperties where username = '" + (string)Session["BuilderUsrname"] +"'";
                var sda = new SqlDataAdapter(qry, con);
                var ds = new DataSet();
                sda.Fill(ds);
                rptrProperty.DataSource = ds;
                rptrProperty.DataBind();
                con.Close();
            }
            catch (Exception e)
            {
                
                Response.Write(e.Message);
            }
            
            
        }
        private void BindPropDetails()
        {
            try
            {
                con.Open();
                var proId = Convert.ToInt32(Request.QueryString["item"]);

                var dal =
                new SqlDataAdapter(
                    "select * from AddedProperties where ProID = " + proId + "", con);
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

        protected void showProp_OnServerClick(object sender, EventArgs e)
        {
            BindPropDetails();
        }
    }
}