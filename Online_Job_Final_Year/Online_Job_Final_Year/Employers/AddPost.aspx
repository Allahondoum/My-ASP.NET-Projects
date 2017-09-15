<%@ Page Title="Add Job" Language="C#" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" MasterPageFile="~/Employers/EmployerMaster.Master" Inherits="Online_Job_Final_Year.Employers.AddPost" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script>
        function showAltCont()
        {
            document.getElementById().style =
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EmployerMainContent" runat="server">

<h2>SUBMIT JOB FORM</h2>
<asp:MultiView ID="SubmitJobMultiView" runat="server">

<!--View One: Display the job critiria-->
<asp:View runat="server" ID="JobDetails">

        <div class="row">
            <div class="col-md-8">
                 <div class="panel panel-primary">
                <div class="panel-heading">
                    <p class="h4">Job Details</p>
                </div>
                <div class="panel-body">
                 <Label>Job Title<span style="color: red">*</span>: </Label>
                    <p>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtJobTitle"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtJobTitle"
                                            CssClass="text-danger" ErrorMessage="The Job Title field is required."/>
                    </p>

                        <asp:Label runat="server" AssociatedControlID="txtCategory">Category<span style="color: red">*</span>: </asp:Label>
                    <p>
                        <asp:DropDownList ID="txtCategory" runat="server" CssClass="form-control" ToolTip="Select the job category">
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>Regular</asp:ListItem>
                            <asp:ListItem>Urgent</asp:ListItem>
                            <asp:ListItem>Instant</asp:ListItem>
                        </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCategory"
                                            CssClass="text-danger" ErrorMessage=" field is required."/> </p>


                 <asp:Label runat="server" AssociatedControlID="txtDescription">Description :<span style="color: red">*</span> </asp:Label>
                <p>
                    <CKEditor:CKEditorControl ID="txtDescription" CssClass="form-control"  runat="server">
                </CKEditor:CKEditorControl>
                <asp:RequiredFieldValidator ID="txtUsernameErrMess" runat="server" ControlToValidate="txtDescription"
                                            CssClass="text-danger" ErrorMessage="The Description field is required."/>
                    </p>
                    <p>
                        <asp:TextBox runat="server" ID="txtDesc2" TextMode="MultiLine" CssClass="textarea_editor" />
                    </p>

                    <asp:Label runat="server" AssociatedControlID="txtQualiRequirement">Requirement :<span style="color: red">*</span> </asp:Label>
                <p>
                    <CKEditor:CKEditorControl ID="txtQualiRequirement" CssClass="form-control"  runat="server"></CKEditor:CKEditorControl>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQualiRequirement"
                                            CssClass="text-danger" ErrorMessage="The Description field is required."/>

                </p>

                <asp:Button runat="server" CssClass="btn btn-default btn-block" CommandName="Step1" OnClick="btn_Next" Text="Next"/>
                </div>
            </div>


            </div>
        </div>
</asp:View>
<asp:View runat="server" ID="CompanyRequirement">
     <div class="row">
            <div class="col-md-8">
                 <div class="panel panel-primary">
                <div class="panel-heading">
                    <p class="h4">Company Requirement</p>
                </div>
                <div class="panel-body">

                        <asp:Label runat="server" AssociatedControlID="txtLevel">Job Level<span style="color: red">*</span>: </asp:Label>
                  <p>
                <asp:DropDownList ID="txtLevel" runat="server" CssClass="form-control">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Experienced</asp:ListItem>
                    <asp:ListItem>Fresher</asp:ListItem>
                    <asp:ListItem>Manager</asp:ListItem>
                    <asp:ListItem>Operator</asp:ListItem>
                    <asp:ListItem>Advanced</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLevel"
                                            CssClass="text-danger" ErrorMessage="Level field is required."/></p>

                <asp:Label runat="server" AssociatedControlID="txtLocation">Location<span style="color: red">*</span>: </asp:Label>

                    <p>
                <asp:DropDownList ID="txtLocation" runat="server" CssClass="form-control">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Tchad</asp:ListItem>
                    <asp:ListItem>Ghana</asp:ListItem>
                    <asp:ListItem>Togo</asp:ListItem>
                    <asp:ListItem>Benin</asp:ListItem>
                    <asp:ListItem>Cameroon</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLocation"
                                            CssClass="text-danger" ErrorMessage="Location field is required."/></p>

                    <asp:Label runat="server" AssociatedControlID="txtspeciality">Specialization: </asp:Label>
                <p>
                <asp:DropDownList ID="txtspeciality" runat="server" CssClass="form-control">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>ICT / Telecommunications</asp:ListItem>
                    <asp:ListItem>Oil &amp; Gas / Mining</asp:ListItem>
                    <asp:ListItem>Food Services</asp:ListItem>
                    <asp:ListItem>Consulting</asp:ListItem>
                    <asp:ListItem>Real Estate/Construction</asp:ListItem>
                    <asp:ListItem>Travels/Tours</asp:ListItem>
                    <asp:ListItem>Healthcare</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtspeciality"
                                            CssClass="text-danger" ErrorMessage="Specialization field is required."/></p>

                    <asp:Label runat="server" AssociatedControlID="txtJobType">Job Type<span style="color: red">*</span>: </asp:Label>
                <p>
                <asp:DropDownList ID="txtJobType" runat="server" CssClass="form-control" ToolTip="Select the location where live">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Full Time</asp:ListItem>
                    <asp:ListItem>Part Time</asp:ListItem>
                    <asp:ListItem>Internship</asp:ListItem>
                    <asp:ListItem>Temporary</asp:ListItem>
                </asp:DropDownList>

                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtJobType"
                                            CssClass="text-danger" ErrorMessage="The Job Type field is required."/></p>

                     <asp:Label runat="server" AssociatedControlID="txtMiniQualif">Minimum Qualification: </asp:Label>
                <p>
                <asp:DropDownList ID="txtMiniQualif" runat="server" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>MPhil/PhD</asp:ListItem>
                    <asp:ListItem>MBA/MSc</asp:ListItem>
                    <asp:ListItem>BSc/BBA</asp:ListItem>
                    <asp:ListItem>HND</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                    <asp:ListItem>High School(S.S.C.E)</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMiniQualif"
                                            CssClass="text-danger" ErrorMessage="Minimum Education field is required."/></p>

                    <asp:Label runat="server" AssociatedControlID="txtPreferedYearOfExp">Prefered Year of Experience*: </asp:Label>
                <p>
                <asp:DropDownList ID="txtPreferedYearOfExp" runat="server" Height="30" Width="150px">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPreferedYearOfExp"
                                            CssClass="text-danger" ErrorMessage="Year of Experience field is required."/></p>

                <asp:Label runat="server" AssociatedControlID="txtSalary">Expected Salary(Monthly)*: </asp:Label>
                <p>
                <asp:DropDownList ID="txtSalary" runat="server" CssClass="form-control">
                    <asp:ListItem>Ghc 150</asp:ListItem>
                    <asp:ListItem>Ghc 200-500</asp:ListItem>
                    <asp:ListItem>Ghc 500-800</asp:ListItem>
                    <asp:ListItem>Ghc 800-1100</asp:ListItem>
                    <asp:ListItem>Ghc 1100-1400</asp:ListItem>
                    <asp:ListItem>Ghc 1400-1700</asp:ListItem>
                    <asp:ListItem>Ghc 2000-above</asp:ListItem>
                </asp:DropDownList>
                <br/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSalary"
                                            CssClass="text-danger" ErrorMessage="Year of Experience field is required."/></p>

                     <asp:Label runat="server" AssociatedControlID="txtExpiryDate">Expiry Date<span style="color: red">*</span>: </asp:Label>
                    <p>
                <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtExpiryDate"/>

                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtExpiryDate"
                                            CssClass="text-danger" ErrorMessage="The Expiry Date field is required."/></p>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Button runat="server" CssClass="btn btn-block" CommandName="PrevStep1" OnClick="btn_Goto_Step1" Text="<< Prev"/>
                    </div>
                    <div class="col-md-6">
                        <asp:Button runat="server" CssClass="btn btn-block" CommandName="Step2" OnClick="btn_Goto_Summary" Text="Next >>"/>
                    </div>
                 </div>
            </div>
      </div>
</div>
    </div>
</asp:View>
    <!--
<asp:View ID="ViewSummary" runat="server">

    <table class="table-responsive">
        <tr>
            <td colspan="4">
                <h2>Step 3 - Summary </h2>

            </td>
        </tr>
        <tr>
            <td colspan="4">
                <hr/>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <h3>Job Details</h3>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <hr/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Job Title: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblJobTitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Category: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblCategory"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Description: </asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label runat="server" ID="lblDesc"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Requirement: </asp:Label>

            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label runat="server" ID="lblRequirement"></asp:Label>
            </td>
        </tr>

        <tr>
            <td colspan="4">
                <asp:Label runat="server">
                    <h3>Company Requirement</h3>
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <hr/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Job Level: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblJobLevel"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" CssClass="h4">Specialization: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblSpecialization"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Job Type: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblJobType"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" CssClass="h4">Location: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblLocation"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Minimum Requirement: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblMiniRequirement"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" CssClass="h4">Salary(Monthly): </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblSalary"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" CssClass="h4">Prefered Year of Experience: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblYearOfExp"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" CssClass="h4">Expiry Date: </asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblExpDate"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" CssClass="btn btn-xs" CommandName="PrevStep2" Height="40px" Width="100px" OnClick="btn_Goto_Step2" Text="<< Prev"/>
            </td>
            <td>
                <asp:Button runat="server" CssClass="btn btn-success" Height="40px" Width="100px" CommandName="Finish" OnClick="btn_Finish" Text="Finish"/>
            </td>
        </tr>
    </table>
</asp:View>-->
<asp:View ID="View1" runat="server">


            <div class="row">
                <div class="col-lg-offset-4">
                    <h2>Step 3 - Confirmation </h2>
                    <div>
                    <h5 class="alert-success well">Thank you for trusting us. Your Job have been submitted to the administrator for approval before publishing.</h5>
                    </div>
                    <asp:LinkButton runat="server" CssClass="btn btn-block btn-success" CommandName="BackToLogin" PostBackUrl="#" Text="Close"/>
                </div>
            </div>



</asp:View>
</asp:MultiView>

</asp:Content>