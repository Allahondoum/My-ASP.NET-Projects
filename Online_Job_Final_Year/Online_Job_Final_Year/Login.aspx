<%@ Page Title="Job Seeker Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.Login" %>


<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
    <!--- Login -->
    <div class="container" style="padding-top: 50px">
        <ol class="breadcrumb">
			    <li><a href="Default.aspx" title="Go to Home">Home</a></li>
			    <li class="active">Job Seeker Login</li>
		    </ol>
        <div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-5 col-sm-offset-5">
                <h2 class="text-center">Login as Job Seeker</h2>
                <hr />

                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>

                <div class="input-group">

                     <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-user"></span></span>
                    <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Username" runat="server" aria-describedby="basic-addon2"></asp:TextBox>
                </div>
                                    <span><asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="txtUserName"></asp:RequiredFieldValidator></span>

                <div class="input-group">
                                <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-lock
                                "></span></span>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Passowrd" runat="server" TextMode="Password" aria-describedby="basic-addon1"></asp:TextBox>

                </div>
                                    <span><asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></span>

                <div class="checkbox">
                    <label>


                        <asp:CheckBox ID="RememberMe" runat="server" />
                        Remember me ?</label>
                </div>

                <p>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary form-control" OnClick="btnLogin_Click" />
                </p>
                <div class="pull-left">
                    <a href="ForgetPassword.aspx" title="Forget Password">Forgot Password?</a>
                </div>
                <div class="pull-right">
                    New?
                    <asp:LinkButton ID="btnLinkSignUp" CausesValidation="False" runat="server" PostBackUrl="JobSeekerRegistration.aspx">Sign Up</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--- Sign in end -->

</asp:Content>
