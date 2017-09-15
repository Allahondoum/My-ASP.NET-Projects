<%@ Page Title="Job Details" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="Online_Job_Final_Year.JobDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="PageContainer1" runat="server">
	<div class="container" style="padding-top: 30px">

		<div class="row">

			<!--Main Side-->
			<asp:Repeater runat="server" ID="rptrJobDetails">
				<ItemTemplate>
					<ol class="breadcrumb">
				<li>
					<a href="Default.aspx" title="Go to Home">Home</a>
				</li>
				<li>
					<a href="JobSearchResult.aspx" title="Go to Home">All Jobs</a>
				</li>
				<li class="active"><%#Eval("JobTitle") %></li>
			</ol>
					<!--Right Side bar-->
			<div class="col-md-3 Right-Side-JobDetails">
				<p class="h3 text-primary">Summary</p>
				<hr/>
				<p><b>Company</b></p>
				<p><%#Eval("CompanyName") %></p>
				<p><b>Industry</b></p>
			   <p><%#Eval("Specialization") %></p>
				<p><b>Experience(in Year)</b></p>
				<p><%#Eval("Experience") %></p>
				<p><b>Contract Type</b></p>
				<p><%#Eval("JobType") %></p>
				<p><b>Degree</b></p>
				<p><%#Eval("MiniQualif") %></p>
				<p><b>Salary</b></p>
				<p><%#Eval("Salary") %></p>
				<p><b>Location</b></p>
				<p><%#Eval("Location") %></p>
				<p><b>Deadline</b></p>
				<p><%#Eval("Deadline") %></p>
				<p>
                    <!--<a  class="btn btn-primary mainbgcolor" href="SubmissionForm.aspx?item=<%# Eval("JobID")%>">Apply Now</a>-->
                    <asp:Button runat="server" CssClass="btn btn-primary btn-lg" ID="btnApply" OnClick="btnApply_OnClick" Text="Apply Now"/>
				</p>


			</div>

			<div class="col-md-9 Main-Side-JobDetails">
				<p><b>Job title</b></p>
				<p><%#Eval("JobTitle") %></p>
				<p><b>Job Category</b></p>
				<p><%#Eval("Category") %></p>
				<p><b>Description</b></p>
				<p><%#Eval("Description") %></p>
				<p><b>Requirement</b></p>
				<p><%#Eval("Requirement") %></p>


			</div>

					</ItemTemplate>
				</asp:Repeater>
		</div>
	</div>

</asp:Content>
