<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<style>
@media print {
	body {
		width: 100%;
		color: red;
	}
	#menu-btn, #nav {
		display: none;
	}
}

.column {
	float: left;
	width: 33.33%;
	padding: 10px;
	height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

h3 {
	margin: 0;
}
</style>
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Booking Details</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/booking">Booking</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Booking Details</li>
				</ol>
			</div>
		</div>
		<ul id="nav" class="nav nav-pills nav-pills-rose">
			<li class="nav-item tab-all"><a class="nav-link active show" href="#tab1" data-toggle="tab">Details</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab2" data-toggle="tab">Room</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab3" data-toggle="tab">Service</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab4" data-toggle="tab">Guest In Room</a></li>
		</ul>
		<div class="tab-content tab-space">
			<div class="tab-pane active show" id="tab1">
				<div class="row">
					<div class="col-md-12">
						<div class="white-box">
							<div id="menu-btn">
								<div class="float-right ml-2">
									<a style="background: #888888;" class="btn btn-tsk" onclick="javascript:window.print()"><i style="color: #fff;"
													class="fa fa-print"></i></a>
								</div>
								<c:choose>
									<c:when test="${booking.status == 'ONLINE_PENDING'}">
										<div class="float-right mr-2">
											<a class="btn btn-secondary " href="/admin/booking/booking-details/${booking.bookingId}/confirmStatus"> Make Confirm</a>
										</div>
									</c:when>
									<c:when test="${booking.status == 'SUCCESS'}">
										<div class="float-right mr-2">
											<a class="btn btn-success " href="javascript:;">SUCCESS</a>
										</div>
									</c:when>
									<c:when test="${booking.status == 'CANCEL'}">
										<div class="float-right mr-2">
											<a class="btn btn-danger " href="javascript:;">CANCEL</a>
										</div>
									</c:when>
									<c:otherwise>
										<c:if test="${booking.status eq 'STAYING' }">
											<div class="float-right ml-2">
												<a style="margin-right: .5rem !important;" class="btn btn-primary" href="#" data-toggle="modal" data-target="#add_service"> Add
													Service</a> 
											</div>
											<div class="float-right mr-2" style="margin-right: 0; margin-left: .5rem !important;">
												<a class="btn btn-danger" href="#" data-toggle="modal" data-target="#checkout"> CHECKOUT</a>
											</div>
										</c:if>
										<div class="dropdown float-right mr-2">
											<button type="button"
												class="btn btn-${booking.status == 'STAYING' ? 'warning' : 'danger'} 
											dropdown-toggle"
												data-toggle="dropdown">${booking.status}
												&nbsp&nbsp<i class="fa fa-angle-down"></i>
											</button>
											<div class="dropdown-menu">
												<c:set var="statusList" value="${['STAYING','CANCEL']}" />
												<c:forEach var="status" items="${statusList}">
													<c:if test="${status != booking.status}">
														<c:set var="statusLink" value="/admin/booking/booking-details/${booking.bookingId}/change-status/${status}" />
														<c:choose>
															<c:when test="${status eq 'CANCEL' }">
																<a class="dropdown-item" href="#"
																	onclick="if ((confirm('Are you sure you want to delete this student?'))) 
																window.location.href = '${statusLink}'; return false;">${status}</a>
															</c:when>
															<c:otherwise>
																<a class="dropdown-item" href="/admin/booking/booking-details/${booking.bookingId}/change-status/${status}">${status}</a>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>

							<br>
							<hr>
							<img style="width: 200px;" src="${resources}/assets/images/logo-3d2.png" alt="logo" class="logo-default" />
							<h3>
								<span class="pull-right"><b>BOOKING NUMBER: </b>#${booking.bookinguid}</span>
							</h3>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<div class="column">
										<b>Gwesty Hotel</b> <br> Opp. Town Hall, <br> Sardar Patel Road, <br> Ahmedabad - 380015
									</div>
									<div class="column">
										Guest Details<br> <b>${booking.user.getName()}</b><br> ${booking.user.getAddress()}<br /> Phone: ${booking.user.getPhone()}<br />
										Email: ${booking.user.getEmail()}
									</div>
									<div class="column">
										<table style="width: 100%;">
											<tr>
												<th><b>Room Type</b></th>
												<th>:</th>
												<td>&nbsp&nbsp ${booking.roomtype.getTypename()}</td>
											</tr>
											<tr>
												<th><b>Booking Date</b></th>
												<th>:</th>
												<fmt:parseDate value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
												<fmt:formatDate value="${parsedDate}" var="bookingDate" type="both" pattern="yyyy-MM-dd HH:mm" />
												<td>&nbsp&nbsp ${bookingDate}</td>
											</tr>
											<tr>
												<th><b>Check in </b></th>
												<th>:</th>
												<td>&nbsp&nbsp <fmt:formatDate value="${booking.checkInDate}" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<th><b>Check out</b></th>
												<th>:</th>
												<td>&nbsp&nbsp <fmt:formatDate value="${booking.checkOutDate}" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<th><b>Booking Status </b></th>
												<th>:</th>
												<td>&nbsp&nbsp <span style="padding: 2px 5px; font-weight: bold;"
													class="btn-circle btn-${booking.status == 'STAYING' ? 'warning' : booking.status == 'CANCEL' ? 'danger' : booking.status == 'SUCCESS' ? 'success' : 'secondary'} btn-sm m-b-5">
														${booking.status}</span>
												</td>
											</tr>
											<tr>
												<th><b>Adults</b></th>
												<th>:</th>
												<td>&nbsp&nbsp ${booking.adult} Person</td>
											</tr>
											<tr>
												<th><b>Kids </b></th>
												<th>:</th>
												<td>&nbsp&nbsp ${booking.children} Person</td>
											</tr>
										</table>

									</div>
								</div>
								<div class="col-md-12">
									<div class="table-responsive m-t-40">
										<p class="lead text-info">Night list</p>
										<table class="table table-hover">
											<thead>
												<tr>
													<th class="text-center">#</th>
													<th class="text-center">Date</th>
													<th class="text-center">Descriptions</th>
													<th class="text-center">Price</th>
													<th class="text-center">No Of Rooms</th>
													<th class="text-right">Amount</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="index" value="1" />
												<c:set var="sumTotal1" value="0" />
												<c:forEach var="date" items="${listDate}">
													<tr>
														<td class="text-center">${index}</td>
														<td class="text-center"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></td>
														<td class="text-center">${booking.roomtype.typename}</td>
														<td class="text-center">${booking.price}</td>
														<td class="text-center">${booking.numberOfRooms}</td>
														<c:set var="total" value="${booking.price * booking.numberOfRooms}" />
														<td class="text-right">$${total}</td>
													</tr>
													<c:set var="index" value="${index + 1}" />
													<c:set var="sumTotal1" value="${sumTotal1 + total }" />
												</c:forEach>
												
											</tbody>
											<tr class="border-bottom">
												<td colspan="5" align=""><b>Total Paid Night</b></td>
												<td class="text-right"><b>$${sumTotal1}</b></td>
											</tr>
										</table>
									</div>
								</div>
								<c:if test="${!empty booking.charges}">
									<div class="col-md-12">
										<div class="table-responsive m-t-40">
											<p class="lead text-info">Services</p>
											<table class="table table-hover">
												<thead>
													<tr>
														<th class="text-center">#</th>
														<th class="text-center">Date</th>
														<th class="text-center">Service</th>
														<th class="text-center">Price</th>
														<th class="text-center">Quantity</th>
														<th class="text-right">Total</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="index" value="1" />
													<c:set var="sumTotal2" value="0" />
													<c:forEach var="charge" items="${booking.charges}">
														<c:set var="total" value="${charge.service.price * charge.quantity}" />
														<tr>
															<td class="text-center">${index}</td>
															<fmt:parseDate value="${charge.chargeDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
															<fmt:formatDate value="${parsedDate}" var="chargeDate" type="both" pattern="yyyy-MM-dd HH:mm" />
															<td class="text-center">${chargeDate}</td>
															<td class="text-center">${charge.service.serviceName}</td>
															<td class="text-center">${charge.service.price}</td>
															<td class="text-center">${charge.quantity}</td>
															<td class="text-right">$${total}</td>
														</tr>
														<c:set var="index" value="${index + 1}" />
														<c:set var="sumTotal2" value="${sumTotal2 + total}" />
													</c:forEach>
												</tbody>
												<tr class="border-bottom">
													<td colspan="5" align=""><b>Total Paid service</b></td>
													<td class="text-right"><b>$${sumTotal2}</b></td>
												</tr>
											</table>
										</div>
									</div>
								</c:if>
								<div class="col-md-12">
									<div class="pull-right m-t-30 text-right">
										<c:set var="subTotal" value="${sumTotal1 + sumTotal2}" />
										<c:set var="discount"
											value="${empty booking.promotion ? '0' : 
														booking.promotion.type == 'PERCENTAGE' ? (sumTotal1 * booking.promotion.value)/100 : 
														booking.promotion.value}" />
										<c:set var="tax" value="${sumTotal1 * 0.1}" />
										<p>Sub - Total amount: $${subTotal}</p>
										<p>Discount : $${discount}</p>
										<p>Tax (10%) : $${tax}</p>
										<hr>
										<h3>
											<c:set var="grandTotal" value="${subTotal - discount + tax}" />
											<b>Total :</b> $${grandTotal}
										</h3>
										<h3>
											<b>Total Paid :</b> $${empty booking.invoices ? 0 : totalPaid}
										</h3>
										<h3>
											<b>Due :</b> $${grandTotal - totalPaid}
										</h3>
									</div>
									<div class="clearfix"></div>
									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab2">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-box">
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
											<c:forEach var="room" items="${listRoom}">
												<tr class="odd gradeX">
													<td class="center">${index}</td>
													<td class="center">${room.roomnumber}</td>
													<td class="center">${room.floor}</td>
													<td class="center">${room.status}</td>
													<td class="center"><a href="edit_room.html" class="btn btn-tbl-edit btn-xs"> <i class="fa fa-pencil"></i>
													</a> <a class="btn btn-tbl-delete btn-xs"> <i class="fa fa-trash-o "></i>
													</a></td>
													<c:set var="index" value="${index + 1}" />
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
						<div class="card card-box">
							<div class="card-body ">
								<div class="table-scrollable">
									<table class="table table-hover table-checkable order-column full-width" id="example3">
										<thead>
											<tr>
												<th class="center">#</th>
												<th class="center">Service</th>
												<th class="center">Unit</th>
												<th class="center">Quantity</th>
												<th class="center">Price</th>
												<th class="center">Total</th>
												<th class="center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="index" value="1" />
											<c:forEach var="charge" items="${booking.charges}">
												<tr class="odd gradeX">
													<td class="center">${index}</td>
													<td class="center">${charge.service.serviceName}</td>
													<td class="center">${charge.service.unit}</td>
													<td class="center">${charge.quantity}</td>
													<td class="center">${charge.service.price}</td>
													<td class="center">${charge.service.price * charge.quantity}</td>
													<c:url var="deleteService" value="${booking.bookingId}/remove-service/${charge.chargeId}" />
													<td class="center"><a href=""
														onclick="if ((confirm('Are you sure you want to delete this service?'))) 
											window.location.href = '${deleteService}'; return false;"
														class="btn btn-tbl-delete btn-xs"> <i class="fa fa-trash-o "></i>
													</a></td>
													<c:set var="index" value="${index + 1}" />
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
			<div class="tab-pane" id="tab4">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-box">
							<div class="card-body ">
								<div class="row p-b-20">
									<div class="col-md-6 col-sm-6 col-6">
										<div class="btn-group">
											<a href="/admin/booking/booking-details/${booking.bookingId}/create-guest" id="" class="btn btn-info"> Add New <i class="fa fa-plus"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="table-scrollable">
									<table class="table table-hover table-checkable order-column full-width" id="example1">
										<thead>
											<tr>
												<th class="center">Room</th>
												<th class="center">Identify Number</th>
												<th class="center">Full Name</th>
												<th class="center">Gender</th>
												<th class="center">Date Of Birth</th>
												<th class="center">Address</th>
												<th class="center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="details" items="${booking.bookingdetails}">
												<c:forEach var="guest" items="${details.listGuest}">
													<tr class="odd gradeX">
														<td class="center">${details.room.roomnumber}</td>
														<td class="center">${guest.idNo}</td>
														<td class="center">${guest.name}</td>
														<td class="center">${guest.sex}</td>
														<td class="center"><fmt:formatDate value="${guest.dob}" pattern="yyyy-MM-dd" /></td>
														<td class="center">${guest.address}</td>
														<c:url var="deleteGuest" value="${booking.bookingId}/remove-guest/${guest.id}" />
														<td class="center"><a href="/admin/guest/${guest.id}" class="btn btn-tbl-edit btn-xs"> <i class="fa fa-pencil"></i>
														</a><a class="btn btn-tbl-delete btn-xs" onclick="if ((confirm('Are you sure you want to delete this guest?'))) 
											window.location.href = '${deleteGuest}'; return false;"> <i class="fa fa-trash-o "></i>
														</a></td>
													</tr>
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
<div class="modal fade" id="add_service" tabindex="-1" role="dialog" aria-labelledby="add_service" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Service</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form id="service-form" class="" action="add-service" method="POST">
							<input type="hidden" name="bookingId" value="${booking.bookingId}">
							<div class="form-row justify-content-center">
								<div class="form-group col-sm-12">
									<label><strong>Reservation Number</strong></label> <input class="form-control" readonly="readonly" value="${booking.bookinguid }">
								</div>
							</div>
							<div class="form-row justify-content-center">
								<div class="form-group col-sm-12">
									<label><strong>Date</strong></label> <input id="liveClock1" class="form-control" name="date" readonly="readonly">
								</div>
							</div>
							<div class="form-row justify-content-center">
								<div class="form-group col-sm-12">
									<label><strong>Service</strong></label> <select class="form-control" name="service">
										<option value="">Select Service</option>
										<c:forEach var="service" items="${serviceList}">
											<option value="${service.serviceId}">${service.serviceName}($${service.price})</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-row justify-content-center">
								<div class="form-group col-sm-12">
									<label><strong>Quantity</strong></label> <input type="number" class="form-control" name="qty" min="0" placeholder="0" required="required" autocomplete="off">
								</div>
							</div>
							<div class="form-row justify-content-center">
								<div class="form-group col-sm-12">
									<hr>
									<button type="reset" class="btn btn-outline-tsk">
										<i class="fa fa-refresh"></i> Reset
									</button>
									<button type="submit" class="btn btn-tsk">
										<i class="fa fa-money"></i> Submit
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="checkout" tabindex="-1" role="dialog" aria-labelledby="checkout" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Checkout</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form id="checkout-form" action="${booking.bookingId}/checkout" method="POST">
							<div id="initial-content">
								<div class="form-row justify-content-center">
									<div class="form-group col-sm-12">
										<label><strong>Booking Number</strong></label> <input class="form-control" readonly="readonly" value="${booking.bookinguid }">
									</div>
								</div>
								<div class="form-row justify-content-center">
									<div class="form-group col-sm-12">
										<label><strong>Date</strong></label> <input name="date" id="liveClock" class="form-control" readonly="readonly">
									</div>
								</div>
								<div class="form-row justify-content-center">
									<div class="form-group col-sm-12">
										<label style="display: block;"><strong>Rooms</strong></label>
										<c:forEach var="room" items="${unCheckoutRooms}">
											<div style="display: inline; margin-right: 1rem;" class="custom-control custom-checkbox">
												<input name="checked" type="checkbox" class="form-control custom-control-input checkbox-btn" id="${room.roomnumber}"
													value="${room.roomid}" onchange='checkCount();' /> <label class="custom-control-label" for="${room.roomnumber}">${room.roomnumber}</label>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="form-row justify-content-center">
									<div class="form-group col-sm-12">
										<hr>
										<button id="btn-submit" type="submit" class="btn btn-tsk">
											<i class="fa fa-money"></i> Submit
										</button>
										<button id="btn-send" type="button" onclick="showMethod();" class="btn btn-info" style="display: none;">
											<i class="fa fa-arrow-circle-right"></i> Next
										</button>
									</div>
								</div>
							</div>
						</form>
						<div id="payment-details" style="display: none;">
							<form id="payment-form" class="" action="${booking.bookingId}/checkout" method="POST">
								<input id="checked" type="hidden" name="checked" value=""> 
								<input type="hidden" name="amount" value="${grandTotal - totalPaid}">
								<div class="form-row justify-content-center">
									<div class="form-group col-sm-12">
										<label><strong>Total Amount to be paid: $${grandTotal - totalPaid}</strong></label>
									</div>
								</div>
								<div id="area" class="form-row justify-content-center">
									<div class="form-group col-sm-12">
										<label><strong>Payment Method</strong></label> <select id="payMethod" class="form-control" name="payment" onchange="showDiv(this);">
											<option value="cash" selected="selected">Cash</option>
											<option value="card">CreditCard</option>

										</select>
									</div>
								</div>
								<div id="card" class="method form-row justify-content-center" style="display: none;">
									<div class="card-wrapper">
									
									</div>
									<div class="form-group col-sm-12">
										<label class="font-bold18">Card Number</label> <input name="cardNumber" class="form-control" type="text" maxlength="19"/>
									</div>
									<div class="form-group col-sm-12">
										<label class="font-bold18">Name on Card</label> <input name="ownerName" style="text-transform:uppercase;" class="form-control" type="text"/>
									</div>
									<div class="form-group col-sm-12">
										<label class="font-bold18">Expiry Date</label>
										<input name="expiry" class="form-control" type="text" placeholder data-mask="99/99"/>
									</div>
									<div class="form-group col-sm-12 ">
										<label class="font-bold18">CVV Number</label> <input name="cvvcode" class="form-control" type="text" />
									</div>
								</div>
								<div id="cash" class="method form-row justify-content-center" style="display: none;">
									<!-- <div class="form-group col-sm-12">
									<label><strong>Amount</strong></label> <input type="number" class="form-control" name="amount" min="0" placeholder="0">
								</div> -->
								</div>
								<input type="hidden" name="grandTotal" value="${grandTotal}">
								<div class="form-row justify-content-center">
									<div class="form-group col-sm-12">
										<hr>
										<button type="button" class="btn btn-sml btn-success"
											onclick="$('#payment-details').hide();$('#card').hide();$('#cash').hide();$('#initial-content').show();$('#payment-form').trigger('reset');">
											<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>Back
										</button>
										<button type="submit" class="btn btn-tsk">
											<i class="fa fa-money"></i> Submit
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$('#checkout').on('hidden.bs.modal', function(e) {
		$(this).find('#checkout-form')[0].reset();
		document.getElementById("initial-content").style.display = 'block';
		document.getElementById("payment-details").style.display = 'none';
		document.getElementById('btn-submit').style.display = 'inline-block';
		document.getElementById('btn-send').style.display = 'none';
	});
	$('#add_service').on('hidden.bs.modal', function(e) {
		$(this).find('#service-form')[0].reset();
	});
