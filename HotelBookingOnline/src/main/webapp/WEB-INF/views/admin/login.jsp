<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta name="description" content="Responsive Admin Template" />
<meta name="author" content="SmartUniversity" />
<title>Admin | Login</title>
<!-- google font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
<!-- icons -->
<link href="${resources}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${resources}/assets/plugins/iconic/css/material-design-iconic-font.min.css">
<!-- bootstrap -->
<link href="${resources}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- style -->
<link rel="stylesheet" href="${resources}/assets/css/pages/extra_pages.css">
<!-- favicon -->
<link rel="shortcut icon" href="${resources}/assets/img/favicon.png" />
<style type="text/css">
body {
	background: #3e2bc5 url('/resources/admin/assets/img/login_bg.jpg') no-repeat center center fixed;
}
</style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="POST" action="${pageContext.request.contextPath }/admin/process-login">
					<div style="text-align: center;"><img src="${resources}/assets/img/login-logo.png" ></div>
					<span class="login100-form-title p-b-34 p-t-27" style="padding-bottom: 25px; padding-top: 20px;"><h1>Log in</h1></span>
					<c:if test="${not empty message}">
						<p style="color: red;">
							Error:
							<c:out value="${message}" />
						</p>
					</c:if>
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="text" name="username" placeholder="Username"> <span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password"> <span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me"> <label class="label-checkbox100" for="ckb1">
							Remember me </label>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Login</button>
					</div>
					<div class="text-center p-t-90" style="padding-top: 35px;">
						<a class="txt1" href="#"> Forgot Password? </a>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>
	<!-- start js include path -->
	<script src="${resources}/assets/plugins/jquery/jquery.min.js"></script>
	<!-- bootstrap -->
	<script src="${resources}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${resources}/assets/js/pages/extra_pages/login.js"></script>
	<!-- end js include path -->
</body>
</html>