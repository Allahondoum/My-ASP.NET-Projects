<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="AgentMaster.Master" CodeBehind="ViewClients.aspx.cs" Inherits="Real_Estate_Final_Year.Agents.ViewClients" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="container">
		<div class="row">
			<div class="col-md-8">
    		  <div class="panel panel-success">
			  <div class="panel-heading">
				 Linked Clients
			  </div>
				<asp:Repeater runat="server" ID="rptrClients">
				  <HeaderTemplate>
				  <table class="table">
				  <thead>
				  <tr>
					  <th>#</th>
					  <th>Name</th>
					  <th>View</th>
					   <th>Delete</th>
				  </tr>
				  </thead>
				  <tbody>
				  </HeaderTemplate>
				  <ItemTemplate>
					  
					  <tr>
						<th><%# Eval("ProID")%></th>
						<td><%# Eval("Title")%></td>
						<td><asp:LinkButton data-toggle="modal" ID="showProp" runat="server" OnServerClick="showProp_OnServerClick" data-target="#ViewPro" href="#">View</asp:LinkButton></td>
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
            </div></div>

</asp:Content>
