<%@ Page Title="" Language="C#" MasterPageFile="~/Builder/BuilderMaster.Master" AutoEventWireup="true" CodeBehind="BuilderProfile.aspx.cs" Inherits="Real_Estate_Final_Year.Builder.BuilderProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            
     <div style="padding-left: 30px">
                        
                   <p class="h2">Builder Profile</p>
                       <p> <img src="../Images/Profiles/avatar6.png" width="70" height="70" alt="company logo"/></p>
                    <p class="Fullname h2">
                            <asp:Label runat="server" ID="lblFname"></asp:Label>
                            <asp:Label runat="server" ID="lblLname"></asp:Label>
                        </p>
                        
                       
                        <hr/>
                    </div>
            <div class="col-md-8">
                 <div class="Profile-box clearfix">
               
                  
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
                    <div style="float: left">
                        <p class="Category">
                          <asp:Label runat="server" ID="lblCategory"></asp:Label>
                        </p>
                        <p></p>
                    </div>
                    </div>
                    <p>
                         <!-- <a href="#">Share</a> -->
                        <asp:Button runat="server" ID="btnEditProfile" Cssclass="btn btn-primary" PostBackUrl="BuilderEditProfile.aspx" Text="Edit Profile"></asp:Button>
                    </p>   
                

            </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Recent Posts
                         </div>
                        <div class="panel-body">
                            
                       
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Linked Agents
                         </div>
                        <div class="panel-body">
                            
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
