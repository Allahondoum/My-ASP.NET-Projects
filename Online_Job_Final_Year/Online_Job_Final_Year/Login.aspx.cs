using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year
{
    public partial class Login : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.Cookies["CookSeekerUname"] != null && Request.Cookies["CookSeekerPassword"] != null)
                {
                    txtUserName.Text = Request.Cookies["CookSeekerUname"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["CookSeekerPassword"].Value;
                    RememberMe.Checked = true;
                }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                var chkusr = "select * from SeekerLogin where Username ='" + txtUserName.Text + "' and Password ='" +
                             txtPassword.Text + "'";

                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                    if (dr.HasRows)
                    {
                        if (RememberMe.Checked)
                        {
                            Response.Cookies["CookSeekerUname"].Value = txtUserName.Text;
                            Response.Cookies["CookSeekerPassword"].Value = txtPassword.Text;

                            Response.Cookies["CookSeekerUname"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["CookSeekerPassword"].Expires = DateTime.Now.AddDays(-1);
                        }
                        else
                        {
                            Response.Cookies["CookSeekerUname"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["CookSeekerPassword"].Expires = DateTime.Now.AddDays(-1);
                        }
                        //Session["SeekerName"] = dr["Fname"].ToString();
                        Session["SeekerUsrname"] = dr["Username"].ToString();
                        Session["CompareSeekerPass"] = dr["Password"].ToString();
                        Response.Redirect("~/JobSeeker/JobSeekerProfile.aspx");
                    }
                    else
                    {
                        FailureText.Text = "This account doesn't exist in our database.";
                    }
                else
                    FailureText.Text = "wrong username or password.";
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}