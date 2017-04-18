<%@ Page Title="Employer Registration" Language="C#" AutoEventWireup="true" CodeBehind="EmployerRegistration.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.EmployerRegistration" %>



<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
	<div class="h2 text-center">Employer Sign Up</div>
	<div class="h2">
		<hr />
	</div>
	<asp:MultiView runat="server" ID="EmployerRegisMultiView">
		<!-- Personal Details view-->

		<asp:View ID="ViewPersonalDetails" runat="server">
			<!--<div class="Registration-box">-->
				<div class="container Registration-box">
					<div class="row">
						<div class="h4" style="padding-left: 20px">
							Step 1 - Personal Details
						</div>
						<hr />
						<div class="col-md-6">

							<asp:Label runat="server" AssociatedControlID="FirstName">First Name<span style="color: red">*</span>: </asp:Label>
							<p>
								<asp:TextBox runat="server" CssClass="form-control" ID="FirstName" />

								<asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
									CssClass="text-danger" ErrorMessage="The First Name field is required." />
							</p>
							<asp:Label runat="server" AssociatedControlID="LastName">Last Name<span style="color: red">*</span>: </asp:Label>

							<p>
								<asp:TextBox runat="server" CssClass="form-control" ID="LastName" />

								<asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
									CssClass="text-danger" ErrorMessage="The Last Name field is required." />
							</p>
							<asp:Label runat="server" AssociatedControlID="DOB">Date Of Birth<span style="color: red">*</span>: </asp:Label>
							<p>
								<asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="DOB" />


								<asp:RequiredFieldValidator runat="server" ControlToValidate="DOB"
									CssClass="text-danger" ErrorMessage="The Date of birth field is required." />
							</p>
							<asp:Label runat="server" AssociatedControlID="txtUsername">Username :<span style="color: red">*</span> </asp:Label>
							<p>
								<asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="txtUsername" />

								<asp:RequiredFieldValidator ID="txtUsernameErrMess" runat="server" ControlToValidate="txtUsername"
									CssClass="text-danger" ErrorMessage="The Username field is required." />
							</p>


						</div>
						<div class="col-md-6">
							<asp:Label runat="server" AssociatedControlID="txtEmail">Email<span style="color: red">*</span>: </asp:Label>
							<p>
								<asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" />

								<asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
									CssClass="text-danger" ErrorMessage="The Email field is required." />
								<asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong email format." CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
							</p>
							<asp:Label runat="server" AssociatedControlID="txtPhone">Phone No<span style="color: red">*</span>: </asp:Label>
							<p>
								<asp:TextBox runat="server" CssClass="form-control" TextMode="Phone" ID="txtPhone" />


								<asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
									CssClass="text-danger" ErrorMessage="The Phone No field is required." />
							</p>

							<asp:Label runat="server" AssociatedControlID="Password">Password<span style="color: red">*</span>: </asp:Label>

							<p>
								<asp:TextBox runat="server" CssClass="form-control" TextMode="Password" ID="Password" />

								<asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
									CssClass="text-danger" ErrorMessage="The Password field is required." />
							</p>

							<asp:Label runat="server" AssociatedControlID="Repassword">Re-type Password<span style="color: red">*</span>: </asp:Label>
							<p>
								<asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="Repassword" />

								<asp:RequiredFieldValidator runat="server" ControlToValidate="Repassword"
									CssClass="text-danger" ErrorMessage="The Ret-type Password field is required." />
							</p>


						 

						</div>

					</div>
					<p>
						<asp:Button runat="server" Class="btn btn-primary" CommandName="Step1" OnClick="btn_Goto_Step2" Text="Next >>" Height="40px" Width="100px" />
					</p>

				</div>

</asp:View>
<!-- Company Details view-->

