<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<section class="user_account_content">
	<div class="user_profile_Bg"></div>
	<div class="container">
		<div class="row m-b30">
			<div class="col-lg-6">
				<div class="user_accout_pic d-flex align-items-center">
					<img src="<c:url value="/resources/upload/user-image/${user.userId}/${user.picture}"/>" alt="">
					<h3>${user.name}</h3>
				</div>
			</div>
			<div class="col-lg-6  text-right mt-mainus60">
				<form action="uploadUserImage" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="userId" value="${user.userId}"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
					<input type="file" id="upload" hidden="hiden" name="fileDatas" onchange="this.form.submit()"> 
					<label for="upload"	class="btn btn-success"><i class="fa fa-edit m-r-7"></i> Edit Photo</label>
				</form>
			</div>
		</div>
		<form:form action="updateUser" method="POST" modelAttribute="user">
			<div class="row">
				<div class="col-lg-12 account_info_widgets">
					<form:hidden path="userId" />
					<h4>Full Name</h4>
					<div class="row">
						<div class="form-group col-lg-6 col-md-6 m-0">
							<form:input path="name" type="text" class="form-control gray_fild" required="true"/>
						</div>
						<!-- <div class="form-group col-lg-6 col-md-6 Gender_widgets">
						<p>Your Gender</p>
						<label class="custom-control custom-radio">
							<input name="radio" type="radio" class="custom-control-input">
							<span class="custom-control-indicator"></span>
							<span class="custom-control-description">Male</span>
						</label>
						<label class="custom-control custom-radio m-0">
							<input name="radio" type="radio" class="custom-control-input">
							<span class="custom-control-indicator"></span>
							<span class="custom-control-description">Female</span>
						</label>
					</div> -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 account_info_widgets">
					<div class="row">
						<div class="form-group col-lg-6 col-md-6 m-0">
							<h4>
								Email Address <a href="#" class="pass_link" data-toggle="modal" data-target="#change_pass">Change Password</a>
							</h4>
							<form:input path="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control gray_fild" required="true"/>
						</div>
						<div class="form-group col-lg-6 col-md-6  m-0">
							<h4>Phone No.</h4>
							<form:input path="phone" type="text" class="form-control gray_fild" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 account_info_widgets">
					<h4>Address</h4>
					<div class="form-group">
						<form:textarea path="address" class="form-control gray_fild"></form:textarea>
					</div>
					<div class="text-right">
						<button type="submit" class="btn btn-success btn-lg">Update</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	<!-- change Password Modal -->
	<div class="modal fade" id="change_pass">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Change Your Password</h4>
					<button type="button" class="close" data-dismiss="modal">
						<i class="fa fa-times"></i>
					</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form action="changePass" method="POST">
						<input type="hidden" name="userId" value="${user.userId}">
						<c:if test="${not empty msg}">
							<p style="color: red;">
								Error:
								<c:out value="${msg}" />
							</p>
						</c:if>
						<div class="form-group">
							<input name="oldPass" type="password" placeholder="Old Password" class="form-control" required="required" />
						</div>
						<div class="form-group">
							<input id="newPass" name="newPass" type="password" placeholder="New Password" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<input id="confirmPass" type="password" placeholder="Confirm Password" class="form-control" required="required"/>
						</div>
						<div class="form-group text-right border-0 m-0">
						<input type="submit" value="Submit" class="btn btn-success" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- change Password Modal End -->
</section>
<script type="text/javascript">
	var password = document.getElementById("newPass"), 
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

