using System;
using System.Web.UI;

namespace Online_Job_Final_Year.Employers
{
    public partial class EmployerMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSeekerUser.Text = (string) Session["EmployerName"];
        }

        protected void EmployerLogout(object sender, EventArgs e)
        {
            Session.Remove("EmployerName");
            Session.Remove("EmployerUsername");
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}