<asp:View ID="ViewProfessionalDetails" runat="server">
	<div class="container Registration-box">
				<div class="row">
									<div class="h4" style="padding-left: 20px">Step 2 - Company Details</div>

					<div>
						<hr />
					</div>
					<div class="col-md-6">
						
								<asp:Label runat="server" AssociatedControlID="txtCompanyName">Company Name: </asp:Label>
						<p>        
						<asp:TextBox runat="server" ID="txtCompanyName" CssClass="form-control" />
							  
								<asp:RequiredFieldValidator runat="server" ControlToValidate="txtCompanyName"
															CssClass="text-danger" ErrorMessage="Company Name field is required." />
							</p>
						
								<asp:Label runat="server" AssociatedControlID="txtCompanyWeb">Company Website: </asp:Label>
						<p>        
						<asp:TextBox runat="server" CssClass="form-control" TextMode="Url" ID="txtCompanyWeb" />
								
								<asp:RequiredFieldValidator runat="server" ControlToValidate="txtCompanyWeb"
															CssClass="text-danger" ErrorMessage="The Company Website field is required." />
							</p>
						<asp:Label runat="server" AssociatedControlID="drpSpecialization">Specialization: </asp:Label>
						<p>
							<asp:DropDownList CssClass="form-control" ID="drpSpecialization" runat="server">
								<asp:ListItem>None</asp:ListItem>
								<asp:ListItem>IT</asp:ListItem>
								<asp:ListItem>Administrative</asp:ListItem>
								<asp:ListItem>Construction</asp:ListItem>
								<asp:ListItem>Engineering</asp:ListItem>
								<asp:ListItem>Oil & Gaz</asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator runat="server" ControlToValidate="drpSpecialization"
								CssClass="text-danger" ErrorMessage="Specialization field is required." />
						</p>

						<asp:Label runat="server" AssociatedControlID="txtTypeOfEmployer">Type of Employer: </asp:Label>
						<p>


							<asp:DropDownList CssClass="form-control" ID="txtTypeOfEmployer" runat="server">
								<asp:ListItem>None</asp:ListItem>
									<asp:ListItem>Recruitment Agency</asp:ListItem>
									<asp:ListItem>Direct Employer</asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator runat="server" ControlToValidate="txtTypeOfEmployer"
								CssClass="text-danger" ErrorMessage="Type of Employer field is required." />
						</p>
					</div>
					<div class="col-md-6">


						<asp:Label runat="server" AssociatedControlID="txtNumberOfEmployee">Number of Employees </asp:Label>
						<p>
							<asp:DropDownList ID="txtNumberOfEmployee" CssClass="form-control" runat="server">
							   <asp:ListItem></asp:ListItem>
									<asp:ListItem>1-10</asp:ListItem>
									<asp:ListItem>11-50</asp:ListItem>
									<asp:ListItem>51-100</asp:ListItem>
									<asp:ListItem>101-500</asp:ListItem>
									<asp:ListItem>501-1000</asp:ListItem>
									<asp:ListItem>1001+</asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumberOfEmployee"
								CssClass="text-danger" ErrorMessage="Year of Experience field is required." />
						</p>

						<asp:Label runat="server" AssociatedControlID="Salary">Expected Salary(Monthly)*: </asp:Label>
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
								CssClass="text-danger" ErrorMessage="Year of Experience field is required." />
						</p>

						   <asp:Label runat="server" AssociatedControlID="drpEmployerCountry">Country<span style="color: red">*</span>: </asp:Label>
							<p>
								<asp:DropDownList CssClass="form-control" OnSelectedIndexChanged="drpSeekerCountry_OnSelectedIndexChanged" ID="drpEmployerCountry" runat="server" ToolTip="Select the location where live">
								   
								</asp:DropDownList>
								<br />
								<asp:RequiredFieldValidator runat="server" ControlToValidate="drpEmployerCountry"
									CssClass="text-danger" ErrorMessage="Country field is required." />
							</p>
							  <asp:Label runat="server" AssociatedControlID="drpEmployerCity">City/State<span style="color: red">*</span>: </asp:Label>
							<p>
								<asp:DropDownList CssClass="form-control" ID="drpEmployerCity" runat="server" ToolTip="Select the location where live">
									
								</asp:DropDownList>
								<br />
							   <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="drpEmployerCity"
									CssClass="text-danger" ErrorMessage="City/State field is required." />--%>
							</p>


						<asp:Label runat="server" AssociatedControlID="UploadLogo">Upload Logo: </asp:Label>

						<p>
							<asp:FileUpload CssClass="form-control" ID="UploadLogo" runat="server" />
							
						</p>

					</div>
					

				</div>
				<p>
					<asp:Button runat="server" CssClass="btn btn-primary" CommandName="PrevStep1" OnClick="btn_Goto_Step1" Text="<< Prev" Height="40px" Width="100px" />
					&nbsp;&nbsp;| &nbsp;&nbsp;
					<asp:Button runat="server" CssClass="btn btn-success" CommandName="Step2" OnClick="btn_Finish" Text="Finish" Height="40px" Width="100px" />

				</p>
			</div>
