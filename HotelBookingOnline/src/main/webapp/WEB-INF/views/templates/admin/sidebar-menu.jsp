<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources/admin" />
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<security:authentication var="principal" property="principal" />
<security:authentication var="role" property="principal.authorities" />
<div class="sidebar-container">
	<div class="sidemenu-container navbar-collapse collapse fixed-menu">
		<div id="remove-scroll">
			<ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
				<li class="sidebar-toggler-wrapper hide">
					<div class="sidebar-toggler">
						<span></span>
					</div>
				</li>
				<li class="sidebar-user-panel">
					<div class="user-panel">
						<div class="row">
							<div class="sidebar-userpic">
								<img style="height: 75px;" src="<c:url value="/resources/upload/staff-image/${principal.id}/${principal.picture}"/>" class="img-responsive"
									alt="">
							</div>
						</div>
						<div class="profile-usertitle">
							<div class="sidebar-userpic-name">${principal.name}</div>
							<div class="profile-usertitle-job">${principal.position}</div>
						</div>
						<div class="sidebar-userpic-btn">
							<a class="tooltips" href="/admin/staff/${principal.id}" data-placement="top" data-original-title="Profile"> 
								<i class="material-icons">person_outline</i>
							</a> 
							<a class="tooltips" href="#" data-placement="top" data-original-title="Mail"> 
								<i class="material-icons">mail_outline</i>
							</a> 
							<a class="tooltips" href="#" data-placement="top" data-original-title="Chat"> 
								<i class="material-icons">chat</i>
							</a> 
							<a class="tooltips" href="/admin/process-logout" data-placement="top" data-original-title="Logout"> 
								<i class="material-icons">input</i>
							</a>
						</div>
					</div>
				</li>
				<li class="menu-heading"><span>-- Main</span></li>
				<li class="nav-item ${fn:indexOf(url, 'dashboard') > -1 ? ' active':''}"><a href="<c:url value="/admin/dashboard"/>"
					class="nav-link nav-toggle"> <i class="material-icons">dashboard</i> <span class="title">Dashboard</span>
				</a></li>
				<li class="nav-item ${fn:indexOf(url, 'user') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i class="material-icons">person_add</i>
						<span class="title">Users</span> <span class="arrow ${fn:indexOf(url, 'user') > -1 ? ' open':''}"></span>
				</a>
					<ul class="sub-menu">
						<li class="nav-item ${fn:indexOf(url, 'user/create') > -1 ? ' active':''}"><a href="<c:url value="/admin/user/create"/>" class="nav-link ">
								<span class="title">Add User</span>
						</a></li>
						<li class="nav-item ${isUser ? ' active':''}"><a href="<c:url value="/admin/user"/>" class="nav-link "> <span class="title">View
									All Users</span>
						</a></li>
					</ul></li>
				<li class="nav-item ${fn:indexOf(url, '/guest') > -1 ? ' active':''}"><a href="<c:url value="/admin/guest"/>" class="nav-link nav-toggle"> <i class="material-icons">contacts</i>
						<span class="title">Guest In Room</span> <%-- <span class="arrow ${fn:indexOf(url, '/guest') > -1 ? ' open':''}"></span> --%>
				</a>
					<%-- <ul class="sub-menu">
						<li class="nav-item ${isGuest ? ' active':''}"><a href="<c:url value="/admin/guest"/>" class="nav-link "> <span class="title">View
									All Guest</span>
						</a></li>
					</ul></li> --%>
				<li class="nav-item ${fn:indexOf(url, 'booking') > -1 ? ' active':''}"><a href="<c:url value="/admin/booking"/>" class="nav-link nav-toggle"> <i class="material-icons">business_center</i>
						<span class="title">Booking</span> <%-- <span class="arrow ${fn:indexOf(url, 'booking') > -1 ? ' open':''}"></span> --%>
				</a>
					<%-- <ul class="sub-menu">
						<li class="nav-item ${fn:indexOf(url, 'booking/create') > -1 ? ' active':''}"><a href="<c:url value="/admin/booking/create"/>"
							class="nav-link "> <span class="title">New Booking</span>
						</a></li>
						<li class="nav-item ${isBooking ? ' active':''}"><a href="<c:url value="/admin/booking"/>" class="nav-link "> <span class="title">View
									Booking</span>
						</a></li>
					</ul></li> --%>
				</li>
				<li class="nav-item ${fn:indexOf(url, 'report') > -1 ? ' active':''}">
					<a href="#" class="nav-link nav-toggle"> 
						<i class="material-icons">local_hotel</i> 
						<span class="title">Reports</span> 
						<span class="arrow ${fn:indexOf(url, 'report') > -1 ? ' open':''}"></span>
					</a>
					<ul class="sub-menu">
						<%-- <li class="nav-item ${fn:indexOf(url, 'booking-report') > -1 ? ' active':''}"><a href="<c:url value="/admin/booking-report"/>"
							class="nav-link "> <span class="title">Booking Report</span>
						</a></li> --%>
						<li class="nav-item ${fn:indexOf(url, 'revenue-report') > -1 ? ' active':''}"><a href="<c:url value="/admin/revenue-report"/>"
							class="nav-link "> <span class="title">Revenue Report</span>
						</a></li>
						<li class="nav-item ${fn:indexOf(url, 'room-report') > -1 ? ' active':''}"><a href="<c:url value="/admin/room-report"/>"
							class="nav-link "> <span class="title">Room Report</span>
						</a></li>
					</ul>
				</li>
				<security:authorize access="hasRole('ADMIN')">
					<li class="nav-item ${fn:indexOf(url, 'room-type') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i
							class="material-icons">local_hotel</i> <span class="title">Room Types</span> <span
							class="arrow ${fn:indexOf(url, 'room-type') > -1 ? ' open':''}"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item ${fn:indexOf(url, 'room-type/create') > -1 ? ' active':''}"><a href="<c:url value="/admin/room-type/create"/>"
								class="nav-link "> <span class="title">Add Room Type</span>
							</a></li>
							<li class="nav-item ${isRoomType ? ' active':''}"><a href="<c:url value="/admin/room-type"/>" class="nav-link "> <span class="title">View
										All Room Types</span>
							</a></li>
						</ul>
					</li>
					<li class="nav-item ${fn:indexOf(url, 'rooms') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i class="material-icons">vpn_key</i>
							<span class="title">Rooms</span> <span class="arrow ${fn:indexOf(url, 'rooms') > -1 ? ' open':''}"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item ${fn:indexOf(url, 'rooms/create') > -1 ? ' active':''}"><a href="<c:url value="/admin/rooms/create"/>"
								class="nav-link "> <span class="title">Add Room</span>
							</a></li>
							<li class="nav-item ${isRoom ? ' active':''}"><a href="<c:url value="/admin/rooms"/>" class="nav-link "> <span class="title">View
										All Rooms</span>
							</a></li>
						</ul></li>
					<li class="nav-item ${fn:indexOf(url, 'service') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i
							class="material-icons">card_travel</i> <span class="title">Service</span> <span class="arrow ${fn:indexOf(url, 'service') > -1 ? ' open':''}"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item ${fn:indexOf(url, 'service/create') > -1 ? ' active':''}"><a href="<c:url value="/admin/service/create"/>"
								class="nav-link "> <span class="title">Add Service</span>
							</a></li>
							<li class="nav-item ${isService ? ' active':''}"><a href="<c:url value="/admin/service"/>" class="nav-link "> <span class="title">View
										All Services</span>
							</a></li>
						</ul></li>
					<li class="nav-item ${fn:indexOf(url, 'staff') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i class="material-icons">group</i>
							<span class="title">Staff</span> <span class="arrow ${fn:indexOf(url, 'staff') > -1 ? ' open':''}"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item ${fn:indexOf(url, 'staff/create') > -1 ? ' active':''}"><a href="<c:url value="/admin/staff/create"/>"
								class="nav-link "> <span class="title">Add Staff</span>
							</a></li>
							<li class="nav-item ${isStaff	 ? ' active':''}"><a href="<c:url value="/admin/staff"/>" class="nav-link "> <span class="title">View
										All Staffs</span>
							</a></li>
						</ul></li>
					<%-- <li class="nav-item ${fn:indexOf(url, 'payment') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i
							class="material-icons">credit_card</i> <span class="title">Payment</span> <span class="arrow ${fn:indexOf(url, 'payment') > -1 ? ' active':''}"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item"><a href="all_staffs.html" class="nav-link "> <span class="title">Payment Logs</span>
							</a></li>
						</ul></li> --%>
					<li class="nav-item ${fn:indexOf(url, 'promotion') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i
							class="material-icons">redeem</i> <span class="title">Promotion</span> <span class="arrow ${fn:indexOf(url, 'promotion') > -1 ? ' open':''}"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item ${fn:indexOf(url, 'promotion/create') > -1 ? ' active':''}"><a href="/admin/promotion/create" class="nav-link "> <span
									class="title">Add Promotion</span>
							</a></li>
							<li class="nav-item ${isPromo ? ' active':''}"><a href="/admin/promotion" class="nav-link "> <span class="title">View All
										Promotions</span>
							</a></li>
						</ul></li>
					<li class="nav-item ${fn:indexOf(url, 'creditcard') > -1 ? ' active':''}"><a href="#" class="nav-link nav-toggle"> <i
							class="material-icons">credit_card</i> <span class="title">CreditCard</span> <span class="arrow ${fn:indexOf(url, 'creditcard') > -1 ? ' open':''}"></span>
					</a>
						<ul class="sub-menu">
							<li class="nav-item ${fn:indexOf(url, 'creditcard/create') > -1 ? ' active':''}"><a href="/admin/creditcard/create" class="nav-link "> <span
									class="title">Add CreditCard</span>
							</a></li>
							<li class="nav-item ${isCard ? ' active':''}"><a href="/admin/creditcard" class="nav-link "> <span class="title">View All
										CreditCard</span>
							</a></li>
						</ul></li>
				</security:authorize>
			</ul>
		</div>
	</div>
</div>

<!-- <script>
$('li.nav-item > a.nav-link > ul.sub-menu > li > a').click(function(e){
    e.preventDefault();
    $(this).prepend('<span class="selected"></span>');
    $(this).parent().addClass('active').siblings().find("span.selected").remove;
});
</script> -->