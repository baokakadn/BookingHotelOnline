<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<!-- inner_window_banner Start bg -->
<tg:breadcrumb title1="Book Now" title2="Book Now" />
<!-- inner_window_banner End bg -->
<section class="padding_75">
	<div class="container">
		<div class="row">
			<div class="col-12 reserv_detail_contant">
				<h4 class="form_title4">Your Reservation :-</h4>
				<div class="row reservation_blog">
					<div class="col-lg-8 col-md-12 p-0">
						<div class="row yemm_res_left">
							<div class="col-lg-4 col-md-4 col-sm-4">
								<img src="${resources}/upload/room-type-image/${booking.roomtype.roomtypeid}/${booking.roomtype.image}" class="img-fluid" alt="">
							</div>
							<div class="col-lg-8 col-md-8 col-sm-8 booking_hotel_dic">
								<h5>FabHotel All Season Calangute Beach</h5>
								<ul class="list-inline item-ratting">
									<li><a href="#"> <i class="fa fa-star fa-2x"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star fa-2x"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star fa-2x"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star-o fa-2x"></i>
									</a></li>
									<li><a href="#"> <i class="fa fa-star-o fa-2x"></i>
									</a></li>
								</ul>
								<p>
									<strong>Address:</strong> 235 W 46th St, New York, NY 10036, USA
								</p>
								<h6>Deluxe Room</h6>
								<span class="green_text">Your stay includes:</span>
								<ul class="room_facilities">
									<li><i class="fa fa-check"></i> Breakfast</li>
									<li><i class="fa fa-check"></i> Wi-fi</li>
									<li><i class="fa fa-check"></i> Taxes</li>
									<li><i class="fa fa-check"></i> Mandatoty Gala Dinner X-Max & New Year Eve payable at Hotel.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 p-0 check_in_detail">
						<div class="check_in_time">
							<strong>Check-In</strong>
							<p>
								<fmt:setLocale value="en_US" scope="session" />
								<i class="fa fa-calendar"></i>
								<fmt:formatDate value="${booking.checkInDate}" pattern="E MMMM dd-yyyy" />
							</p>
							<p>
								<i class="fa fa-clock-o"></i> 13:00 PM
							</p>
						</div>
						<div class="check_in_time">
							<strong>Check-Out</strong>
							<p>
								<i class="fa fa-calendar"></i>
								<fmt:formatDate value="${booking.checkOutDate}" pattern="E MMMM dd-yyyy" />
							</p>
							<p>
								<i class="fa fa-clock-o"></i> 12:00 AM
							</p>
						</div>
						<p class="day_stuts clear">
							<span> <i class="fa fa-bed"></i> <c:set var="numberOfNights"
									value="${(booking.checkOutDate.time - booking.checkInDate.time)/(60*60*24*1000)}" /> <fmt:formatNumber value="${numberOfNights}" pattern="#" />
								Nights
							</span> <a href="">Booking & Cancellation Policy</a>
						</p>
						<div class="i_have_promo justify-content-between d-flex">
							<form action="addPromo" method="POST">
								<label class="custom-control custom-radio m-0"> <input id="radio1" name="radio" type="checkbox" class="custom-control-input"
									onchange="Checked(this)"> <span class="custom-control-indicator"></span> <span class="custom-control-description">I have
										promocode.</span>
								</label> <input name="promoCode" id="code" type="text" class="promo_fild" readonly="readonly" />
								<button type="submit" class="btn btn-success">Apply</button>
							</form>
						</div>
						<c:if test="${not empty promoErr}">
							<p style="color: red; text-align: center;">
								Error:
								<c:out value="${promoErr}" />
							</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="light_grayBG padding_75">
	<div class="container">
		<div class="row bookin_detail_tabel">
			<div class="col-12">
				<h4 class="form_title4">Booking :-</h4>
				<table class="table m-0">
					<thead>
						<tr>
							<th scope="col">Room Type</th>
							<th scope="col">Capacity</th>
							<th scope="col">Children</th>
							<th scope="col">Quantity</th>
							<th scope="col">Check - in</th>
							<th scope="col">Check - out</th>
							<th scope="col">Night</th>
							<th scope="col">Gross Total</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${booking.roomtype.typename}</td>
							<td>${booking.adult} Adult</td>
							<td>${booking.children} Children</td>
							<td>${booking.adult + booking.children} Person</td>
							<fmt:setLocale value="en_US" scope="session" />
							<td>
									<fmt:formatDate value="${booking.checkInDate}" pattern="EEEE MMMM dd-yyyy" />
							</td>
							<td>
									<fmt:formatDate value="${booking.checkOutDate}" pattern="EEEE MMMM dd-yyyy" />
							</td>
							<td style="text-align: center;"><fmt:formatNumber value="${numberOfNights}" pattern="#" /></td>
							<td style="text-align: right;">$${booking.roomtype.price * booking.numberOfRooms * numberOfNights}</td>
						</tr>
						<tr>
							<td colspan="7">Sub Total</td>
							<c:set var="subTotal" value="${booking.roomtype.price * booking.numberOfRooms * numberOfNights}" />
							<td style="text-align: right;"><strong>$${subTotal}</strong></td>
						</tr>
						<tr>
							<td colspan="7">Tax (10%)</td>
							<td style="text-align: right;">$${subTotal * 0.1 }</td>
						</tr>
						<tr>
							<td colspan="7">Discount (You Save)</td>
							<c:set var="discount"
								value="${empty booking.promotion ? '0' : 
														booking.promotion.type == 'PERCENTAGE' ? (subTotal * booking.promotion.value)/100 : 
														booking.promotion.value}" />
							<td style="text-align: right;">$${discount}</td>
						</tr>
						<tr>
							<td colspan="7"><strong>Grand Total</strong></td>
							<td style="text-align: right;"><strong>$${subTotal - discount + (subTotal * 0.1)}</strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
