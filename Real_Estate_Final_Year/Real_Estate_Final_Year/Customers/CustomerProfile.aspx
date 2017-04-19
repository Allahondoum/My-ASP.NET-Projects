<%@ Page Title="" Language="C#" MasterPageFile="~/Customers/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="Real_Estate_Final_Year.Customers.CustomerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <p class="h2">Builder Profile</p>
    <br/>
       
            <div class="Profile-box clearfix">
                <div class="clearfix">
                        
                   
                       <p> <img src="../Images/Profiles/avatar6.png" width="70" height="70" alt="company logo"/></p>
                    <p class="Fullname h2">
                            <asp:Label runat="server" ID="lblFullName"></asp:Label>
                        </p>
                        
                       
                        <hr/>
                    </div>
                  
                <div class="clearfix">
                     <p class="items-color">Gender:</p>
                       <p><asp:Label runat="server" ID="lblGender"></asp:Label></p> 
                    
                   
                 
                       <p class="items-color"> Date Of Birth:</p> <p><asp:Label runat="server" ID="lblDOB"></asp:Label></p>
                 
                </div>
                <div class="clearfix">
                    
                        <p class="items-color">Phone: </p><p><asp:Label runat="server" ID="lblPhone"></asp:Label></p>
                         <p class="items-color">Email: </p><p><asp:Label runat="server" ID="lblEmail"></asp:Label></p>
                    
                </div>
                <div class="clearfix">
                    
                        <p class="items-color">Address:<p/> <p><asp:Label runat="server" ID="lblAddress"></asp:Label></p>
                          <p class="items-color">Location: </p><p><asp:Label runat="server" ID="lblLocation"></asp:Label></p>
                    
                </div>
                <div class="clearfix">
                    <div style="float: left; margin-top: 25px;">
                        <p class="Category">
                          <asp:Label runat="server" ID="lblCategory"></asp:Label>
                        </p>
                        <p></p>
                    </div>
                    <div class="Search-Details-Right"  style="width: 360px; text-overflow: ellipsis; display: inline-block; overflow: hidden;">
                        <!-- <a href="#">Share</a> -->
                        <a class="btn btn-primary" href="#">Edit</a>
                    </div>
                </div>

            </div>

</asp:Content>
