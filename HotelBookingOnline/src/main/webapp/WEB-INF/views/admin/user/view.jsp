<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">All Users</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/user">Users</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">All Users</li>
				</ol>
			</div>
		</div>
		<ul class="nav nav-pills nav-pills-rose">
			<li class="nav-item tab-all"><a class="nav-link active show" href="#tab1" data-toggle="tab">List View</a></li>
			<li class="nav-item tab-all"><a class="nav-link" href="#tab2" data-toggle="tab">Grid View</a></li>
		</ul>
		<div class="tab-content tab-space">
			<div class="tab-pane active show" id="tab1">
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
											<a href="/admin/user/create" id="addRow" class="btn btn-info"> Add New <i class="fa fa-plus"></i>
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
												<th></th>
												<th class="center">Full Name</th>
												<th class="center">Email</th>
												<th class="center">Mobile</th>
												<th class="center">Address</th>
												<th class="center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="user" items="${userList}">
												<tr class="odd gradeX">
													<td class="user-circle-img sorting_1"><img style="width: 40px; height: 40px;" src="<c:url value="/resources/upload/user-image/${user.userId}/${user.picture}"/>" alt=""></td>
													<td class="center">${user.name}</td>
													<td class="center"><a href="mailto:${user.email}"> ${user.email} </a></td>
													<td class="center"><a href="tel:${user.phone}"> ${user.phone} </a></td>
													<td class="center">${user.address}</td>
													<td class="center"><a href="/admin/user/${user.userId}" class="btn btn-tbl-edit btn-xs"> <i class="fa fa-pencil"></i>
													</a> <a class="btn btn-tbl-delete btn-xs"> <i class="fa fa-trash-o "></i>
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
			<div class="tab-pane" id="tab2">
				<div class="row">
					<c:forEach var="user" items="${userList}">
						<div class="col-md-4">
							<div class="card">
								<div class="m-b-20">
									<div class="doctor-profile">
										<div class="profile-header">
											<div class="user-name">${user.name}</div>
										</div>
										<img style="width: 112px; height: 112px;" src="<c:url value="/resources/upload/user-image/${user.userId}/${user.picture}"/>" class="user-img" alt="">
										<p>${user.address}</p>
										<div>
											<p>
												<i class="fa fa-phone"></i> <a href="tel:${user.phone}"> ${user.phone}</a>
											</p>
										</div>
										<div class="profile-userbuttons">
											<a href="/admin/user/${user.userId}" class="btn btn-circle deepPink-bgcolor btn-sm">Read More</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	var classes = ['bg-b-purple', 'cyan-bgcolor', 'light-dark-bgcolor', 'bg-b-orange', 'bg-b-green', 'bg-b-danger', 'bg-b-pink'];
    $(".profile-header").each(function(i){
       $(this).addClass(classes[i]);
    });
});
</script>