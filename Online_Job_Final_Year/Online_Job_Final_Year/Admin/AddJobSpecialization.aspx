<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MyAdminMaster.Master" CodeBehind="AddJobSpecialization.aspx.cs" Inherits="Online_Job_Final_Year.Admin.AddJobSpecialization" %>

<asp:Content runat="server" ContentPlaceHolderID="MyAdminMainContent">
        <div class="form-horizontal">
            <h2> Add Specialization</h2>
            <hr/>
            <div class="form-group">
                <p><asp:Label runat="server" CssClass="col-md-2 control-label h4" Text="Specialization:"></asp:Label></p>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtAddSpecial" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddSpecial" ErrorMessage="The field is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <p><asp:Button runat="server" Text="Add" ID="btnAddSpecial" CssClass="btn btn-primary" OnClick="Click_AddSepecial"/></p>
                </div>
                </div>
                
            
        </div>
        
        <h3>Specialities</h3>
        <hr/>
          <div class="panel panel-default">
              <div class="panel-heading">
                  all Specialities
              </div>
              <asp:Repeater runat="server" ID="rptrSpecialities">
                  <HeaderTemplate>
                  <table class="table table-responsive">
                  <thead>
                  <tr>
                      <th>#</th>
                      <th>Name</th>
                      <th>Edit</th>
                       <th>Delete</th>
                  </tr>
                  </thead>
                  <tbody>
                  </HeaderTemplate>
                  <ItemTemplate>
                      
                      <tr>
                        <th><%# Eval("SpecialID")%></th>
                        <td><%# Eval("SpecialityName")%></td>
                        <td><a href="#">Edit</a></td>
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