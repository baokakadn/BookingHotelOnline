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
					<div class="page-title">Add Guest Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/guest">Guest</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Add Guest Details</li>
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
					<form:form action="saveGuest" method="POST" modelAttribute="guest">
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="name" class="mdl-textfield__input" type="text" /> <label class="mdl-textfield__label">Full Name</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="sex" class="mdl-textfield__input" type="text" id="sample3" value="" readonly="true" tabIndex="-1" /> <label for="sample3"
										class="pull-right margin-0"> <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
									</label> <label for="sample3" class="mdl-textfield__label">Gender</label>
									<ul data-mdl-for="sample3" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<li class="mdl-menu__item" data-val="DE">Male</li>
										<li class="mdl-menu__item" data-val="BY">Female</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="dob" class="mdl-textfield__input" type="text" id="dateOfBirth"/> <label class="mdl-textfield__label">Date Of Birth</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<input name="roomNum" class="mdl-textfield__input" type="text" id="sample2" value="" readonly tabIndex="-1"> <label for="sample2"
										class="pull-right margin-0"> <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
									</label> <label for="sample2" class="mdl-textfield__label">Room</label>
									<ul data-mdl-for="sample2" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<c:forEach var="room" items="${listRoom}">
											<li class="mdl-menu__item" data-val="${room.roomid}">${room.roomnumber}</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield txt-full-width">
									<form:textarea path="address" class="mdl-textfield__input" rows="1" id="text7" />
									<label class="mdl-textfield__label" for="text7">Address</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="idType" class="mdl-textfield__input" type="text" id="txtFirstName" /> <label class="mdl-textfield__label">Identify Type</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="idNo" class="mdl-textfield__input" type="number" id="text5" /> <label class="mdl-textfield__label" for="text5">Identify Number</label>
									<span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<!-- <div style="margin: 0 auto;" class="col-lg-6">
								<input name="image" onchange="processFile(this)" type="file" accept="image/*" multiple>
							</div> -->
							<div class="col-lg-12 p-t-20 text-center">
								<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
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