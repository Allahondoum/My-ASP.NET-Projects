<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuilderEditProfile.aspx.cs" MasterPageFile="BuilderMaster.Master" Inherits="Real_Estate_Final_Year.Builder.BuilderEditProfile" %>
<%@ PreviousPageType VirtualPath="BuilderProfile.aspx" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="container">
        <div class="row">
            <div style="padding-left:60px"><h2>Edit Profile</h2></div>
            <div class="col-md-8">

            <asp:MultiView runat="server" ID="EditProfileMultiView">
                <asp:View ID="DetailsView" runat="server">
                    <div class="container Registration-box">
                    <div class="row">
                        

        <div class="col-md-6">

                    <label>First Name</label>
                    <p>
                        <asp:TextBox ID="txtFname" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" CssClass="text-danger" runat="server" ErrorMessage="The First field is Required !" ControlToValidate="txtFname"></asp:RequiredFieldValidator>

                    </p>
                    <label>Last Name</label>
                    <p>
                        <asp:TextBox ID="txtLName" runat="server" Class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" CssClass="text-danger" runat="server" ErrorMessage="The Last name field is Required !" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
                    </p>
                    <Label>Gender<span style="color: red">*</span>: </Label>
                    <p>
                        <asp:DropDownList ID="drpGender" CssClass="form-control" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpGender"
                                    CssClass="text-danger" ErrorMessage="Country field is required." />

                    </p>
                    <label>Date of Birth</label>
                    <p>
                        <asp:TextBox ID="txtDOB" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" CssClass="text-danger" runat="server" ErrorMessage="The date of birth field is Required !" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>

                    </p>
                 
                    
             

            </div>
                        <div class="col-md-6">
                       <label>Email</label>
                    <p>
                        <asp:TextBox ID="txtEmail" runat="server" Class="form-control" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>

                    </p>
                    <label>Phone</label>
                    <p>
                        <asp:TextBox ID="txtPhone" runat="server" Class="form-control" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" CssClass="text-danger" runat="server" ErrorMessage="The Last name field is Required !" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                    </p>
                    <label>Address</label>
                    <p>
                        <asp:TextBox ID="txtAddress" runat="server" Class="form-control" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" CssClass="text-danger" runat="server" ErrorMessage="The field is Required !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>

                    </p>
                    <Label>Location<span style="color: red">*</span>: </Label>
                    <p>
                        <asp:DropDownList ID="txtLocation" runat="server" CssClass="form-control">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Tchad</asp:ListItem>
                    <asp:ListItem>Ghana</asp:ListItem>
                    <asp:ListItem>Togo</asp:ListItem>
                    <asp:ListItem>Benin</asp:ListItem>
                    <asp:ListItem>Cameroon</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLocation"
                                    CssClass="text-danger" ErrorMessage="Country field is required." />
                    </p>
                        </div>
                        <p style="padding: 10px">
                        <asp:Button ID="btnSaveUpdate" runat="server" Class="btn btn-success form-control" Text="Save Update" OnClick="btnSaveUpdate_Click" />
                    </p>
    </div>
                         </div>
                </asp:View>

                <asp:View ID="ConfirmationView" runat="server">

                   
                    <div class="Registration-box">
                <h2>- Confirmation </h2>

            <div class="alert-success well">
                                <h5 class="alert-success well">Thank you for trusting us. Your registration is successful. Click on the close button to login with your new username and password.</h5>
            </div>
                                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-success" CommandName="BackToLogin" OnClick="btnClose_OnClick" Text="Close"/>

            </div>
                </asp:View>
            </asp:MultiView>

</div>

            
            <div class="col-md-4">
                <div class="Registration-box">
                    <div class="panel panel-success">
                    <div class="panel-heading">
                        Recent Posts
                         </div>
                        <div class="panel-body">
                            
                       
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Linked Agents
                         </div>
                        <div class="panel-body">
                            
                       
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>