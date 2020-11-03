<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Dashboard</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Home</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Dashboard</li>
				</ol>
			</div>
		</div>
		<!-- start widget -->
		<div class="state-overview">
			<div class="row">
				<div class="col-xl-3 col-md-6 col-12">
					<div class="info-box bg-blue">
						<span class="info-box-icon push-bottom"> <i class="material-icons">style</i>
						</span>
						<div class="info-box-content">
							<span class="info-box-text">Orders</span> <span class="info-box-number">450</span>
							<div class="progress">
								<div class="progress-bar width-60"></div>
							</div>
							<span class="progress-description"> 60% Increase in 28 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-xl-3 col-md-6 col-12">
					<div class="info-box bg-orange">
						<span class="info-box-icon push-bottom"> <i class="material-icons">card_travel</i>
						</span>
						<div class="info-box-content">
							<span class="info-box-text">New Booking</span> <span class="info-box-number">155</span>
							<div class="progress">
								<div class="progress-bar width-40"></div>
							</div>
							<span class="progress-description"> 40% Increase in 28 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-xl-3 col-md-6 col-12">
					<div class="info-box bg-purple">
						<span class="info-box-icon push-bottom"> <i class="material-icons">phone_in_talk</i>
						</span>
						<div class="info-box-content">
							<span class="info-box-text">Inquiry</span> <span class="info-box-number">52</span>
							<div class="progress">
								<div class="progress-bar width-80"></div>
							</div>
							<span class="progress-description"> 80% Increase in 28 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-xl-3 col-md-6 col-12">
					<div class="info-box bg-success">
						<span class="info-box-icon push-bottom"> <i class="material-icons">monetization_on</i>
						</span>
						<div class="info-box-content">
							<span class="info-box-text">Total Earning</span> <span class="info-box-number">13,921</span> <span>$</span>
							<div class="progress">
								<div class="progress-bar width-60"></div>
							</div>
							<span class="progress-description"> 60% Increase in 28 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
			</div>
		</div>
		<!-- end widget -->
		<!-- UPCOMING BOOKING -->
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card  card-box">
					<div class="card-head">
						<header>Upcoming Booking</header>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a> 
							<a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
							<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body ">
						<div class="table-wrap">
							<div class="table-responsive">
								<table style="width:100%" class="table display product-overview mb-30" id="example4">
									<thead>
										<tr>
											<th class="center">Booking number</th>
											<th class="center">Booking date</th>
											<th class="center">Name</th>
											<th class="center">Room Type</th>
											<th class="center">Arrival</th>
											<th class="center">Departure</th>
											<th class="center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="booking" items="${upcoming}">
											<tr class="odd gradeX">
												<td class="center">${booking.bookinguid}</td>
												<fmt:parseDate value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
												<fmt:formatDate value="${parsedDate}" var="bookingDate" type="both" pattern="yyyy-MM-dd HH:mm" />
												<td class="center">${bookingDate}</td>
												<td class="center"><a href="<c:url value="/admin/user/${booking.user.getUserId()}"/>">${booking.user.getName()}</a></td>
												<td class="center">${booking.roomtype.typename}</td>
												<td class="center"><fmt:formatDate value="${booking.checkInDate}" pattern="yyyy-MM-dd" /></td>
												<td class="center"><fmt:formatDate value="${booking.checkOutDate}" pattern="yyyy-MM-dd" /></td>
												<td class="center"><a href="/admin/booking/booking-details/${booking.bookingId}" class="btn btn-tbl-edit btn-xs"><i
														class="fa fa-eye"></i></a> <!-- <button class="btn btn-tbl-delete btn-xs">
													<i class="fa fa-trash-o "></i>
												</button> --></td>
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
		<!-- end UPCOMING BOOKING -->
		
		<!-- CURRENT BOOKING -->
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card  card-box">
					<div class="card-head">
						<header>Current Booking</header>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a> 
							<a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
							<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body ">
						<div class="table-wrap">
							<div class="table-responsive">
								<table style="width:100%" class="table display product-overview mb-30" id="example3">
									<thead>
										<tr>
											<th class="center">Booking number</th>
											<th class="center">Booking date</th>
											<th class="center">Name</th>
											<th class="center">Room Type</th>
											<th class="center">Arrival</th>
											<th class="center">Departure</th>
											<th class="center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="booking" items="${current}">
											<tr class="odd gradeX">
												<td class="center">${booking.bookinguid}</td>
												<fmt:parseDate value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
												<fmt:formatDate value="${parsedDate}" var="bookingDate" type="both" pattern="yyyy-MM-dd HH:mm" />
												<td class="center">${bookingDate}</td>
												<td class="center"><a href="<c:url value="/admin/user/${booking.user.getUserId()}"/>">${booking.user.getName()}</a></td>
												<td class="center">${booking.roomtype.typename}</td>
												<td class="center"><fmt:formatDate value="${booking.checkInDate}" pattern="yyyy-MM-dd" /></td>
												<td class="center"><fmt:formatDate value="${booking.checkOutDate}" pattern="yyyy-MM-dd" /></td>
												<td class="center"><a href="/admin/booking/booking-details/${booking.bookingId}" class="btn btn-tbl-edit btn-xs"><i
														class="fa fa-eye"></i></a> <!-- <button class="btn btn-tbl-delete btn-xs">
													<i class="fa fa-trash-o "></i>
												</button> --></td>
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
		<!-- END CURRENT BOOKING -->
		
		<%-- <div class="row">
			<div class="col-lg-8 col-md-12 col-sm-12 col-12">
				<div class="card-box ">
					<div class="card-head">
						<header>Guest Review</header>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a> <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
							<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body ">
						<div class="row">
							<ul class="docListWindow small-slimscroll-style">
								<li>
									<div class="row">
										<div class="col-md-8 col-sm-8">
											<div class="prog-avatar">
												<img src="${resources}/assets/img/user/user1.jpg" alt="" width="40" height="40">
											</div>
											<div class="details">
												<div class="title">
													<a href="#">Rajesh Mishra</a>
													<p class="rating-text">Awesome!!! Highly recommend</p>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-4 rating-style">
											<i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star_half</i>
											<i class="material-icons">star_border</i>
										</div>
									</div>
								</li>
								<li>
									<div class="row">
										<div class="col-md-8 col-sm-8">
											<div class="prog-avatar">
												<img src="${resources}/assets/img/user/user2.jpg" alt="" width="40" height="40">
											</div>
											<div class="details">
												<div class="title">
													<a href="#">Sarah Smith</a>
													<p class="rating-text">Very bad service :(</p>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-4 rating-style">
											<i class="material-icons">star</i> <i class="material-icons">star_half</i> <i class="material-icons">star_border</i> <i
												class="material-icons">star_border</i> <i class="material-icons">star_border</i>
										</div>
									</div>
								</li>
								<li>
									<div class="row">
										<div class="col-md-8 col-sm-8">
											<div class="prog-avatar">
												<img src="${resources}/assets/img/user/user3.jpg" alt="" width="40" height="40">
											</div>
											<div class="details">
												<div class="title">
													<a href="#">John Simensh</a>
													<p class="rating-text">Staff was good nd i'll come again</p>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-4 rating-style">
											<i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star</i>
											<i class="material-icons">star</i>
										</div>
									</div>
								</li>
								<li>
									<div class="row">
										<div class="col-md-8 col-sm-8">
											<div class="prog-avatar">
												<img src="${resources}/assets/img/user/user4.jpg" alt="" width="40" height="40">
											</div>
											<div class="details">
												<div class="title">
													<a href="#">Priya Sarma</a>
													<p class="rating-text">The price I received was good value.</p>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-4 rating-style">
											<i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star</i>
											<i class="material-icons">star_half</i>
										</div>
									</div>
								</li>
								<li>
									<div class="row">
										<div class="col-md-8 col-sm-8">
											<div class="prog-avatar">
												<img src="${resources}/assets/img/user/user5.jpg" alt="" width="40" height="40">
											</div>
											<div class="details">
												<div class="title">
													<a href="#">Serlin Ponting</a>
													<p class="rating-text">Not Satisfy !!!1</p>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-4 rating-style">
											<i class="material-icons">star</i> <i class="material-icons">star_border</i> <i class="material-icons">star_border</i> <i
												class="material-icons">star_border</i> <i class="material-icons">star_border</i>
										</div>
									</div>
								</li>
								<li>
									<div class="row">
										<div class="col-md-8 col-sm-8">
											<div class="prog-avatar">
												<img src="${resources}/assets/img/user/user6.jpg" alt="" width="40" height="40">
											</div>
											<div class="details">
												<div class="title">
													<a href="#">Priyank Jain</a>
													<p class="rating-text">Good....</p>
												</div>
											</div>
										</div>
										<div class="col-md-4 col-sm-4 rating-style">
											<i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star</i> <i class="material-icons">star_half</i>
											<i class="material-icons">star_border</i>
										</div>
									</div>
								</li>
							</ul>
							<div class="full-width text-center p-t-10">
								<a href="#" class="btn purple btn-outline btn-circle margin-0">View All</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-12 col-sm-12 col-12">
				<div class="card-box">
					<div class="card-head">
						<header>Todo List</header>
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
						<ul class="to-do-list ui-sortable" id="sortable-todo">
							<li class="clearfix">
								<div class="todo-check pull-left">
									<input type="checkbox" value="None" id="todo-check1"> <label for="todo-check1"></label>
								</div>
								<p class="todo-title">Add fees details in system</p>
								<div class="todo-actionlist pull-right clearfix">
									<a href="#" class="todo-remove"> <i class="fa fa-times"></i>
									</a>
								</div>
							</li>
							<li class="clearfix">
								<div class="todo-check pull-left">
									<input type="checkbox" value="None" id="todo-check2"> <label for="todo-check2"></label>
								</div>
								<p class="todo-title">Announcement for holiday</p>
								<div class="todo-actionlist pull-right clearfix">
									<a href="#" class="todo-remove"> <i class="fa fa-times"></i>
									</a>
								</div>
							</li>
							<li class="clearfix">
								<div class="todo-check pull-left">
									<input type="checkbox" value="None" id="todo-check3"> <label for="todo-check3"></label>
								</div>
								<p class="todo-title">call bus driver</p>
								<div class="todo-actionlist pull-right clearfix">
									<a href="#" class="todo-remove"> <i class="fa fa-times"></i>
									</a>
								</div>
							</li>
							<li class="clearfix">
								<div class="todo-check pull-left">
									<input type="checkbox" value="None" id="todo-check4"> <label for="todo-check4"></label>
								</div>
								<p class="todo-title">School picnic</p>
								<div class="todo-actionlist pull-right clearfix">
									<a href="#" class="todo-remove"> <i class="fa fa-times"></i>
									</a>
								</div>
							</li>
							<li class="clearfix">
								<div class="todo-check pull-left">
									<input type="checkbox" value="None" id="todo-check5"> <label for="todo-check5"></label>
								</div>
								<p class="todo-title">Exam time table generate</p>
								<div class="todo-actionlist pull-right clearfix">
									<a href="#" class="todo-remove"> <i class="fa fa-times"></i>
									</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div> --%>
	</div>
</div>

<script>
$(document).ready(function() {
   $($.fn.dataTable.tables(true)).DataTable()
      .columns.adjust();
});
</script>