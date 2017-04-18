using System;
using System.Web.UI;

namespace Online_Job_Final_Year
{
    public partial class MainSignUp : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Open_JobSeeker_Form(object sender, EventArgs e)
        {
            Response.Redirect("~/JobSeekerRegistration.aspx");
        }

        protected void Open_Employer_Form(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployerRegistration.aspx");
        }
    }
}