<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuilderAddProperty.aspx.cs" MasterPageFile="BuilderMaster.Master" Inherits="Real_Estate_Final_Year.Builder.BuilderAddProperty" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="MyContent">   
    <div class="row">
            
                <div class="col-md-8">
            <div class="h2">Publish Property</div>
            <asp:MultiView runat="server" ID="AddPostMultiView">
                <asp:View ID="DetailsView" runat="server">

                    <h2>1- First Step</h2>
                    <label>Company Name</label>
                    <p>
                        <asp:TextBox ID="txtCompanyName" runat="server" Class="form-control" placeholder="Company Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" CssClass="text-danger" runat="server" ErrorMessage="The Company Name field is Required !" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>

                    </p>
                    <label  >Title</label>
                    <div  >
                        <asp:TextBox ID="txtTitle" runat="server" Class="form-control" placeholder="Title"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" CssClass="text-danger" runat="server" ErrorMessage="The Title field is Required !" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>

                    </div>
                    <label  >Description: </label>
                    <div  >
                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Class="form-control" placeholder="Description"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" CssClass="text-danger" runat="server" ErrorMessage="The Description field is Required !" ControlToValidate="txtDesc"></asp:RequiredFieldValidator>
                    </div>
                    <Label runat="server"   AssociatedControlID="drpCat">Category:<span style="color: red">*</span>: </Label>
                    <div  >
                        <asp:DropDownList ID="drpCat" CssClass="form-control" Width="150" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Rent</asp:ListItem>
                            <asp:ListItem>Sell</asp:ListItem>
                            <asp:ListItem>Lease</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpCat"
                                                    CssClass="text-danger" ErrorMessage="Category field is required."/>

                    </div>

                    <label  >Price(in USD):</label>
                    <div  >
                        <asp:TextBox ID="txtPrice" runat="server" Class="form-control" placeholder="Price" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" CssClass="text-danger" runat="server" ErrorMessage="The price field is Required !" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>

                    </div>
                     <Label runat="server"   AssociatedControlID="drpPriceCond">Price Conditions:<span style="color: red">*</span>: </Label>
                    <div  >
                        <asp:DropDownList ID="drpPriceCond" CssClass="form-control" Width="150" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Fixed</asp:ListItem>
                            <asp:ListItem>Negociable</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpType"
                                                    CssClass="text-danger" ErrorMessage="Price Condition field is required."/>

                    </div>
                    <label  >Email</label>
                    <div  >
                        <asp:TextBox ID="txtEmail" runat="server" Class="form-control" TextMode="Email" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>

                    </div>
                 
                    <label  >Phone</label>
                    <div  >
                        <asp:TextBox ID="txtPhone" runat="server" Class="form-control" placeholder="Phone" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" CssClass="text-danger" runat="server" ErrorMessage="The Last name field is Required !" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                    </div>
                    <Label runat="server"   AssociatedControlID="drpLocation    ">Location<span style="color: red">*</span>: </Label>
                    <div  >
                        <asp:DropDownList ID="drpLocation" Width="120" runat="server" CssClass="form-control">
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>Tchad</asp:ListItem>
                            <asp:ListItem>Ghana</asp:ListItem>
                            <asp:ListItem>Togo</asp:ListItem>
                            <asp:ListItem>Benin</asp:ListItem>
                            <asp:ListItem>Cameroon</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpLocation"
                                                    CssClass="text-danger" ErrorMessage="Location field is required."/>

                    </div>
                   

                    <div  >
                        <asp:Button ID="btnNext" runat="server" Class="btn btn-success form-control" Text="Next" OnClick="btnNext_OnClick"/>
                    </div>


                </asp:View>
                <!--Other details-->
                <asp:View ID="ObjecDetails" runat="server">
                    <h2>2 - Second Step</h2>
                    <Label runat="server"   AssociatedControlID="drpType">Type:<span style="color: red">*</span>: </Label>
                    <div  >
                        <asp:DropDownList ID="drpType" CssClass="form-control" Width="150" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>House</asp:ListItem>
                            <asp:ListItem>Apartement</asp:ListItem>
                            <asp:ListItem>Land</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpType"
                                                    CssClass="text-danger" ErrorMessage="Type field is required."/>

                    </div>
                    <h3>General Features</h3>
                    <hr/>
                     <label  >Bedrooms:</label>
                    <div  >
                        <asp:TextBox ID="txtbedrooms" runat="server" Class="form-control" placeholder="Price" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBedrooms" CssClass="text-danger" runat="server" ErrorMessage="The bedrooms field is Required !" ControlToValidate="txtbedrooms"></asp:RequiredFieldValidator>

                    </div>
                    <div  >
                            <asp:CheckBox ID="chkAC" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Air Condition"></asp:Label>
                        </div>
                        <div  >
                            <asp:CheckBox ID="chkGarage" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Garage"></asp:Label>
                        </div>
                    <div  >
                            <asp:CheckBox ID="chkSwim" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Swimming Pool"></asp:Label>
                        </div>
                    <div  >
                            <asp:CheckBox ID="chkBalcony" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Balcony"></asp:Label>
                        </div>
                    <div  >
                            <asp:CheckBox ID="chkFence" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Fully fenced"></asp:Label>
                        </div>
                    <br/><br/>
                    <h3>Eco Features</h3>
                    <hr/>
                    <div  >
                            <asp:CheckBox ID="chkWater" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Water tank"></asp:Label>
                        </div>
                    <div  >
                            <asp:CheckBox ID="chkGen" CssClass="control-label" runat="server"/> <asp:Label runat="server" CssClass="control-label" Text="Spare Generator"></asp:Label>
                        </div>
                    <br/><br/>
                     <label  >Images</label>
                    <div  >
                        <p><asp:FileUpload ID="img1" runat="server" Class="form-control"></asp:FileUpload></p>
                        <p><asp:FileUpload ID="img2" runat="server" Class="form-control"></asp:FileUpload></p>
                        <p><asp:FileUpload ID="img3" runat="server" Class="form-control"></asp:FileUpload></p>
                        <p><asp:FileUpload ID="img4" runat="server" Class="form-control"></asp:FileUpload></p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>

                    </div>
                    
                        <Label runat="server"   AssociatedControlID="drpAvailability">Availabilty:<span style="color: red">*</span>: </Label>
                    <div  >
                        <asp:DropDownList ID="drpAvailability" CssClass="form-control" Width="150" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Now</asp:ListItem>
                            <asp:ListItem>Soon</asp:ListItem>
                            <asp:ListItem>Next Year</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpAvailability"
                                                    CssClass="text-danger" ErrorMessage="Availability field is required."/>

                    </div>
                    <div  >
                        <asp:Button ID="btnPublish" runat="server" Class="btn btn-success form-control" Text="Publish" OnClick="btnPublish_OnClick" />
                    </div>
                </asp:View>
                
                <asp:View ID="ConfirmationView" runat="server">

                    <table>
                        <tr>
                            <td colspan="4">
                                <h2>- Confirmation - </h2>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5 class="alert-success well">Thank you for trusting us. Your post have been added and required approval before publishing.</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button runat="server" ID="btnBack" CssClass="btn btn-success" CommandName="BackToLogin" OnClick="btnBack_OnClick" Text="Close"/>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            </div>
        <div class="col-md-4">
            <div class="panel panel-success">
                    <div class="panel-heading">
                        Recent Posts
                         </div>
                        <div class="panel-body">
                            
                       
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Linked Agents
                         </div>
                        <div class="panel-body">
                            
                       
                    </div>
                </div>
        </div>
    </div>
</asp:Content>


