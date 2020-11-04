<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<fmt:setLocale value="en_US" scope="session" />
<!-- Wishlist strat Here -->
<section class="p-45 Wishlist-contant">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4 class="dashboard-title">Cancelled Booking</h4>
			</div>
		</div>
		<c:choose>
			<c:when test="${empty bookings}">
				<hr>
				<div class="row">
					<div class="col-lg-12" style="text-align: center;">
						<img alt="" src="https://cdn6.agoda.net/images/MMB-855/default/illustration-property.png">
						<h1 class="mmb-blc-title">You have no bookings here.</h1>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="booking" items="${bookings}">
					<div class="row listing_widgets rel_position">
						<div class="col-lg-3 col-md-4">
							<div class="img_modul_blog rel_position">
								<img style="height: 188px; width: 255px;" src="${resources}/upload/room-type-image/${booking.roomtype.roomtypeid}/${booking.roomtype.image}"
									class="img-fluid" alt="">
							</div>
						</div>
						<div class="col-lg-7 col-md-6 listing-detail_modaul cancil_listing_detail_modaul">
							<h4>${booking.roomtype.typename }</h4>
							<div class="clearfix">
								<p class="float-left">
									<fmt:parseDate value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
									<fmt:formatDate value="${parsedDate}" var="bookingDate" type="both" pattern="yyyy-MM-dd HH:mm" />
									<span class="book_date_class"> Booking Date: <strong>${bookingDate}</strong></span>
								</p>
								<fmt:formatDate var="cancelDate" value="${booking.cancelDate}" pattern="MMM dd yyyy" />
								<span class="gray_text2"> Cancel Date: <strong>${cancelDate}</strong>
								</span> <span class="green_text1 float-right">Id: ${booking.bookinguid}</span>
							</div>
							<div class="conform_date clear">
								<ul class="d-flex justify-content-between align-items-center">
									<li><strong>Check-In</strong>
										<fmt:formatDate var="checkinDate1" value="${booking.checkInDate}" pattern="MMM dd yyyy" />
										<fmt:formatDate var="checkinDate2" value="${booking.checkInDate}" pattern="E" />
										<p>${checkinDate1}</p> 
										<span>${checkinDate2}, 13 pm</span>
									</li>
									<c:set var="nights" value="${(booking.checkOutDate.time - booking.checkInDate.time)/(60*60*24*1000)}"/>
									<li class="text-center"><span> <i class="fa fa-clock-o d-block"></i> <fmt:formatNumber value="${nights}" pattern="#" /> nights
									</span></li>
									<li><strong>Check-Out</strong>
										<fmt:formatDate var="checkoutDate1" value="${booking.checkOutDate}" pattern="MMMM dd yyyy" />
										<fmt:formatDate var="checkoutDate2" value="${booking.checkOutDate}" pattern="E" />
										<p>${checkoutDate1}</p> 
										<span>${checkoutDate2}, 12 pm</span>
									</li>
								</ul>
							</div>
							<hr>
							<p class="getsts_cont">
								<strong style="color: black;">Guests</strong> 
								<span>${booking.adult } Adult</span> 
								<span> ${booking.children} Children</span>
							</p>
						</div>
						<div class="col-lg-2 col-md-2">
							<div class="price_modual_sec">
								<strong>$${booking.roomtype.price}</strong> 
								<small>PER NIGHT</small>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</section>
<!-- Order History End Here -->