</asp:View>
<asp:View ID="Confirmation" runat="server">

	<div class="Registration-box">
				<h2>Step 3 - Confirmation </h2>

			<div class="alert-success well">
			Thank you for trusting us. Your registration is successful. Click on the close button to login with your new username and password.
			</div>
			<asp:Button runat="server" CssClass="btn btn-success" Height="40px" Width="100px" CommandName="BackToLogin" OnClick="btn_BackToLogin" Text="Close" />

			</div>

</asp:View>
<script type="text/javascript">
	
	$(document).ready(function () {
	    var validator = $("#formValidator").bootstrapValidator({
			feedbackIcons :{
				valid: "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-ref"
				
			},
				
			fields : {
				FirstName :{
					validators : {
						notEmpty : {
							message : "First Name is required"
						},
						stringLength:{
						min:5,
						message: "First Name  must be at least 5 character long"
					},
					regexp: {
							regexp: /[a-zA-Z]/,
							message: "The name can only consist of alphabetical characters"
						}
						
					}
				},
				LastName: {
					validators: {
						notEmpty: {
							message: "Last Name is required"
						},
						stringLength: {
							min: 5,
							message: "Last Name  must be at least 5 character long"
						},
						regexp: {
							regexp: /[a-zA-Z]/,
							message: "Last Name can only consist of alphabetical characters"
						}

					}
				},
				username:{
					validators:{
						notEmpty:{
							message: "username is required"
						},
						stringLength:{
							min:6,
							message: "username must be at least 6 character long"
						},
						regexp:{
							regexp: /^[a-zA-Z0-9_\.]+$/,
							message: "The username can only consist of alphabetical, number, dot and underscore"
						}
					}
				},
				
				email :{
					validators : {
						notEmpty : {
							message : "Email address is required"
						},
						stringLength:{
					min:8,
					max:30,
					message:"Email address must be between 8 and 30 characters long"
				}
					}
				},
				
				password :{
					validators : {
						notEmpty : {
							message : "Password is required"
						},
						stringLength : {
							min:8,
							message : "password must be 8 characters long"
						},
						different :{
							field : "email",
							message : "email address an password can not match"
						}
					}
				},
				
				confirmpassword :{
					validators : {
						notEmpty : {
							message : "Confirm password is required"
						},
						identical : {
							field : "password",
							message : "password do not match"
						},
						different :{
							field : "email",
							message : "email address an password can not match"
						}
						
						
					}
				},
				gender:{
					validators:{
						notEmpty:{
							message:"Gender is required"
						}
					}
				}
		
			}
		});
//		validator.on("success.form.bv", function(e){
//			e.preventDefault();
//			$("#form-validation").addClass("hidden");
//			$("#confirmation").removeClass("hidden");
//		});
		
	});
	
	</script>
</asp:MultiView>
</asp:Content>