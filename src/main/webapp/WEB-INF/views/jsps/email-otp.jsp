<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Doc-Inventory | OTP</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="./resources/css/googleapis-sans-pro.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="./resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
			<a href="#"><img src="./resources/images/logo.png" width="64" height="64" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"><b>Doc</b>Inventory</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Your one time password has send to your <a href="#"><%=request.getAttribute("userEmail") %></a>. OTP is valid only for 10 minutes</p>

      <form action="./email-OTP" method="post">
	      <%
	      	String userId = (String) request.getAttribute("userId");
    		String sourcePage = (String) request.getAttribute("sourcePage");
	      %>
      	<input type="hidden" name="userId" value="<%=userId %>" />
      	<input type="hidden" name="sourcePage" value="<%=sourcePage %>" />
        <div class="input-group mb-3">
          <input type="email" name="otp" class="form-control" placeholder="Enter your OTP">
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <div class="row">
        
          <div class="col-12">
          
            <button  type="submit" class="btn btn-primary btn-block">Submit</button>
            <a href = "#">Resend OTP</a>
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
<!-- AdminLTE App -->
<script src="./resources/dist/js/adminlte.min.js"></script>
</body>
</html>
