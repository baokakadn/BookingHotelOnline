<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">All Guests</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/guest">Users</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">All Guests</li>
				</ol>
			</div>
		</div>
		<div class="tab-content tab-space">
			<div class="tab-pane active show">
				<div class="row">
					<div class="col-md-12">
						<div class="card-box">
							<div class="card-head">
								<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a> <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
						</div>
							</div>
							<div class="card-body ">
								<div class="row p-b-20">
									<div class="col-md-6 col-sm-6 col-6">
										<div class="btn-group">
											<a href="/admin/guest/create" id="addRow" class="btn btn-info"> Add New <i class="fa fa-plus"></i>
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
												<th class="center">Identify Number</th>
												<th class="center">Full Name</th>
												<th class="center">Gender</th>
												<th class="center">Date Of Birth</th>
												<th class="center">Room</th>
												<th class="center">Arrival Date</th>
												<th class="center">Departure Date</th>
												<th class="center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="guest" items="${listGuest}">
												<tr class="odd gradeX">
													<td class="center">${guest.idNo}</td>
													<td class="center">${guest.name}</td>
													<td class="center">${guest.sex}</td>
													<td class="center"><fmt:formatDate value="${guest.dob}" pattern="yyyy-MM-dd"/></td>
													<td class="center">${guest.bookingDetails.room.roomnumber}</td>
													<td class="center"><fmt:formatDate value="${guest.bookingDetails.booking.checkInDate}" pattern="yyyy-MM-dd"/></td>
													<td class="center"><fmt:formatDate value="${guest.bookingDetails.booking.checkOutDate}" pattern="yyyy-MM-dd"/></td>
													<td class="center"><a href="/admin/guest/${guest.id}" class="btn btn-tbl-edit btn-xs"> <i class="fa fa-eye"></i>
													</a><a class="btn btn-tbl-delete btn-xs"> <i class="fa fa-trash-o "></i>
													</a></td>
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
	</div>
</div>