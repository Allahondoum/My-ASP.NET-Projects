using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Job_Final_Year
{
    public partial class EmployerRegistration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindCountries();
                EmployerRegisMultiView.ActiveViewIndex = 0;
        }
        private void BindCountries()
        {
            try
            {
                SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var query = "Select* from Countries";
                var
                cmd = new SqlCommand(query, connn);
                connn.Open();
                var sqlda = new SqlDataAdapter(cmd);
                var dt = new DataTable();

                sqlda.Fill(dt);

                if (dt.Rows.Count == 0) return;
                drpEmployerCountry.DataSource = dt;
                drpEmployerCountry.DataTextField = "CountryName";
                drpEmployerCountry.DataValueField = "CountryID";
                drpEmployerCountry.DataBind();
                drpEmployerCountry.Items.Insert(0, new ListItem("-Select-", "0"));
                connn.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);

            }

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
                var chkusr = "select Username from EmployerLogin where Username ='" + txtUsername.Text + "'";
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
                        "INSERT INTO EmployerProfile(Fname, Lname,Username, Email, Phone, CompanyName, CompanyWebsite, Specialization, TypeOfEmployer, NumberOfEmployees,Location) VALUES (@Fname, @Lname,@Username, @Email, @Phone, @CompanyName, @CompanyWebsite, @Specialization, @TypeOfEmployer, @NumberOfEmployees, @Location)";
                    var AddEmployerLoginInfo =
                        "INSERT INTO EmployerLogin(Username,Password) VALUES (@Username,@Password)";

                    //Creating SqlCommand objects for the two statements
                    var cmd2 = new SqlCommand(AddEmployerInfo, con);
                    var cmd3 = new SqlCommand(AddEmployerLoginInfo, con);

                    //Adding to the SeekerLogin Table
                    cmd3.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd3.Parameters.AddWithValue("@Password", (string) ViewState["pass"]);

                    //Inserting to the JobSeekerProfile Table
                    cmd2.Parameters.AddWithValue("@Fname", FirstName.Text);
                    cmd2.Parameters.AddWithValue("@Lname", LastName.Text);
                    cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                    cmd2.Parameters.AddWithValue("@CompanyWebsite", txtCompanyWeb.Text);
                    cmd2.Parameters.AddWithValue("@Specialization", drpSpecialization.SelectedValue);
                    cmd2.Parameters.AddWithValue("@TypeOfEmployer", txtTypeOfEmployer.SelectedValue);
                    cmd2.Parameters.AddWithValue("@NumberOfEmployees", txtNumberOfEmployee.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Location", drpEmployerCountry.SelectedValue);
                    //cmd2.Parameters.AddWithValue("@logo", ((FileUpload)Session["fileUpload_LogoName"]).FileName.ToString());


                    cmd3.ExecuteNonQuery();
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

        protected void drpSeekerCountry_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var query = "Select * from Cities Where CountryID = '" + drpEmployerCountry.SelectedItem.Value + "' ";
                var
                cmd = new SqlCommand(query, connn);
                connn.Open();
                var sqlda = new SqlDataAdapter(cmd);
                var dt = new DataTable();

                sqlda.Fill(dt);

                if (dt.Rows.Count == 0) return;
                drpEmployerCity.DataSource = dt;
                drpEmployerCity.DataTextField = "CityName";
                drpEmployerCity.DataValueField = "CityID";
                drpEmployerCity.DataBind();
                drpEmployerCity.Items.Insert(0, new ListItem("-Select-", "0"));
                connn.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);

            }
        }
    }
}