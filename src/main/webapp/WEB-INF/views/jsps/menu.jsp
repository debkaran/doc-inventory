<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<% String pageTitle = request.getParameter("pageTitle");  %>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
			href="#" role="button"><i class="fas fa-bars"></i></a></li>
		<li class="nav-item d-none d-sm-inline-block"
			style="font-size: x-large;"><a href="index3.html"
			class="nav-link" style="top: -7px;"><%=pageTitle %></a></li>
	</ul>

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<!-- Navbar Search -->
		<li class="nav-item"><a class="nav-link"
			data-widget="navbar-search" href="#" role="button"> <i
				class="fas fa-search"></i>
		</a>
			<div class="navbar-search-block">
				<form class="form-inline">
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit">
								<i class="fas fa-search"></i>
							</button>
							<button class="btn btn-navbar" type="button"
								data-widget="navbar-search">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

		<!-- Messages Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link"
			data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
				<span class="badge badge-danger navbar-badge">3</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="./resources/dist/img/user1-128x128.jpg"
							alt="User Avatar" class="img-size-50 mr-3 img-circle">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Brad Diesel <span class="float-right text-sm text-danger"><i
									class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">Call me whenever you can...</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="./resources/dist/img/user8-128x128.jpg"
							alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								John Pierce <span class="float-right text-sm text-muted"><i
									class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">I got your message bro</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="./resources/dist/img/user3-128x128.jpg"
							alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Nora Silvester <span class="float-right text-sm text-warning"><i
									class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">The subject goes here</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All
					Messages</a>
			</div></li>
		<!-- Notifications Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link"
			data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
				class="badge badge-warning navbar-badge">15</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header">15 Notifications</span>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i
					class="fas fa-envelope mr-2"></i> 4 new messages <span
					class="float-right text-muted text-sm">3 mins</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-users mr-2"></i>
					Sign out <span class="float-right text-muted text-sm">12
						hours</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
					3 new reports <span class="float-right text-muted text-sm">2
						days</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All
					Notifications</a>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-widget="fullscreen"
			href="#" role="button"> <i class="fas fa-expand-arrows-alt"></i>
		</a></li>
		<li class="nav-item dropdown"><a class="nav-link"
			data-toggle="dropdown" href="#">
				<div class="user-panel mt-3 pb-3 mb-3 d-flex"
					style="top: -22px !important;">
					<div class="image">
						<img src="./resources/dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
				</div>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<div class="dropdown-item dropdown-header">
					<div class="media">
						<img src="./resources/dist/img/user2-160x160.jpg"
							alt="User Avatar" class="img-size-50 mr-3 img-circle">
						<div class="media-body">
							<h3 class="dropdown-item-title">DEB KARAN SINGHANIA</h3>
							<p class="text-sm text-muted">debkaransinghania@gmail.com</p>
						</div>
					</div>
					<div style="text-align: left; top: 5px;"
						class="dig-Text dig-Text--variant-paragraph dig-Text--size-xsmall dig-Text--color-faint">Your
						account has 2 GB storage</div>
				</div>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-user-cog"></i>
					&nbsp;&nbsp;Settings
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item" id="logout"> <i
					class="fas fa-sign-out-alt"></i> &nbsp;&nbsp;Sign out
				</a>
			</div></li>
	</ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="index3.html" class="brand-link"> <img
		src="./resources/images/logo.png" alt="Doc-Inventory logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">Doc-Inventory</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class=" mt-3 pb-3 mb-3 d-flex"></div>


		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item"><a href="./home"
				<% if(pageTitle != null && pageTitle.equals("Home")){ %>
					class="nav-link active"> <i class="fas fa-laptop-house"></i>
				<% } else{ %>
					class="nav-link"> <i class="fas fa-laptop-house"></i>
				<% } %>
						<p>Home</p>
				</a></li>
				<li class="nav-item"><a href="./inventory"
				<% if(pageTitle != null && pageTitle.equals("All Files")){ %>
					class="nav-link active"> <i class="fas fa-folder-open"></i>
				<% } else{ %>
					class="nav-link"> <i class="fas fa-folder-open"></i>
				<% } %>
						<p>All Files</p>
				</a></li>
				<li class="nav-item"><a href="pages/gallery.html"
				<% if(pageTitle != null && pageTitle.equals("Deleted Files")){ %>
					class="nav-link active"> <i class="fas fa-trash"></i>
				<% } else{ %>
					class="nav-link"> <i class="fas fa-trash"></i>
				<% } %>
						<p>Deleted Files</p>
				</a></li>
				<li class="nav-item"><a href="pages/gallery.html"
				<% if(pageTitle != null && pageTitle.equals("Favorites")){ %>
					class="nav-link active"> <i class="far fa-heart"></i>
				<% } else{ %>
					class="nav-link"> <i class="far fa-heart"></i>
				<% } %>
						<p>Favorites</p>
				</a></li>
				<li class="nav-item"><a href="pages/gallery.html"
				<% if(pageTitle != null && pageTitle.equals("History")){ %>
					class="nav-link active"> <i class="fas fa-history"></i>
				<% } else{ %>
					class="nav-link"> <i class="fas fa-history"></i>
				<% } %>
						<p>History</p>
				</a></li>
				<li class="nav-item"><a href="pages/gallery.html"
				<% if(pageTitle != null && pageTitle.equals("Recents")){ %>
					class="nav-link active"> <i class="fas fa-user-clock"></i>
				<% } else{ %>
					class="nav-link"> <i class="fas fa-user-clock"></i>
				<% } %>
						<p>Recents</p>
				</a></li>
				<li class="nav-item"><a href="pages/gallery.html"
				<% if(pageTitle != null && pageTitle.equals("Shared Files")){ %>
					class="nav-link"> <i class="fab fa-slideshare"></i>
				<% } else{ %>
					class="nav-link"> <i class="fab fa-slideshare"></i>
				<% } %>
						<p>Shared Files</p>
				</a></li>


			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
<style type="text/css">
.sidebar .nav-link p {
	padding-left: 10px;
}
</style>
<script type="text/javascript">
document.getElementById("logout").addEventListener("click", logout);
function logout(){
	var form = document.createElement('form');
    document.body.appendChild(form);
    form.method = 'post';
    form.action = "./logout";
    form.submit();
}
</script>