<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MainMaster.Master" CodeBehind="RegistrationPage.aspx.cs" Inherits="Real_Estate_Final_Year.RegistrationPage" %>

<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">


            <div class="h2 text-center">Registration</div>

            <asp:MultiView runat="server" ID="RegisMultiView">
                <asp:View ID="DetailsView" runat="server">
                    <div class="container Registration-box">
                    <div class="row">


        <div class="col-md-6">
            <p>

            </p>
                    <label>First Name</label>
                    <p>
                        <asp:TextBox ID="txtFname" runat="server" Class="form-control" placeholder="First Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" CssClass="text-danger" runat="server" ErrorMessage="The First field is Required !" ControlToValidate="txtFname"></asp:RequiredFieldValidator>

                    </p>
                    <label>Last Name</label>
                    <p>
                        <asp:TextBox ID="txtLName" runat="server" Class="form-control" placeholder="Last Name"></asp:TextBox>
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
                        <asp:TextBox ID="txtDOB" runat="server" Class="form-control"  placeholder="Date of birth" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" CssClass="text-danger" runat="server" ErrorMessage="The date of birth field is Required !" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>

                    </p>
                 <label>Email</label>
                    <p>
                        <asp:TextBox ID="txtEmail" runat="server" Class="form-control" TextMode="Email" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>

                    </p>
                    <label>Phone</label>
                    <p>
                        <asp:TextBox ID="txtPhone" runat="server" Class="form-control" placeholder="Phone" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" CssClass="text-danger" runat="server" ErrorMessage="The Last name field is Required !" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                    </p>



            </div>
                        <!--Account Details-->
                        <div class="col-md-6">

                    <label>Address</label>
                    <p>
                        <asp:TextBox ID="txtAddress" runat="server" Class="form-control" placeholder="Address" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" CssClass="text-danger" runat="server" ErrorMessage="The field is Required !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>

                    </p>


                             <label>Username</label>
                    <p>
                        <asp:TextBox ID="txtUsername" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorusername" CssClass="text-danger" runat="server" ErrorMessage="The field is Required !" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                    </p>

                    <label>Password</label>
                    <p>
                        <asp:TextBox ID="txtPass" runat="server" Class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtPass" CssClass="text-danger" runat="server" ErrorMessage="The pasword field is Required !" ControlToValidate="txtPass"></asp:RequiredFieldValidator>

                    </p>
                    <label>Confirm Password</label>
                    <p>
                        <asp:TextBox ID="txtConfirmPass" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" CssClass="text-danger" runat="server" ErrorMessage="The Confirm field is Required !" ControlToValidate="txtConfirmPass"></asp:RequiredFieldValidator>

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


                    <Label>Category<span style="color: red">*</span>: </Label>
                    <p>
                        <asp:DropDownList ID="txtCategory" CssClass="form-control" runat="server">
                            <asp:ListItem>--select--</asp:ListItem>
                    <asp:ListItem>Agent</asp:ListItem>
                    <asp:ListItem>Builder</asp:ListItem>
                    <asp:ListItem>Customer</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCategory"
                                    CssClass="text-danger" ErrorMessage="Country field is required." />

                    </p>
                        </div>
                        <p style="padding: 10px">
                        <asp:Button ID="btnRegUser" runat="server" Class="btn btn-success form-control" Text="Sign Up" OnClick="btn_BackToLogin"/>
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
                                <asp:Button runat="server" CssClass="btn btn-success" CommandName="BackToLogin" OnClick="btn_BackToLogin" Text="Close"/>

            </div>
                </asp:View>
            </asp:MultiView>
    </asp:content>
