<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MyAdminMaster.Master" CodeBehind="ManageJobs.aspx.cs" Inherits="Online_Job_Final_Year.Admin.ManagePost" %>
<asp:Content runat="server" ContentPlaceHolderID="MyAdminMainContent">
    <script type="text/javascript">
        $(document).ready(function() {
            $('#jobsTable').dataTable();
        });
    </script>
    <h3>Posted Jobs</h3>
        <hr/>
          <div class="panel panel-default">
              <div class="panel-heading">
                  All Posted Jobs
              </div>
              <asp:Repeater runat="server" ID="rptrPostedJobs">
                  <HeaderTemplate>
                  <table class="table table-responsive">
                  <thead>
                  <tr>
                      <th>#</th>
                      <th>Company Name</th>
                      <th>Job Title</th>
                      <th>Approval Status</th>
                      <th>View</th>
                       <th>Delete</th>
                  </tr>
                  </thead>
                  <tbody>
                  </HeaderTemplate>
                  <ItemTemplate>
                      
                      <tr>
                        <th><%#Eval("JobID") %></th>
                        <th><%#Eval("CompanyName") %></th>
                        <th><%#Eval("JobTitle") %></th>
                        <td><a href="#"><asp:Label runat="server" ID="lblApprove">Approve</asp:Label></a></td>
                        <td><a href="#">View</a></td>
                        <td><a href="#">Delete</a></td>
                    </tr>
                  </ItemTemplate>
                  <FooterTemplate>
                      </tbody>
                     </table>
                  </FooterTemplate>
              </asp:Repeater>
          </div>
</asp:Content>