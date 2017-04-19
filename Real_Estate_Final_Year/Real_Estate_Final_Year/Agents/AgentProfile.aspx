<%@ Page Title="Agent Profile" Language="C#" MasterPageFile="~/Agents/AgentMaster.Master" AutoEventWireup="true" CodeBehind="AgentProfile.aspx.cs" Inherits="Real_Estate_Final_Year.Agents.AgentProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <p class="h2">Agent Profile</p>
    <br/>
       
            <div class="Profile-box clearfix">
                <div class="clearfix">
                        
                   
                       <p> <img src="../Images/Profiles/avatar6.png" width="70" height="70" alt="company logo"/></p>
                    <p class="Fullname">
                            Fullname: <asp:Label runat="server" ID="lblFullName"></asp:Label>
                        </p>
                        
                       
                        <hr/>
                    </div>
                  
                <div class="clearfix">
                     Gender:
                       <p><asp:Label runat="server" ID="lblGender"></asp:Label></p> 
                    
                   
                 
                        Date Of Birth: <p><asp:Label runat="server" ID="lblDOB"></asp:Label></p>
                 
                </div>
                <div class="clearfix">
                    
                        Phone: <p><asp:Label runat="server" ID="lblPhone"></asp:Label></p>
                          Email: <p><asp:Label runat="server" ID="lblEmail"></asp:Label></p>
                    
                </div>
                <div class="clearfix">
                    
                        Address: <p><asp:Label runat="server" ID="lblAddress"></asp:Label></p>
                          Location: <p><asp:Label runat="server" ID="lblLocation"></asp:Label></p>
                    
                </div>
                <div class="clearfix">
                    <div style="float: left; margin-top: 25px;">
                        <p class="Category" style="width: 360px; text-overflow: ellipsis; display: inline-block; overflow: hidden;">
                          <asp:Label runat="server" ID="lblCategory"></asp:Label>
                        </p>
                    </div>
                    <div class="Search-Details-Right">
                        <!-- <a href="#">Share</a> -->
                        <a class="btn btn-primary" href="#">Edit</a>
                    </div>
                </div>

            </div>
</asp:Content>
