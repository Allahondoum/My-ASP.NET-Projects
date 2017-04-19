using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate_Final_Year.Builder
{
    public partial class BuilderAddProperty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AddPostMultiView.ActiveViewIndex = 0;
        }

        protected void btnNext_OnClick(object sender, EventArgs e)
        {
            AddPostMultiView.ActiveViewIndex = 1;
        }

        protected void btnPublish_OnClick(object sender, EventArgs e)
        {
            try
            {
                var uname = (string)Session["BuilderUsrname"];
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["RealEstateConn"].ToString());

                con.Open();
                var AddProp = "INSERT INTO AddedProperties(Username,CompanyName,Title,Descrip,Category,Price,Email,Phone,Location,Type,Bedrooms,AC,Garage,SwimPool,Balcony,Fence,Tank,Generator,Availability,Img1,Img2,Img3,Img4) VALUES (@Username,@CompanyName,@Title,@Descrip,@Category,@Price,@Email,@Phone,@Location,@Type,@Bedrooms,@AC,@Garage,@SwimPool,@Balcony,@Fence,@Tank,@Generator,@Availability,@Img1,@Img2,@Img3,@Img4)";
                var cmd = new SqlCommand(AddProp, con);
                cmd.Parameters.AddWithValue("@Username", uname);
                cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Descrip", txtDesc.Text);
                cmd.Parameters.AddWithValue("@Category", drpType.SelectedValue);
                cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Location", drpLocation.SelectedValue);
                cmd.Parameters.AddWithValue("@Type", drpType.SelectedValue);
                cmd.Parameters.AddWithValue("@Bedrooms", txtbedrooms.Text);
                cmd.Parameters.AddWithValue("@AC", chkAC.Checked == true ? 1.ToString() : 0.ToString());
                cmd.Parameters.AddWithValue("@Garage", chkGarage.Checked == true ? 1.ToString() : 0.ToString());
                cmd.Parameters.AddWithValue("@SwimPool", chkSwim.Checked == true ? 1.ToString() : 0.ToString());
                cmd.Parameters.AddWithValue("@Balcony", chkBalcony.Checked == true ? 1.ToString() : 0.ToString());
                cmd.Parameters.AddWithValue("@Fence", chkFence.Checked == true ? 1.ToString() : 0.ToString());
                cmd.Parameters.AddWithValue("@Tank", chkWater.Checked == true ? 1.ToString() : 0.ToString());
                cmd.Parameters.AddWithValue("@Generator", chkGen.Checked == true ? 1.ToString() : 0.ToString());
                cmd.Parameters.AddWithValue("@Availability", drpAvailability.SelectedValue);

                if (img1.HasFile)
                {
                    var savepath = Server.MapPath("~/Images/Properties/") + txtCompanyName.Text;
                    if (!Directory.Exists(savepath))
                    {
                        Directory.CreateDirectory(savepath);
                    }
                    else
                    {

                        var ext = Path.GetExtension(img1.PostedFile.FileName);
                        var img = drpType.SelectedValue.ToString().Trim() + "img01";
                        //img1.PostedFile.SaveAs(savepath);
                        img1.SaveAs(savepath + "\\" + drpType.SelectedValue.ToString().Trim() + "01" + ext);

                        cmd.Parameters.AddWithValue("@Img1", img + ext);
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Img1", null);
                }
                if (img2.HasFile)
                {
                    var savepath = Server.MapPath("~/Images/Properties/") + txtCompanyName.Text;
                    if (!Directory.Exists(savepath))
                    {
                        Directory.CreateDirectory(savepath);
                    }
                    else
                    {

                        var ext = Path.GetExtension(img2.PostedFile.FileName);
                        var img = drpType.SelectedValue.ToString().Trim() + "img02";
                        img2.SaveAs(savepath + "\\" + drpType.SelectedValue.ToString().Trim() + "02" + ext);

                        cmd.Parameters.AddWithValue("@Img2", img + ext);
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Im2", null);
                }
                if (img3.HasFile)
                {
                    var savepath = Server.MapPath("~/Images/Properties/") + txtCompanyName.Text;
                    if (!Directory.Exists(savepath))
                    {
                        Directory.CreateDirectory(savepath);
                    }
                    else
                    {
                        var ext = Path.GetExtension(img3.PostedFile.FileName);
                        var img = drpType.SelectedValue.ToString().Trim() + "img03";
                        img3.SaveAs(savepath + "\\" + drpType.SelectedValue.ToString().Trim() + "03" + ext);

                        cmd.Parameters.AddWithValue("@Img3", img + ext);
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Img3", null);
                }
                if (img4.HasFile)
                {
                    var savepath = Server.MapPath("~/Images/Properties/") + txtCompanyName.Text;
                    if (!Directory.Exists(savepath))
                    {
                        Directory.CreateDirectory(savepath);
                    }
                    else
                    {

                        var ext = Path.GetExtension(img4.PostedFile.FileName);
                        var img = drpType.SelectedValue.ToString().Trim() + "img04";
                        img4.SaveAs(savepath +"\\"+ drpType.SelectedValue.ToString().Trim() + "04" + ext);

                        cmd.Parameters.AddWithValue("@Img4", img + ext);
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Img4", null);
                }

                cmd.ExecuteNonQuery();
                con.Close();
                AddPostMultiView.ActiveViewIndex = 2;


            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);
                
            }
        }

        protected void btnBack_OnClick(object sender, EventArgs e)
        {
            
        }
    }
}