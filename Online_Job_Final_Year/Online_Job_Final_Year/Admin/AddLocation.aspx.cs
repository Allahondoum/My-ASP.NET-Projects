using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Admin
{
    public partial class AddLocation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminUsrname"] != null)
            //{
            //    if (!IsPostBack)
                    {
                        BindRptrCountry();
                    }
            //}
            //else
            //{
            //    Response.Redirect("~/AdminLogin.aspx.cs");
            //}

        }

        private void BindRptrCountry()
        {

            var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

            string find = "select * from Location";
            con.Open();
            SqlCommand cmd = new SqlCommand(find, con);



            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataSet ds = new DataSet();

            da.Fill(ds);
            rptrCountry.DataSource = ds;
            rptrCountry.DataBind();

            con.Close();
        }

        protected void btnAddCountry_OnClick(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var chkusr = "select LocationName from Location where LocationName ='" + txtAddCountry.Text + "'";
                cnn.Open();
                var cmd = new SqlCommand(chkusr, cnn);
                var dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    Response.Write(
                        "<script>alert('The country you are adding already exist.')</script>");

                    cnn.Close();
                }
                else
                {
                    con.Open();
                    var addCountry =
                        "INSERT INTO Location(LocationName) VALUES (@location)";


                    var cmd1 = new SqlCommand(addCountry, con);
                    cmd1.Parameters.AddWithValue("@location", txtAddCountry.Text);
                    cmd1.ExecuteNonQuery();
                    txtAddCountry.Text = string.Empty;

                    con.Close();
                }
                BindRptrCountry();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}