using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Job_Final_Year.Admin
{
    public partial class AddCities : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminUsrname"] != null)
            //{
                if (!IsPostBack)
                {
                    BindCountries();
                    BindRptrCities();
                }
            //}
            //else
            //{
            //    Response.Redirect("~/AdminLogin.aspx.cs");
            //}
        }

        private void BindRptrCities()
        {
            try
            {
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                string find = "select A.*,B.* from Cities A inner join Countries B on B.CountryID = A.CountryID";
                con.Open();
                SqlCommand cmd = new SqlCommand(find, con);



                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                DataTable dt = new DataTable();

                da.Fill(dt);
                rptrCities.DataSource = dt;
                rptrCities.DataBind();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                
            }
            
        }

        private void BindCountries()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var query = "Select* from Countries";
                var
                cmd = new SqlCommand(query, con);
                con.Open();
                var sqlda = new SqlDataAdapter(cmd);
                var dt = new DataTable();

                sqlda.Fill(dt);

                if (dt.Rows.Count == 0) return;
                drpCountry.DataSource = dt;
                drpCountry.DataTextField = "CountryName";
                drpCountry.DataValueField = "CountryID";
                drpCountry.DataBind();
                drpCountry.Items.Insert(0, new ListItem("-Select-", "0"));
                con.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);
                
            }
          
        }

        protected void OnClickAddCity(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


                var chkusr = "select CityName from Cities where CityName ='" + txtCity.Text + "'";
                cnn.Open();
                var cmd = new SqlCommand(chkusr, cnn);
                var dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    Response.Write(
                        "<script>alert('The City you are adding already exist.')</script>");

                    cnn.Close();
                }
                else
                {
                    con.Open();
                    var addCity =
                        "INSERT INTO Cities(CityName,CountryID) VALUES (@city, @countID)";


                    var cmd1 = new SqlCommand(addCity, con);
                    cmd1.Parameters.AddWithValue("@city", txtCity.Text);
                    cmd1.Parameters.AddWithValue("@countID", drpCountry.SelectedItem.Value);
                    cmd1.ExecuteNonQuery();
                    txtCity.Text = string.Empty;
                    drpCountry.ClearSelection();
                    drpCountry.Items.FindByValue("0").Selected = true;

                    con.Close();
                }
                BindRptrCities();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}