</script>
<script>
	function timeClock() {
		setTimeout(timeClock, 1000);
		now = new Date();
		f_date = now.getFullYear();
		f_date += "-" + (now.getMonth() + 1);
		f_date += "-" + now.getDate();
		f_date += " " + now.getHours() + ':'
				+ (now.getMinutes() < 10 ? '0' : '') + now.getMinutes();
		document.getElementById('liveClock').value = f_date;
		document.getElementById('liveClock1').value = f_date;
		return f_date;
	}
	$(function() {
		document.getElementById('liveClock').value = timeClock();
		document.getElementById('liveClock1').value = timeClock();
	});
</script>

<script>
	function checkCount() {

		var checkboxes = document.getElementsByClassName("checkbox-btn");
		var selected = [];
		var rooms = ${unCheckoutRooms.size()};
		for (var i = 0; i < checkboxes.length; ++i) {
			if (checkboxes[i].checked) {
				selected.push(checkboxes[i].value);
			}
		}
		$('#checkout').on('hidden.bs.modal', function(e) {
			selected = [];
		});
		document.getElementById('checked').value = selected;
		if (selected.length == rooms) {
			document.getElementById('btn-submit').style.display = 'none';
			document.getElementById('btn-send').style.display = 'inline-block';

		} else {
			document.getElementById('btn-submit').style.display = 'inline-block';
			document.getElementById('btn-send').style.display = 'none';
		}
	}
