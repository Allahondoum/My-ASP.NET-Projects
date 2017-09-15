<%@ Page Title="Sign Up" Language="C#" AutoEventWireup="true" CodeBehind="MainSignUp.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.MainSignUp" %>

<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
    <div style="padding-top: 50px">
        <div class="row">
            <div class="col-md-6">
                <section class="text-center">
                    <h2>Job Seeker Sign Up.</h2><br/>
                    <img src="Images/employer.svg" class="img-circle" alt="Job Seeker" width="200" height="200"/><br/>
                    <h3>Your job's dream is one step away </h3><br/>
                    <asp:Button runat="server" CommandName="JobSeekerSignUp" OnClick="Open_JobSeeker_Form" Text="Sign Up" CssClass="btn btn-primary btn-lg"/>
                </section>
            </div>
            <div class="col-md-6">
                <section class="text-center">
                    <h2>Employer Sign Up</h2><br/>
                    <img src="Images/avatar3.png" class="img-circle" width="200" height="200"/><br/>
                    <h3>Your right candidate is one step away</h3><br/>

                    <asp:Button runat="server" CommandName="EmployerSignUp" OnClick="Open_Employer_Form" Text="Sign Up" CssClass="btn btn-primary btn-lg"/>
                </section>
             </div>
        </div>
    </div>
</asp:Content>