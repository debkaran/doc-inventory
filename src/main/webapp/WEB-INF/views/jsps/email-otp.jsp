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
  <style type="text/css">
  	.disabled-a-text{
  		color: #e9ecef;
  		cursor: text;
  	}
  	.disabled-a-text:hover{
  		color: #e9ecef;
  		cursor: text;
  	}
  </style>
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
    		String eUId = (String) request.getAttribute("eUId"); 
	      %>
      	<input type="hidden" name="userId" id="userId" value="<%=userId %>" />
      	<input type="hidden" name="sourcePage" id="sourcePage" value="<%=sourcePage %>" />
      	<input type="hidden" name="eUId" value="<%=eUId %>" />
        <div class="input-group mb-3">
          <input type="text" name="otp" class="form-control" placeholder="Enter your OTP">
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button  type="submit" id="submitBtn" class="btn btn-primary btn-block">Submit</button>
          </div>
        </div>
        <div class="row">
          <div class="col-1 d-none" id="resend-email-loader">
           	<span class="spinner-border spinner-border-sm text-primary" role="status" aria-hidden="true"></span>
          </div>
          <div class="col text-left">
          	<a href="#" id="resendOTP">Resend OTP</a>
          </div>
        </div>
        <div class="row d-none">
        	<div class="col-12" style="color: green;" id="resendInfo">&nbsp;</div>
        </div>
        <div class="row">
          <div class="col-12" id="errorMessage">
            <% 
            	String errorMessage = (String) request.getAttribute("errorMessage");
				if(errorMessage != null){
			%>
					<p style="color: red; font-size: 12px; font-weight: 600;">* <%=errorMessage %></p>
			<%
				}
			%>
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
<script src="./resources/js/resend-OTP-ajax.js"></script>
</body>
</html>
