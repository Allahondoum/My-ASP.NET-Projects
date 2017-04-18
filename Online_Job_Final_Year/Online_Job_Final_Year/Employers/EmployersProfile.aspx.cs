using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year.Employers
{
    public partial class EmployersProfile : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
        public string empFname => lblFirstName.Text;
        public string empLname => lblLastName.Text;
        public string phone => lblPhone.Text;
        public string email => lblEmail.Text;
        public string compname => lblCompanyName.Text;
        public string address => lblAddress.Text;
        public string location => lblLocation.Text;
        public string website => lblWebsite.Text;
        public string special => lblSepcialization.Text;
        public string typeOfEmp => lblTypeOfEmployer.Text;
        public string numofemp => lblNumberOfEmployers.Text;

        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["EmployerUsername"]!= null)
            // {
            try
            {
                var chkusr = "select * from EmployerProfile where Username ='" + (string) Session["EmployerUsername"] +
                             "'";
                con.Open();
                var cmd = new SqlCommand(chkusr, con);
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblFirstName.Text = dr["Fname"].ToString();
                    lblLastName.Text = dr["Lname"].ToString();
                    lblEmail.Text = dr["Email"].ToString();
                    lblPhone.Text = dr["Phone"].ToString();
                    lblCompanyName.Text = dr["CompanyName"].ToString();
                    lblWebsite.Text = dr["CompanyWebsite"].ToString();
                    lblSepcialization.Text = dr["Specialization"].ToString();
                    lblTypeOfEmployer.Text = dr["TypeOfEmployer"].ToString();
                    lblNumberOfEmployers.Text = dr["NumberOfEmployees"].ToString();
                    lblLocation.Text = dr["Location"].ToString();
                    //lblAddress.Text = Session["ID"].ToString();
                    Session["EmployerName"] = lblFirstName.Text;
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
                 Response.Redirect("~/EmployerLogin.aspx");
             }*/
            Session["CompName"] = lblCompanyName.Text;
        }

        

    }
}