using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Online_Job_Final_Year
{
    public partial class JobSeekerRegistration : Page
    {
        private readonly SqlConnection con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineJobDBConStr"].ToString());
        MyGlobalClasses gc = new MyGlobalClasses();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                gc.bindLocation(drpSeekerLocation);
                gc.bindSpecialization(Specialization);
                JobSeekerRegisMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Goto_Step2(object sender, EventArgs e)
        {
            JobSeekerRegisMultiView.ActiveViewIndex = 1;
            ViewState["pass"] = Password.Text;
            //ViewState["fileupload_CV"] = UploadCV;
            //Session["pass"] = Password.Text;
        }

        protected void btn_Goto_Step1(object sender, EventArgs e)
        {
            JobSeekerRegisMultiView.ActiveViewIndex = 0;
        }

        protected void btn_Goto_Summary(object sender, EventArgs e)
        {
            try
            {


                var chkusr = "select Username from JobSeeKerProfile where Username ='" + txtUsername.Text + "'";
                con.Open();
                var cmd1 = new SqlCommand(chkusr, con);
                var dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    /*txtUsernameErrMess.Text = "The username you chose as already been taken try another one";
                    txtUsernameErrMess.Visible = true;*/
                    Response.Write(
                        "<script>alert('The username you chose as already been taken try another one.')</script>");

                    con.Close();
                }
                else
                {
                    con.Close();
                    con.Open();
                    var AddJobSeekerProfileInfo =
                        "INSERT INTO JobSeeKerProfile(Fname, Lname, Email, Phone, DOB, Gender, Location,Specialization, HighestEducation, YearOfExperience, Salary,CV,Username,Password) VALUES (@Fname, @Lname, @Email, @Phone, @DOB, @Gender, @Location, @Specialization, @HighestEducation, @YearOfExperience, @Salary, @cv, @Username, @Password)";


                    //Creating SqlCommand objects for the two statements
                    var cmd2 = new SqlCommand(AddJobSeekerProfileInfo, con);

                    //Inserting to the JobSeekerProfile Table
                    cmd2.Parameters.AddWithValue("@Fname", FirstName.Text);
                    cmd2.Parameters.AddWithValue("@Lname", LastName.Text);
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd2.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd2.Parameters.AddWithValue("@DOB", DOB.Text);
                    cmd2.Parameters.AddWithValue("@Gender", gender.SelectedItem.Text);
                    cmd2.Parameters.AddWithValue("@Location", drpSeekerLocation.SelectedItem.Text);
                    cmd2.Parameters.AddWithValue("@Specialization", Specialization.SelectedItem.Text);
                    cmd2.Parameters.AddWithValue("@HighestEducation", HighestEducation.SelectedItem.Text);
                    cmd2.Parameters.AddWithValue("YearOfExperience", YearOfExperience.Text);
                    cmd2.Parameters.AddWithValue("@Salary", Salary.Text);
                    // cmd2.Parameters.AddWithValue("", UploadCV);
                    cmd2.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd2.Parameters.AddWithValue("@Password", gc.Encrypt((string)ViewState["pass"]));
                    if (UploadCV.HasFile)
                    {
                        //string filename = UploadCV.FileName;

                        string filePath = Server.MapPath("~/JobSeeker/CVs/");
                       // string fullpath = filePath + filename;

                        if (!Directory.Exists(filePath))
                        {
                            Directory.CreateDirectory(filePath);
                        }
                        string fileExtention = Path.GetExtension(UploadCV.PostedFile.FileName);
                        if (fileExtention.ToLower() != ".doc" && fileExtention.ToLower() != ".docx" && fileExtention.ToLower() != ".pdf")
                        {
                            Response.Write(
                                "<script>alert('file format not supported. Choose a word or pdf document');</script>");
                        }
                        else
                        {
                            //check file size
                            int filesize = UploadCV.PostedFile.ContentLength;

                            if (filesize >= 1048576)
                            {
                                Response.Write("<script>alert('file size must be less than 1MB.');</script>");
                            }
                            else
                            {
                                var cv = txtUsername.Text.Trim() + "_cv";
                                UploadCV.SaveAs(filePath+"\\"+cv+fileExtention);
                                cmd2.Parameters.AddWithValue("@cv", cv+fileExtention);
                            }
                        }
                    }
                    else
                    {
                        cmd2.Parameters.AddWithValue("@cv", "CV not uploaded");
                    }
                    cmd2.ExecuteNonQuery();

                    con.Close();
                    JobSeekerRegisMultiView.ActiveViewIndex = 2;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

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

                var query = "Select * from Cities Where CountryID = '"+ drpSeekerLocation.SelectedItem.Value+"' ";
                var
                cmd = new SqlCommand(query, connn);
                connn.Open();
                var sqlda = new SqlDataAdapter(cmd);
                var dt = new DataTable();

                sqlda.Fill(dt);

                if (dt.Rows.Count == 0) return;
                //drpSeekerCity.DataSource = dt;
                //drpSeekerCity.DataTextField = "CityName";
                //drpSeekerCity.DataValueField = "CityID";
                //drpSeekerCity.DataBind();
                //drpSeekerCity.Items.Insert(0, new ListItem("-Select-", "0"));
                connn.Close();
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);

            }
        }
    }
}