<%@ Page Title="" Language="C#" MasterPageFile="EmployerMaster.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Online_Job_Final_Year.Employers.EditProfile" %>
<%@ PreviousPageType VirtualPath="EmployersProfile.aspx"%>

<asp:Content ID="Content2" ContentPlaceHolderID="EmployerMainContent" runat="server">
<div class="container">
<div class="row">
<div class="h3">Edit Employer Information</div>
<div class="col-md-8">


    <asp:MultiView ID="EditProfileMultiView" runat="server">
        <asp:View runat="server" ID="ProfileDetails">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>- Personal Details -</h4>
                </div>
                <div class="panel-body">
                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtFirstName"> First Name: </asp:Label>
                    </p>
                    <p>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtFirstName"/>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName"
                                                    CssClass="text-danger" ErrorMessage="The First Name field is required."/>
                    </p>
                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtLastName">Last Name: </asp:Label>
                    </p>
                    <p>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtLastName"/>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName"
                                                    CssClass="text-danger" ErrorMessage="The Last Name field is required."/>
                    </p>


                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtEmail">Email: </asp:Label>
                    </p>
                    <p>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" AutoCompleteType="Email"/>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                                    CssClass="text-danger" ErrorMessage="The Email field is required."/>
                    </p>
                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtPhone">Phone No: </asp:Label>
                    </p>
                    <p>
                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Phone" ID="txtPhone"/>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                                                    CssClass="text-danger" ErrorMessage="The Phone No field is required."/>

                    </p>
                </div>
            </div>

            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h4> - Company Details -</h4>
                </div>

                <div class="panel-body">
                    <p>

                        <asp:Label runat="server" AssociatedControlID="txtCompanyName">Company Name: </asp:Label>
                    </p>
                    <p>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtCompanyName"/>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCompanyName"
                                                    CssClass="text-danger" ErrorMessage="Company Name field is required."/>
                    </p>
                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtCompanyWeb">Company Website: </asp:Label>
                    </p>
                    <p>
                        <asp:TextBox CssClass="form-control" runat="server" AutoCompleteType="BusinessUrl" ID="txtCompanyWeb"/>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCompanyWeb"
                                                    CssClass="text-danger" ErrorMessage="The Company Website field is required."/>
                    </p>
                    <p>

                        <asp:Label runat="server" AssociatedControlID="txtspeciality">Specialization: </asp:Label>
                    </p>
                    <p>
                        <asp:DropDownList ID="txtspeciality" runat="server" CssClass="form-control">
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>ICT / Telecommunications</asp:ListItem>
                            <asp:ListItem>Oil &amp; Gas / Mining</asp:ListItem>
                            <asp:ListItem>Food Services</asp:ListItem>
                            <asp:ListItem>Consulting</asp:ListItem>
                            <asp:ListItem>Real Estate/Conspuction</asp:ListItem>
                            <asp:ListItem>pavels/Tours</asp:ListItem>
                            <asp:ListItem>Healthcare</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtspeciality"
                                                    CssClass="text-danger" ErrorMessage="Specialization field is required."/>
                    </p>
                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtTypeOfEmployer">Type of Employer: </asp:Label>
                    </p>
                    <p>

                        <asp:DropDownList ID="txtTypeOfEmployer" runat="server" CssClass="form-control">
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>Recruitment Agency</asp:ListItem>
                            <asp:ListItem>Direct Employer</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTypeOfEmployer"
                                                    CssClass="text-danger" ErrorMessage="The Type of Employer field is required."/>
                    </p>
                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtNumberOfEmployee">Number of Employees*: </asp:Label>
                    </p>
                    <p>

                        <asp:DropDownList ID="txtNumberOfEmployee" runat="server" CssClass="form-control">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>1-10</asp:ListItem>
                            <asp:ListItem>11-50</asp:ListItem>
                            <asp:ListItem>51-100</asp:ListItem>
                            <asp:ListItem>101-500</asp:ListItem>
                            <asp:ListItem>501-1000</asp:ListItem>
                            <asp:ListItem>1001-above</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumberOfEmployee"
                                                    CssClass="text-danger" ErrorMessage="Number of Employees field is required."/>
                    </p>
                    <p>
                        <asp:Label runat="server" AssociatedControlID="txtCountry">Country: </asp:Label>
                    </p>
                    <p>
                        <asp:DropDownList ID="txtCountry" runat="server" CssClass="form-control">
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>Tchad</asp:ListItem>
                            <asp:ListItem>Ghana</asp:ListItem>
                            <asp:ListItem>Togo</asp:ListItem>
                            <asp:ListItem>Benin</asp:ListItem>
                            <asp:ListItem>Cameroon</asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCountry"
                                                    CssClass="text-danger" ErrorMessage="Counpy field is required."/>
                    </p>
                    <p>
                        <asp:Label runat="server" AssociatedControlID="CompanyLogo">Upload Company Logo: </asp:Label>
                    </p>
                    <p>
                        <asp:FileUpload ID="CompanyLogo" runat="server"/>

                    </p>
                    <p>
                        <asp:Button runat="server" Text="Cancel" OnClick="btn_Cancel_Click" CausesValidation="false" CssClass="btn btn-primary"/>
                        
                        <asp:Button runat="server" ID="btnSave"  OnClick="btnSave_OnClick" Text="Save" CssClass="btn btn-success"/>
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
        <div class="panel-heading">Preferred candidates</div>
        <div class="panel-body">

        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">Recent posted Jobs</div>
        <div class="panel-body">

        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">Track Performance</div>
        <div class="panel-body">

        </div>
    </div>
</div>
</div>
</div>
</asp:Content>