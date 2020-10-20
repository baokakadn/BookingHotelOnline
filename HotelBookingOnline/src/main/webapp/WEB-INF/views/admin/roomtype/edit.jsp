<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
.white-box {
	display: block;
	overflow: auto;
}

.img-fluid {
	max-width: 100%;
	height: auto;
}

img {
	vertical-align: middle;
	border-style: none;
}

.img {
	position: relative;
	max-height: 191px;
}

.img-thumbnail {
	padding: .25rem;
	background-color: #fff;
	border: 1px solid #dee2e6;
	border-radius: .25rem;
	max-width: 100%;
	height: auto;
}

.img .featured {
	display: block;
	position: absolute;
	top: 12px;
	left: 12px;
	z-index: 999;
	background: green;
	padding: 5px;
	font-weight: bold;
	color: white;
}

.img .delete-img-btn {
	display: none;
	position: absolute;
	bottom: 12px;
	right: 12px;
	z-index: 999;
	padding: 5px;
	font-weight: bold;
	color: white;
}

.img:hover>.delete-img-btn {
	display: block;
}

.featured a.btn {
	padding: .15rem .35rem;
	font-size: .675rem;
	line-height: 1.5;
	border-radius: .2rem;
}
</style>
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Room Type Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li><a class="parent-item" href="/admin/room-type">Room Types</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Room Type Details</li>
				</ol>
			</div>
		</div>
		<ul class="nav nav-pills nav-pills-rose">
			<li class="nav-item tab-all"><a class="nav-link active show" href="#tab1" data-toggle="tab">Details</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab2" data-toggle="tab">Rooms</a></li>
		</ul>
		<div class="tab-content tab-space">
			<div class="tab-pane active fontawesome-demo" id="tab1">
				<div class="white-box">
					<div class="profile-sidebar">
						<div class="card card-topline-aqua">
							<div class="card-body no-padding height-9">
								<div class="row">
									<c:forEach var="image" items="${roomType.roomstypeimages}">
										<div class="col-md-6  p-2">
											<div class="img img-thumbnail">
												<img style="width: 142px; height: 105px;" src="<c:url value="/resources/upload/room-type-image/${roomType.roomtypeid}/${image.image}"/>"
													class="img-fluid img-responsive" alt="">
												<c:choose>
													<c:when test="${image.feature == 1 }">
														<div class="featured">FEATURED</div>
													</c:when>
													<c:otherwise>
														<div class="featured">
															<a href="/admin/room-type/${roomType.roomtypeid}/${image.id}/set-feature" class="btn btn-sm btn-danger">Set as featured</a>
														</div>
													</c:otherwise>
												</c:choose>
												<div class="delete-img-btn">
													<a style="padding: 3px;" href="/admin/room-type/${roomType.roomtypeid}/${image.id}/delete" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> </a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- SIDEBAR BUTTONS -->
								<form action="uploadMultiFile" method="post" enctype="multipart/form-data">
									<input type="hidden" name="roomTypeId" value="${roomType.roomtypeid}"> <input id="image" type="file" name="fileDatas" multiple />
									<div class="profile-userbuttons">
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-circle btn-primary">Upload
											Images</button>
									</div>
								</form>
								<!-- END SIDEBAR BUTTONS -->
								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>Title</b> <a class="pull-right">${roomType.typename}</a></li>
									<li class="list-group-item"><b>Adult Capacity</b> <a class="pull-right">${roomType.adultcapacity}</a></li>
									<li class="list-group-item"><b>Children Capacity</b> <a class="pull-right">${roomType.childrencapacity}</a></li>
									<%-- <li class="list-group-item"><b>Total Room</b> <a class="pull-right">${roomType.listRoom.size()}</a></li> --%>
									<li class="list-group-item"><b>Price</b> <a class="pull-right">${roomType.price}</a></li>
								</ul>
								<!-- END SIDEBAR USER TITLE -->

							</div>
						</div>
					</div>
					<form:form action="updateRoomType" modelAttribute="roomType" method="POST" id="updateForm">
						<div class="card-body row">

							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="typename" class="mdl-textfield__input" type="text" />
									<label class="mdl-textfield__label">Title</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="price" class="mdl-textfield__input" type="number" step=".01" />
									<label class="mdl-textfield__label" for="text8">Price</label> <span class="mdl-textfield__error">Price should be format ####(.##)!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="adultcapacity" class="mdl-textfield__input" type="text" id="list2" tabIndex="-1" />
									<label for="list2" class="pull-right margin-0"><i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i></label> <label
										for="list2" class="mdl-textfield__label">Adult Capacity</label>
									<ul data-mdl-for="list2" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<li class="mdl-menu__item" data-val="1">1</li>
										<li class="mdl-menu__item" data-val="2">2</li>
										<li class="mdl-menu__item" data-val="3">3</li>
										<li class="mdl-menu__item" data-val="4">4</li>
										<li class="mdl-menu__item" data-val="5">5</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="childrencapacity" class="mdl-textfield__input" type="text" id="list3" tabIndex="-1" />
									<label for="list2" class="pull-right margin-0"> <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
									</label> <label for="list3" class="mdl-textfield__label">Children Capacity</label>
									<ul data-mdl-for="list3" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<li class="mdl-menu__item" data-val="1">1</li>
										<li class="mdl-menu__item" data-val="2">2</li>
										<li class="mdl-menu__item" data-val="3">3</li>
										<li class="mdl-menu__item" data-val="4">4</li>
										<li class="mdl-menu__item" data-val="5">5</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield txt-full-width">
									<form:textarea path="description" class="mdl-textfield__input" rows="1" id="text7" />
									<label class="mdl-textfield__label" for="text7">Description</label>
								</div>
							</div>

							<div class="col-lg-12 p-t-20 text-center">
								<button onclick="document.getElementById('updateForm').submit();" type="button"
									class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
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
												<th class="center">#</th>
												<th class="center">Room Number</th>
												<th class="center">Floor</th>
												<th class="center">Status</th>
												<th class="center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="index" value="1" />
											<c:forEach var="room" items="${roomType.rooms}">
												<tr class="odd gradeX">
													<td class="center">${index}</td>
													<td class="center">${room.roomnumber}</td>
													<td class="center">${room.floor}</td>
													<td class="center">${room.status}</td>
													<td class="center"><a href="/admin/rooms/${room.roomid}" class="btn btn-tbl-edit btn-xs"> <i class="fa fa-pencil"></i></a></td>
												</tr>
												<c:set var="index" value="${index + 1}" />
											</c:forEach>
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
