<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/JobSeekerMaster.Master" AutoEventWireup="true" CodeBehind="JobSeekerAccount.aspx.cs" Inherits="Online_Job_Final_Year.JobSeeker.JobSeekerAccount" %>

<asp:Content ID="Content2" ContentPlaceHolderID="EmpMainContent" runat="server">
    <div class="center-block" style="width: 600px">
        <div class="panel panel-primary">
            <div class="panel-heading">Account Settings</div>
            <div class="panel-body">
             <asp:MultiView ID="AccountUpdateMultiView" runat="server">
                <asp:View runat="server" ID="ViewOne">
                     
                        <br/>
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText"/>
                        </p>
                        
                            <p>
                                <asp:Label runat="server" AssociatedControlID="txtUsername">New Username: </asp:Label>
                                </p>
                    <p>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtUsername"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                                                            CssClass="text-danger" ErrorMessage="The New username field is required."/>
                            </p>
                            <p>
                                <asp:Label runat="server" AssociatedControlID="txtCurrentPass">Current Password: </asp:Label>
                                </p>
                    <p>
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" Text="current password" ID="txtCurrentPass"/>
                                <asp:RequiredFieldValidator runat="server" ID="lblPassowrdError" ControlToValidate="txtCurrentPass"
                                                            CssClass="text-danger" ErrorMessage="The current password field is required."/>
                            </p>
                      
                            <p>
                                <asp:Label runat="server" AssociatedControlID="txtNewPass">New Password: </asp:Label>
                                </p>
                                <p>
                                <asp:TextBox runat="server" ID="txtNewPass" CssClass="form-control" Text="New Password" TextMode="Password"/>

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewPass"
                                                            CssClass="text-danger" ErrorMessage="The New Password field is required."/>
                            </p>
                        
                            <p>
                                <asp:Label runat="server" AssociatedControlID="txtRepassword">Re-type Password: </asp:Label>
                                </p>
                    <p>
                                <asp:TextBox runat="server" TextMode="Password" ID="txtRepassword" CssClass="form-control"/>

                                <asp:CompareValidator runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtRepassword"
                                                      CssClass="text-danger" Display="Dynamic" ErrorMessage="The Re-Type password does not match."/>

                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRepassword"
                                                            CssClass="text-danger" ErrorMessage="The Ret-type Password field is required."/>
                            </p>
                       
                            <p>
                                <asp:Button runat="server" CommandName="Cancel" OnClick="btn_Cancel" Text="Cancel" CssClass="btn btn-primary form-control"/>
                            </p>
                       
                            <p>
                                <asp:Button runat="server" CommandName="UpdateAccount" OnClick="btn_Update_Account" Text="Update" CssClass="btn btn-success form-control"/>
                            </p>
                     
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
                             <asp:Button runat="server" CssClass="btn btn-success form-control" CommandName="btnClose" Text="Close" OnClick="btnClose_Click"/>
                         </p>
                     </div>
                 </asp:View>
            </asp:MultiView>

            </div>
        </div>
    </div>
</asp:Content>