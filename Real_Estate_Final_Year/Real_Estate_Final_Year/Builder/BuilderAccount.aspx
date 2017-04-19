<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="BuilderMaster.Master" CodeBehind="BuilderAccount.aspx.cs" Inherits="Real_Estate_Final_Year.Builder.BuilderAccount" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
        <div class="container center-block" style="max-width: 600px">
            <div class="form-group">
                
            
        
            <div class="h3">Account Settings</div>
             <asp:MultiView ID="AccountUpdateMultiView" runat="server">
                <asp:View runat="server" ID="ViewOne">
                     <div class="Registration-box">
                        <br/>
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText"/>
                        </p>
                        
                            <div class="col-lg-4">
                                <asp:Label runat="server" AssociatedControlID="txtUsername">New Username: </asp:Label>
                                </div>
                    <div class="col-lg-8">
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtUsername"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                                                            CssClass="text-danger" ErrorMessage="The New username field is required."/>
                            </div>
                            <div class="col-lg-4">
                                <asp:Label runat="server" AssociatedControlID="txtCurrentPass">Current Password: </asp:Label>
                                </div>
                    <div class="col-lg-8">
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" Text="current password" ID="txtCurrentPass"/>
                                <asp:RequiredFieldValidator runat="server" ID="lblPassowrdError" ControlToValidate="txtCurrentPass"
                                                            CssClass="text-danger" ErrorMessage="The current password field is required."/>
                            </div>
                      
                            <div class="col-lg-4">
                                <asp:Label runat="server" AssociatedControlID="txtNewPass">New Password: </asp:Label>
                                </div>
                                <div class="col-lg-8">
                                <asp:TextBox runat="server" ID="txtNewPass" CssClass="form-control" Text="New Password" TextMode="Password"/>

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewPass"
                                                            CssClass="text-danger" ErrorMessage="The New Password field is required."/>
                            </div>
                        
                            <div class="col-lg-4">
                                <asp:Label runat="server" AssociatedControlID="txtRepassword">Re-type Password: </asp:Label>
                                </div>
                    <div class="col-lg-8">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtRepassword" CssClass="form-control"/>

                                <asp:CompareValidator runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtRepassword"
                                                      CssClass="text-danger" Display="Dynamic" ErrorMessage="The Re-Type password does not match."/>

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRepassword"
                                                            CssClass="text-danger" ErrorMessage="The Ret-type Password field is required."/>
                            </div>
                       
                            <p>
                                <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_OnClick" Text="Cancel" CssClass="btn btn-primary form-control"/>
                            </p>
                       
                            <p>
                                <asp:Button runat="server" ID="UpdateAccount" OnClick="UpdateAccount_OnClick" Text="Update" CssClass="btn btn-success form-control"/>
                            </p>
                      </div>
                </asp:View>
                 <asp:View runat="server" ID="ConfirmationMessage">

                     <div class="text-center">
                         <p class="alert-success well text-center">
                             Your information have been successfully updated. You need to login with your new credentials to continue

                         </p>
                         <p class="alert-success well">
                             Your information have been successfully updated.
                         </p>
                         <p>
                             <asp:Button runat="server" ID="btnClose" CssClass="btn btn-success form-control" Text="Close" OnClick="btnClose_OnClick"/>
                         </p>
                     </div>
                 </asp:View>
            </asp:MultiView>

           
        </div>
</div>
</asp:Content>
