<%@ Page Title="Log in" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.Login" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
    <!--- Login -->
    <div class="container" style="padding-top: 30px">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-5 col-sm-offset-5">
                     <h2 class="text-center">Job Seeker log in form.</h2>
                    <hr/>
                    
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="FailureText"/>
                    </p>
                   
               <div class="form-group">
                   
               
                            <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                        </div>
                <div class="form-group">
                    
                
                            <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Passowrd" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        
                   </div>
                    
                       <div class="checkbox">
                           <label>
                               
                           
                            <asp:CheckBox ID="RememberMe" runat="server"/>
                           Remember me ?</label>
                       </div>
                    
                        <p>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary form-control" OnClick="btnLogin_Click"/>
                        </p>
                        <div class="pull-left">
                            <asp:LinkButton ID="lbForgotPass" runat="server" PostBackUrl="#">Forgot Password?</asp:LinkButton>
                        </div>
                    <div class="pull-right">
                        New? <asp:LinkButton ID="btnLinkSignUp" CausesValidation="False" runat="server" PostBackUrl="JobSeekerRegistration.aspx">Sign Up</asp:LinkButton> 
                    </div>
                    </div>
                </div>

            

        </div>
    <!--- Sign in end -->

</asp:Content>