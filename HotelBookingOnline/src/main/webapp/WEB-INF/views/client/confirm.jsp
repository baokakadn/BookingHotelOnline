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
							<h2 class="page_title white-text">Confirm</h2>
							<ul class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">Book Now</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">Checkout</a>
								</li>
								<li class="breadcrumb-item active">Confirm</li>
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
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-success">
					<i class="fa fa-info-circle m-r-7"></i>
					Thank you! Your booking has been placed. We will contact you to confirm about the booking soon.
				</div>
			</div>
		</div>
		<div class="row conform-yemm_content">
			<div class="col-12">
				<h4 class="form_title4">Booking Information:-</h4>
			</div>
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-9 col-md-12 conform-yemm-detail">
						<div class="row">
							<div class="conform-hotel_pic col-lg-4 col-md-4 ">
								<img src="${resources}/assets/images/conform_hotelpic.jpg" class="img-fluid" alt="">
							</div>
							<div class="col-lg-8 col-md-8 confortion_dic">
								<h5>${booking.roomtype.typename }</h5>
								<p class="clearfix">
									<span class="float-left">${booking.numberOfRooms} Room for ${nights} Nights</span>
									<span class="green_text1 float-right">Id: ${booking.bookinguid }</span>
								</p>
								<div class="conform_date clear">
									<ul class="d-flex justify-content-between align-items-center">
										<li>
											<fmt:setLocale value="en_US" scope="session"/>
											<strong>Check-In</strong>
											<p><fmt:formatDate value="${booking.checkInDate}" pattern="MMM dd yyyy" /></p>
											<span><fmt:formatDate value="${booking.checkInDate}" pattern="E" />, 13 pm</span>
										</li>
										<li class="text-center">
											<span>
												<i class="fa fa-clock-o d-block"></i>
												${nights} nights
											</span>
										</li>
										<li>
											<strong>Check-Out</strong>
											<p><fmt:formatDate value="${booking.checkOutDate}" pattern="MMM dd yyyy" /></p>
											<span><fmt:formatDate value="${booking.checkOutDate}" pattern="E" />, 12 pm</span>
										</li>
									</ul>
								</div>
								<p class="getsts_cont">
									<strong>Guests</strong>
									<span>${booking.adult} Adult</span>
									<span> ${booking.children} Children</span>
								</p>
							</div>
						</div>
						<div class="conform_more_dic">
							<h5>Customer information :-</h5>
							<ul class="d-inline-block m-b15">
								<li>
									<strong>Full Name:</strong>
									${booking.user.name}
								</li>
								<li>
									<strong>Phone:</strong>
									${booking.user.phone}
								</li>
								<li>
									<strong>Address:</strong>
									${booking.user.address}
								</li>
								<li>
									<strong>Email:</strong>
									${booking.user.email}
								</li>
							</ul>
							<p>
								<strong class="d-block">Request:</strong>
								Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since
								the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
							</p>
						</div>

					</div>
					<div class="col-lg-3 col-md-12">
						<div class="payment_receipt">
							<div class="receipt_widgets">
								<h6>Payment Receipt</h6>
								<img src="${resources}/assets/images/payment_card.png" alt="">
							</div>
							<div class="receipt_widgets">
								<h6>Credit Card</h6>
								<strong>${card}</strong>
							</div>
							<div class="receipt_widgets">
								<h6>Total Charge</h6>
								<strong>$${grandTotal}</strong>
							</div>
							<div class="receipt_widgets rate_breakup">
								<h6>Rate Breakup</h6>
								<ul>
									<li>
										Room rate:
										<strong>$${booking.roomtype.price}</strong>
									</li>
									<c:set var="subTotal" value="${booking.roomtype.price * booking.numberOfRooms * nights}"/>
									<li>
										Tax:
										<strong>$${subTotal * 0.1}</strong>
									</li>
									<li>
										Discount:
										<strong>$${empty booking.promotion ? '0' : 
														booking.promotion.type == 'PERCENTAGE' ? (subTotal * booking.promotion.value)/100 : 
														booking.promotion.value}</strong>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>