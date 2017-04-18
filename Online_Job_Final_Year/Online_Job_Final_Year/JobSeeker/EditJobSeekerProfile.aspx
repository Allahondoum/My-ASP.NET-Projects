<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/JobSeekerMaster.Master" AutoEventWireup="true" CodeBehind="EditJobSeekerProfile.aspx.cs" Inherits="Online_Job_Final_Year.JobSeeker.EditJobSeekerProfile" %>
<%@ PreviousPageType VirtualPath="~/JobSeeker/JobSeekerProfile.aspx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="EmpMainContent" runat="server">
    
        <div class="row">
        <div class="h3">Edit Job Seeker Information</div>
            <div class="col-md-8">
                <asp:MultiView ID="EditProfileMultiView" runat="server">
<asp:View runat="server" ID="ProfileDetails">
    <!--personal details-->
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4>- Personal Details -</h4>
        </div>
        <div class="panel-body">
            
        <p>
                <asp:Label runat="server" AssociatedControlID="txtFirstName"> First Name: </asp:Label>
            </p>
            <p>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtFirstName"/>
                
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName"
                                            CssClass="text-danger" ErrorMessage="The First Name field is required."/>
                </p>
            <p>
                <asp:Label runat="server" AssociatedControlID="txtLastName">Last Name: </asp:Label></p>
            <p>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtLastName"/>
                
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName"
                                            CssClass="text-danger" ErrorMessage="The Last Name field is required."/></p>
          <p>
                <asp:Label runat="server" AssociatedControlID="txtEmail">Email: </asp:Label></p>
            <p>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail" AutoCompleteType="Email"/>
                
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                            CssClass="text-danger" ErrorMessage="The Email field is required."/></p>

           <p>
                <asp:Label runat="server" AssociatedControlID="txtPhone">Phone No: </asp:Label></p>
            <p>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtPhone"/>
                
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                                            CssClass="text-danger" ErrorMessage="The Phone No field is required."/></p>
            <p>
            
                <asp:Label runat="server" AssociatedControlID="DOB">Date Of Birth<span style="color: red">*</span>: </asp:Label></p>
            <p>
                <asp:TextBox CssClass="form-control" runat="server" ID="DOB"/>
                
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DOB"
                                            CssClass="text-danger" ErrorMessage="The Date of birth field is required."/></p>
            <p>
            
                <asp:Label runat="server" AssociatedControlID="gender">Gender<span style="color: red">*</span>: </asp:Label>
            </p>
            <p>
                <asp:DropDownList CssClass="form-control" ID="gender" runat="server" >
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
               
                <asp:RequiredFieldValidator runat="server" ControlToValidate="gender"
                                            CssClass="text-danger" ErrorMessage="Gender field is required."/>
                </p>
            
            <p>
                
           
                <asp:Label runat="server" AssociatedControlID="Location">Current Location<span style="color: red">*</span>: </asp:Label>
                 </p>
            <p>
                <asp:DropDownList ID="Location" runat="server" CssClass="form-control" ToolTip="Select the location where live">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Tchad</asp:ListItem>
                    <asp:ListItem>Ghana</asp:ListItem>
                    <asp:ListItem>Togo</asp:ListItem>
                    <asp:ListItem>Benin</asp:ListItem>
                    <asp:ListItem>Cameroon</asp:ListItem>
                </asp:DropDownList>
                
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Location"
                                            CssClass="text-danger" ErrorMessage="Current Location field is required."/></p>
            </div>
    </div>
            
    <div class="panel panel-primary">
        <div class="panel-heading">
                    <h4>- Professional Details -</h4>
                
        </div>
        <div class="panel-body">
            <p>
                <asp:Label runat="server" AssociatedControlID="Specialization">Specialization: </asp:Label>
                </p>
            <p>

                <asp:DropDownList ID="Specialization" runat="server" CssClass="form-control">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>IT</asp:ListItem>
                    <asp:ListItem>Administrative</asp:ListItem>
                    <asp:ListItem>Construction</asp:ListItem>
                    <asp:ListItem>Engineering</asp:ListItem>
                    <asp:ListItem>Oil & Gaz</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Specialization"
                                            CssClass="text-danger" ErrorMessage="Specialization field is required."/>
            </p>
            <p>
                <asp:Label runat="server" AssociatedControlID="HighestEducation">Highest Education*: </asp:Label>
                </p>
            <p>
                <asp:DropDownList ID="HighestEducation" runat="server" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>MPhil/PhD</asp:ListItem>
                    <asp:ListItem>MBA/MSc</asp:ListItem>
                    <asp:ListItem>BSc/BBA</asp:ListItem>
                    <asp:ListItem>HND</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                    <asp:ListItem>High School(S.S.C.E)</asp:ListItem>
                </asp:DropDownList>
               
                <asp:RequiredFieldValidator runat="server" ControlToValidate="HighestEducation"
                                            CssClass="text-danger" ErrorMessage="Highest Education field is required."/>
            </p>
            <p>
                <asp:Label runat="server" AssociatedControlID="YearOfExperience">Year of Experience*: </asp:Label>
                </p>
            <p>

                <asp:DropDownList ID="YearOfExperience" runat="server" CssClass="form-control">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="YearOfExperience"
                                            CssClass="text-danger" ErrorMessage="Year of Experience field is required."/>
            </p>
            <p>
                <asp:Label runat="server" AssociatedControlID="Salary">Expected Salary(Monthly): </asp:Label>
                </p>
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
                                            CssClass="text-danger" ErrorMessage="Year of Experience field is required."/>
            </p>
            <p>
                <asp:Label runat="server" AssociatedControlID="UploadCV">Upload CV: </asp:Label>
            </p>
            <p>
                <asp:FileUpload ID="UploadCV" runat="server"/>

            </p>
            <p>
                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" OnClick="btn_Cancel_Click"/>
            
                <asp:Button runat="server" CommandName="SaveUpdate" OnClick="btn_Save_Click" Text="Update" CssClass="btn btn-success"/>
            </p>
        </div>
        
            
       
    </div>
</asp:View>
<asp:View runat="server" ID="ConfirmationMessage">
    <div class="text-center">
        
            <p>
                - Confirmation -

            </p>
        
            <p class="alert-success well">
                Your information have been successfully updated.
            </p>
        
            <p>
                <asp:Button runat="server" CssClass="btn btn-success form-control" CommandName="btnClose" Text="Close" OnClick="btnClose"/>
            </p>
       
    </div>
</asp:View>
</asp:MultiView>
            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">Recommanded Job</div>
                    <div class="panel-body">
                        
                    </div>
                    </div>
                    <div class="panel panel-primary">
                    <div class="panel-heading">Recent Application</div>
                    <div class="panel-body">
                        
                    </div>
                        </div>
                        <div class="panel panel-primary">
                    <div class="panel-heading">CV and Cover Letter</div>
                    <div class="panel-body">
                        
                    </div>
                </div>
            </div>
        </div>

</asp:Content>