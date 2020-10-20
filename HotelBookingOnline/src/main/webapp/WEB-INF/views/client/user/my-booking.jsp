<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<!-- Order History strat Here -->
<section class="p-45 my_history_main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4 class="dashboard-title">My History</h4>
			</div>
		</div>
		<c:forEach var="booking" items="${user.bookings}">
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
							<span class="book_date_class"> Booking Date: <strong>${parsedDate}</strong>
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
														<li>Room rate: <strong>$45, 152</strong>
														</li>
														<li>Tax: <strong>$1500</strong>
														</li>
														<li>Discount: <strong>$-15</strong>
														</li>
														<li>Paid earlier: <strong>$100</strong>
														</li>
														<li>Total: <strong>$45, 152</strong>
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
								<p>March 01</p> <span>Fir, 12 pm</span></li>
							<li class="text-center"><span> <i class="fa fa-clock-o d-block"></i> 2 nights
							</span></li>
							<li><strong>Check-In</strong>
								<p>March 04</p> <span>Mon, 12 pm</span></li>
							<li><strong class="d-block">Guests</strong> <span class="m-r-7">1 Adult</span> <span>2 Children</span></li>
						</ul>
					</div>
				</div>
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
								<div class="modal-footer text-right border-0">
									<input type="submit" value="Cancel" class="btn btn-success">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>
<!-- Order History End Here -->