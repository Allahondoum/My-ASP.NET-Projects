using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Job_Final_Year
{
    public partial class JobSeekerRegistration : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindCountries();
                JobSeekerRegisMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Goto_Step2(object sender, EventArgs e)
        {
            JobSeekerRegisMultiView.ActiveViewIndex = 1;
            ViewState["pass"] = Password.Text;
            //ViewState["fileupload_CV"] = UploadCV;
            //Session["pass"] = Password.Text;
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
                drpSeekerCountry.DataSource = dt;
                drpSeekerCountry.DataTextField = "CountryName";
                drpSeekerCountry.DataValueField = "CountryID";
                drpSeekerCountry.DataBind();
                drpSeekerCountry.Items.Insert(0, new ListItem("-Select-", "0"));
                connn.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);

            }

        }

        protected void btn_Goto_Step1(object sender, EventArgs e)
        {
            JobSeekerRegisMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Goto_Summary(object sender, EventArgs e)
        {
            try
            {
                var cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());


                var chkusr = "select Username from SeekerLogin where Username ='" + txtUsername.Text + "'";
                cnn.Open();
                var cmd1 = new SqlCommand(chkusr, cnn);
                var dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    /*txtUsernameErrMess.Text = "The username you chose as already been taken try another one";
                    txtUsernameErrMess.Visible = true;*/
                    Response.Write(
                        "<script>alert('The username you chose as already been taken try another one.')</script>");

                    cnn.Close();
                }
                else
                {
                    con.Open();
                    var AddJobSeekerProfileInfo =
                        "INSERT INTO JobSeeKerProfile(Fname, Lname, Username, Email, Phone, DOB, Gender, Location,Specialization, HighestEducation, YearOfExperience, Salary) VALUES (@Fname, @Lname, @Username, @Email, @Phone, @DOB, @Gender, @Location, @Specialization, @HighestEducation, @YearOfExperience, @Salary)";
                    var AddJobSeekerLoginInfo =
                        "INSERT INTO SeekerLogin(Username,Password) VALUES (@Username,@Password)";

                    //Creating SqlCommand objects for the two statements
                    var cmd2 = new SqlCommand(AddJobSeekerProfileInfo, con);
                    var cmd3 = new SqlCommand(AddJobSeekerLoginInfo, con);

                    //Adding to the SeekerLogin Table
                    cmd3.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd3.Parameters.AddWithValue("@Password", (string)ViewState["pass"]);


                    //Inserting to the JobSeekerProfile Table
                    cmd2.Parameters.AddWithValue("@Fname", FirstName.Text);
                    cmd2.Parameters.AddWithValue("@Lname", LastName.Text);
                    cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@DOB", DOB.Text);
                    cmd2.Parameters.AddWithValue("@Gender", gender.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Location", drpSeekerCountry.SelectedValue);
                    cmd2.Parameters.AddWithValue("@Specialization", Specialization.SelectedValue);
                    cmd2.Parameters.AddWithValue("@HighestEducation", HighestEducation.SelectedValue);
                    cmd2.Parameters.AddWithValue("YearOfExperience", YearOfExperience.Text);
                    cmd2.Parameters.AddWithValue("@Salary", Salary.Text);

                    cmd3.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();

                    con.Close();
                    JobSeekerRegisMultiView.ActiveViewIndex = 2;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            //lblPass.Text = (string)ViewState["pass"];
            /*
             * try
                {
                     if(UploadCV.HasFile)
                    {
                    string filename = UploadCV.FileName;
                    string fileExt = Path.GetExtension(UploadCV.FileName);
                    string filePath = Server.MapPath("~/JobSeeker/CVs/");

                    if(fileExt.ToLower() != ".doc" && fileExt.ToLower() != ".docx" && fileExt.ToLower()!=".pdf")
                    {
                        Response.Write("<script>alert('file format not supported. Choose a word or pdf document');</script>");

                    }
                    else
                    {
                        //check file size
                        int filesize = UploadCV.PostedFile.ContentLength;

                        if(filesize >= 1048576)
                        {
                            Response.Write("<script>alert('file size must be less than 1MB.');</script>");
                        }
                        else
                        {
             *              UploadCV.SaveAs(filePath+filename);
             *           
                         }
                      }
                    catch(Exception ex)
                    {
                        Response.Write(ex.Message);

                    }
             *      }
                }
             *              
                         */
        }

        protected void btn_Finish(object sender, EventArgs e)
        {
            
        }

        protected void btn_BackToLogin(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void drpSeekerCountry_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //int drpCountryID = Convert.ToInt32(drpSeekerCountry.SelectedItem.Value);
            try
            {
                SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());

                var query = "Select * from Cities Where CountryID = '"+drpSeekerCountry.SelectedItem.Value+"' ";
                var
                cmd = new SqlCommand(query, connn);
                connn.Open();
                var sqlda = new SqlDataAdapter(cmd);
                var dt = new DataTable();

                sqlda.Fill(dt);

                if (dt.Rows.Count == 0) return;
                drpSeekerCity.DataSource = dt;
                drpSeekerCity.DataTextField = "CityName";
                drpSeekerCity.DataValueField = "CityID";
                drpSeekerCity.DataBind();
                drpSeekerCity.Items.Insert(0, new ListItem("-Select-", "0"));
                connn.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);

            }
        }
    }
}