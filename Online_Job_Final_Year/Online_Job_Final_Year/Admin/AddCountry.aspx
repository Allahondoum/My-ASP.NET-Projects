<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCountry.aspx.cs" MasterPageFile="MyAdminMaster.Master" Inherits="Online_Job_Final_Year.Admin.AddCountry" %>

<asp:Content runat="server" ContentPlaceHolderID="MyAdminMainContent">
      <div class="container">
        <div class="form-horizontal">
            <h2> Add Country</h2>
            <hr/>
            <div class="form-group">
                <p><asp:Label runat="server" CssClass="col-md-2 control-label h4" Text="Country:"></asp:Label></p>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtAddCountry" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddCountry" ErrorMessage="The field is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    
                </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                        <div class="col-md-6">
                            <asp:Button runat="server" Text="Add" ID="btnAddCountry" CssClass="btn btn-primary" OnClick="btnAddCountry_OnClick"/>
                        </div>
                    
                </div>
                
            
        </div>
        <h3>Countries</h3>
        <hr/>
          <div class="panel panel-default">
              <div class="panel-heading">
                  All Countries
              </div>
              <asp:Repeater runat="server" ID="rptrCountry">
                  <HeaderTemplate>
                  <table class="table">
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
                        <th><%# Eval("CountryID")%></th>
                        <td><%# Eval("CountryName")%></td>
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
    </div>
</asp:Content>