</script>

<script>
	function showDiv(e) {
		var strUser = e.value;
		document.querySelectorAll('.method').forEach(function(el) {
			el.style.display = 'none';
		});
		if (strUser == 0) {
			return false;
		} else {
			document.getElementById(strUser).style.display = 'block';
		}
	}
</script>

<script>
	function showMethod() {
		document.getElementById("initial-content").style.display = 'none';
		document.getElementById("payment-details").style.display = 'block';
	}
</script>

<script>
	$('input[name=cardNumber]').keypress(function(){
		 var rawNumbers = $(this).val().replace(/ /g,'');
		 var cardLength = rawNumbers.length;
		 if(cardLength !==0 && cardLength <=12 && cardLength % 4 == 0){
		   $(this).val($(this).val()+' ');
		 }
	});
</script>

<script>
jQuery.browser = {
	    msie: false,
	    version: 0
	};
</script>

<%-- <script src="${resources}/assets/plugin/card-master/dist/card.js"></script>

<script>
	var card = new Card({
	    // a selector or DOM element for the form where users will
	    // be entering their information
	    form: '#payment-form', // *required*
	    // a selector or DOM element for the container
	    // where you want the card to appear
	    container: '.card-wrapper', // *required* 

	    formSelectors: {
	        numberInput: 'input[name="cardNumber"]', // optional — default input[name="number"]
	        expiryInput: 'input[name="expiry"]', // optional — default input[name="expiry"]
	        cvcInput: 'input[name="cvvcode"]', // optional — default input[name="cvc"]
	        nameInput: 'input[name="ownerName"]' // optional - defaults input[name="name"]
	    },

	    messages: {
	        validDate: 'expire\ndate',
	        monthYear: 'mm/yy'
	    },

	    placeholders: {
	        number: '•••• •••• •••• ••••',
	        name: 'Full Name',
	        expiry: '••/••',
	        cvc: '•••'
	    }

	});
</script> --%>
