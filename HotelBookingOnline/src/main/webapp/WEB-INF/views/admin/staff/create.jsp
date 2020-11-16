<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Add Staff</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/staff">Staff</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Add Staff</li>
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
					<form:form action="saveStaff" method="POST" modelAttribute="staff">	
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="empName" class="mdl-textfield__input" type="text" id="txtFirstName" required="true"/> <label class="mdl-textfield__label">Full name</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="gender" class="mdl-textfield__input" readonly="true" type="text" id="sample2" value="" required="true"/> 
									<label for="sample2" class="pull-right margin-0"> <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
									</label> <label for="sample2" class="mdl-textfield__label">Gender</label>
									<ul data-mdl-for="sample2" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<li class="mdl-menu__item" data-val="DE">Male</li>
										<li class="mdl-menu__item" data-val="BY">Female</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="dateOfBirth" class="mdl-textfield__input" type="text" id="dateOfBirth" required="true"/> <label class="mdl-textfield__label">Birth Date</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="phone" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="text5" required="true"/> <label class="mdl-textfield__label"
										for="text5">Mobile Number</label> <span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<input name="pos" class="mdl-textfield__input"  type="text" id="list1" value="${staff.position.name}" readonly="readonly" required="required"/> 
									<label for="list1" class="pull-right margin-0"><i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i></label> 
									<label for="list1" class="mdl-textfield__label">Position</label>
									<ul data-mdl-for="list1" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<c:forEach var="position" items="${positionList}">
											<li class="mdl-menu__item" data-val="${position.name}">${position.name}</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="username" class="mdl-textfield__input" type="text" id="txtFirstName" /> <label class="mdl-textfield__label">Username</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="password" class="mdl-textfield__input" type="password" id="txtPwd" /> <label class="mdl-textfield__label">Password</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div id="confirm" class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="password" id="txtConfirmPwd" required="required"> 
									<label class="mdl-textfield__label">Confirm Password</label>
								</div>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:textarea path="address" class="mdl-textfield__input" rows="2" id="text7" required="true"/>
									<label class="mdl-textfield__label" for="text7">Address</label>
								</div>
							</div>
							<!-- <div class="col-lg-12 p-t-20">
								<label class="control-label col-md-3">Upload Room Photos</label>
								<div id="dZUpload" class="dropzone">
									<div class="dz-message">
										<div class="dropIcon">
											<i class="material-icons">cloud_upload</i>
										</div>
										<h3>Drop files here or click to upload.</h3>
										<em> (This is just a demo. Selected files are <strong>not</strong> actually uploaded.)
										</em>
									</div>
								</div>
							</div> -->
							<div class="col-lg-12 p-t-20 text-center">
								<button id="submitBtn" type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
								<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

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