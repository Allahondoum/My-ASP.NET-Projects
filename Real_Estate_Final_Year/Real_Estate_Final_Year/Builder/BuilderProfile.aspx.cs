using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year.Builder
{
    public partial class BuilderProfile : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["BuilderUsrname"]!= null)
            // {
            try
            {
                SqlConnection con =
                    new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());

                var chkusr = "select * from UserRegistration where Username ='" + (string) Session["BuilderUsrname"] +
                             "'";
                con.Open();
                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    var dt = Convert.ToDateTime(dr["DOB"].ToString());

                    var birth = dt.ToString("dd/MM/yyyy");


                    lblFname.Text = dr["FirstName"].ToString();
                   lblLname.Text = dr["LastName"].ToString();
                    ;
                    lblEmail.Text = dr["Email"].ToString();
                    lblPhone.Text = dr["Phone"].ToString();
                    lblDOB.Text = birth;
                    lblAddress.Text = dr["Address"].ToString();
                    lblGender.Text = dr["Gender"].ToString();
                    lblCategory.Text = dr["Category"].ToString();
                    lblLocation.Text = dr["Location"].ToString();
                    Session["BuilderName"] = dr["FirstName"].ToString();

                }
                else
                {
                    Response.Write("No information to display");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Redirect(ex.Message);
            }

            /* }
             else
             {
                 Response.Redirect("~/Default.aspx");
             }*/
        }

        public string BuilderFname => lblFname.Text;

        public string BuilderLname => lblLname.Text;

        public string BuilderEmail => lblEmail.Text;

        public string BuilderPhone => lblPhone.Text;

        public string BuilderGender => lblGender.Text;

        public string BuilderLocation => lblLocation.Text;

        public string Builderdob => lblDOB.Text;
        public string BuilderAddress => lblAddress.Text;
    }
}