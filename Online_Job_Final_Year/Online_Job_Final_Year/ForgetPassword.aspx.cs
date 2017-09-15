using System;

namespace Online_Job_Final_Year
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            forgetPassMultiView.ActiveViewIndex = 0;
        }

        protected void BackToLogin_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void resetPass_OnClick(object sender, EventArgs e)
        {
            forgetPassMultiView.ActiveViewIndex = 1;
        }
    }
}