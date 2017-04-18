<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Online_Job_Final_Year.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContainer1" runat="server">
    <div class="container">

        <div class="form-horizontal">
            <h2>Administrator Login</h2>
            <hr class="text-center"/>
            <asp:PlaceHolder runat="server" ID="ErrorMess" Visible="False">
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText"/>
                </p>
            </asp:PlaceHolder>

            <div class="form-group">
                <asp:Label AssociatedControlID="txtUserName" runat="server" CssClass="control-label col-sm-2" Text="Username"></asp:Label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtPassword" runat="server" CssClass="control-label col-sm-2" Text="Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="txtPassword"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:CheckBox ID="RemberMe" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Remember me?"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-default" OnClick="btnLogin_Click"></asp:Button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:LinkButton ID="lbForgotPass" runat="server" PostBackUrl="#">Forgot Password !</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>