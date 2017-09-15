using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Job_Final_Year
{
    public partial class EmployerRegistration : Page
    {
        MyGlobalClasses gc = new MyGlobalClasses();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                gc.bindLocation(drpEmployerLocation);
                gc.bindSpecialization(drpSpecialization);
                EmployerRegisMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Goto_Step2(object sender, EventArgs e)
        {
            EmployerRegisMultiView.ActiveViewIndex = 1;
            ViewState["pass"] = Password.Text;

        }

        protected void btn_Goto_Step1(object sender, EventArgs e)
        {
            EmployerRegisMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Finish(object sender, EventArgs e)
        {
            //lblpass.Text = (string)ViewState["pass"];
            /* try
             {
                 if (((FileUpload)Session["fileUpload_LogoName"]).HasFile)
                 {
                     string filename = ((FileUpload)Session["fileUpload_LogoName"]).FileName;
                     string fileExt = Path.GetExtension(((FileUpload)Session["fileUpload_LogoName"]).FileName);
                     //string filePath = Server.MapPath("~/JobSeeker/CVs/");

                     if (fileExt.ToLower() != ".gif" && fileExt.ToLower() != ".png" && fileExt.ToLower() != ".jpg" && fileExt.ToLower() != ".jpeg")
                     {
                         Response.Write("<script>alert('file format not supported.');</script>");

                     }
                     else
                     {
                         //check file size
                         int filesize = ((FileUpload)Session["fileUpload_LogoName"]).PostedFile.ContentLength;

                         if (filesize > 1048576)
                         {
                             Response.Write("<script>alert('file size must be less than 1MB.');</script>");
                         }
                     }
                 }
             }
             catch(Exception ex)
             {
                 Response.Redirect(ex.Message);
             }*/
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                //string filePath = Server.MapPath("~/Employers/Company_Logos/");
                var chkusr = "select Username from EmployerProfile where Username ='" + txtUsername.Text + "'";
                cnn.Open();
                var cmd1 = new SqlCommand(chkusr, cnn);
                var dr = cmd1.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write(
                        "<script>alert('The username you chose as already been taken try another one.')</script>");
                    cnn.Close();
                }
                else
                {
                    //((System.Drawing.Image)Session["imglogo"]).Save(filePath + ((FileUpload)Session["fileUpload_LogoName"]).FileName.ToString());
                    con.Open();
                    var AddEmployerInfo =
                        "INSERT INTO EmployerProfile(Fname, Lname, Email, Phone, CompanyName, CompanyWebsite, Specialization, TypeOfEmployer, NumberOfEmployees,Location,Username,Password) VALUES (@Fname, @Lname,@Username, @Email, @Phone, @CompanyName, @CompanyWebsite, @Specialization, @TypeOfEmployer, @NumberOfEmployees, @Location,@Username,@Password)";


                    //Creating SqlCommand objects for the two statements
                    var cmd2 = new SqlCommand(AddEmployerInfo, con);
                    //Inserting to the JobSeekerProfile Table
                    cmd2.Parameters.AddWithValue("@Fname", FirstName.Text);
                    cmd2.Parameters.AddWithValue("@Lname", LastName.Text);
                    cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                    cmd2.Parameters.AddWithValue("@CompanyWebsite", txtCompanyWeb.Text);
                    cmd2.Parameters.AddWithValue("@Specialization", drpSpecialization.SelectedItem.Text);
                    cmd2.Parameters.AddWithValue("@TypeOfEmployer", txtTypeOfEmployer.SelectedItem.Text);
                    cmd2.Parameters.AddWithValue("@NumberOfEmployees", txtNumberOfEmployee.SelectedItem.Text);
                    cmd2.Parameters.AddWithValue("@Location", drpEmployerLocation.SelectedItem.Text);
                    //cmd2.Parameters.AddWithValue("@logo", ((FileUpload)Session["fileUpload_LogoName"]).FileName.ToString());
                    cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd2.Parameters.AddWithValue("@Password", gc.Encrypt((string)ViewState["pass"]));

                    cmd2.ExecuteNonQuery();
                    con.Close();
                    /*Session.Remove("fileUpload_LogoName");
                    Session.Remove("logoLength");
                    Session.Remove("imglogo");*/
                    EmployerRegisMultiView.ActiveViewIndex = 2;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_BackToLogin(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployerLogin.aspx");
        }
    }
}