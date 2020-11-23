<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />

<style>
.white-box {
	display: block;
	overflow: auto;
}
</style>

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Guest Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li><a class="parent-item" href="/admin/guest">Guests</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Guest Details</li>
				</ol>
			</div>
		</div>
		<ul class="nav nav-pills nav-pills-rose">
			<li class="nav-item tab-all"><a class="nav-link active show" href="#tab1" data-toggle="tab">Details</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab2" data-toggle="tab">Room</a></li>
		</ul>
		<div class="tab-content tab-space">
			<div class="tab-pane active fontawesome-demo" id="tab1">
				<div class="white-box">
					<div class="profile-sidebar">
						<div class="card card-topline-aqua">
							<div class="card-body no-padding height-9">
								<div class="row">
									<div class="profile-userpic">
										<img style="width: 130px; height: 130px;" src="<c:url value="/resources/upload/guest-image/${guest.idImage}"/>"
											class="img-responsive" alt="">
									</div>
								</div>
								<div class="profile-usertitle">
									<div class="profile-usertitle-name">${guest.name}</div>
								</div>
								<!-- SIDEBAR BUTTONS -->
								<div class="profile-userbuttons">
									<form action="uploadGuestImage" method="POST" enctype="multipart/form-data">
										<input type="hidden" name="guestId" value="${guest.id}"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="file" id="upload"
											hidden="hiden" name="fileDatas" onchange="this.form.submit()"> <label style="font-size: 11px; font-weight: 600;" for="upload"
											class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-circle btn-primary">Change Photo</label>
									</form>
								</div>
								<!-- END SIDEBAR BUTTONS -->
								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>Gender</b> <a class="pull-right">${guest.sex}</a></li>
									<li class="list-group-item"><b>Date Of Birth</b> <a class="pull-right"><fmt:formatDate value="${guest.dob}" pattern="yyyy-MM-dd" /></a></li>
									<li class="list-group-item"><b>Room</b> <a class="pull-right">${guest.bookingDetails.room.roomnumber}</a></li>
									<li class="list-group-item"><b>Address</b> <a class="pull-right">${guest.address}</a></li>
									<li class="list-group-item"><b>Identify Type</b> <a class="pull-right">${guest.idType}</a></li>
									<li class="list-group-item"><b>Identify Number</b> <a class="pull-right">${guest.idNo}</a></li>
								</ul>
								<!-- END SIDEBAR USER TITLE -->

							</div>
						</div>
					</div>
					<form:form action="/admin/booking/booking-details/${booking.bookingId}/saveGuest" method="POST" modelAttribute="guest">
						<form:hidden path="id"/>
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="name" class="mdl-textfield__input" type="text" required="true"/> 
									<label class="mdl-textfield__label">Full Name</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="sex" class="mdl-textfield__input" type="text" id="sample3" value="${guest.sex}" readonly="true" required="true"/> <label for="sample3"
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
									<form:input path="dob" class="mdl-textfield__input" type="text" id="dateOfBirth" required="true"/> 
									<label class="mdl-textfield__label">Date Of Birth</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<input name="roomNum" class="mdl-textfield__input" type="text" id="sample2" value="${guest.bookingDetails.room.roomnumber}" readonly tabIndex="-1" required="required"> <label for="sample2"
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
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:textarea path="address" class="mdl-textfield__input" rows="1" id="text7" required="true"/>
									<label class="mdl-textfield__label" for="text7">Address</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="idType" class="mdl-textfield__input" type="text" id="sample1" value="" readonly="true" tabIndex="-1" required="true"/> <label for="sample1"
										class="pull-right margin-0"> <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
									</label> <label for="sample1" class="mdl-textfield__label">Identify Type</label>
									<ul data-mdl-for="sample1" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<li class="mdl-menu__item" data-val="DE">ID CARD</li>
										<li class="mdl-menu__item" data-val="BY">PASSPORT</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="idNo" class="mdl-textfield__input" type="number" id="text5" required="true"/> <label class="mdl-textfield__label" for="text5">Identify Number</label>
									<span class="mdl-textfield__error">Number required!</span>
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

			<div class="tab-pane" id="tab2">
				<div class="row">
					<div class="col-md-12">
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
							<div class="card-body ">
								<div class="table-scrollable">
									<table class="table table-hover table-checkable order-column full-width" id="example4">
										<thead>
											<tr>
												<th class="center">Booking number</th>
												<th class="center">Room no</th>
												<th class="center">Arrival</th>
												<th class="center">Departure</th>
												<!-- <th class="center">Action</th> -->
											</tr>
										</thead>
										<tbody>
											<tr class="odd gradeX">
												<td class="center"><a href="<c:url value="/admin/booking/booking-details/${booking.bookingId}"/>">${booking.bookinguid}</a></td>
												<td class="center">${guest.bookingDetails.room.roomnumber}</td>
												<fmt:parseDate value="${guest.bookingDetails.checkinDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate1" type="both" />
												<fmt:formatDate value="${parsedDate1}" var="checkinDate" type="both" pattern="yyyy-MM-dd HH:mm" />
												<fmt:parseDate value="${guest.bookingDetails.checkoutDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate2" type="both" />
												<fmt:formatDate value="${parsedDate2}" var="checkoutDate" type="both" pattern="yyyy-MM-dd HH:mm" />
												<td class="center">${checkinDate}</td>
												<td class="center">${checkoutDate}</td>
												<!-- <td class="center"><a href="edit_booking.html" class="btn btn-tbl-edit btn-xs"><i class="fa fa-pencil"></i></a>
													<button class="btn btn-tbl-delete btn-xs">
														<i class="fa fa-trash-o "></i>
													</button></td> -->
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>