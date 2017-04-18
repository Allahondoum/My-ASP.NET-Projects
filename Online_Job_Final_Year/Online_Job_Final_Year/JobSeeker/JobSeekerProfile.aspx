<%@ Page Title="Job Seeker Profile" Language="C#" AutoEventWireup="true" CodeBehind="JobSeekerProfile.aspx.cs" MasterPageFile="~/JobSeeker/JobSeekerMaster.Master" Inherits="Online_Job_Final_Year.JobSeeker.JobSeekerProfile" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>


<asp:Content ID="FirstPart" ContentPlaceHolderID="EmpMainContent" runat="server">
    <div class="container">
        <div class="row">
            <div style="padding-left: 20px">
                <p> <img src="../Images/avatar3.png" width="70" height="70" alt="company logo"/></p>
                 <p class="fullname h2">
                        <asp:Label runat="server" ID="lblFirstName"></asp:Label>
                        <asp:Label runat="server" ID="lblLastName"></asp:Label>
                        </p>
            </div>
            
            <!--Main part-->
            <div class="col-md-8">
                
                    <div class="panel panel-primary">
                
                        
                   <div class="panel-heading">Personal Details</div>


                        <div class="panel-body">


                            <p class="item-label">Gender:</p>
                            <p>
                                <asp:Label runat="server" ID="lblGender"></asp:Label>
                            </p>


                            <p class="item-label"> Date Of Birth:</p>
                            <p>
                                <asp:Label runat="server" ID="lblDOB"></asp:Label>
                            </p>


                            <p class="item-label">Phone: </p>
                            <p>
                                <asp:Label runat="server" ID="lblPhone"></asp:Label>
                            </p>
                            <p class="item-label">Email: </p>
                            <p>
                                <asp:Label runat="server" ID="lblEmail"></asp:Label>
                            </p>


                            <p class="item-label">Location: </p>
                            <p>
                                <asp:Label runat="server" ID="lblLocation"></asp:Label>
                            </p>
                        </div>
                        </div>
                <!--Prodessional Details-->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Professional Details
                    </div>
                    <div class="panel-body">
                        <p class="item-label">Highest Education: </p>
                        <p>
                            <asp:Label runat="server" ID="lblHighestEdu"></asp:Label>
                        </p>

                        <p class="item-label">Expected Salary(Monthly):
                        <p/>
                        <p>
                            <asp:Label runat="server" ID="lblSalary"></asp:Label>
                        </p>

                        <p class="item-label">
                            Year Of Experience:
                        </p>
                        <p>
                            <asp:Label runat="server" ID="lblYearOfExp"></asp:Label>
                        </p>

                        <p class="item-label">Specialization:</p>
                        <p class="Category">
                            <asp:Label runat="server" ID="lblSepcialization"></asp:Label>
                        </p>


                        <!-- <a href="#">Share</a> -->

                    </div>
                </div>
                <p>
                    <asp:LinkButton runat="server" class="btn btn-primary form-control" PostBackUrl="~/JobSeeker/EditJobSeekerProfile.aspx" Text="Edit Profile"></asp:LinkButton>

                </p>

            </div>  
            </div>
        </div> 
</asp:Content>