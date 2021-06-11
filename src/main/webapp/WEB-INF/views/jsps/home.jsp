<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="header-imports.jsp" />
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="./resources/images/logo.png"
				alt="Doc-Inventory" height="60" width="60">
		</div>

		<jsp:include page="menu.jsp">
			<jsp:param value="Home" name="pageTitle" />
		</jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<jsp:include page="content-header-data.jsp"></jsp:include>

			<!-- Main content -->
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">
							<i class="fas fa-hdd"></i> Total Memory Used
						</h3>
					</div>
					<div class="card-body">
						<div class="progress">
							<div class="progress-bar bg-success" role="progressbar"
								style="width: 25%" aria-valuenow="25" aria-valuemin="0"
								aria-valuemax="100">25%</div>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Top 10 Recent viewed Folder</h3>
					</div>
					<div class="card-body">
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-head-fixed">
								<thead>
									<tr>
										<th>Name</th>
										<th>Size</th>
										<th>Type</th>
										<th>Created</th>
										<th>Created By</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_115.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">10.72 KB</td>
										<td class="mailbox-attachment">Folder</td>
										<td class="mailbox-date">5 min(s) ago</td>
										<td>You</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/shell32_264.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">10 MB</td>
										<td class="mailbox-attachment">Folder</td>
										<td class="mailbox-date">28 Hour(s) ago</td>
										<td>Tamal Nayak</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_102.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">150 KB</td>
										<td class="mailbox-attachment">Text</td>
										<td class="mailbox-date">2021/2/18, 8:33 PM</td>
										<td>You</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_102.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">150 KB</td>
										<td class="mailbox-attachment">Text</td>
										<td class="mailbox-date">2021/2/18, 8:33 PM</td>
										<td>You</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_102.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">150 KB</td>
										<td class="mailbox-attachment">Text</td>
										<td class="mailbox-date">2021/2/18, 8:33 PM</td>
										<td>You</td>
									</tr>
								</tbody>
							</table>
							<!-- /.table -->
						</div>
						<!-- /.mail-box-messages -->
					</div>
					<!-- /.card-body -->
				</div>
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Top 10 Favorites</h3>
					</div>
					<div class="card-body">
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-head-fixed">
								<thead>
									<tr>
										<th>Name</th>
										<th>Size</th>
										<th>Type</th>
										<th>Created</th>
										<th>Created By</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_115.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">10.72 KB</td>
										<td class="mailbox-attachment">Folder</td>
										<td class="mailbox-date">5 min(s) ago</td>
										<td>You</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/shell32_264.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">10 MB</td>
										<td class="mailbox-attachment">Folder</td>
										<td class="mailbox-date">28 Hour(s) ago</td>
										<td>Tamal Nayak</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_102.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">150 KB</td>
										<td class="mailbox-attachment">Text</td>
										<td class="mailbox-date">2021/2/18, 8:33 PM</td>
										<td>You</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_102.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">150 KB</td>
										<td class="mailbox-attachment">Text</td>
										<td class="mailbox-date">2021/2/18, 8:33 PM</td>
										<td>You</td>
									</tr>
									<tr>
										<td class="mailbox-name"><a href="read-mail.html"> <img
												alt="Folder"
												src="./resources/icons/windows10_icons/imageres_102.ico"
												width="40" height="40">&nbsp;&nbsp;Alexander Pierce
										</a></td>
										<td class="mailbox-subject">150 KB</td>
										<td class="mailbox-attachment">Text</td>
										<td class="mailbox-date">2021/2/18, 8:33 PM</td>
										<td>You</td>
									</tr>
								</tbody>
							</table>
							<!-- /.table -->
						</div>
					</div>
					<!-- /.card-body -->
				</div>
			</section>

		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="footer.jsp" />

	</div>
	<!-- ./wrapper -->

	<jsp:include page="footer-external-imports.jsp" />

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

			$('.knob').knob(
					{
						/*change : function (value) {
						 //console.log("change : " + value);
						 },
						 release : function (value) {
						 console.log("release : " + value);
						 },
						 cancel : function () {
						 console.log("cancel : " + this.value);
						 },*/
						draw : function() {

							// "tron" case
							if (this.$.data('skin') == 'tron') {

								var a = this.angle(this.cv) // Angle
								, sa = this.startAngle // Previous start angle
								, sat = this.startAngle // Start angle
								, ea // Previous end angle
								, eat = sat + a // End angle
								, r = true

								this.g.lineWidth = this.lineWidth

								this.o.cursor && (sat = eat - 0.3)
										&& (eat = eat + 0.3)

								if (this.o.displayPrevious) {
									ea = this.startAngle
											+ this.angle(this.value)
									this.o.cursor && (sa = ea - 0.3)
											&& (ea = ea + 0.3)
									this.g.beginPath()
									this.g.strokeStyle = this.previousColor
									this.g.arc(this.xy, this.xy, this.radius
											- this.lineWidth, sa, ea, false)
									this.g.stroke()
								}

								this.g.beginPath()
								this.g.strokeStyle = r ? this.o.fgColor
										: this.fgColor
								this.g.arc(this.xy, this.xy, this.radius
										- this.lineWidth, sat, eat, false)
								this.g.stroke()

								this.g.lineWidth = 2
								this.g.beginPath()
								this.g.strokeStyle = this.o.fgColor
								this.g.arc(this.xy, this.xy, this.radius
										- this.lineWidth + 1 + this.lineWidth
										* 2 / 3, 0, 2 * Math.PI, false)
								this.g.stroke()

								return false
							}
						}
					})
		})
	</script>
</body>
</html>