<section class="padding_75">
	<div class="container">
		<form:form action="/checkout" method="POST" modelAttribute="user">
			<form:hidden path="userId"/>
			<input type="hidden" name="grandTotal" value="${subTotal - discount + (subTotal * 0.1)}">
			<div class="row">
				<div class="col-lg-9 col-md-9">
					<h4 class="form_title4">Add Your Informations :-</h4>
					<div class="form-group col-lg-6 col-md-6">
						<form:input path="name" type="text" class="form-control" placeholder="Full Name*" required="true"/>
					</div>
					<div class="form-group col-lg-6 col-md-6">
						<form:input path="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" type="email" class="form-control" placeholder="Email*" required="true"/>
					</div>
					<div class="form-group col-lg-6 col-md-6">
						<form:input path="phone" type="text" class="form-control" placeholder="Phone*" required="true"/>
					</div>
					<div class="form-group col-lg-12">
						<form:textarea path="address" placeholder="Address*" class="form-control textaria_height"></form:textarea>
					</div>
					<div class="col-lg-6 col-md-8 col-sm-6">
						<label class="custom-control custom-checkbox"> <input type="checkbox" class="custom-control-input" required="required"> <span
							class="custom-control-indicator"></span> <span class="custom-control-description"> I agree with <strong>Terms and Conditions</strong>
						</span>
						</label>
					</div>
					<form:hidden path="status" value="1" />
					<div class="col-lg-6 col-md-4 col-sm-6 text-right">
						<input type="submit" value="Submit" class="btn btn-success">
					</div>

				</div>
				<div class="col-lg-3 col-md-3 more-google-Ads">
					<a href="#"> <img src="${resources}/assets/images/add_img2.png" class="img-fluid" alt="">
					</a>
				</div>
			</div>
		</form:form>
	</div>
</section>

<script>
	function Checked(chk) {
		var txt = document.getElementById("code");

		if (chk.checked == true) {
			txt.readOnly = false;
		} else {
			txt.readOnly = true;
		}
	}
</script>