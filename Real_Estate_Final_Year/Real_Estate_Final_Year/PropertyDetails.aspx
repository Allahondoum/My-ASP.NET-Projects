<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MainMaster.Master" CodeBehind="PropertyDetails.aspx.cs" Inherits="Real_Estate_Final_Year.PropertyDetails" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="container">
		<div class="row">


			<div class="col-md-8">
				<asp:Repeater runat="server" ID="rptrPropDetails">
					<ItemTemplate>
							   <h2><%#Eval("CompanyName") %></h2>
							<div class="thumbnail">
								<div class="container-fluid">
									<div id="myCarousel" class="carousel slide" data-ride="carousel">
										<ol class="carousel-indicators">
											<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
											<li data-target="#myCarousel" data-slide-to="1"></li>
											<li data-target="#myCarousel" data-slide-to="2"></li>
											<li data-target="#myCarousel" data-slide-to="3"></li>
										</ol>
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<img src="Images/room_single.jpg" alt="slide-1"/>
											</div>

											<div class="item">
												<img src="Images/room_single.jpg"/>
											</div>

											<div class="item">
												<img src="Images/room_single.jpg"/>
											</div>
										</div>
										<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
											<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a>
										<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
											<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
								<div class="caption">
									<div>
										<h3><%#Eval("Title") %></h3>
									</div>
									<div>
										<h4>Price: $<%#Eval("Price") %></h4>
									</div>
									<div>
										<h4>Location: <%#Eval("Location") %></h4>
									</div>
									<div>
										<h4>Availability: <%#Eval("Availability") %></h4>
									</div>
								</div>
								<div>
									<h3>Description:</h3>
									<p><%#Eval("Descrip") %></p>
								</div>
								<div class="row">

									<div class="col-md-4">
										<h3>Indoor Features</h3>
										<p>Bedrooms: <%#Eval("Bedrooms") %></p>
										<p>Air Condition: <%#((int) Eval("AC") == 1) ? "Yes" : "NO" %></p>
									</div>
									<div class="col-md-4">
										<h3>Outdoor Features</h3>
										<p>Swimming Pool: <%#((int) Eval("SwimPool") == 1) ? "Yes" : "NO" %></p>
										<p>Garage: <%#((int) Eval("Garage") == 1) ? "Yes" : "NO" %></p>
										<p>Balcony:<%#((int) Eval("Balcony") == 1) ? "Yes" : "NO" %></p>
										<p>Fully fenced: <%#((int) Eval("Fence") == 1) ? "Yes" : "NO" %></p>

									</div>
									<div class="col-md-4">
										<h3>Other Features</h3>
										<p>Spare Energy Provider: <%#((int) Eval("Generator") == 1) ? "Yes" : "NO" %></p>
										<p>Water Tank: <%#((int) Eval("Tank") == 1) ? "Yes" : "NO" %></p>

									</div>
								</div>
								<p>
								<a data-toggle="modal" data-target="#ModalAgent"  href="#" class="btn btn-block mainButton">Contact Agent</a>
								</p>

								<div class="modal fade" id="ModalAgent" tabindex="-1" role="dialog" aria-labelledby="Contact Agent">
									  <div class="modal-dialog" role="document">
										<div class="modal-content">
										  <div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">Contact Agent</h4>
										  </div>
										  <div class="modal-body">
											  <div class="row">
											  <div class="col-md-12">
												  <div class="form-horizontal">
													  <div class="form-group">
														  <label class="col-md-4">Full name</label>
														  <div class="col-md-8">
															  <asp:TextBox runat="server" ID="txtFullName" TextMode="SingleLine" CssClass="form-control" Placeholder="Your full name"></asp:TextBox>
														  </div>
													  </div>
													<div class="form-group">
															<label class="col-md-4">Email Address</label>
														  <div class="col-md-8">
															  <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" CssClass="form-control" Placeholder="Your email address"></asp:TextBox>
														  </div>
													 </div>
													 <div class="form-group">
														  <label class="col-md-4">Phone Number</label>
														  <div class="col-md-8">
															  <asp:TextBox runat="server" ID="txtPhoneNumber" TextMode="Phone" CssClass="form-control" Placeholder="Your phone number"></asp:TextBox>
															</div>
													  </div>
													  <div class="form-group">
														  <label class="col-md-4">Message</label>
														  <div class="col-md-8">
															  <asp:TextBox runat="server" ID="txtMessage" TextMode="MultiLine" CssClass="form-control" Placeholder="Your message"></asp:TextBox>
														  </div>
														</div>
												  </div>
												  </div>
											   </div>
										  </div>
										  <div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
											<button type="button" class="btn btn-primary">Send</button>
										  </div>
										</div>
									  </div>
									</div>

					</ItemTemplate>
				</asp:Repeater>

			</div>
			<div class="col-md-4" style="padding-top: 70px">
				<div class="panel panel-success">
					<div class="panel-heading">
						Compnay Details
					</div>
					<div class="panel-body">

					</div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">
					   Agent Details
					</div>
					<div class="panel-body">

					</div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">
						Social Network Feed
					</div>
					<div class="panel-body">

					</div>
				</div>




			</div>
		</div>
		</div>
</asp:Content>