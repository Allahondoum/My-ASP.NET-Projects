<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MainMaster.Master" CodeBehind="AllJobs.aspx.cs" Inherits="Online_Job_Final_Year.AllJobs" %>
<asp:Content runat="server" ContentPlaceHolderID="PageContainer1">
		<ol class="breadcrumb">
			<li><a href="Default.aspx" title="Go to Home">Home</a></li>
			<li class="active">All Jobs</li>
		</ol>
		<div class="row">
			<div class="col-md-2">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
<!--Filter by Job Specialization-->
<div class="panel panel-default">
	<div class="panel-heading" role="tab" id="headingThree">
	  <h4 class="panel-title">
		<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSpec" aria-expanded="false" aria-controls="collapseSpec">
		  Specialization</a>
	  </h4>
	</div>
	<div id="collapseSpec" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
	  <div class="panel-body">
		Job Specialization
	  </div>
	</div>
  </div>
<!--Filter by Job Category-->
  <div class="panel panel-default">
	<div class="panel-heading" role="tab" id="headingOne">
	  <h4 class="panel-title">
		<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseCat" aria-expanded="true" aria-controls="collapseCat">
		  Category
		</a>
	  </h4>
	</div>
	<div id="collapseCat" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
	  <div class="panel-body">
		Categories
	  </div>
	</div>
  </div>
  <!--Filter by Job Location-->
  <div class="panel panel-default">
	<div class="panel-heading" role="tab" id="headingTwo">
	  <h4 class="panel-title">
		<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseLoc" aria-expanded="false" aria-controls="collapseLoc">
		  Location
		</a>
	  </h4>
	</div>
	<div id="collapseLoc" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
	  <div class="panel-body">
		Locations
	  </div>
	</div>
  </div>
  <!--Filter by Job Type-->
  <div class="panel panel-default">
	<div class="panel-heading" role="tab" id="headingThree">
	  <h4 class="panel-title">
		<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseType" aria-expanded="false" aria-controls="collapseType">
		  Type
		</a>
	  </h4>
	</div>
	<div id="collapseType" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
	  <div class="panel-body">
		Salary
	  </div>
	</div>
  </div>
</div>
			</div>
			
			<div class="col-md-10">
				 <div class="h2"><asp:Label ID="lblSearchTitle" runat="server" ></asp:Label> <%#Eval("Specialization") %></div>
	<hr />
	<asp:GridView runat="server" AutoGenerateColumns="False" ID="grdViewJobs" AllowPaging="True" GridLines="None" OnPageIndexChanged="grdViewJobs_PageIndexChanged" PageSize="3" ShowHeader="False">
		<Columns>
			<asp:TemplateField>
				<ItemTemplate>
			
			<div class="search-result-box clearfix">
				<div class="clearfix">
					<div class="">
						<p class="Job-Titre">
							<a href="#" title='<%#Eval("JobTitle") %>'><%#Eval("JobTitle") %></a>
						</p>
						</div> <div class="Search-Details-Right">
						<img src="Images/avatar3.png" width="70" height="70" alt="company logo"/>

					</div>
						<p class="Company-Nom"><%#Eval("CompanyName") %></p>
					
				   
				 
						<p><b>Date:</b> <%#Eval("Deadline") %></p>
				 
				</div>
				<div class="clearfix">
					
						<p><b>Location:</b> <%#Eval("Location") %></p>
						<p><b>Salary:</b> <%#Eval("Salary") %></p>
					
				</div>
				<div class="clearfix">
					<div style="float: left; margin-top: 25px;">
						<p class="Job-Category" style="width: 360px; text-overflow: ellipsis; display: inline-block; overflow: hidden;">
							<a href="#"></a><a href="#"><%#Eval("Specialization") %></a>
						</p>
					</div>
					<div class="Search-Details-Right">
						<!-- <a href="#">Share</a> -->
						<a class="btn btn-primary" href="JobDetails.aspx?item=<%#Eval("JobID") %>">View</a>
					</div>
				</div>
				<script type="text/javascript">
					$(function () {
						$('.item').matchHeight();
					});
				</script>

			</div>

		</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
			</div>
		</div>
</asp:Content>