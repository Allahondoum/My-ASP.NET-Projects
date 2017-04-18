<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MainMaster.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Job_Final_Year.Default" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="FirstPart" ContentPlaceHolderID="PageContainer1" runat="server">
   
        <div class="img-responsive" style="background-image: url('Images/Partners.jpg')">
            <div class="container" style="height: 400px; padding-top: 30px">
                <div class="MainTitle">
                    <span class="subTitle1">Online</span> <span class="subTitle2">#Job </span><span class="subTitle3">Site</span>
                </div>
                <br />
                <div class="SearchBar">
        <div class="row SearchContent">

            <div class="col-md-4">


                <asp:TextBox runat="server" CssClass="form-control" ID="txtJobs" Text="Enter your desired Job" ForeColor="#e95420" onfocus="clearTextContent('Enter your desired Job',this);" onblur="CreateTextContent('Enter your desired Job',this)"></asp:TextBox>

            </div>

            <div class="col-md-4" style="padding-left: 10px">
                <asp:DropDownList ID="drplocation" runat="server" type="select" CssClass="form-control" data-toggle="dropdown">
                    <asp:ListItem>Location</asp:ListItem>
                    <asp:ListItem>Ghana</asp:ListItem>
                    <asp:ListItem>Tchad</asp:ListItem>
                    <asp:ListItem>Togo</asp:ListItem>
                </asp:DropDownList>

            </div>

            <div class="col-md-4">
                <asp:Button ID="search" runat="server" Text="Search" CssClass="btn btn-success form-control" PostBackUrl="JobSearchResult.aspx" />


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
                            <span class="badge">10</span>
                            <a href="#"></a><a href="#"><%#Eval("SpecialityName") %></a>
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
        <div class="col-md-4">
            <div class="h4 text-center">Browse jobs by Location</div>

            <asp:Repeater runat="server" ID="rptrJobByLocation" OnItemDataBound="rptrJobByLocation_ItemDataBound">
                <HeaderTemplate>
                    <ul class="list-group">
                        
                </HeaderTemplate>
                
                 <ItemTemplate>
                   
                        <li class="list-group-item">
                            <span class="badge">10</span>
                            <a href="#"></a><a href="#"><%#Eval("Location") %></a>
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
        <div class="col-md-4">
             <div class="h4 text-center">Browse jobs by Company</div>

            <asp:Repeater runat="server" ID="rptrJobByCompany" OnItemDataBound="rptrJobByCompany_ItemDataBound">
                <HeaderTemplate>
                    <ul class="list-group">
                        
                </HeaderTemplate>
                
                 <ItemTemplate>
                   
                        <li class="list-group-item">
                            <span class="badge">10</span>
                            <a href="#"></a><a href="#"><%#Eval("CompanyName") %></a>
                       
                   


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
        <div class="h4 text-center">Jobs News</div>
        <div class="col-md-4">
            <p>
                Today technology plays a major role in several work and professional fields and one of them is the process of job search and recruitments.
            </p>
             <p>
                <a class="btn btn-default" href="#">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <p> Today technology plays a major role in several work and professional fields and one of them is the process of job search and recruitments. </p>
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
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">Live Activities</h4>
                </div>
                <div class="panel-body">
                    <asp:Repeater runat="server" ID="rptrLiveActivity" OnItemDataBound="rptrJobByCategory_ItemDataBound">
                <HeaderTemplate>
                    <ul class="list-group">
                        
                </HeaderTemplate>
                
                 <ItemTemplate>
                   
                       
                            <li class="list-group-item">
                                <a href="#" ></a><a href="#"><%#Eval("Specialization") %>

                            </a>
                            
                            
                               
                </ItemTemplate>
                     
                <FooterTemplate>
                    </li>
                      </ul>
                    
                </FooterTemplate>
            </asp:Repeater>
                </div>
            </div>
            <p></p>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">Social Media feed</h4>
                </div>
                <div class="panel-body">
                    <p>Facebook</p>
                    <p>Twitter</p>
                    </div>
                </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">Adverts</h4>
                </div>
                <div class="panel-body">
                    </div>
                </div>
            
        </div>
    </div>
    
</asp:Content>