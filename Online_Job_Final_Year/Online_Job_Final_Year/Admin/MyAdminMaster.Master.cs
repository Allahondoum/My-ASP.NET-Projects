using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Job_Final_Year.Admin
{
    public partial class MyAdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAdminUser.Text = (string)Session["AdminName"];
        }

        protected void logout(object sender, EventArgs e)
        {
            Session.Remove("SeekerUsrname");
            Session.Remove("CompareSeekerPass");
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}