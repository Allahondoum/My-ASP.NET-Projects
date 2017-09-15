<%@ Page Title="Forget Password" Language="C#" AutoEventWireup="true" MasterPageFile="MainMaster.Master" CodeBehind="ForgetPassword.aspx.cs" Inherits="Online_Job_Final_Year.ForgetPassword" %>
<asp:Content runat="server" ContentPlaceHolderID="PageContainer1">
	<div class="container">
	<div class="row">
		<div class="col-lg-offset-3 col-md-6 col-sm-offset-3 col-sm-6">
			<asp:MultiView runat="server" ID="forgetPassMultiView">
				<asp:View runat="server">
					<div class="text-center h1">
					<p><strong>Forgot Your Password</strong></p>
					</div>
						<div class="lead text-center">
							<p>Having trouble signing in? Enter your email address to reset your password.</p>
							<p>
							If unable to reset, <a href="#">Contact Us</a> for help
						</p>
						</div>
						<div class="form-group form-group-default">
							<label>Email</label>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
								<asp:TextBox TextMode="Email" name="fpemail" class="form-control" placeholder="Email" aria-describedby="basic-addon1" runat="server"/>
							</div>

						</div>
				    <p><asp:Button runat="server" CssClass="btn btn-lg btn-block btn-default mainbgcolor" ID="resetPass" OnClick="resetPass_OnClick" Text="Reset Password"/></p>
				</asp:View>
				<asp:View runat="server">

					<div class="alert-success well">
					<p>A link is sent to your email to reset your password.</p>
					</div>
					<asp:Button runat="server" CssClass="btn btn-success btn-block"  ID="BackToLogin" OnClick="BackToLogin_OnClick" Text="close" />
				</asp:View>
			</asp:MultiView>
		</div>
	</div>

</div>
</asp:Content>