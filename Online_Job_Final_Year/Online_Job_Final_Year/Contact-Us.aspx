<%@ Page Title="Contact Us" Language="C#" MasterPageFile="MainMaster.Master" AutoEventWireup="true" CodeBehind="Contact-Us.aspx.cs" Inherits="Online_Job_Final_Year.Contact_Us" %>

<asp:Content runat="server" ContentPlaceHolderID="PageContainer1">
	<div class="container bgcolorwhite">
	<div class="row">
	<div class="text-center h1">
				Contact Us
			</div>
			<hr style="background-color:#ab66c8">
		<div class="col-lg-offset-1 col-md-6">
					<p class="h4 lead">We would like to hear from you.</p>
					<p class="h5">Fill up this to form to get in touch with us.</p>
					<div class="form-group">
						<asp:TextBox runat="server" ID="txtFullname" CssClass="form-control" placeholder="Full Name"/>
						<span><asp:RequiredFieldValidator ID="RequiredFieldValidatorFullname" CssClass="text-danger" runat="server" ErrorMessage="The Fullname field is Required !" ControlToValidate="txtFullname"></asp:RequiredFieldValidator></span>

					</div>

					<div class="form-group">
					  <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Email address"/>
					  <span><asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></span>

					</div>

					<div class="form-group">

				<asp:TextBox TextMode="MultiLine" Columns="30" Rows="10" runat="server" ID="txtMessage" CssClass="form-control" placeholder="Message"/>
				<span><asp:RequiredFieldValidator ID="RequiredFieldValidatorMessage" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></span>

				</div>
					<p>
						<asp:button runat="server" Cssclass="btn btn-lg btn-block btn-default mainbgcolor" Text="Send message"/></p>

					  <div id="form-messages" class="pull-left col-sm-8 col-xs-8">
						<span class="success col-sm-12 col-xs-12"></span>
						<span class="error col-sm-12 col-xs-12"></span>
					  </div>
					</div>
					<div class="col-md-4">
					<div id="address" class="h4">
						 <span class="glyphicon glyphicon-map-marker"></span> <strong>Address</strong> <br>
						 <p>
						  Cola Street, Near ATTC, <br>
						  Adjacent Societe Generale Head Office, <br>
						  Kokomlemle, P.O. Box AN18392, Accra<br/>
						  Accra - Ghana
						</p>

						<p>
						  <span class="glyphicon glyphicon-earphone"></span> <strong> Mobile Phone: </strong><br>  (+233) 026 331 9710</p>
						  <p>
						  <span class="glyphicon glyphicon-phone-alt"></span> <strong> Land line: </strong><br>  (+233) 030 225 0649
						</p>
						<p><span class="glyphicon glyphicon-envelope"> Email: </span><a href="mailto:info@onlinejob.com">info@onlinejob.com</a></p>
						</div>
				</div>
			 </div>
	</div>

</asp:Content>
