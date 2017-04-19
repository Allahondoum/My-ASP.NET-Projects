<%@ Page Title="Home" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Real_Estate_Final_Year.Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="SearchContent">
            <div class="MainTitle">
                The Number #1 Property Site
            </div>
            <div class="searchArea">
                
            
        <div class="SearchBar">
            <div class="row">
                <div class="col-lg-2">
                    <h4>Find Property</h4>
                </div>
                <div class="col-lg-4">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtSearchPro" Text="Enter your desired Job"></asp:TextBox>
                </div>
                <div class="col-lg-4">
                        <asp:DropDownList ID="drplocation" runat="server" type="select" CssClass="form-control" data-toggle="dropdown">
                            <asp:ListItem>Location</asp:ListItem>
                            <asp:ListItem>Ghana</asp:ListItem>
                            <asp:ListItem>Tchad</asp:ListItem>
                            <asp:ListItem>Togo</asp:ListItem>
                        </asp:DropDownList>


                </div>
                <div class="col-lg-2">
                    <asp:Button ID="search" runat="server" Text="Search" CssClass="btn btn-success" PostBackUrl="AllOffers.aspx"/>
                </div>
            </div>
                 
            </div>
                </div>
       
    </div>
    
    <div class="jumbotron">
        <h2>The Real Estate Solution...</h2>
    </div>
        </div>
    <div class="container">
        <div class="row well">
             <p class="h3 text-center">Featured Properties</p>
              <asp:Repeater runat="server" ID="rptrFeaturedProperty" OnItemDataBound="rptrFeaturedProperty_ItemDataBound">
                <ItemTemplate>
                    <div class="col-sm-2 col-md-4 col-lg-4">
                    <div class="thumbnail">
                     <a style="text-decoration: none" href="PropertyDetails.aspx?item=<%#Eval("ProID") %>">

                        <img src="images/cinqueterre.jpg" class="img-responsive" alt="">
                        <!--<img src="~/Images/Properties/<%//#Eval("Title") %>/<%//#Eval("Img1") %>" alt="Image" height="228" width="304"/>-->


                         <div class="caption">
                            <div class="proName"><%#Eval("Title") %></div>
                            
                        
                         <div class="proPrice pull-left"><%#Eval("Price") %>USD</div>
                            <div class="proName pull-right"><%#Eval("Type") %></div>
                             </div>
                        </a>
                    &nbsp;</div>
                        </div>
                    </ItemTemplate>
                  <FooterTemplate>
                      <a href="AllOffers.aspx" class="btn btn-primary">View More</a>
                  </FooterTemplate>
                  
                </asp:Repeater>
            
            </div>
        <div class="row well">
            <div class="col-md-4">
                <div class="text-center">
                    <img src="Images/Others/Search.png" />
                </div>
                <p class="h3 text-center">Find Your Dream Property
                <p>Ghana, touted by many to be the gateway to Africa, offers the perfect location to find the property of your dreams.
                Ghanaians have embraced the internet and technology and this has had a very positive impact on the Ghanaian property market.
                It has never been easier to find the home of your dreams in Ghana than now.
                Looking for a luxury apartment in Airport Residential Area?
                A plot of land at Haatso? A house at Paraku Estates or commercial buildings for sale in Osu?</p>
                
            </div>
            <div class="col-md-4">
                <div class="text-center">
                    <img src="Images/Others/Rent.png" />
                </div>
                <p class="h3 text-center">Buy or Rent Property</p>
               <p>Looking for an apartment in Cantonments?
                A house at Atasemanso in Kumasi?
                Or perhaps you urgently need an office space in Osu or plots of land at Adenta?
                We aim to cater to all members of Ghanaian society by ensuring that all prices are competitive enabling anyone to find their dream home here at Jumia House.</p>
            </div>
            <div class="col-md-4">
                <div class="text-center">
                    <img src="Images/Others/Agent.png" />
                </div>
                <p class="h3 text-center">Get A trusted Agents</p>
                <p>People are nowadays concerned with who they do business with,
                especially, in the business of real estate in Ghana. 
                With our highly regarded “Trusted Seller” seal of approval, 
                an innovation unique to Jumia House, 
                we ensure that the persons or company you are dealing with is reputable and honest. 
                We are also in constant contact with agents on our website to ensure that we combat fraud and act in your best interest.</p>
                
            </div>
        </div>
     
  </div>
</asp:Content>
