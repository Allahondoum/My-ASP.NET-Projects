<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MyAdminMaster.Master" CodeBehind="AddCities.aspx.cs" Inherits="Online_Job_Final_Year.Admin.AddCities" %>
<asp:Content runat="server" ContentPlaceHolderID="MyAdminMainContent">
        <div class="container">
        <div class="form-horizontal">
            <h2> Add Country</h2>
            <hr/>
            <div class="form-group">
                <p><asp:Label runat="server" CssClass="col-md-2 control-label h4" Text="Country:"></asp:Label></p>
                <div class="col-md-3">
                    <asp:DropDownList runat="server" ID="drpCountry" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="drpCountry" ErrorMessage="This field is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    
                </div>
                </div>
            <div class="form-group">
                <p><asp:Label runat="server" CssClass="col-md-2 control-label h4" Text="City/State:"></asp:Label></p>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtCity" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" ErrorMessage="This field is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    
                </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                        <div class="col-md-6">
                            <asp:Button runat="server" Text="Add" ID="btnAddCity" CssClass="btn btn-primary" OnClick="OnClickAddCity"/>
                        </div>
                    
                </div>
                
            
        </div>
      
         <h3>Countries</h3>
        <hr/>
          <div class="panel panel-default">
              <div class="panel-heading">
                  All Cities
              </div>
              <asp:Repeater runat="server" ID="rptrCities">
                  <HeaderTemplate>
                  <table class="table">
                  <thead>
                  <tr>
                      <th>#</th>
                      <th>City</th>
                      <th>Country</th>
                      <th>Edit</th>
                       <th>Delete</th>
                  </tr>
                  </thead>
                  <tbody>
                  </HeaderTemplate>
                  <ItemTemplate>
                      
                      <tr>
                        <th><%# Eval("CityID")%></th>
                        <td><%# Eval("CityName")%></td>
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
