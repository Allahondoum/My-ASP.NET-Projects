<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="BuilderMaster.Master" CodeBehind="ViewListedProperties.aspx.cs" Inherits="Real_Estate_Final_Year.Builder.ViewListedProperties" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
		  <div class="panel panel-success">
			  <div class="panel-heading">
				 All Posted Properties
			  </div>
							<asp:Repeater runat="server" ID="rptrProperty">
				  <HeaderTemplate>
				  <table class="table">
				  <thead>
				  <tr>
					  <th>#</th>
					  <th>Name</th>
					  <th>View</th>
					   <th>Delete</th>
				  </tr>
				  </thead>
				  <tbody>
				  </HeaderTemplate>
				  <ItemTemplate>
					  
					  <tr>
						<th><%# Eval("ProID")%></th>
						<td><%# Eval("Title")%></td>
						<td><asp:LinkButton data-toggle="modal" ID="showProp" runat="server" OnServerClick="showProp_OnServerClick" data-target="#ViewPro" href="#">View</asp:LinkButton></td>
						<td><a href="#">Delete</a></td>
					</tr>
				  </ItemTemplate>
				  <FooterTemplate>
					  </tbody>
					 </table>
				  </FooterTemplate>
				 
			  </asp:Repeater>

		  </div>
				<script type="text/javascript">
					$('#ViewPro').on('show.bs.modal', function (event) {
						var button = $(event.relatedTarget);
						var recipient = button.data('whatever');
						var modal = $(this);
						modal.find('.modal-title').text('New message to ' + recipient);
						modal.find('.modal-body input').val(recipient);
					})
				</script>
				<!--Div pop up-->
				<div class="modal fade" id="ViewPro" tabindex="-1" role="dialog" aria-labelledby="Login">
			  <div class="modal-dialog" role="document">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Property</h4>
				  </div>
				  <div class="modal-body">
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
												<img src="../Images/room_single.jpg" alt="slide-1"/>
											</div>

											<div class="item">
												<img src="../Images/room_single.jpg"/>
											</div>

											<div class="item">
												<img src="../Images/room_single.jpg"/>
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
									<asp:Button runat="server" ID="btnContactAgent" CssClass="mainButton" Text="Contact Agent"/>
								</p>
							</div>
					</ItemTemplate>
				</asp:Repeater>

				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Edit</button>
				  </div>
				</div>
			  </div>
			</div>

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
	</div>
</asp:Content>