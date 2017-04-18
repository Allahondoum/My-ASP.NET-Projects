<%@ Page Title="Main Login" Language="C#" AutoEventWireup="true" CodeBehind="MainLogin.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.MainLogin" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
    <div class="raw">
        <div class="col-md-6">
        <section class="text-center">
            <h2>Job Seeker Login.</h2><br/>
            <img src="Images/avatar3.png" class="img-circle" alt="Job Seeker" height="154" width="154"/><br/>
            <h3>Login to continue building your deam.</h3><br/>
            <asp:Button runat="server" CommandName="JobSeekerLogin" OnClick="Open_JobSeeker_Login" Text="I am a Job Seeker" CssClass="btn btn-primary btn-lg"/>

        </section>
            </div>
    <div class="col-md-6">
    <section class="text-center">
        <h2>Employer Login</h2><br/>
        <img src="Images/employer.svg" alt="Employer" height="154" width="154"/><br/>
        <h3>Continue to seek for the right candidate</h3><br/>

        <asp:Button runat="server" CommandName="EmployerLogin" OnClick="Open_Employer_Login" Text="I am an Employer" CssClass="btn btn-primary btn-lg"/>
    </section>
        </div>
        </div>
</asp:Content>