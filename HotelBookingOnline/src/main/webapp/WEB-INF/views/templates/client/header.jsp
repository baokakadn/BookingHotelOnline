<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:url var="resources" value="/resources" />
<header class="header ${fn:indexOf(url, 'user') > -1 ? ' header_style2':' header_style1'}">
	<div class="container top-bar">
		<div class="row pt-2 pb-2">
			<div class="col-6"></div>

			<security:authorize access="isAuthenticated()">
				<security:authorize access="hasRole('USER')">
					<div class="col-6 top_Right text-right admin_mini_menu">
						<ul>
							<security:authentication var="principal" property="principal" />
							<li class="profile_drop nav-item dropdown"><a href="#" id="NavebarProfileDrop" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <img src="<c:url value="/resources/upload/user-image/${principal.id}/${principal.picture}"/>" alt="">
									${principal.name} <i class="fa fa-angle-down"></i>
							</a>
								<div class="dropdown-menu" aria-labelledby="NavebarProfileDrop">
									<h3>Account & Settings</h3>
									<ul>
										<li><a class="dropdown-item clearfix" href="/user/profile">My Account</a></li>
										<li><a class="dropdown-item clearfix" href="/user/booking">My Bookings</a></li>
										<li><a class="dropdown-item clearfix" href="/user/cancel-booking">Cancel Bookings</a></li>
										<li><a class="dropdown-item clearfix" href="process-logout">Log Out</a></li>
									</ul>
								</div></li>
						</ul>
					</div>
				</security:authorize>
			</security:authorize>
			<security:authorize access="isAnonymous()">
				<div class="col-6 top_Right text-right">
					<ul>
						<li class="hide"><a href="#">Account</a></li>
						<li><a href="#Login_tab" data-toggle="modal" data-target="#login_signup" onclick="showTab('Register_tab', 'Login_tab')">Login</a></li>
						<li><a href="#Register_tab" data-toggle="modal" data-target="#login_signup" onclick="showTab('Login_tab', 'Register_tab')">Register</a></li>
					</ul>
				</div>
			</security:authorize>
			<!-- If has login session -->
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light top_divider" data-toggle="sticky-onscroll">
		<div class="container">
			<div class="logo">
				<a class="navbar-brand" href="<c:url value="/"/>"> <img src="${pageContext.request.contextPath }/resources/assets/images/logo.png" alt="image">
				</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item ${homePage ? ' active':''}"><a class="nav-link" href="<c:url value="/"/>">Home</a></li>
					<li class="nav-item ${fn:indexOf(url, 'rooms') > -1 ? ' active':''}"><a class="nav-link" href="<c:url value="/rooms"/>">Rooms</a></li>
					<li class="nav-item ${fn:indexOf(url, 'about') > -1 ? ' active':''}"><a class="nav-link" href="<c:url value="/about"/>">About</a></li>
					<li class="nav-item ${fn:indexOf(url, 'blogs') > -1 ? ' active':''}"><a class="nav-link" href="<c:url value="/blogs"/>">Blogs</a></li>
					<li class="nav-item ${fn:indexOf(url, 'contact') > -1 ? ' active':''}"><a class="nav-link" href="<c:url value="/contact"/>">Contact Us</a></li>
					<li class="nav-item ${fn:indexOf(url, 'faq') > -1 ? ' active':''}"><a class="nav-link" href="<c:url value="/faqs"/>">FAQs</a></li>
				</ul>
				<div id="sb-search" class="sb-search">
					<form action="/search-booking" id="searchForm">
						<input class="sb-search-input" placeholder="Enter booking number..." type="text" value="" name="bookingUID" id="search"> <input
							class="sb-search-submit" type="submit" value=""> <span class="sb-icon-search"></span>
					</form>
				</div>
				<%-- <div class="navbar-nav float-right">
					<a class="btn btn-success" href="<c:url value="/rooms"/>"> <i class="fa fa-search m-r-7"></i> Search Booking
					</a>
				</div> --%>
			</div>
		</div>
	</nav>
