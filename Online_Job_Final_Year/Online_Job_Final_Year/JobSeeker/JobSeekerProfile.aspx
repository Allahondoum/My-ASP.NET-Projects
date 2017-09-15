<%@ Page Title="Job Seeker Profile" Language="C#" AutoEventWireup="true" CodeBehind="JobSeekerProfile.aspx.cs" MasterPageFile="~/JobSeeker/JobSeekerMaster.Master" Inherits="Online_Job_Final_Year.JobSeeker.JobSeekerProfile" %>

<asp:Content ID="FirstPart" ContentPlaceHolderID="EmpMainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4">
                <div class="thumbnail">

                    <div class="panel-body">
                        <center class="page-header">
                            <img class="img-responsive img-circle" width="150" height="150" src="../Images/avatar3.png" />
                            <p class="fullname">
                                <h2><asp:Label runat="server" ID="lblFirstName"></asp:Label>
                                <asp:Label runat="server" ID="lblLastName"></asp:Label></h2>
                            </p>
                            <h4 class="text-muted"><asp:Label runat="server" ID="lblSepcialization"></asp:Label></h4>

                        </center>


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
                            <p>
                                <asp:LinkButton runat="server" class="btn btn-primary form-control" PostBackUrl="~/JobSeeker/EditJobSeekerProfile.aspx" Text="Edit Profile"></asp:LinkButton>

                            </p>
                        </div>
                </div>
            </div>
            </div>


            <!--Main part-->
            <div class="col-md-8">

                <!--Prodessional Details-->
                <div class="panel panel-default">
                 <div class="panel-body">

                     <div data-spy="scroll" class="tabbable-panel">
                        <div class="tabbable-line">
                        <ul class="nav nav-tabs ">
                            <li class="active">
                                <a href="#tab_default_1" data-toggle="tab">Details</a>
                            </li>
                            <li>
                                <a href="#tab_default_2" data-toggle="tab">Education& Career</a>
                            </li>
                            <li>
                                <a href="#tab_default_3" data-toggle="tab">Family Details</a>
                            </li>
                            <li>
                                <a href="#tab_default_4" data-toggle="tab">Desire Partner</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_default_1">
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
                            <p class="item-label">CV:</p>
                            <p>
                                <asp:LinkButton runat="server" ID="lblCV" OnClick="lblCV_OnClick"></asp:LinkButton>
                            </p>

                            </div>
                            <div class="tab-pane" id="tab_default_2">
                                <p>
                                    Education& Career

                                </p>
                            </div>
                            <div class="tab-pane" id="tab_default_3">
                                <p>
                                    Family Details

                                </p>
                            </div>
                            <div class="tab-pane" id="tab_default_4">
                                <p>
                                    Lifestyle


                                </p>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
             </div>
            </div>
        </div>
    </div>
</asp:Content>