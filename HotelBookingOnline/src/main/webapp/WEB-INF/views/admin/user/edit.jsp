<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">User Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li><a class="parent-item" href="/admin/user">Users</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">User Details</li>
				</ol>
			</div>
		</div>
		<ul class="nav nav-pills nav-pills-rose">
			<li class="nav-item tab-all"><a class="nav-link active show" href="#tab1" data-toggle="tab">Details</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab2" data-toggle="tab">Bookings</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab3" data-toggle="tab">Invoices</a></li>
		</ul>
		<div class="tab-content tab-space">
			<div class="tab-pane active fontawesome-demo" id="tab1">
				<div class="white-box">
					<div class="profile-sidebar">
						<div class="card card-topline-aqua">
							<div class="card-body no-padding height-9">
								<div class="row">
									<div class="profile-userpic">
										<img style="width: 130px; height: 130px;" src="<c:url value="/resources/upload/user-image/${user.userId}/${user.picture}"/>"
											class="img-responsive" alt="">
									</div>
								</div>
								<div class="profile-usertitle">
									<div class="profile-usertitle-name">${user.name}</div>
								</div>
								<!-- SIDEBAR BUTTONS -->
								<div class="profile-userbuttons">
									<form action="uploadUserImage" method="POST" enctype="multipart/form-data">
										<input type="hidden" name="userId" value="${user.userId}"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="file" id="upload"
											hidden="hiden" name="fileDatas" onchange="this.form.submit()"> <label style="font-size: 11px; font-weight: 600;" for="upload"
											class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-circle btn-primary">Change Photo</label>
									</form>
								</div>
								<!-- END SIDEBAR BUTTONS -->
								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>Email</b> <a class="pull-right">${user.email}</a></li>
									<li class="list-group-item"><b>Phone</b> <a class="pull-right">${user.phone}</a></li>
									<li class="list-group-item"><b>Address</b> <a class="pull-right">${user.address}</a></li>
								</ul>
								<!-- END SIDEBAR USER TITLE -->

							</div>
						</div>
					</div>
					<form:form action="updateUser" method="POST" modelAttribute="user" id="userForm">
						<form:hidden path="userId" />
						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="name" class="mdl-textfield__input" type="text" id="txtFirstName" />
									<label class="mdl-textfield__label">Full Name</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="email" class="mdl-textfield__input" type="email" id="txtemail" />
									<label class="mdl-textfield__label">Email</label> <span class="mdl-textfield__error">Enter Valid Email Address!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="phone" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="text5" />
									<label class="mdl-textfield__label" for="text5">Mobile Number</label> <span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="password" class="mdl-textfield__input" type="password" id="password" />
									<label class="mdl-textfield__label">Password</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="password" id="confirmPass"> <label class="mdl-textfield__label">Confirm Password</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield txt-full-width">
									<form:textarea path="address" class="mdl-textfield__input" rows="1" id="text7" />
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
												<th class="center">Booking date</th>
												<th class="center">Room Type</th>
												<th class="center">Arrive</th>
												<th class="center">Depart</th>
												<th class="center">Booking Status</th>
												<th class="center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="booking" items="${user.bookings}">
												<tr class="odd gradeX">
													<td class="center">${booking.bookinguid}</td>
													<fmt:parseDate value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
													<fmt:formatDate value="${parsedDate}" var="bookingDate" type="both" pattern="yyyy-MM-dd HH:mm" />
													<td class="center">${bookingDate}</td>
													<td class="center">${booking.roomtype.typename}</td>
													<td class="center"><fmt:formatDate value="${booking.checkInDate}" pattern="yyyy-MM-dd"/></td>
													<td class="center"><fmt:formatDate value="${booking.checkOutDate}" pattern="yyyy-MM-dd"/></td>
													<td class="center">${booking.status}</td>
													<td class="center"><a href="/admin/booking/booking-details/${booking.bookingId}" class="btn btn-tbl-edit btn-xs"><i class="fa fa-eye"></i></a>
														<button class="btn btn-tbl-delete btn-xs">
															<i class="fa fa-trash-o "></i>
														</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab3">
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
									<table class="table table-hover table-checkable order-column full-width" id="example3">
										<thead>
											<tr>
												<th class="center">#</th>
												<th class="center">Invoice Date</th>
												<th class="center">Amount</th>
												<th class="center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="index" value="1"/>
											<c:forEach var="booking" items="${user.bookings}">
												<c:forEach var="invoice" items="${booking.invoices}">
													<tr class="odd gradeX">
														<td class="center">${index}</td>
														<td class="center">${invoice.invoiceDate}</td>
														<td class="center">${invoice.amount}</td>
														<td class="center"><a href="edit_booking.html" class="btn btn-tbl-edit btn-xs"><i class="fa fa-pencil"></i></a>
															<button class="btn btn-tbl-delete btn-xs">
																<i class="fa fa-trash-o "></i>
															</button>
														</td>
													</tr>
													<c:set var="index" value="${index + 1}"/>
												</c:forEach>
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

<script type="text/javascript">
	var password = document.getElementById("password"), confirm_password = document
			.getElementById("confirmPass");

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