<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<style>
.switchToggle {
	float: left;
	margin-left: 90px;
	margin-top: -20px;
	width: 145px;
}

.switchToggle input:checked+.slider:before {
	transform: translateX(110px);
}
</style>
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Add Room Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/rooms">Rooms</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Add Room Details</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="card-box">
					<div class="card-head">
						<button id="panel-button" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
							<i class="material-icons">more_vert</i>
						</button>
						<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" data-mdl-for="panel-button">
							<li class="mdl-menu__item"><i class="material-icons">assistant_photo</i> Action</li>
							<li class="mdl-menu__item"><i class="material-icons">print</i> Another action</li>
							<li class="mdl-menu__item"><i class="material-icons">favorite</i> Something else here</li>
						</ul>
					</div>
					<form:form action="saveRoom" method="POST" modelAttribute="room">
						<form:hidden path="roomid" />
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input class="mdl-textfield__input" type="text" id="txtRoomNo" path="roomnumber" />
									<label class="mdl-textfield__label">Room Number</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<input name="roomType" class="mdl-textfield__input" id="list1" value="${room.roomtype.getTypename()}" readonly="readonly"/> 
									<label for="list1" class="pull-right margin-0"><i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i></label> 
									<label for="list1" class="mdl-textfield__label">Room Type</label>
									<ul data-mdl-for="list1" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<c:forEach var="roomType" items="${listRoomType}">
											<li class="mdl-menu__item" data-val="${roomType.roomtypeid}">${roomType.typename}</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="floor" class="mdl-textfield__input" type="number" />
									<label class="mdl-textfield__label" for="text8">Floor</label> <span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<label style="height: 20px;" class="mdl-textfield__label">Status</label>
								</div>
								<label class="switchToggle"> <input name="status" type="checkbox" ${room.status eq '1' ? 'checked="checked"': '' }> <span
									class="slider aqua round"></span>
								</label>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:textarea path="description" class="mdl-textfield__input" rows="2" id="education" />
									<label class="mdl-textfield__label" for="text7">Description</label>
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
	</div>
</div>