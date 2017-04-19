using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year.Builder
{
    public partial class BuilderMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblBuilderUser.Text = (string)Session["BuilderName"];
        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("BuilderUsrname");
            Session.Remove("CompareBuilderPass");
            Session.Remove("BuilderName");
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}