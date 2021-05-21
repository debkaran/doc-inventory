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

		<jsp:include page="menu.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<jsp:include page="header-info.jsp" />

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
								<jsp:include page="drive-table-controls.jsp" />
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
												<td><a href="#"><i class="fas fa-bars"></i></a></td>
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
								<jsp:include page="drive-table-controls.jsp" />
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
				</div>
			</section>

		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="footer.jsp" />

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