<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Doc-Inventory</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="./resources/css/googleapis-sans-pro.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="./resources/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="./resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="./resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="./resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
<link rel="Shortcut Icon" href="./resources/images/favicon.ico"
	type="image/x-icon" />
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="./resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="./resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="./resources/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="./resources/images/logo.png"
				alt="Doc-Inventory" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"
					style="font-size: x-large;"><a href="index3.html"
					class="nav-link" style="top: -7px;">Home</a></li>
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
						<span class="dropdown-item dropdown-header">15
							Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> Sign out <span
							class="float-right text-muted text-sm">12 hours</span>
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
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
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
						<a href="#" class="dropdown-item"> <i
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

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Dashboard <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="./index.html"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v1</p>
								</a></li>
								<li class="nav-item"><a href="./index2.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v2</p>
								</a></li>
								<li class="nav-item"><a href="./index3.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Dashboard v3</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="pages/widgets.html"
							class="nav-link"> <i class="nav-icon fas fa-th"></i>
								<p>
									Widgets <span class="right badge badge-danger">New</span>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-copy"></i>
								<p>
									Layout Options <i class="fas fa-angle-left right"></i> <span
										class="badge badge-info right">6</span>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/layout/top-nav.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Top Navigation</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/layout/top-nav-sidebar.html" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Top Navigation + Sidebar</p>
								</a></li>
								<li class="nav-item"><a href="pages/layout/boxed.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Boxed</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/layout/fixed-sidebar.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Fixed Sidebar</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/layout/fixed-sidebar-custom.html" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>
											Fixed Sidebar <small>+ Custom Area</small>
										</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/layout/fixed-topnav.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Fixed Navbar</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/layout/fixed-footer.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Fixed Footer</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/layout/collapsed-sidebar.html" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Collapsed Sidebar</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-chart-pie"></i>
								<p>
									Charts <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/charts/chartjs.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>ChartJS</p>
								</a></li>
								<li class="nav-item"><a href="pages/charts/flot.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Flot</p>
								</a></li>
								<li class="nav-item"><a href="pages/charts/inline.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Inline</p>
								</a></li>
								<li class="nav-item"><a href="pages/charts/uplot.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>uPlot</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-tree"></i>
								<p>
									UI Elements <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/UI/general.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>General</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/icons.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Icons</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/buttons.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Buttons</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/sliders.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Sliders</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/modals.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Modals & Alerts</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/navbar.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Navbar & Tabs</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/timeline.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Timeline</p>
								</a></li>
								<li class="nav-item"><a href="pages/UI/ribbons.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Ribbons</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-edit"></i>
								<p>
									Forms <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/forms/general.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>General Elements</p>
								</a></li>
								<li class="nav-item"><a href="pages/forms/advanced.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Advanced Elements</p>
								</a></li>
								<li class="nav-item"><a href="pages/forms/editors.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Editors</p>
								</a></li>
								<li class="nav-item"><a href="pages/forms/validation.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Validation</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-table"></i>
								<p>
									Tables <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/tables/simple.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Simple Tables</p>
								</a></li>
								<li class="nav-item"><a href="pages/tables/data.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>DataTables</p>
								</a></li>
								<li class="nav-item"><a href="pages/tables/jsgrid.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>jsGrid</p>
								</a></li>
							</ul></li>
						<li class="nav-header">EXAMPLES</li>
						<li class="nav-item"><a href="pages/calendar.html"
							class="nav-link"> <i class="nav-icon far fa-calendar-alt"></i>
								<p>
									Calendar <span class="badge badge-info right">2</span>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/gallery.html"
							class="nav-link"> <i class="nav-icon far fa-image"></i>
								<p>Gallery</p>
						</a></li>
						<li class="nav-item"><a href="pages/kanban.html"
							class="nav-link"> <i class="nav-icon fas fa-columns"></i>
								<p>Kanban Board</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-envelope"></i>
								<p>
									Mailbox <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/mailbox/mailbox.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Inbox</p>
								</a></li>
								<li class="nav-item"><a href="pages/mailbox/compose.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Compose</p>
								</a></li>
								<li class="nav-item"><a href="pages/mailbox/read-mail.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Read</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-book"></i>
								<p>
									Pages <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/examples/invoice.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Invoice</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/profile.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Profile</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/examples/e-commerce.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>E-commerce</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/projects.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Projects</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/examples/project-add.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Project Add</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/examples/project-edit.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Project Edit</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/examples/project-detail.html" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Project Detail</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/contacts.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Contacts</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/faq.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>FAQ</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/examples/contact-us.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Contact us</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-plus-square"></i>
								<p>
									Extras <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>
											Login & Register v1 <i class="fas fa-angle-left right"></i>
										</p>
								</a>
									<ul class="nav nav-treeview">
										<li class="nav-item"><a href="pages/examples/login.html"
											class="nav-link"> <i class="far fa-circle nav-icon"></i>
												<p>Login v1</p>
										</a></li>
										<li class="nav-item"><a
											href="pages/examples/register.html" class="nav-link"> <i
												class="far fa-circle nav-icon"></i>
												<p>Register v1</p>
										</a></li>
										<li class="nav-item"><a
											href="pages/examples/forgot-password.html" class="nav-link">
												<i class="far fa-circle nav-icon"></i>
												<p>Forgot Password v1</p>
										</a></li>
										<li class="nav-item"><a
											href="pages/examples/recover-password.html" class="nav-link">
												<i class="far fa-circle nav-icon"></i>
												<p>Recover Password v1</p>
										</a></li>
									</ul></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>
											Login & Register v2 <i class="fas fa-angle-left right"></i>
										</p>
								</a>
									<ul class="nav nav-treeview">
										<li class="nav-item"><a
											href="pages/examples/login-v2.html" class="nav-link"> <i
												class="far fa-circle nav-icon"></i>
												<p>Login v2</p>
										</a></li>
										<li class="nav-item"><a
											href="pages/examples/register-v2.html" class="nav-link">
												<i class="far fa-circle nav-icon"></i>
												<p>Register v2</p>
										</a></li>
										<li class="nav-item"><a
											href="pages/examples/forgot-password-v2.html"
											class="nav-link"> <i class="far fa-circle nav-icon"></i>
												<p>Forgot Password v2</p>
										</a></li>
										<li class="nav-item"><a
											href="pages/examples/recover-password-v2.html"
											class="nav-link"> <i class="far fa-circle nav-icon"></i>
												<p>Recover Password v2</p>
										</a></li>
									</ul></li>
								<li class="nav-item"><a
									href="pages/examples/lockscreen.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Lockscreen</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/examples/legacy-user-menu.html" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Legacy User Menu</p>
								</a></li>
								<li class="nav-item"><a
									href="pages/examples/language-menu.html" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Language Menu</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/404.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Error 404</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/500.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Error 500</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/pace.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Pace</p>
								</a></li>
								<li class="nav-item"><a href="pages/examples/blank.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Blank Page</p>
								</a></li>
								<li class="nav-item"><a href="starter.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Starter Page</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-search"></i>
								<p>
									Search <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="pages/search/simple.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Simple Search</p>
								</a></li>
								<li class="nav-item"><a href="pages/search/enhanced.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Enhanced</p>
								</a></li>
							</ul></li>
						<li class="nav-header">MISCELLANEOUS</li>
						<li class="nav-item"><a href="iframe.html" class="nav-link">
								<i class="nav-icon fas fa-ellipsis-h"></i>
								<p>Tabbed IFrame Plugin</p>
						</a></li>
						<li class="nav-item"><a href="https://adminlte.io/docs/3.1/"
							class="nav-link"> <i class="nav-icon fas fa-file"></i>
								<p>Documentation</p>
						</a></li>
						<li class="nav-header">MULTI LEVEL EXAMPLE</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fas fa-circle nav-icon"></i>
								<p>Level 1</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-circle"></i>
								<p>
									Level 1 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Level 2</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>
											Level 2 <i class="right fas fa-angle-left"></i>
										</p>
								</a>
									<ul class="nav nav-treeview">
										<li class="nav-item"><a href="#" class="nav-link"> <i
												class="far fa-dot-circle nav-icon"></i>
												<p>Level 3</p>
										</a></li>
										<li class="nav-item"><a href="#" class="nav-link"> <i
												class="far fa-dot-circle nav-icon"></i>
												<p>Level 3</p>
										</a></li>
										<li class="nav-item"><a href="#" class="nav-link"> <i
												class="far fa-dot-circle nav-icon"></i>
												<p>Level 3</p>
										</a></li>
									</ul></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Level 2</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fas fa-circle nav-icon"></i>
								<p>Level 1</p>
						</a></li>
						<li class="nav-header">LABELS</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-circle text-danger"></i>
								<p class="text">Important</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-circle text-warning"></i>
								<p>Warning</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-circle text-info"></i>
								<p>Informational</p>
						</a></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-lg-2 col-12">
							<!-- small card -->
							<div class="small-box bg-success">
								<div class="inner">
									<h3>150</h3>

									<p>Files in Inventory</p>
								</div>
								<div class="icon">
									<i class="fas fa-shopping-cart"></i>
								</div>
								<a href="#" data-toggle="dropdown" class="small-box-footer">
									New <i class="fas fa-arrow-circle-right"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right" role="menu">
									<a class="dropdown-item" href="#">Upload File</a> <a
										class="dropdown-item" href="#">Upload Folder</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Create Folder</a>
								</div>
							</div>
						</div>
						<div class="col-lg-5 col-12">
							<div class="info-box bg-info">

								<div class="info-box-content">
									<span class="info-box-number"><i
										class="fas fa-cloud-download-alt"></i> &nbsp;41,410 files
										Downloaded</span>

									<div class="info-box-number"
										style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
										<span style="font-size: 12px;">Last download at 12th
											Oct at 9:00 pm</span>
									</div>
									<div class="dropdown-divider"></div>
									<span class="info-box-number"><i
										class="fas fa-trash-alt"></i> &nbsp;210 files Deleted</span>

									<div class="info-box-number"
										style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
										<span style="font-size: 12px;">Last deleted at 12th Oct</span>
									</div>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<div class="col-lg-5 col-12">
							<div class="info-box bg-info">

								<div class="info-box-content">
									<span class="info-box-number"><i
										class="fas fa-share-alt"></i> &nbsp;41,410 files in Shared</span>

									<div class="info-box-number"
										style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
										<span style="font-size: 12px;">Last shared at 12th Oct
											at 9:00 pm</span>
									</div>
									<div class="dropdown-divider"></div>
									<span class="info-box-number"><i class="fas fa-heart"></i>
										&nbsp;210 files is Favourite</span>

									<div class="info-box-number"
										style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
										<span style="font-size: 12px;">Last favourite done at
											12th Oct</span>
									</div>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h3 class="card-title">Inbox</h3>

								<div class="card-tools">
									<div class="input-group input-group-sm">
										<input type="text" class="form-control"
											placeholder="Search Mail">
										<div class="input-group-append">
											<div class="btn btn-primary">
												<i class="fas fa-search"></i>
											</div>
										</div>
									</div>
								</div>
								<!-- /.card-tools -->
							</div>
							<!-- /.card-header -->
							<div class="card-body p-0">
								<div class="mailbox-controls">
									<!-- Check all button -->
									<button type="button"
										class="btn btn-default btn-sm checkbox-toggle">
										<i class="far fa-square"></i>
									</button>
									<div class="btn-group">
										<button type="button" class="btn btn-default btn-sm">
											<i class="far fa-trash-alt"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-download"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-share-alt"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-thumbtack"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="fas fa-arrows-alt"></i>
										</button>
										<button type="button" class="btn btn-default btn-sm">
											<i class="far fa-clone"></i>
										</button>
									</div>
									<!-- /.btn-group -->
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-sync-alt"></i>
									</button>
								</div>
								<div class="table-responsive mailbox-messages"
									style="position: relative; max-height: 700px; overflow: auto; display: block;">
									<table class="table table-hover table-head-fixed">
										<thead>
											<tr>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
												<th>Name</th>
												<th>Size</th>
												<th>Type</th>
												<th>Created</th>
												<th>Created By</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<div class="icheck-primary">
														<input type="checkbox" value="" id="check1"> <label
															for="check1"></label>
													</div>
												</td>
												<td class="mailbox-star"><a href="#"><i
														class="fas fa-heart text-info"></i></a></td>
												<td class="mailbox-name"><a href="read-mail.html">
														<img alt="Folder"
														src="./resources/icons/windows10_icons/imageres_115.ico"
														width="40" height="40">&nbsp;&nbsp;Alexander Pierce
												</a></td>
												<td class="mailbox-subject">10.72 KB</td>
												<td class="mailbox-attachment">Folder</td>
												<td class="mailbox-date">5 min(s) ago</td>
												<td>You</td>
												<td><a href="#"><i class="fas fa-bars"></i></a></td>
											</tr>
											<tr>
												<td>
													<div class="icheck-primary">
														<input type="checkbox" value="" id="check2"> <label
															for="check2"></label>
													</div>
												</td>
												<td class="mailbox-star"><a href="#"><i
														class="far fa-heart text-info"></i></a></td>
												<td class="mailbox-name"><a href="read-mail.html">
														<img alt="Folder"
														src="./resources/icons/windows10_icons/shell32_264.ico"
														width="40" height="40">&nbsp;&nbsp;Alexander Pierce
												</a></td>
												<td class="mailbox-subject">10 MB</td>
												<td class="mailbox-attachment">Folder</td>
												<td class="mailbox-date">28 Hour(s) ago</td>
												<td>Tamal Nayak</td>
												<td><a href="#"><i class="fas fa-bars"></i></i></a></td>
											</tr>
											<tr>
												<td>
													<div class="icheck-primary">
														<input type="checkbox" value="" id="check3"> <label
															for="check3"></label>
													</div>
												</td>
												<td class="mailbox-star"><a href="#"><i
														class="far fa-heart text-info"></i></a></td>
												<td class="mailbox-name"><a href="read-mail.html">
														<img alt="Folder"
														src="./resources/icons/windows10_icons/imageres_102.ico"
														width="40" height="40">&nbsp;&nbsp;Alexander Pierce
												</a></td>
												<td class="mailbox-subject">150 KB</td>
												<td class="mailbox-attachment">Text</td>
												<td class="mailbox-date">2021/2/18, 8:33 PM</td>
												<td>You</td>
												<td><a href="#"><i class="fas fa-bars"></i></a></td>
											</tr>
										</tbody>
									</table>
									<!-- /.table -->
								</div>
								<!-- /.mail-box-messages -->
							</div>
							<!-- /.card-body -->
							<div class="card-footer p-0">
								<div class="mailbox-controls">
									<!-- Check all button -->
									<button type="button"
										class="btn btn-default btn-sm checkbox-toggle">
										<i class="far fa-square"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="far fa-trash-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-download"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-share-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-thumbtack"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-arrows-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="far fa-clone"></i>
									</button>
							
									<!-- /.btn-group -->
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-sync-alt"></i>
									</button>
								
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
		</div>
		</section>

	</div>
	<!-- /.content-wrapper -->

	<footer class="main-footer">
		<strong>3 File(s) selected</strong>
	</footer>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="./resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="./resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

	<!-- Bootstrap 4 -->
	<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="./resources/plugins/chart.js/Chart.min.js"></script>

	<!-- JQVMap -->
	<script src="./resources/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="./resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="./resources/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="./resources/plugins/moment/moment.min.js"></script>
	<script src="./resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="./resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="./resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./resources/dist/js/demo.js"></script>

	<script>
		$(function() {
			//Enable check and uncheck all functionality
			$('.checkbox-toggle').click(
					function() {
						var clicks = $(this).data('clicks')
						if (clicks) {
							//Uncheck all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', false)
							$('.checkbox-toggle .far.fa-check-square')
									.removeClass('fa-check-square').addClass(
											'fa-square')
						} else {
							//Check all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', true)
							$('.checkbox-toggle .far.fa-square').removeClass(
									'fa-square').addClass('fa-check-square')
						}
						$(this).data('clicks', !clicks)
					})

			//Handle starring for font awesome
			$('.mailbox-star').click(function(e) {
				e.preventDefault()
				//detect type
				var $this = $(this).find('a > i')
				var fa = $this.hasClass('fa')

				//Switch states
				if (fa) {
					$this.toggleClass('fa-star')
					$this.toggleClass('fa-star-o')
				}
			})
		})
	</script>
</body>
</html>