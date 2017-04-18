<%@ Page Title="Job Seeker Registration" Language="C#" AutoEventWireup="true" CodeBehind="JobSeekerRegistration.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.JobSeekerRegistration" %>





<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
    <div class="container">
    <ol class="breadcrumb">
	        <li><a href="Default.aspx" title="Go to Home">Home</a></li>
        <li><a href="Login.aspx" title="Go to Home">Login</a></li>
	        <li class="active">Job Seeker Registration</li>
        </ol>
    <div class="h2 text-center">Job Seeker Sign Up</div>
    <div class="h2">
        <hr />
    </div>
    <asp:MultiView runat="server" ID="JobSeekerRegisMultiView">
        <!-- Personal Details view-->

        <asp:View ID="ViewPersonalDetails" runat="server">
            <!--<div class="Registration-box">-->
                <div class="container Registration-box">
                    <div class="row">
                        <div class="h4" style="padding-left: 20px">
                            Step 1 - Personal Details
                        </div>
                        <hr />
                        <div class="col-md-6">

                            <asp:Label runat="server" AssociatedControlID="FirstName">First Name<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" ID="FirstName" />

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                                    CssClass="text-danger" ErrorMessage="The First Name field is required." />
                            </p>
                            <asp:Label runat="server" AssociatedControlID="LastName">Last Name<span style="color: red">*</span>: </asp:Label>

                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" ID="LastName" />

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                                    CssClass="text-danger" ErrorMessage="The Last Name field is required." />
                            </p>
                            <asp:Label runat="server" AssociatedControlID="gender">Gender<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:DropDownList ID="gender" CssClass="form-control" runat="server">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="gender"
                                    CssClass="text-danger" ErrorMessage="Gender field is required." />
                            </p>
                            <asp:Label runat="server" AssociatedControlID="DOB">Date Of Birth<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="DOB" />


                                <asp:RequiredFieldValidator runat="server" ControlToValidate="DOB"
                                    CssClass="text-danger" ErrorMessage="The Date of birth field is required." />
                            </p>
                            <asp:Label runat="server" AssociatedControlID="txtUsername">Username :<span style="color: red">*</span> </asp:Label>
                            <p>
                                <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="txtUsername" />

                                <asp:RequiredFieldValidator ID="txtUsernameErrMess" runat="server" ControlToValidate="txtUsername"
                                    CssClass="text-danger" ErrorMessage="The Username field is required." />
                            </p>


                        </div>
                        <div class="col-md-6">
                            <asp:Label runat="server" AssociatedControlID="txtEmail">Email<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" />

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                    CssClass="text-danger" ErrorMessage="The Email field is required." />
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong email format." CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            </p>
                            <asp:Label runat="server" AssociatedControlID="txtPhone">Phone No<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Phone" ID="txtPhone" />


                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                                    CssClass="text-danger" ErrorMessage="The Phone No field is required." />
                            </p>

                            <asp:Label runat="server" AssociatedControlID="Password">Password<span style="color: red">*</span>: </asp:Label>

                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" ID="Password" />

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="text-danger" ErrorMessage="The Password field is required." />
                            </p>

                            <asp:Label runat="server" AssociatedControlID="Repassword">Re-type Password<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="Repassword" />

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Repassword"
                                    CssClass="text-danger" ErrorMessage="The Ret-type Password field is required." />
                            </p>


                            <asp:Label runat="server" AssociatedControlID="drpSeekerCountry">Country<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:DropDownList CssClass="form-control" OnSelectedIndexChanged="drpSeekerCountry_OnSelectedIndexChanged" AutoPostBack="True" ID="drpSeekerCountry" runat="server" ToolTip="Select the location where live">
                                   
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="drpSeekerCountry"
                                    CssClass="text-danger" ErrorMessage="Country field is required." />
                            </p>
                              <asp:Label runat="server" AssociatedControlID="drpSeekerCity">City/State<span style="color: red">*</span>: </asp:Label>
                            <p>
                                <asp:DropDownList CssClass="form-control" ID="drpSeekerCity" runat="server" ToolTip="Select the location where live">
                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="drpSeekerCity"
                                    CssClass="text-danger" ErrorMessage="City/State field is required." />
                            </p>



                        </div>

                    </div>
                    <p>
                        <asp:Button runat="server" Class="btn btn-primary" CommandName="Step1" OnClick="btn_Goto_Step2" Text="Next >>" Height="40px" Width="100px" />
                    </p>

                </div>

          
        </asp:View>
        <!-- Professional Details view-->

        <asp:View ID="ViewProfessionalDetails" runat="server">

            
            <div class="container Registration-box">
                <div class="row">
                                    <div class="h4" style="padding-left: 20px">Step 2 - Professional Details</div>

                    <div>
                        <hr />
                    </div>
                    <div class="col-md-6">


                        <asp:Label runat="server" AssociatedControlID="Specialization">Specialization: </asp:Label>
                        <p>
                            <asp:DropDownList CssClass="form-control" ID="Specialization" runat="server">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>IT</asp:ListItem>
                                <asp:ListItem>Administrative</asp:ListItem>
                                <asp:ListItem>Construction</asp:ListItem>
                                <asp:ListItem>Engineering</asp:ListItem>
                                <asp:ListItem>Oil & Gaz</asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Specialization"
                                CssClass="text-danger" ErrorMessage="Specialization field is required." />
                        </p>

                        <asp:Label runat="server" AssociatedControlID="HighestEducation">Highest Education*: </asp:Label>
                        <p>


                            <asp:DropDownList CssClass="form-control" ID="HighestEducation" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>MPhil/PhD</asp:ListItem>
                                <asp:ListItem>MBA/MSc</asp:ListItem>
                                <asp:ListItem>BSc/BBA</asp:ListItem>
                                <asp:ListItem>HND</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem>High School(S.S.C.E)</asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator runat="server" ControlToValidate="HighestEducation"
                                CssClass="text-danger" ErrorMessage="Highest Education field is required." />
                        </p>
                    </div>
                    <div class="col-md-6">


                        <asp:Label runat="server" AssociatedControlID="YearOfExperience">Year of Experience*: </asp:Label>
                        <p>
                            <asp:DropDownList ID="YearOfExperience" CssClass="form-control" runat="server">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator runat="server" ControlToValidate="YearOfExperience"
                                CssClass="text-danger" ErrorMessage="Year of Experience field is required." />
                        </p>

                        <asp:Label runat="server" AssociatedControlID="Salary">Expected Salary(Monthly)*: </asp:Label>
                        <p>
                            <asp:DropDownList ID="Salary" runat="server" CssClass="form-control">
                                <asp:ListItem>Ghc 150</asp:ListItem>
                                <asp:ListItem>Ghc 200-500</asp:ListItem>
                                <asp:ListItem>Ghc 500-800</asp:ListItem>
                                <asp:ListItem>Ghc 800-1100</asp:ListItem>
                                <asp:ListItem>Ghc 1100-1400</asp:ListItem>
                                <asp:ListItem>Ghc 1400-1700</asp:ListItem>
                                <asp:ListItem>Ghc 2000-above</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Salary"
                                CssClass="text-danger" ErrorMessage="Year of Experience field is required." />
                        </p>


                        <asp:Label runat="server" AssociatedControlID="UploadCV">Upload CV: </asp:Label>

                        <p>
                            <asp:FileUpload CssClass="form-control" ID="UploadCV" runat="server" />
                            
                        </p>

                    </div>
                    

                </div>
                <p>
                    <asp:Button runat="server" CssClass="btn btn-primary" CommandName="PrevStep1" OnClick="btn_Goto_Step1" Text="<< Prev" Height="40px" Width="100px" />
                    &nbsp;&nbsp;| &nbsp;&nbsp;
                    <asp:Button runat="server" CssClass="btn btn-success" CommandName="Step2" OnClick="btn_Goto_Summary" Text="Finish" Height="40px" Width="100px" />

                </p>
            </div>
        </asp:View>
        <!-- Summary view-->
        <asp:View ID="View1" runat="server">

            <div class="Registration-box">
                <h2>Step 3 - Confirmation </h2>

            <div class="alert-success well">
            Thank you for trusting us. Your registration is successful. Click on the close button to login with your new username and password.
            </div>
            <asp:Button runat="server" CssClass="btn btn-success" Height="40px" Width="100px" CommandName="BackToLogin" OnClick="btn_BackToLogin" Text="Close" />

            </div>

            
        </asp:View>

    </asp:MultiView>

    </div>
</asp:Content>
