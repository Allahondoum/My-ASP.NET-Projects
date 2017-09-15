<%@ Page Title="Register New Admin" Language="C#" AutoEventWireup="true" CodeBehind="RegisterAdmin.aspx.cs" MasterPageFile="MyAdminMaster.Master" Inherits="Online_Job_Final_Year.Admin.RegisterAdmin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MyAdminMainContent" runat="server">

            <asp:MultiView runat="server" ID="RegisAdminMultiView">

                <asp:View ID="DetailsView" runat="server">

                    <div class="container Registration-box">
                        <div class="row">
                            <div class="h2 text-center">Add New Administrator</div>
                            <div class="col-md-6">
                                <p>
                                    <label>First Name</label>
                                </p>
                                <p>
                                    <asp:TextBox ID="txtFname" runat="server" Class="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" CssClass="text-danger" runat="server" ErrorMessage="The First field is Required !" ControlToValidate="txtFname"></asp:RequiredFieldValidator>

                                </p>
                                <p>
                                    <label>Last Name</label>
                                </p>
                                <p>
                                    <asp:TextBox ID="txtLName" runat="server" Class="form-control" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" CssClass="text-danger" runat="server" ErrorMessage="The Last name field is Required !" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
                                </p>
                                <p>
                                    <label>Date of Birth</label>
                                </p>
                                <p>
                                    <asp:TextBox ID="txtDOB" runat="server" Class="form-control" placeholder="Date of birth"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" CssClass="text-danger" runat="server" ErrorMessage="The date of birth field is Required !" ControlToValidate="txtDOB"></asp:RequiredFieldValidator>

                                </p>
                                 <p>
                                    <Label>Gender<span style="color: red">*</span>: </Label>

                                </p>
                                <p>
                                    <asp:DropDownList ID="drpGender" CssClass="form-control" runat="server">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="drpGender"
                                                                CssClass="text-danger" ErrorMessage="Gender field is required."></asp:RequiredFieldValidator>

                                </p>
                                <p>
                                    <label>Username</label>
                                </p>
                                <p>
                                    <asp:TextBox ID="txtUsername" runat="server" Class="form-control" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorusername" CssClass="text-danger" runat="server" ErrorMessage="The  field is Required !" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                </p>

                            </div>
                            <div class="col-md-6">
                                <p>
                                    <label>Email</label>
                                </p>
                                <p>
                                    <asp:TextBox ID="txtEmail" runat="server" Class="form-control" placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="The Last name field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>

                                </p>
                                <p>
                                    <label>Phone</label>
                                </p>
                                <p>
                                    <asp:TextBox ID="txtPhone" runat="server" Class="form-control" placeholder="Email" TextMode="SingleLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" CssClass="text-danger" runat="server" ErrorMessage="The Last name field is Required !" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                                </p>
                                <p>
                                    <label>Address</label>

                                </p>
                                <p>
                                    <asp:TextBox ID="txtAddress" runat="server" Class="form-control" placeholder="Address" TextMode="SingleLine"></asp:TextBox>
                                </p>
                                <p>
                                    <label>Password</label>
                                </p>

                                <p>
                                    <asp:TextBox ID="txtPass" runat="server" Class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtPass" CssClass="text-danger" runat="server" ErrorMessage="The pasword field is Required !" ControlToValidate="txtPass"></asp:RequiredFieldValidator>

                                </p>
                                <p>
                                    <label>Confirm Password</label>
                                </p>

                                <p>
                                    <asp:TextBox ID="txtConfirmPass" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" CssClass="text-danger" runat="server" ErrorMessage="The Confirm field is Required !" ControlToValidate="txtConfirmPass"></asp:RequiredFieldValidator>

                                </p>




                                <p>
                                    <Label>Accreditation Level<span style="color: red">*</span>: </Label>

                                </p>
                                <p>
                                    <asp:DropDownList ID="drpRole" CssClass="form-control" runat="server">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>Senior</asp:ListItem>
                                        <asp:ListItem>Junior</asp:ListItem>
                                        <asp:ListItem>Operational</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="drpRole"
                                                                CssClass="text-danger" ErrorMessage="The Role field is required."/>

                                </p>



                            </div>

                            </div>
                        <p>
                                    <asp:Button ID="btnRegAdmin" runat="server" Class="btn btn-success form-control" Text="Sign Up" OnClick="btnRegAdmin_Click"/>
                                </p>
                        </div>
                </asp:View>

                <asp:View ID="ConfirmationView" runat="server">

                    <table>
                        <tr>
                            <td colspan="4">
                                <h2>- Confirmation - </h2>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5 class="alert-success well">Thank you for trusting us. Your registration is successful. Click on the close button to login with your new username and password.</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button runat="server" CssClass="btn btn-success" Height="40px" Width="100px" CommandName="BackToLogin" OnClick="btn_BackToLogin" Text="Close"/>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
</asp:Content>