</header>
<!-- Login Modal -->
<div class="modal fade" id="login_signup">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link " data-toggle="pill" href="#Login_tab">Login</a></li>
					<li class="nav-item"><a class="nav-link " data-toggle="pill" href="#Register_tab">Register</a></li>
				</ul>
				<button type="button" class="close" data-dismiss="modal">
					<i class="fa fa-times"></i>
				</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="tab-content">
					<div class="tab-pane " id="Login_tab">
						<form name='login-form' action="process-login" method='POST'>
							<label id="loginError" style="color: red;"></label>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i>
								</span> <input id="email" type="text" class="form-control" name="email" placeholder="Username">
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-lock"></i>
								</span> <input id="password" type="Password" class="form-control" name="password" placeholder="Password">
							</div>
							<div class="foregot_pass">
								<label class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0"> <input type="checkbox" class="custom-control-input"> <span
									class="custom-control-indicator"></span> <span class="custom-control-description">Remember Me</span>
								</label> <a href="#">Forgot Password?</a>
							</div>
							<div class="text-right mt-4">
								<input type="submit" value="Sign In" class="btn btn-success" />
							</div>
							<div class="socail_login">
								<span class="or_line">OR</span>
								<h6>Login with Your Social Profile</h6>
								<ul>
									<li><a href="#" class="fb_btn"> <i class="fa fa-facebook"></i>
									</a></li>
									<li><a href="#" class="twitter_btn"> <i class="fa fa-twitter"></i>
									</a></li>
									<li><a href="#" class="google_btn"> <i class="fa fa-google-plus"></i>
									</a></li>
									<li><a href="#" class="yahoo_btn"> <i class="fa fa-yahoo"></i>
									</a></li>
								</ul>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>
					<div class="tab-pane " id="Register_tab">
						<form action="register" method="POST">
							<label id="registerError" style="color: red;"></label>
							<input type="hidden" name="url" value="${url}">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-user"></i>
								</span> <input type="text" class="form-control" name="Reg-Username" placeholder="Username" required="required">
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-envelope"></i>
								</span> <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" name="Reg-Email" placeholder="Email" required="required">
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-lock"></i>
								</span> <input id="regPass" type="Password" class="form-control" name="Reg-Password" placeholder="Password" required="required">
							</div>
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-lock"></i>
								</span> <input id="confirmPass" type="Password" class="form-control" name="Confirm Password" placeholder="Confirm Password" required="required">
							</div>
							<div class="foregot_pass">
								<label class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0"> <input type="checkbox" class="custom-control-input"
									required="required"> <span class="custom-control-indicator"></span> <span class="custom-control-description"> I agree with
										your <a href="#">Terms & Conditions</a>
								</span>
								</label>
							</div>
							<div class="text-right mt-4">
								<input type="submit" value="Sign Up" class="btn btn-success" />
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
		</div>
	</div>
</div>
<!-- Login Modal End -->
<script src="${resources}/assets/js/uisearch.js"></script>
<script src="${resources}/assets/js/classie.js"></script>
<script>
	new UISearch(document.getElementById('sb-search'));
</script>

<script>
function GetURLParameter(sParam)
{
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++){
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam)
		{
			return sParameterName[1];
		}
	}
}

var msg = GetURLParameter('msg');
if (msg == 'username'){
	$('#registerError').text('Error: Username already exists !!!');
}
if (msg == 'error'){
	$('#loginError').text('Error: Wrong username or password !!!');
}
if (msg == 'email'){
	$('#registerError').text('Error: Email already registered !!!');
}
</script>
<script type="text/javascript">
	var password = document.getElementById("regPass"), 
		confirm_password = document.getElementById("confirmPass");
	
	function validatePassword() {
		if (password.value != confirm_password.value) {
			confirm_password.setCustomValidity("Passwords Don't Match");
		} else {
			confirm_password.setCustomValidity('');
		}
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
</script>