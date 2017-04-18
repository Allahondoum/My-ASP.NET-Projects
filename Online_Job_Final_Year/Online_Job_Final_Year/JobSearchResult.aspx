<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobSearchResult.aspx.cs" MasterPageFile="~/MainMaster.Master" Inherits="Online_Job_Final_Year.Jobs.SearchResult" %>

<%@ PreviousPageType VirtualPath="Default.aspx" %>
<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">

    <div class="container" style="padding-top: 30px">
        <div class="row">
            <div class="col-md-4">
                <div class="list-group">
                    <div class="text-center h3 list-group-item">
                        <p><strong>Filter</strong></p>
                    </div>
                    <div class="list-group-item">
                        <asp:Label runat="server" AssociatedControlID="drpSpecial">Specialization: </asp:Label>
                        <p>
                            <asp:DropDownList ID="drpSpecial" runat="server" CssClass="form-control">
                                <asp:ListItem>Engineering</asp:ListItem>
                                <asp:ListItem>Information Technology</asp:ListItem>
                                <asp:ListItem>NGO</asp:ListItem>
                            </asp:DropDownList>
                        </p>
                    </div>
                    <div class="list-group-item">
                        <asp:Label runat="server" AssociatedControlID="drpCategory">Category: </asp:Label>
                        <p>
                            <asp:DropDownList ID="drpCategory" runat="server" CssClass="form-control">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Regular</asp:ListItem>
                                <asp:ListItem>Urgent</asp:ListItem>
                                <asp:ListItem>Instant</asp:ListItem>
                            </asp:DropDownList>
                        </p>
                    </div>
                    <div class="list-group-item">
                        <asp:Label runat="server" AssociatedControlID="drpLocation">Location: </asp:Label>
                        <p>
                            <asp:DropDownList ID="drpLocation" runat="server" CssClass="form-control">
                                <asp:ListItem>Location</asp:ListItem>
                                <asp:ListItem>Accra</asp:ListItem>
                                <asp:ListItem>Kumasi</asp:ListItem>
                                <asp:ListItem>Cape-Coast</asp:ListItem>
                            </asp:DropDownList>
                        </p>
                    </div>
                    <div class="list-group-item">
                        <asp:Label runat="server" AssociatedControlID="drpSalary">Salary: </asp:Label>
                        <p>
                            <asp:DropDownList ID="drpSalary" runat="server" CssClass="form-control">
                                <asp:ListItem>Ghc 150</asp:ListItem>
                                <asp:ListItem>Ghc 200-500</asp:ListItem>
                                <asp:ListItem>Ghc 500-800</asp:ListItem>
                                <asp:ListItem>Ghc 800-1100</asp:ListItem>
                                <asp:ListItem>Ghc 1100-1400</asp:ListItem>
                                <asp:ListItem>Ghc 1400-1700</asp:ListItem>
                                <asp:ListItem>Ghc 2000-above</asp:ListItem>
                            </asp:DropDownList>
                        </p>
                    </div>
                    <div class="list-group-item">
                        <asp:Button CssClass="btn btn-primary btn-block" Text="GO" runat="server" ID="filter" />
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <ol class="breadcrumb">
                    <li><a href="Default.aspx" title="Go to Home">Home</a></li>
                    <li class="active">Job Display</li>
                </ol>
                <div class="h2">
                    <asp:Label ID="lblSearchTitle" runat="server"></asp:Label>
                    <%#Eval("Specialization") %>
                </div>
                <hr />
                <asp:Repeater runat="server" ID="SearchRslt" OnItemDataBound="SearchRslt_ItemDataBound">
                    <ItemTemplate>

                        <div class="search-result-box clearfix">
                            <div class="clearfix">
                                <div class="">
                                    <p class="Job-Titre">
                                        <a href="#" title='<%#Eval("JobTitle") %>'><%#Eval("JobTitle") %></a>
                                    </p>
                                </div>
                                <div class="Search-Details-Right">
                                    <img src="Images/avatar3.png" width="70" height="70" alt="company logo" />

                                </div>
                                <p class="Company-Nom"><%#Eval("CompanyName") %></p>


                                <p>
                                    <b>Date:</b> <%#Eval("Deadline") %>
                                </p>

                            </div>
                            <div class="clearfix">

                                <p>
                                    <b>Location:</b> <%#Eval("Location") %>
                                </p>
                                <p>
                                    <b>Salary:</b> <%#Eval("Salary") %>
                                </p>

                            </div>
                            <div class="clearfix">
                                <div style="float: left; margin-top: 25px;">
                                    <p class="Job-Category" style="width: 360px; text-overflow: ellipsis; display: inline-block; overflow: hidden;">
                                        <a href="#"></a><a href="#"><%#Eval("Specialization") %></a>
                                    </p>
                                </div>
                                <div class="Search-Details-Right">
                                    <!-- <a href="#">Share</a> -->
                                    <a class="btn btn-primary" href="JobDetails.aspx?item=<%#Eval("JobID") %>">View</a>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('.item').matchHeight();
                                });
                            </script>

                        </div>

                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label CssClass="text-primary h2" runat="server" ID="lblEmptymss" Visible="False"></asp:Label>
                        <div class="pull-right">
                    <ul class="pagination pager">
                        <li><a href="#">&larr; Previous</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">Next &rarr;</a></li>
                    </ul>
                </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
