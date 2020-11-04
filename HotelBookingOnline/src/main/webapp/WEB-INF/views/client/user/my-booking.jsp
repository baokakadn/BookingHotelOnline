<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<fmt:setLocale value="en_US" scope="session" />
<!-- Order History strat Here -->
<section class="p-45 my_history_main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4 class="dashboard-title">My History</h4>
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
					<div class="row listing_widgets">
						<div class="col-lg-3 col-md-4">
							<div class="img_modul_blog rel_position">
								<img style="height: 188px; width: 255px;" src="${resources}/upload/room-type-image/${booking.roomtype.roomtypeid}/${booking.roomtype.image}"
									class="img-fluid" alt="">
								<ul class="faclities_modual">
									<li><img src="${resources}/assets/images/gray_car_icon.png" alt=""> <span class="d-block">Car Parking</span></li>
									<li><img src="${resources}/assets/images/swmming_gray_icon.png" alt=""> <span class="d-block">Swimming</span></li>
									<li><img src="${resources}/assets/images/fitness_gray_icon.png" alt=""> <span class="d-block">Fitness</span></li>
									<li><img src="${resources}/assets/images/spa_gray_icon.png" alt=""> <span class="d-block">Spa & Massage</span></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-7 col-md-5 listing-detail_modaul">
							<h4>${booking.roomtype.typename }</h4>
							<div class="row">
								<div class="col-lg-7 col-md-7 col-sm-7">
									<span class="widget_ratting"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</span>
								</div>
								<div class="col-lg-5 col-md-5 col-sm-5">
									<fmt:parseDate value="${booking.bookingDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
									<fmt:formatDate value="${parsedDate}" var="bookingDate" type="both" pattern="yyyy-MM-dd HH:mm" />
									<span class="book_date_class"> Booking Date: <strong>${bookingDate}</strong>
									</span> <a href="#" class="pay_respit"> See Your payment Detail
										<div class="costom-tooltip">
											<div class="payment_receipt clearfix">
												<div class="row m-0">
													<div class="col-lg-6 col-md-6 p-0">
														<div class="receipt_widgets">
															<h6>Transaction Id</h6>
															<strong>Id: ${booking.invoices[0].invoiceId }</strong>
														</div>
														<div class="receipt_widgets">
															<h6>Payment Mode</h6>
															<img src="${resources}/assets/images/payment_card.png" alt="">
															<h6 class="mt-2">Credit Card</h6>
															<strong>${booking.invoices[0].creditcard.cardNumber }</strong>
														</div>
													</div>
													<div class="col-lg-6 col-md-6 p-0">
														<div class="receipt_widgets">
															<h6>Total Charge</h6>
															<strong>$${booking.invoices[0].amount}</strong>
														</div>
														<div class="receipt_widgets rate_breakup">
															<h6>Rate Breakup</h6>
															<ul>
																<li>Room rate: <strong>$${booking.roomtype.price}</strong>
																</li>
																<c:set var="nights" value="${(booking.checkOutDate.time - booking.checkInDate.time)/(60*60*24*1000)}"/>
																<c:set var="subTotal" value="${booking.roomtype.price * booking.numberOfRooms * nights}"/>
																<li>Tax: <strong>$${subTotal * 0.1}</strong>
																</li>
																<c:set var="discount"
																	value="${empty booking.promotion ? '0' : 
																							booking.promotion.type == 'PERCENTAGE' ? (subTotal * booking.promotion.value)/100 : 
																							booking.promotion.value}" />
																<li>Discount: <strong>$${discount}</strong>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
							<div></div>
							<div class="conform_date">
								<ul class="d-flex justify-content-between align-items-center">
									<li><strong>Check-In</strong>
										<fmt:formatDate var="checkinDate1" value="${booking.checkInDate}" pattern="MMM dd yyyy" />
										<fmt:formatDate var="checkinDate2" value="${booking.checkInDate}" pattern="E" />
										<p>${checkinDate1}</p> 
										<span>${checkinDate2}, 13 pm</span>
									</li>
									<li class="text-center">
										<c:set var="nights" value="${(booking.checkOutDate.time - booking.checkInDate.time)/(60*60*24*1000)}"/>
										<span> <i class="fa fa-clock-o d-block"></i> <fmt:formatNumber value="${nights}" pattern="#" /> nights</span>
									</li>
									<li><strong>Check-Out</strong>
										<fmt:formatDate var="checkoutDate1" value="${booking.checkOutDate}" pattern="MMM dd yyyy" />
										<fmt:formatDate var="checkoutDate2" value="${booking.checkOutDate}" pattern="E" />
										<p>${checkoutDate1}</p> 
										<span>${checkoutDate2}, 12 pm</span>
									</li>
									<li>
										<strong class="d-block">Guests</strong> 
										<span class="m-r-7">${booking.adult } Adult</span> 
										<span>${booking.children} Children</span>
									</li>
								</ul>
							</div>
						</div>
						<jsp:useBean id="now" class="java.util.Date" />
						<c:choose>
							<c:when test="${booking.status eq 'ONLINE_PENDING'}">
								<div class="col-lg-2 col-md-3">
									<div class="price_modual_sec">
										<strong>$${booking.roomtype.price }</strong> <a href="#" class="btn btn-danger" data-toggle="modal" data-target="#cancel-booking">Cancel</a>
									</div>
									<div class="modal fade" id="cancel-booking">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">Cancel Booking</h4>
													<button type="button" class="close" data-dismiss="modal">
														<i class="fa fa-times"></i>
													</button>
												</div>
												<!-- Modal body -->
												<form action="cancel-booking" method="POST">
													<div class="modal-body">
														<label class="font18">Reason for cancelation (option)</label>
														<div class="select_cart_down">
															<select class="form-control large_fild select_height48">
																<option>Select Cancelation Reason</option>
																<option>Change of Plan</option>
																<option>Generic Cancel Rule</option>
																<option>Local Competition Preferred</option>
																<option>Other Destination Preferred</option>
																<option>Convenition Cancelled</option>
																<option>Duplicate Booking</option>
																<option>Flight Cancelled</option>
																<option>Group Cancelled</option>
																<option>Death in Family</option>
															</select>
														</div>
														<div class="mt-4">
															<textarea placeholder="Other Reason" class="form-control textaria_height"></textarea>
														</div>
													</div>
													<!-- Modal footer -->
													<input type="hidden" name="bookingId" value="${booking.bookingId}">
													<div class="modal-footer text-right border-0">
														<input type="submit" value="Cancel" class="btn btn-success">
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-lg-2 col-md-3">
									<div class="price_modual_sec">
										<strong>$${booking.roomtype.price }</strong> <small>PER NIGHT</small>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</div>
</section>
<!-- Order History End Here -->