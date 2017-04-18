<%@ Page Title="Employer Login" Language="C#" AutoEventWireup="true" CodeBehind="EmployerLogin.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.EmployerLogin" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
	<div class="container">
			 <ol class="breadcrumb">
			<li><a href="Default.aspx" title="Go to Home">Home</a></li>
		<li><a href="Login.aspx" title="Go to Home">Login</a></li>
			<li class="active">Employer Registration</li>
		</ol>
				<div class="form-horizontal">
			 <h2>Employer login form.</h2>
			<hr class="text-center" />
				<p class="text-danger">
					<asp:Literal runat="server" ID="FailureText"/>
				</p>
			<div class="form-group">
				<div class="control-label col-md-2">Username</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" ControlToValidate="txtUserName" runat="server" ErrorMessage="The Username field is required"></asp:RequiredFieldValidator>

					
				</div>
			</div>
			<div class="form-group">
				<div class="control-label col-md-2">Password</div>
				<div class="col-md-3">
					<asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidatortPassword" CssClass="text-danger" ControlToValidate="txtPassword" runat="server" ErrorMessage="The Password field is required"></asp:RequiredFieldValidator>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<asp:CheckBox ID="RemberMe" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Remember me?"></asp:Label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click"></asp:Button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-2"></div>
				<div class="col-md-6">
					<asp:LinkButton ID="lbForgotPass" runat="server" PostBackUrl="#">Forgot Password?</asp:LinkButton> | New <asp:LinkButton ID="btnLinkSignUp" runat="server" PostBackUrl="EmployerRegistration.aspx">Sign Up</asp:LinkButton> 
				</div>
			</div>
		</div>

	</div>
</asp:Content>