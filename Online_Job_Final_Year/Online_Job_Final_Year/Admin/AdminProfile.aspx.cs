using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Admin
{
    public partial class AdminProfile : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminUsrname"] != null)
            //{
            try
            {
                var chkusr = "select * from AdminProfile where Username ='" + (string) Session["AdminUsrname"] + "'";
                con.Open();
                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblFirstName.Text = dr["FirstName"].ToString();
                    lblLastName.Text = dr["LastName"].ToString();
                    lblEmail.Text = dr["Email"].ToString();
                    lblPhone.Text = dr["Phone"].ToString();
                    lblDOB.Text = dr["DOB"].ToString();
                    lblAddress.Text = dr["AdminAddress"].ToString();
                    lblGender.Text = dr["Gender"].ToString();
                    lblAccreditation.Text = dr["Accreditation"].ToString();
                    Session["AdminName"] = lblFirstName.Text;
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

            //}
            //else
            //{
            //    Response.Redirect("~/AdminLogin.aspx");
            //}
            // Session["CompName"] = lblFirstName.Text;
        }
    }
}