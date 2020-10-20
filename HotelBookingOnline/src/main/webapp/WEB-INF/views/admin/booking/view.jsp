<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">All Bookings</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i></li>
					<li><a class="parent-item" href="">Booking</a>&nbsp;<i class="fa fa-angle-right"></i></li>
					<li class="active">All Bookings</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card card-box">
					<div class="card-head">
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a> <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body ">
						<div class="row p-b-20">
							<div class="col-md-6 col-sm-6 col-6">
								<div class="btn-group">
									<a href="<c:url value="booking/create"/>" id="addRow" class="btn btn-info"> Add New <i class="fa fa-plus"></i>
									</a>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-6">
								<div class="btn-group pull-right">
									<a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu pull-right">
										<li><a href="javascript:;"> <i class="fa fa-print"></i> Print
										</a></li>
										<li><a href="javascript:;"> <i class="fa fa-file-pdf-o"></i> Save as PDF
										</a></li>
										<li><a href="javascript:;"> <i class="fa fa-file-excel-o"></i> Export to Excel
										</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="table-scrollable">
							<table class="table table-hover table-checkable order-column full-width" id="example4">
								<thead>
									<tr>
										<th class="center">Booking number</th>
										<th class="center">Booking date</th>
										<th class="center">Name</th>
										<th class="center">Room Type</th>
										<th class="center">Arrive</th>
										<th class="center">Depart</th>
										<th class="center">Booking Status</th>
										<th class="center">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="booking" items="${bookingList}">
										<tr class="odd gradeX">
											<td class="center">${booking.bookinguid}</td>
											<fmt:parseDate value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
											<fmt:formatDate value="${parsedDate}" var="bookingDate" type="both" pattern="yyyy-MM-dd HH:mm" />
											<td class="center">${bookingDate}</td>
											<td class="center"><a href="<c:url value="/admin/user/${booking.user.getUserId()}"/>">${booking.user.getName()}</a></td>
											<td class="center">${booking.roomtype.typename}</td>
											<td class="center"><fmt:formatDate value="${booking.checkInDate}" pattern="yyyy-MM-dd"/></td>
											<td class="center"><fmt:formatDate value="${booking.checkOutDate}" pattern="yyyy-MM-dd"/></td>
											<td class="center">
												<span class="label label-sm label-${booking.status == 'ONLINE_PENDING' ? 'secondary' : booking.status == 'PENDING' 
												? 'warning' : booking.status == 'SUCCESS' ? 'success' : 'danger'}">${booking.status}</span>
											</td>
											<td class="center">
												<a href="/admin/booking/booking-details/${booking.bookingId}" class="btn btn-tbl-edit btn-xs"><i class="fa fa-eye"></i></a>
												<button class="btn btn-tbl-delete btn-xs"><i class="fa fa-trash-o "></i></button>
											</td>
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
</div>