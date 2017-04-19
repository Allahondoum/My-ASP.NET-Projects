using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year.Customers
{
    public partial class CustomerMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblCustomerUser.Text = (string)Session["CustomerName"];
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
               
            }
            //lblCustomerUser.Text = (string) Session["CustomerName"];
            
        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("CustUsrname");
            Session.Remove("CompareCustPass");
            Session.Remove("CustomerName");
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}