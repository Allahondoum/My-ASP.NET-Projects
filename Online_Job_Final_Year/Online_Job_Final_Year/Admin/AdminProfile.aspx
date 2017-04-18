<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MyAdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Online_Job_Final_Year.Admin.AdminProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MyAdminMainContent" runat="server">
        <div class="row">
            <div style="padding-left: 10px">
                <p>
                    <img src="../Images/avatar3.png" width="70" height="70" alt="company logo"/>
                </p>
                <p class="fullname h2">
                    <asp:Label runat="server" ID="lblFirstName"></asp:Label>
                    <asp:Label runat="server" ID="lblLastName"></asp:Label>
                </p>
                </div>
            <!--Personal Details-->
            <div class="col-md-8">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <p class="h4">Personal Details</p>
                    </div>
                    <div class="panel-body">
                        <p class="item-label">Phone: 

                    </p>
                    <p>
                        <asp:Label runat="server" ID="lblPhone"></asp:Label>
                    </p>
                    <p class="item-label">Email: </p>
                    <p>
                        <asp:Label runat="server" ID="lblEmail"></asp:Label>
                    </p>

                
                
                    <p class="item-label">Gender:</p>
                    <p>
                        <asp:Label runat="server" ID="lblGender"></asp:Label>
                    </p>


                    <p class="item-label"> Date Of Birth:</p>
                    <p>
                        <asp:Label runat="server" ID="lblDOB"></asp:Label>
                    </p>
                        <p>
                        <p class="item-label">Address: </p>
                    </p>
                    <p>
                        <asp:Label runat="server" ID="lblAddress"></asp:Label>
                    </p>
                    <p>
                        <p class="item-label">Accreditation Level: </p>
                    </p>
                    <p class="Category">
                        <asp:Label runat="server" ID="lblAccreditation"></asp:Label>
                    </p>
                        <p>
                          <asp:LinkButton runat="server" CssClass="btn btn-primary form-control" Height="40px" Width="100px" CommandName="Edit" Text="Edit Profile" PostBackUrl="#"/>

                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">Manage</div>
                    <div class="panel-body">
                        
                    </div>
                    </div>
                    <div class="panel panel-primary">
                    <div class="panel-heading">Publish</div>
                    <div class="panel-body">
                        
                    </div>
                        </div>
                        <div class="panel panel-primary">
                    <div class="panel-heading">Forum</div>
                    <div class="panel-body">
                        
                    </div>
                </div>
            </div>
        </div>
</asp:Content>