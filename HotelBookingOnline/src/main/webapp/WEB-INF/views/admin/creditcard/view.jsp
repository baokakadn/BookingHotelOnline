<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">All CreditCard</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="/admin/dashboard">Dashboard</a>&nbsp;<i class="fa fa-angle-right"></i></li>
					<li><a class="parent-item" href="/admin/creditcard">CreditCard</a>&nbsp;<i class="fa fa-angle-right"></i></li>
					<li class="active">All CreditCard</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card card-box">
					<div class="card-head">
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a> <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
							<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body ">
						<div class="row p-b-20">
							<div class="col-md-6 col-sm-6 col-6">
								<div class="btn-group">
									<a href="/admin/creditcard/create" id="addRow" class="btn btn-info"> Add New <i class="fa fa-plus"></i>
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
										<th class="center">CreditCard Number</th>
										<th class="center">Owner Name</th>
										<th class="center">Expiry Date</th>
										<th class="center">Balance</th>
										<th class="center">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="card" items="${listCard}">
										<tr class="odd gradeX">
											<td class="center">${card.cardNumber}</td>
											<td class="center">${card.ownerName}</td>
											<td class="center">${card.expiryMonth}/${card.expiryYear}</td>
											<td class="center">${card.balance}</td>
											<td class="center"><a href="/admin/creditcard/${card.id}" class="btn btn-tbl-edit btn-xs"> <i class="fa fa-pencil"></i>
											</a> </td>
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