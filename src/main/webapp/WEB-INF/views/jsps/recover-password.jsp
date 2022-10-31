<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Doc-Inventory | Recover Password</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="./resources/css/googleapis-sans-pro.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./resources/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="./resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
<link rel="Shortcut Icon" href="./resources/images/favicon.ico"
	type="image/x-icon" />
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><img src="./resources/images/logo.png" width="64"
				height="64" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8"><b>Doc</b>Inventory</a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">You are only one step a way from your
					new password, recover your password now.</p>
					<%
				      	String encUserId = (String) request.getAttribute("encUserId");
				      %>
				<form action="./recover-password?eUId=<%=encUserId %>" method="post" id="forgetPassword">
					<div class="input-group mb-3 form-group">
						<input type="password" class="form-control" placeholder="Password" name="password" id="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3 form-group">
						<input type="password" class="form-control"
							placeholder="Confirm Password" name="confirmPassword" id="confirmPassword">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<button type="submit" class="btn btn-primary btn-block">Change
								password</button>
						</div>
						<div class="col-12">
							<b>&lt;</b> Back to <a href="./">login</a>
						</div>
						<!-- /.col -->
					</div>
				</form>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="./resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="./resources/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script
		src="./resources/plugins/jquery-validation/additional-methods.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./resources/dist/js/adminlte.min.js"></script>
	

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							
							$('#forgetPassword')
									.validate(
											{
												rules : {
													password : {
														required : true,
														minlength : 5
													},
													confirmPassword : {
														required : true,
														equalTo : "#password"
													},
												},
												messages : {
													password : {
														required : "Please provide a password",
														minlength : "Your password must be at least 5 characters long"
													},
													confirmPassword : {
														required : "Please enter confirm password",
														equalTo : "Password mismatched"
													}
												},
												errorElement : 'span',
												errorPlacement : function(
														error, element) {
													error
															.addClass('invalid-feedback');
													element.closest(
															'.form-group')
															.append(error);
												},
												highlight : function(element,
														errorClass, validClass) {
													$(element).addClass(
															'is-invalid');
												},
												unhighlight : function(element,
														errorClass, validClass) {
													$(element).removeClass(
															'is-invalid');
												}
											});
							
							
						});
	</script>
</body>
</html>
