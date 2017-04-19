<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllOffers.aspx.cs" MasterPageFile="MainMaster.Master" Inherits="Real_Estate_Final_Year.AllOffers" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="container">
        <div class="row" style="padding-top: 50px">
            <div class="col-md-10">
                <asp:Repeater runat="server" ID="rptrProperty">
                <ItemTemplate>
            <div class="col-sm-3 col-md-3">
                <a style="text-decoration: none" href="PropertyDetails.aspx?item=<%#Eval("ProID") %>">
                <div class="thumbnail">
                    <div class="probrand"><%#Eval("CompanyName") %></div>
                    <img src="~/Images/Properties/<%#Eval("Title") %>/<%#Eval("Img1") %>" alt="Image" height="228" width="304"/>
                    <img src="Images/cinqueterre.jpg" /> 
                        <div class="caption">
                            <div class="proName"><%#Eval("Title") %></div>
                            <div class="proPrice"><%#Eval("Price") %>USD</div>
                            <div class="proName"><%#Eval("Type") %></div>
                        </div>
                </div>
                    </a>
            </div>
           </ItemTemplate>
</asp:Repeater>
            </div>
            
            
        </div>
    </div>
</asp:Content>


