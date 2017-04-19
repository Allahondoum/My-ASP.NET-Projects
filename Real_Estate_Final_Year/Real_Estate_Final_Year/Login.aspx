<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" MasterPageFile="MainMaster.Master" CodeBehind="Login.aspx.cs" Inherits="Real_Estate_Final_Year.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Login</h2>
            <hr class="text-center" />
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText"/>
                </p>
            <div class="form-group">
                <div class="control-label col-sm-2">Username</div>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" ControlToValidate="txtUserName" runat="server" ErrorMessage="The Username field is required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="control-label col-sm-2">Password</div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortPassword" CssClass="text-danger" ControlToValidate="txtPassword" runat="server" ErrorMessage="The Password field is required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:CheckBox ID="RemberMe" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Remember me?"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click"></asp:Button>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:LinkButton ID="lbForgotPass" runat="server" PostBackUrl="#">Forgot Password !</asp:LinkButton> | <asp:LinkButton ID="btnLinkSignUp" runat="server" PostBackUrl="JobSeekerRegistration.aspx">Sign Up</asp:LinkButton>
                </div>
            </div>
        </div>
         <script type="text/javascript">
        $(document).ready(function() {
            $.validate.addMethod("emailmatch",
                function(value, element) {
                    return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/i.test(value);
                }, "Please use a valid email address");
            $.validate.addMethod("usernamematch",
                function (value, element) {
                    return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
                }, "Username must contain only alphabets");

            $("#mainform").validate({
                rules:
                {
                    <%=txtUserName.UniqueID%>:
                    {
                        required: true,
                        rangelength: [5 - 10],
                        usernamematch: true
                    },
                    <%=txtPassword.UniqueID%>:
                    {
                        required: true,
                        rangelength: [6 - 30]
                    }
                },
                messages:
                {
                    <%=txtUserName.UniqueID%>:
                    {
                        required: "Username is required",
                        rangelength: "Username must be between {0} to {1} characters."
                    },
                    <%=txtPassword.UniqueID%>:
                    {
                        required: "Password is required",
                        rangelength: "Password must be between {0} to {1} characters."
                    },
                }
            });
        })
    </script>
    </div>
    </asp:Content>
