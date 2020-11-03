<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<!-- inner_window_banner Start bg -->
<section>
	<div class="inner_window_banner" data-parallax="scroll" data-image-src="${resources}/assets/images/inner_banner1.jpg">
		<div class="inner_window_overlay">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb_parent text-center">
							<h2 class="page_title white-text">Search</h2>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Search</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- inner_window_banner End bg -->
<section class="padding_75 conform-warpper">
	<div class="container">
		<c:choose>
			<c:when test="${empty booking}">
				<div class="row">
					<div class="col-lg-12" style="text-align: center;">
						<img alt="" src="https://cdn6.agoda.net/images/MMB-855/default/illustration-property.png">
						<h1 class="mmb-blc-title">Opps ! No booking found !</h1>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row conform-yemm_content">
					<div class="col-12">
						<h4 class="form_title4">Booking Information:-</h4>
					</div>
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-9 col-md-12 conform-yemm-detail">
								<div class="row">
									<div class="conform-hotel_pic col-lg-4 col-md-4 ">
										<img src="${resources}/upload/room-type-image/${booking.roomtype.roomtypeid}/${booking.roomtype.image}" class="img-fluid" alt="">
									</div>
									<div class="col-lg-8 col-md-8 confortion_dic">
										<h5>${booking.roomtype.typename }</h5>
										<p class="clearfix">
											<span class="float-left">${booking.numberOfRooms} Room for ${nights} Nights</span>
											<c:if test="${booking.status eq 'CANCEL'}">
												<fmt:formatDate var="cancelDate" value="${booking.cancelDate}" pattern="MMM dd yyyy" />
												<span class="gray_text2" style="text-align: right; display: block; color: #f00; font-size: 14px;"> Cancel Date: <strong>${cancelDate}</strong></span>
											</c:if>
											<span class="green_text1 float-right">Id: ${booking.bookinguid }</span>
										</p>
										<div class="conform_date clear">
											<ul class="d-flex justify-content-between align-items-center">
												<li><fmt:setLocale value="en_US" scope="session" /> <strong>Check-In</strong>
													<p>
														<fmt:formatDate value="${booking.checkInDate}" pattern="MMMM dd" />
													</p> <span><fmt:formatDate value="${booking.checkInDate}" pattern="E" />, 13 pm</span></li>
												<li class="text-center"><span> <i class="fa fa-clock-o d-block"></i> ${nights} nights
												</span></li>
												<li><strong>Check-In</strong>
													<p>
														<fmt:formatDate value="${booking.checkOutDate}" pattern="MMMM dd" />
													</p> <span><fmt:formatDate value="${booking.checkOutDate}" pattern="E" />, 12 pm</span></li>
											</ul>
										</div>
										<p class="getsts_cont">
											<strong>Guests</strong> 
											<span>${booking.adult} Adult</span> 
											<span> ${booking.children} Children</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-12">
								<div class="payment_receipt">
									<div class="receipt_widgets">
										<h6>Total Charge</h6>
										<strong>$${grandTotal}</strong>
									</div>
									<div class="receipt_widgets rate_breakup">
										<h6>Rate Breakup</h6>
										<ul>
											<li>Room rate: <strong>$${booking.roomtype.price}</strong>
											</li>
											<c:set var="subTotal" value="${booking.roomtype.price * booking.numberOfRooms * nights}" />
											<li>Tax: <strong>$${subTotal * 0.1}</strong>
											</li>
											<li>Discount: <strong>$${empty booking.promotion ? '0' : booking.promotion.type == 'PERCENTAGE' ? (subTotal *
													booking.promotion.value)/100 : booking.promotion.value}</strong>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</section>