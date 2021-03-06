<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Doc-Inventory | Registration Page</title>

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
<!-- daterange picker -->
<link rel="stylesheet"
	href="./resources/plugins/daterangepicker/daterangepicker.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="./resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="#"><img src="./resources/images/logo.png" width="64"
				height="64" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8"><b>Doc</b>Inventory</a>
		</div>

		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">Register as a new membership</p>
				<% 
					String errorMessage = (String) request.getAttribute("errorMsg");
					if(errorMessage != null){
						%>
						<p style="color: red;"><%=errorMessage %></p>
						<%
					}
				%>
				<form id="registration" action="./registration" method="post">
					<div class="input-group mb-3 form-group">
						<input type="text" class="form-control" placeholder="Full name"
							name="fullname">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3 form-group">
						<input type="email" class="form-control" placeholder="Email"
							name="email">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3 form-group">
						<input type="password" class="form-control" placeholder="Password"
							name="password" id="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3 form-group">
						<input type="password" class="form-control"
							placeholder="Retype password" name="confirmPassword">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3 form-group date" id="dob"
						data-target-input="nearest">
						<input type="text" class="form-control datetimepicker-input"
							placeholder="Date of Birth" id="dateOfBirth" name="dateOfBirth"
							data-target="#dob" data-toggle="datetimepicker" />
						<div class="input-group-append" data-target="#dob"
							data-toggle="datetimepicker">
							<div class="input-group-text">
								<i class="fa fa-calendar"></i>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8 form-group">
							<div class="icheck-primary">
								<input type="checkbox" id="agreeTerms" name="terms"
									value="agree"> <label for="agreeTerms"> I agree
									to the <a href="#">terms</a>
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<a href="./" class="text-center">I already have a membership</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->
	<!-- jQuery -->
	<script src="./resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="./resources/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script
		src="./resources/plugins/jquery-validation/additional-methods.min.js"></script>
	<!-- InputMask -->
	<script src="./resources/plugins/moment/moment.min.js"></script>
	<!-- date-range-picker -->
	<script src="./resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="./resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- AdminLTE App -->
	<script src="./resources/dist/js/adminlte.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#dob').datetimepicker({
								format : 'DD/MM/yyyy'
							});
							$.validator.addMethod("dateFormat", function(value,
									element) {
								return value.match(/^\d{2}\/\d{2}\/\d{4}$/);
							}, "Please enter a date in the format dd/mm/yyyy.");

							$('#registration')
									.validate(
											{
												rules : {
													fullname : "required",
													email : {
														required : true,
														email : true,
													},
													password : {
														required : true,
														minlength : 5
													},
													confirmPassword : {
														required : true,
														equalTo : "#password"
													},
													dateOfBirth : {
														required : true,
														dateFormat : true
													},
													terms : {
														required : true
													},
												},
												messages : {
													fullname : "Please enter a Full name",
													email : {
														required : "Please enter a email address",
														email : "Please enter a vaild email address"
													},
													password : {
														required : "Please provide a password",
														minlength : "Your password must be at least 5 characters long"
													},
													confirmPassword : {
														required : "Please enter confirm password",
														equalTo : "Password mismatched"
													},
													terms : "Please accept our terms"
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
