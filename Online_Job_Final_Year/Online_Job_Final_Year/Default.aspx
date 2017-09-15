<%@ Page Title="Home" Language="C#" MasterPageFile="~/MainMaster.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Job_Final_Year.Default" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">

    <div class="img-responsive" style="background-image: url('Images/Partners.jpg')">
        <div class="container" style="height: 400px; padding-top: 30px">
            <div class="MainTitle">
                <span class="subTitle1">Online</span> <span class="subTitle2">#Job </span><span class="subTitle3">Site</span>
            </div>
            <br />
            <div class="SearchBar">
                <div class="row">

                    <div class="col-md-4">


                        <asp:TextBox runat="server" CssClass="form-control" ID="txtJobs" Text="Enter your desired Job" ForeColor="#e95420" onfocus="clearTextContent('Enter your desired Job',this);" onblur="CreateTextContent('Enter your desired Job',this)"></asp:TextBox>

                    </div>

                    <div class="col-md-4" style="padding-left: 10px">
                        <asp:DropDownList ID="drplocation" runat="server" type="select" CssClass="form-control" data-toggle="dropdown">
                        </asp:DropDownList>
                        <asp:Label ID="lblSelectError" runat="server"></asp:Label>

                    </div>

                    <div class="col-md-4">
                        <asp:Button ID="search" runat="server" Text="Search" CssClass="btn btn-success form-control" OnClick="search_OnClick" PostBackUrl="JobSearchResult.aspx" />


                    </div>

                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        function clearTextContent(defaultText, textBoxControl) {
            if (textBoxControl.value == defaultText) {
                textBoxControl.value = null;
                textBoxControl.style.color = "black";
            }
        }

        function CreateTextContent(defaultText, textBoxControl) {
            if (textBoxControl.value.length == 0) {
                textBoxControl.value = defaultText;
                textBoxControl.style.color = "#e95420";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="SecondPart" ContentPlaceHolderID="PageContainer2" runat="server">
    <div class="well 3">Our parteners</div>
    <div class="row">
        <!--Main sidebar-->
        <div class="col-md-9">
            <div class="row White-back">

                <div class="col-md-4">
                    <div class="h4 text-center">Browse jobs by category</div>

                    <asp:Repeater runat="server" ID="rptrJobByCategory" OnItemDataBound="rptrJobByCategory_ItemDataBound">
                        <HeaderTemplate>
                            <ul class="list-group">
                        </HeaderTemplate>

                        <ItemTemplate>

                            <li class="list-group-item">
                                <a href="JobSearchResult.aspx?cat=<%#Eval("SpecialityName") %>"><%#Eval("SpecialityName") %></a>
                        </ItemTemplate>

                        <FooterTemplate>
                            </li>
                    </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <p>
                        <a class="btn btn-default mainbgcolor" href="JobSearchResult.aspx?item=SpecialityName">View more &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <div class="h4 text-center">Browse jobs by Location</div>

                    <asp:Repeater runat="server" ID="rptrJobByLocation" OnItemDataBound="rptrJobByLocation_ItemDataBound">
                        <HeaderTemplate>
                            <ul class="list-group">
                        </HeaderTemplate>

                        <ItemTemplate>

                            <li class="list-group-item">
                                <a href="JobSearchResult.aspx?name=<%#Eval("LocationName") %>"><%#Eval("LocationName") %></a>
                        </ItemTemplate>

                        <FooterTemplate>
                            </li>
                    </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    <p>
                        <a class="btn btn-default mainbgcolor" href="">View more &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <div class="h4 text-center">Browse jobs by Company</div>

                    <asp:Repeater runat="server" ID="rptrJobByCompany" OnItemDataBound="rptrJobByCompany_ItemDataBound">
                        <HeaderTemplate>
                            <ul class="list-group">
                        </HeaderTemplate>

                        <ItemTemplate>

                            <li class="list-group-item">
                                <a href="JobSearchResult.aspx?item=<%#Eval("CompanyName") %>"><%#Eval("CompanyName") %></a>

                        </ItemTemplate>

                        <FooterTemplate>
                            </li>
                    </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    <p>
                        <a class="btn btn-default mainbgcolor" href="#">View more &raquo;</a>
                    </p>
                </div>
            </div>
            <div class="row White-back">
                <div class="h4 text-center">Featured Jobs</div>
                <div class="col-md-4">
                    <p>
                        Today technology plays a major role in several work and professional fields and one of them is the process of job search and recruitments.
                    </p>
                    <p>
                        <a class="btn btn-default" href="#">Learn more &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <p>Today technology plays a major role in several work and professional fields and one of them is the process of job search and recruitments. </p>
                    <p>
                        <a class="btn btn-default" href="#">Learn more &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <p>Today technology plays a major role in several work and professional fields and one of them is the process of job search and recruitments. </p>
                    <p>
                        <a class="btn btn-default" href="#">Learn more &raquo;</a>
                    </p>
                </div>
            </div>
        </div>
        <!--Right sidebar-->
        <div class="col-md-3">
                    <h4 class="block-title text-center">Most Popular Jobs</h4>
                    <asp:Repeater runat="server" ID="rptrLiveActivity" OnItemDataBound="rptrJobByCategory_ItemDataBound">
                        <HeaderTemplate>
                            <div class="sidecat">
                            <ul class="list-group">
                        </HeaderTemplate>

                        <ItemTemplate>


                            <li>
                                <a href="#"></a><a href="#"><%#Eval("SpecialityName") %>

                                </a>



                        </ItemTemplate>

                        <FooterTemplate>
                            </li>
                      </ul>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="row">
                <div class="jumbotron">
                <div class="container">
                    <div class="text-center">
                        <h2 class="">News &amp; Updates</h2>
                    </div>
                </div>
            </div>
            </div>

</asp:Content>
