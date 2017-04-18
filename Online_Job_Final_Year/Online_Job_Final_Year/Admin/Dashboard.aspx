<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MyAdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Online_Job_Final_Year.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyAdminMainContent" runat="server">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5>Statistics</h5>
            </div>
            <div class="panel-body">
                <div class="col-sm-6 col-md-4 col-lg-2">
                  <div class="well text-center">
                    <h2><span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> 30</h2>
                    <h5>Reg. Employers</h5>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2">
                  <div class="well text-center">
                    <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 18</h2>
                    <h5>Reg. Seekers</h5>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2">
                  <div class="well text-center">
                    <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 20</h2>
                    <h5>Posted Jobs</h5>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2">
                  <div class="well text-center">
                    <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 10</h2>
                    <h5>Submitted Jobs</h5>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2">
                  <div class="well text-center">
                    <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 10</h2>
                    <h5>Under Process</h5>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-2">
                  <div class="well text-center">
                    <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 10</h2>
                    <h5>Processed</h5>
                  </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
