<%@ Page Title="" Language="C#" MasterPageFile="EmployerMaster.Master" AutoEventWireup="true" CodeBehind="ViewMyJobs.aspx.cs" Inherits="Online_Job_Final_Year.Employers.ViewMyJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EmployerMainContent" runat="server">
    <div class="text-center h2">
        My Jobs
    </div>
    <div class="Registration-box">
        <table class="table-responsive">
            <tr>
                <td></td>
                <td>
                    <asp:GridView ID="ViewPostedJobs" AutoGenerateColumns="False" runat="server" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>

                                    <p>
                                        <strong>Job Title : </strong>
                                        <asp:Label runat="server" ID="lblJobTitle" Text='<%#Eval("JobTitle") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Category : </strong>
                                        <asp:Label runat="server" ID="lblCategory" Text='<%#Eval("Category") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Level : </strong>
                                        <asp:Label runat="server" ID="lblLevel" Text='<%#Eval("JobLevel") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Type : </strong>
                                        <asp:Label runat="server" ID="lblType" Text='<%#Eval("JobType") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Specialization : </strong>
                                        <asp:Label runat="server" ID="lblSpecialization" Text='<%#Eval("Specialization") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Qualification : </strong>
                                        <asp:Label runat="server" ID="lblQuali" Text='<%#Eval("MiniQualif") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Location : </strong>
                                        <asp:Label runat="server" ID="lblLocation" Text='<%#Eval("Location") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>DeadLine : </strong>
                                        <asp:Label runat="server" ID="lblDeadline" Text='<%#Eval("Deadline") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Experience : </strong>
                                        <asp:Label runat="server" ID="lblExperience" Text='<%#Eval("Experience") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Salary : </strong>
                                        <asp:Label runat="server" ID="lblSalary" Text='<%#Eval("Salary") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Description : </strong>
                                    </p>
                                    <p>
                                        <asp:Label runat="server" ID="lblDesc" Text='<%#Eval("Description") %>'></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Requirement : </strong>
                                    </p>
                                    <p>
                                        <asp:Label runat="server" ID="lblReq" Text='<%#Eval("Requirement") %>'></asp:Label>
                                    </p>

                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </td>

            </tr>
        </table>
    </div>
</asp:Content>