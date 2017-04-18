using System;
using System.Web.UI;

namespace Online_Job_Final_Year.JobSeeker
{
    public partial class JobSeekerMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAdminUser.Text = (string) Session["SeekerName"];
        }

        protected void JobSeekerlogout(object sender, EventArgs e)
        {
            Session.Remove("SeekerName");
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}