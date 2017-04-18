<%@ Page Title="Employer Profile" Language="C#" AutoEventWireup="true" CodeBehind="EmployersProfile.aspx.cs" MasterPageFile="~/Employers/EmployerMaster.Master" Inherits="Online_Job_Final_Year.Employers.EmployersProfile" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="FirstPart" ContentPlaceHolderID="EmployerMainContent" runat="server">
        <div class="row">
            <div style="padding-left: 20px">
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
                    <p class="items">Phone: </p>
                    <p>
                        <asp:Label runat="server" ID="lblPhone"></asp:Label>
                    </p>
                    <p class="items">Email: </p>
                    <p>
                        <asp:Label runat="server" ID="lblEmail"></asp:Label>
                    </p>
                </div>
            </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <p class="h4">Company Profile</p>
                    </div>
                    <div class="panel-body">
                        <p> <img src="../Images/logo2.jpg" width="100" height="70" alt="company logo"/></p>
                      <p class="fullname"><asp:Label runat="server" ID="lblCompanyName"></asp:Label></p> 
                        <p class="items">Address:<p/><p><asp:Label runat="server" ID="lblAddress"></asp:Label></p>
                          <p class="items">Location: </p><p><asp:Label runat="server" ID="lblLocation"></asp:Label></p>
                        <p class="items">Website:</p><p><a href="<%#Eval("lblWesite") %>"><asp:Label runat="server" ID="lblWebsite"></asp:Label></a></p>
                    <p class="items">Sprcialization:</p><p><asp:Label runat="server" ID="lblSepcialization"></asp:Label></p>
                    <p class="items">Type Of Employer:</p><p><asp:Label runat="server" ID="lblTypeOfEmployer"></asp:Label></p>
                    
                    <p class="items">Number of Employers : </p><p><asp:Label runat="server" ID="lblNumberOfEmployers"></asp:Label></p>
                    
                    </div>
                </div>
                <p>
                <!-- <a href="#">Share</a> -->
                <asp:LinkButton runat="server" class="btn btn-primary form-control" PostBackUrl="EditProfile.aspx" Text="Edit Profile"></asp:LinkButton>
            </p>
            </div>
            
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">Preferred candidates</div>
                    <div class="panel-body">
                        
                    </div>
                    </div>
                    <div class="panel panel-primary">
                    <div class="panel-heading">Recent posted Jobs</div>
                    <div class="panel-body">
                        
                    </div>
                        </div>
                        <div class="panel panel-primary">
                    <div class="panel-heading">Track Performance</div>
                    <div class="panel-body">
                        
                    </div>
                </div>
        </div>
    </div>
</asp:Content>