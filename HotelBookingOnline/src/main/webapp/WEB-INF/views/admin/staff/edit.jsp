<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Staff Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li><a class="parent-item" href="/admin/staff">Staff</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Staff Details</li>
				</ol>
			</div>
		</div>
		<ul class="nav nav-pills nav-pills-rose">
			<li class="nav-item tab-all"><a class="nav-link" href="#tab1" data-toggle="tab">Details</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab2" data-toggle="tab">Change Password</a></li>
		</ul>
		<div class="tab-content tab-space">
			<div class="tab-pane fontawesome-demo" id="tab1">
				<div class="white-box">
					<div class="profile-sidebar">
						<div class="card card-topline-aqua">
							<div class="card-body no-padding height-9">
								<div class="row">
									<div class="profile-userpic">
										<img style="width: 130px; height: 130px;" src="<c:url value="/resources/upload/staff-image/${staff.empId}/${staff.photo}"/>"
											class="img-responsive" alt="">
									</div>
								</div>
								<div class="profile-usertitle">
									<div class="profile-usertitle-name">${staff.empName}</div>
									<div class="profile-usertitle-job">${staff.position.name}</div>
								</div>
								<!-- SIDEBAR BUTTONS -->
								<div class="profile-userbuttons">
									<form action="uploadImage" method="POST" enctype="multipart/form-data">
										<input type="hidden" name="staffId" value="${staff.empId}"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="file" id="upload"
											hidden="hiden" name="fileDatas" onchange="this.form.submit()"> <label style="font-size: 11px; font-weight: 600;" for="upload"
											class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-circle btn-primary">Change Photo</label>
									</form>
								</div>
								<!-- END SIDEBAR BUTTONS -->
								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>Gender</b> <a class="pull-right">${staff.gender}</a></li>
									<li class="list-group-item"><b>Date Of Birth</b> <a class="pull-right"><fmt:formatDate value="${staff.dateOfBirth}"
												pattern="yyyy-MM-dd" /></a></li>
									<li class="list-group-item"><b>Phone</b> <a class="pull-right">${staff.phone}</a></li>
									<li class="list-group-item"><b>Position</b> <a class="pull-right">${staff.position.name}</a></li>
									<li class="list-group-item"><b>Address</b> <a class="pull-right">${staff.address}</a></li>
								</ul>
								<!-- END SIDEBAR USER TITLE -->

							</div>
						</div>
					</div>
					<form:form action="updateStaff" method="POST" modelAttribute="staff" id="update">
						<form:hidden path="empId" />
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="empName" class="mdl-textfield__input" type="text" id="txtFirstName" />
									<label class="mdl-textfield__label">Full name</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="gender" class="mdl-textfield__input" readonly="true" type="text" id="sample2" value="" />
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
									<form:input path="dateOfBirth" class="mdl-textfield__input" type="text" id="dateOfBirth" />
									<label class="mdl-textfield__label">Birth Date</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="phone" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="text5" />
									<label class="mdl-textfield__label" for="text5">Mobile Number</label> <span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<input name="roleName" class="mdl-textfield__input" type="text" id="list1" value="${staff.position.name}" readonly="readonly" /> <label
										for="list1" class="pull-right margin-0"><i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i></label> <label for="list1"
										class="mdl-textfield__label">Position</label>
									<ul data-mdl-for="list1" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<c:forEach var="position" items="${positionList}">
											<li class="mdl-menu__item" data-val="${position.id}">${position.name}</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="username" class="mdl-textfield__input" type="text" id="txtUserName" />
									<label class="mdl-textfield__label">Username</label>
								</div>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:textarea path="address" class="mdl-textfield__input" rows="2" id="text7" />
									<label class="mdl-textfield__label" for="text7">Address</label>
								</div>
							</div>
							<%-- <div class="col-lg-12 p-t-20">
								<c:forEach var="role" items="${listRole}">
									<c:set var="unCheckFlag" value="${true}"/>
									<c:forEach var="check" items="${staff.listRole}">
										<c:if test="${role.roleId eq check.roleId}">
											<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="${role.roleId}"> 
												<input type="checkbox" name="role" id="${role.roleId}" class="mdl-checkbox__input" value="${role.roleId}" checked> 
												<span class="mdl-checkbox__label">${role.roleName}</span>
											</label>
											<c:set var="unCheckFlag" value="${false}"/>
										</c:if>
									</c:forEach>
									<c:if test="${unCheckFlag == true}">
										<label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="${role.roleId}"> 
											<input type="checkbox" name="role" id="${role.roleId}" class="mdl-checkbox__input" value="${role.roleId}"> 
											<span class="mdl-checkbox__label">${role.roleName}</span>
										</label>
									</c:if>
								</c:forEach>
							</div> --%>
							<div class="col-lg-12 p-t-20 text-center">
								<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
								<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
			<div class="tab-pane fontawesome-demo" id="tab2">
				<div class="white-box">
					<form action="changePass" method="POST">
						<label id="changePassError" style="color: red;"></label> <input type="hidden" name="staffId" value="${staff.empId}" />
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="password" id="oldPass" name="oldPass" /> <label class="mdl-textfield__label">Current
										Password</label>
									<c:if test="${not empty msg}">
										<span class="mdl-textfield__error">${msg}</span>
									</c:if>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="password" id="newPass" name="newPass" /> <label class="mdl-textfield__label">New Password</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div id="confirm" class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="password" id="confirmPass"> <label class="mdl-textfield__label">Confirm Password</label>
								</div>
							</div>
							<div class="col-lg-12 p-t-20 text-center">
								<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
								<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript">
	var password = document.getElementById("newPass"), confirm_password = document
			.getElementById("confirmPass");

	function validatePassword() {
		if (password.value != confirm_password.value) {
			$('#confirm').removeClass('is-valid');
			$('#confirm').addClass('is-invalid');
			$('#cfError').remove();
			$('#confirm')
					.append(
							"<span class='mdl-textfield__error' id='cfError'>Passwords Don't Match</span>");
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
<script type="text/javascript">
	var url = document.location.toString();
	if (window.location.href.indexOf('#changePass') != -1) {
		$('.nav-pills a[href="#tab2').addClass("active show");
		$('#tab2').addClass("active show");
	} else {
		$('.nav-pills a[href="#tab1').addClass("active show");
		$('#tab1').addClass("active show");
	}
</script>
<script>
	function GetURLParameter(sParam) {
		var sPageURL = window.location.search.substring(1);
		var sURLVariables = sPageURL.split('&');
		for (var i = 0; i < sURLVariables.length; i++) {
			var sParameterName = sURLVariables[i].split('=');
			if (sParameterName[0] == sParam) {
				return sParameterName[1];
			}
		}
	}

	var msg = GetURLParameter('msg');
	if (msg == 'wrong') {
		$('#changePassError').text('Error: Wrong Password !!!');
	}
</script>