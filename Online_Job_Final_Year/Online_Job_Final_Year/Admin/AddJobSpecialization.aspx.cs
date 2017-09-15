using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Online_Job_Final_Year.Admin
{
    public partial class AddJobSpecialization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminUsrname"] != null)
            //{
                if (!IsPostBack)
                {
                    BindrptrSpecialities();
                }
            //}
            //else
            //{
            //    Response.Redirect("~/AdminLogin.aspx.cs");
            //}
        }

        private void BindrptrSpecialities()
        {
            try
            {
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

               string find = "select * from Specialization";
                con.Open();
                SqlCommand cmd = new SqlCommand(find, con);
               // cmd.CommandType = CommandType.StoredProcedure;


                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                DataSet ds = new DataSet();

                da.Fill(ds);
                rptrSpecialities.DataSource = ds;
                rptrSpecialities.DataBind();

                con.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);

            }

        }

        protected void Click_AddSepecial(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var chkusr = "select SpecialityName from Specialization where SpecialityName ='" + txtAddSpecial.Text + "'";
                cnn.Open();
                var cmd = new SqlCommand(chkusr, cnn);
                var dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    Response.Write(
                        "<script>alert('The speciality you are adding already exist.')</script>");

                    cnn.Close();
                }
                else
                {
                    con.Open();
                    var addSpeciality =
                        "INSERT INTO Specialization(SpecialityName) VALUES (@special)";


                    var cmd1 = new SqlCommand(addSpeciality, con);
                    cmd1.Parameters.AddWithValue("@special", txtAddSpecial.Text);
                    cmd1.ExecuteNonQuery();
                    txtAddSpecial.Text = string.Empty;

                    con.Close();
                }
                BindrptrSpecialities();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}