using System;
using System.Web.UI;

namespace Online_Job_Final_Year
{
    public partial class MainLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Open_JobSeeker_Login(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Open_Employer_Login(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployerLogin.aspx");
        }
    }
}