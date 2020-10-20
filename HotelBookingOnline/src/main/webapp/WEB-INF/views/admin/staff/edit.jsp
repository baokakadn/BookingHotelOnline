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
		<div class="white-box">
			<div class="profile-sidebar">
				<div class="card card-topline-aqua">
					<div class="card-body no-padding height-9">
						<div class="row">
							<div class="profile-userpic">
								<img style="width: 130px; height: 130px;" src="<c:url value="/resources/upload/staff-image/${staff.empId}/${staff.photo}"/>" class="img-responsive" alt="">
							</div>
						</div>
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">${staff.empName}</div>
							<div class="profile-usertitle-job">${staff.position.name}</div>
						</div>
						<!-- SIDEBAR BUTTONS -->
						<div class="profile-userbuttons">
							<form action="uploadImage" method="POST" enctype="multipart/form-data">
								<input type="hidden" name="staffId" value="${staff.empId}">
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="file" id="upload" hidden="hiden" name="fileDatas" onchange="this.form.submit()"> 
								<label style="font-size: 11px; font-weight: 600;" for="upload" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-circle btn-primary">Change Photo</label>
							</form>
						</div>
						<!-- END SIDEBAR BUTTONS -->
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>Gender</b> <a class="pull-right">${staff.gender}</a></li>
							<li class="list-group-item"><b>Date Of Birth</b> <a class="pull-right"><fmt:formatDate value="${staff.dateOfBirth}"
										pattern="yyyy-MM-dd" /></a></li>
							<li class="list-group-item"><b>Phone</b> <a class="pull-right">${staff.phone}</a></li>
							<li class="list-group-item"><b>Role</b> <a class="pull-right">${staff.position.name}</a></li>
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
								class="mdl-textfield__label">Role</label>
							<ul data-mdl-for="list1" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
								<c:forEach var="role" items="${roleList}">
									<li class="mdl-menu__item" data-val="${position.id}">${position.name}</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 p-t-20">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
							<form:input path="username" class="mdl-textfield__input" type="text" id="txtFirstName" />
							<label class="mdl-textfield__label">Username</label>
						</div>
					</div>
					<div class="col-lg-6 p-t-20">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
							<form:input path="password" class="mdl-textfield__input" type="password" id="txtPwd" />
							<label class="mdl-textfield__label">Password</label>
						</div>
					</div>
					<div class="col-lg-6 p-t-20">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
							<input class="mdl-textfield__input" type="password" id="txtConfirmPwd"> 
							<label class="mdl-textfield__label">Confirm Password</label>
						</div>
					</div>
					<div class="col-lg-12 p-t-20">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
							<form:textarea path="address" class="mdl-textfield__input" rows="2" id="text7" />
							<label class="mdl-textfield__label" for="text7">Address</label>
						</div>
					</div>
					<div class="col-lg-12 p-t-20 text-center">
						<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
						<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
	var password = document.getElementById("txtPwd")
	  , confirm_password = document.getElementById("txtConfirmPwd");


	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("Passwords Don't Match");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
</script>