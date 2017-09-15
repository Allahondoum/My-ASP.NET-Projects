<%@ Page Title="Submit Application" Language="C#" AutoEventWireup="true" MasterPageFile="MainMaster.Master" CodeBehind="SubmissionForm.aspx.cs" Inherits="Online_Job_Final_Year.SubmissionForm" %>

<asp:Content runat="server" ContentPlaceHolderID="PageContainer1">
    <div class="container" style="padding-top: 50px">
        <div class="row">
            <asp:Label runat="server" ID="lblalert" Visible="False">
                <div class="alert alert-danger">
			        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			        <center>
				        <strong>Form submitted successful</strong>
				     </center>
		        </div>
            </asp:Label>
            <p class="h2" style="padding-left: 20px">Submit Application</p>
            <!--Submission Form-->
            <div class="col-md-8">
                <!--Personal Details-->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Personal Detailsry</h3>
                    </div>
                    <div class="panel-body">
                                <p>
                                    <label>First Name</label>
                                </p>
                                <p>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="FirstName"/>

                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                                                                CssClass="text-danger" ErrorMessage="The First Name field is required."/>
                                </p>
                                <p>
                                    <Label >Last Name: </Label>
                                </p>
                                <p>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="LastName"/>

                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                                                                CssClass="text-danger" ErrorMessage="The Last Name field is required."/>
                                </p>
                                <Label>Email: </Label>
                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" />

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                    CssClass="text-danger" ErrorMessage="The Email field is required." />
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong email format." CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            </p>
                            <Label>Phone No: </Label>
                            <p>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Phone" ID="txtPhone" />


                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                                    CssClass="text-danger" ErrorMessage="The Phone No field is required." />
                            </p>
                               <p><Label>Country: </Label></p>
                            <p>
                                <asp:DropDownList CssClass="form-control" ID="drpSeekerCountry" runat="server" ToolTip="Select the location where live">

                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="drpSeekerCountry"
                                    CssClass="text-danger" ErrorMessage="Country field is required." />
                            </p>

                        </div>
                </div>

                <!--Professional Details-->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Professional Details</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
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
                                <div style="padding-left: 20px">
                                <p>
                                    <asp:RadioButton runat="server" CssClass="radio" ID="upLoadNewCV" GroupName="chkCV"/> Upload New CV
                                </p>
                                <p>
                                    <asp:FileUpload runat="server" ID="FileUploadNewCV"/>
                                </p>
                                 <p>
                                    <asp:RadioButton runat="server" CssClass="radio" ID="UseMyAccountCV" GroupName="chkCV"/> Use the CV from my account
                                </p>
                                </div>
                            </div>

                    </div>
                </div>
                <p>
                    <asp:Button runat="server" CssClass="btn btn-primary form-control" ID="btnSubmitApplication" Text="Submit Application" OnClick="btnSubmitApplication_OnClick"/>
                </p>
            </div>

            <!--Job summary-->
            <div class="col-md-4">
                <asp:Repeater runat="server" ID="rptrJobSummary">
                    <ItemTemplate>
                         <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Job Summary</h3>
                        </div>
                        <div class="panel-body">
                            <p><b>Company</b></p>
                            <p><%#Eval("CompanyName") %></p>
                            <p><b>Industry</b></p>
                           <p><%#Eval("Specialization") %></p>
                            <p><b>Experience(in Year)</b></p>
                            <p><%#Eval("Experience") %></p>
                            <p><b>Contract Type</b></p>
                            <p><%#Eval("JobType") %></p>
                            <p><b>Degree</b></p>
                            <p><%#Eval("MiniQualif") %></p>
                            <p><b>Salary</b></p>
                            <p><%#Eval("Salary") %></p>
                            <p><b>Location</b></p>
                            <p><%#Eval("Location") %></p>
                            <p><b>Deadline</b></p>
                            <p><%#Eval("Deadline") %></p>
                            <asp:Label runat="server" ID="lblEmpID" Visible="False"><%#Eval("EmployerID")%></asp:Label>
                        </div>
                    </div>
                    </ItemTemplate>

                </asp:Repeater>


            </div>
        </div>
    </div>
</asp:Content>
