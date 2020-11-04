<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />
<link rel="stylesheet" href="${resources}/assets/css/imageuploadify.min.css" type="text/css">
<style>
.imageuploadify-container{
	margin: 0px auto;
}
</style>
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Add User Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/user">Users</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Add User Details</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="card-box">
					<div class="card-head">
						<header>Basic Information</header>
						<button id="panel-button" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
							<i class="material-icons">more_vert</i>
						</button>
						<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" data-mdl-for="panel-button">
							<li class="mdl-menu__item"><i class="material-icons">assistant_photo</i> Action</li>
							<li class="mdl-menu__item"><i class="material-icons">print</i> Another action</li>
							<li class="mdl-menu__item"><i class="material-icons">favorite</i> Something else here</li>
						</ul>
					</div>
					<form:form action="saveUser" method="POST" modelAttribute="user" id="userForm">
						<form:hidden path="userId" />
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="name" class="mdl-textfield__input" type="text" id="txtFirstName" required="true"/>
									<label class="mdl-textfield__label">Full Name</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="email" class="mdl-textfield__input" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" id="txtemail" required="true"/>
									<label class="mdl-textfield__label">Email</label> 
									<span class="mdl-textfield__error">Enter Valid Email Address!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="phone" class="mdl-textfield__input" type="text" pattern="-?[0-9]*([0-9]+)?" id="text5" required="true"/>
									<label class="mdl-textfield__label" for="text5">Mobile Number</label> <span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="username" class="mdl-textfield__input" type="text" id="txtUserName" required="true"/>
									<label class="mdl-textfield__label">UserName</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="password" class="mdl-textfield__input" type="password" id="txtPwd" required="true"/>
									<label class="mdl-textfield__label">Password</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div id="confirm" class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="password" id="txtConfirmPwd" required="true" /> 
									<label class="mdl-textfield__label">Confirm Password</label>
								</div>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield txt-full-width">
									<form:textarea path="address" class="mdl-textfield__input" rows="1" id="text7" required="true"/>
									<label class="mdl-textfield__label" for="text7">Address</label>
								</div>
							</div>
							<div style="margin: 0 auto;" class="col-lg-6">
								<input name="image" onchange="processFile(this)" type="file" accept="image/*" multiple>
							</div>
							<div class="col-lg-12 p-t-20 text-center">
								<button id="submit" type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
								<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${resources}/assets/js/imageuploadify.min.js"></script>

<script>
$('input[type="file"]').imageuploadify();
</script>

<script>
function processFile(imageInput) {
    if (imageInput.files[0]) {
      var file = imageInput.files[0];
      var pattern = /image-*/;
      if (!file.type.match(pattern)) {
        alert('Invalid format');
        return;
      }
      // here you can do whatever you want with your image. Now you are sure that it is an image
    }
}
</script>

<script type="text/javascript">
		var password = document.getElementById("txtPwd")
		  , confirm_password = document.getElementById("txtConfirmPwd");
	
		function validatePassword(){
		  if(password.value != confirm_password.value) {
			$('#confirm').removeClass('is-valid');
			$('#confirm').addClass('is-invalid');
			$('#cfError').remove();
			$('#confirm').append("<span class='mdl-textfield__error' id='cfError'>Passwords Don't Match</span>");
		    confirm_password.setCustomValidity("Passwords Don't Match");
		  } else {
			  $('#cfError').remove();
			 $('#confirm').removeClass('is-invalid');
			 $('#confirm').addClass('is-valid');
		    confirm_password.setCustomValidity('');
		  }
		}
	
		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>
