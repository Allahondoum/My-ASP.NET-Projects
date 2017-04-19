using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly SqlConnection con =
    new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //    if (Request.Cookies["CookUAname"] != null && Request.Cookies["CookUAPassword"] != null)
            //    {
            //        txtUserName.Text = Request.Cookies["CookUAname"].Value;
            //        txtPassword.Attributes["value"] = Request.Cookies["CookUAPassword"].Value;
            //        RemberMe.Checked = true;
            //    }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
        try
            {
                con.Open();
                var chkusr = "select * from UserLogin where Username ='" + txtUserName.Text + "' and Password ='" +
                             txtPassword.Text + "'";

                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                    if (dr.HasRows)
                    {
                        switch (dr["Category"].ToString())
                        {
                            case "Agent":
                                if (RemberMe.Checked)
                                {
                                    Response.Cookies["CookUAname"].Value = txtUserName.Text;
                                    Response.Cookies["CookUAPassword"].Value = txtPassword.Text;

                                    Response.Cookies["CookUAname"].Expires = DateTime.Now.AddDays(1);
                                    Response.Cookies["CookUAPassword"].Expires = DateTime.Now.AddDays(1);
                                }
                                else
                                {
                                    Response.Cookies["CookUAname"].Expires = DateTime.Now.AddDays(-1);
                                    Response.Cookies["CookUAPassword"].Expires = DateTime.Now.AddDays(-1);
                                }
                                //Session["SeekerName"] = dr["Fname"].ToString();
                                Session["AgentUsername"] = dr["Username"].ToString();
                                Session["CompareAgentPass"] = dr["Password"].ToString();
                                Response.Redirect("~/Agents/AgentProfile.aspx");
                                break;
                            case "Builder":
                                if (RemberMe.Checked)
                                {
                                    Response.Cookies["CookBUname"].Value = txtUserName.Text;
                                    Response.Cookies["CookBUPassword"].Value = txtPassword.Text;

                                    Response.Cookies["CookBUname"].Expires = DateTime.Now.AddDays(1);
                                    Response.Cookies["CookBUPassword"].Expires = DateTime.Now.AddDays(1);
                                }
                                else
                                {
                                    Response.Cookies["CookBUname"].Expires = DateTime.Now.AddDays(-1);
                                    Response.Cookies["CookBUPassword"].Expires = DateTime.Now.AddDays(-1);
                                }
                                //Session["SeekerName"] = dr["Fname"].ToString();
                                Session["BuilderUsrname"] = dr["Username"].ToString();
                                Session["CompareBuilderPass"] = dr["Password"].ToString();
                                Response.Redirect("~/Builder/BuilderProfile.aspx");
                                break;
                            case "Customer":
                                if (RemberMe.Checked)
                                {
                                    Response.Cookies["CookCUname"].Value = txtUserName.Text;
                                    Response.Cookies["CookCUPassword"].Value = txtPassword.Text;

                                    Response.Cookies["CookCUname"].Expires = DateTime.Now.AddDays(1);
                                    Response.Cookies["CookUPassword"].Expires = DateTime.Now.AddDays(1);
                                }
                                else
                                {
                                    Response.Cookies["CookCUname"].Expires = DateTime.Now.AddDays(-1);
                                    Response.Cookies["CookCUPassword"].Expires = DateTime.Now.AddDays(-1);
                                }
                                //Session["SeekerName"] = dr["Fname"].ToString();
                                Session["CustUsrname"] = dr["Username"].ToString();
                                Session["CompareCustPass"] = dr["Password"].ToString();
                                Response.Redirect("~/Customers/CustomerProfile.aspx");
                                break;
                            default:
                                FailureText.Text = "Your account doesn't exist in our database.";
                                break;
                                
                        }
                       
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