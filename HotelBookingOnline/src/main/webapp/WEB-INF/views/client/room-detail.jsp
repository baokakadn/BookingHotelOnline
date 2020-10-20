<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
							<h2 class="page_title white-text">Room Details</h2>
							<ul class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">Rooms</a>
								</li>
								<li class="breadcrumb-item active">Anchorage to Santiago</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- inner_window_banner End bg -->
<!-- Hotel Detail-1 Warpper Start -->
<section class="padding_75">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="hotel-detail_slider1">
					<div class="hotel_title clearfix">
						<h3 class="float-left m-0">${roomType.typename}</h3>
					</div>
					<!-- Productes Detail Slider 1 Start-->
					<div class="product_detail_slider1">
						<div id="detail_slider2" class="flexslider">
							<ul class="slides">
								<c:forEach var="img" items="${roomType.roomstypeimages}">
									<li>
										<img style="width: 825px; height: 550px;" src="${resources}/upload/room-type-image/${roomType.roomtypeid}/${img.image}" alt="image">
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- Productes Detail Thumb -->
						<div id="detail_carousel2" class="flexslider">
							<ul class="slides">
								<c:forEach var="img" items="${roomType.roomstypeimages}">
									<li>
										<img style="width: 140px; height: 140px;" src="${resources}/upload/room-type-image/${roomType.roomtypeid}/${img.image}" alt="image">
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- Productes Detail Thumb -->
					</div>
					<!-- Productes Detail Slider 2 -->
				</div>
			</div>
			<!-- Hotel Detail-1 Slider End -->
			<div class="col-lg-3 col-md-12">
				<div class="booking_detail_form">
					<div class="yemm_top_price">
						<strong>$${roomType.price}</strong>
						<p>Per Night</p>
					</div>
					<form:form action="${roomType.roomtypeid}/search" method="POST" class="booking_form1" modelAttribute="booking">
						<h4 class="form_title">Booking</h4>
						<div class="form-group rel_position">
							<form:input path="checkInDate" id="check-in" name="arrival" placeholder="Check In" type="text" class="fancy_fild form-control" readonly="true" />
							<i class="fa fa-calendar absolute_icon"></i>
						</div>
						<div class="form-group rel_position">
							<form:input path="checkOutDate" id="check-out" name="departure" placeholder="Check Out" type="text" class="fancy_fild form-control" readonly="true" />
							<i class="fa fa-calendar absolute_icon"></i>
						</div>
						<div class="form-group select_cart_down">
							<form:select path="adult" class="fancy_fild form-control" name="adult" id="adult">
								<option>Adults</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</form:select>
						</div>
						<div class="form-group select_cart_down">
							<form:select path="children" class="fancy_fild form-control" name="children" id="children">
								<option value="0">Children</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</form:select>
						</div>
						<div class="form-group">
							<label>Rooms</label>
							<input name="numberOfRooms" id="room" type="number" value="1" class="number-control" readonly="readonly">
						</div>
						<input type="submit" value="Book Now" class="btn btn-success" />
					</form:form>
				</div>
				<div class="hotel_adds_sec">
					<a href="#">
						<img src="${resources}/assets/images/featured_add_img.jpg" class="img-fluid" alt="">
					</a>
				</div>
			</div>
		</div>
		<!-- Hotel Detail-1 description Start -->
		<div class="row">
			<div class="scrollpay_nav col-lg-12">
				<ul>
					<li class="active">
						<a id="link1" class="nav-section1" href="#owerviwe">Overview</a>
					</li>
					<li>
						<a id="link2" class="nav-section2" href="#Additional_info">Additional information </a>
					</li>
					<li>
						<a id="link3" class="nav-section3" href="#Location_sec">Location</a>
					</li>
					<li>
						<a id="link4" class="nav-section4" href="#Reviews_sec">Reviews</a>
					</li>
					<li class="scrollTop">
						<a href="#">
							<span class="entypo-up-open"></span>
						</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-12">
				<div id="owerviwe">
					<div class="dic_coman_style">
						<strong class="des_title">About This Listing</strong>
						<p>${roomType.description}</p>
					</div>
					<div class="dic_coman_style">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-6">
								<strong class="des_title">The Space</strong>
								<ul class="list-style-none">
									<li>
										Check In:
										<strong>Anytime after 2PM</strong>
									</li>
									<li>
										Check Out:
										<strong>10AM</strong>
									</li>
									<li>
										Accommodates:
										<strong>2</strong>
									</li>
									<li>
										Bathrooms:
										<strong>1</strong>
									</li>
									<li>
										Bed type:
										<strong>Real Bed</strong>
									</li>
									<li>
										Bedrooms:
										<strong>1</strong>
									</li>
									<li>
										Beds:
										<strong>1</strong>
									</li>
									<li>
										Pet Owner:
										<strong>Dog(s) and cat(s)</strong>
									</li>
									<li>
										Property type:
										<strong>Treehouse</strong>
									</li>
									<li>
										Room type:
										<strong>Entire home/apt</strong>
									</li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-6">
								<strong class="des_title">Prices</strong>
								<ul class="list-style-none">
									<li>
										Extra people:
										<strong>No Charge</strong>
									</li>
									<li>
										Cleaning Fee:
										<strong>65</strong>
									</li>
									<li>
										Weekly Discount:
										<strong>10%</strong>
									</li>
									<li>
										Monthly Discount:
										<strong>20%</strong>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="dic_coman_style">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-6">
								<strong class="des_title">Amenities</strong>
								<ul class="list-style-none">
									<li>
										Wifi:
										<strong>Free</strong>
									</li>
									<li>
										Elevator:
										<strong>No</strong>
									</li>
									<li>
										Hair Dryer :
										<strong>Yes</strong>
									</li>
									<li>
										Air Conditioning :
										<strong>Yes</strong>
									</li>
									<li>
										Parking:
										<strong>$20 / Car / Night</strong>
									</li>
									<li>
										Safety Box:
										<strong>Yes</strong>
									</li>
									<li>
										Television :
										<strong>Yes</strong>
									</li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-6">
								<strong class="des_title">House Rules</strong>
								<ul class="list-style-none">
									<li>No smoking</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="dic_coman_style">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-6">
								<strong class="des_title">Cancellations</strong>
								<p class="">
									This host has
									<strong>a Moderate Cancellation Policy</strong>
									- 100% refundable
								</p>
								<br>
								<p>Cancel up to 7 days before your trip and get a full refund. Cancel within 7 days of the trip and get a 50% refund of the nightly rate,
									as well as a full refund of fees.</p>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-6">
								<strong class="des_title">Safety features</strong>
								<ul class="list-style-none">
									<li>Smoke detector</li>
									<li>Carbon monoxide detector</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div id="Additional_info" class="dic_coman_style">
					<h4 class="dic_title">Additional information</h4>
					<table class="table-responsive w-100">
						<tbody>
							<tr>
								<td class="w-25">Month</td>
								<td class="w-75">January, March</td>
							</tr>
							<tr>
								<td class="w-25">destination</td>
								<td class="w-75">Australia</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-lg-12">
				<div id="Location_sec" class="dic_coman_style location_contant">
					<h3 class="dic_title">Location</h3>
					<address>
						Address : Alnahas Building, 2 AlBahr St, Tanta AlGharbia, Egypt.
						<br>
						Phone : +123 456 7890
						<br>
						info@example.com
						<br>
					</address>
					<div class="hotel_loca_map">
						<iframe class="w-100 border-0 map_height350"
							src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d227983.263496325!2d75.80659278740234!3d26.768666699297366!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1518501774240"
							allowfullscreen></iframe>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div id="Reviews_sec" class="review_contant">
					<div class="dic_coman_style">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-6">
								<h4 class="dic_title">Ratings</h4>
								<div class="ratting_overall">
									<strong class="over_cricul">4.5</strong>
									<span>Overall Rating of 231 guest rating</span>
									<div class="ratting_prog_contant row">
										<div class="col-3 p-r-0">
											<ul class="list-inline item-ratting">
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
											</ul>
										</div>
										<div class="col-8 p-l-0">
											<div class="progress">
												<div class="progress-bar pro-50" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</div>
										<div class="col-1 p-l-0 text-left">
											<span class="rattin_count">03</span>
										</div>
									</div>
									<div class="ratting_prog_contant row">
										<div class="col-3 p-r-0">
											<ul class="list-inline item-ratting">
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star un_hightlight font18"></i>
													</a>
												</li>
											</ul>
										</div>
										<div class="col-8 p-l-0">
											<div class="progress">
												<div class="progress-bar pro-75" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</div>
										<div class="col-1 p-l-0 text-left">
											<span class="rattin_count">05</span>
										</div>
									</div>
									<div class="ratting_prog_contant row">
										<div class="col-3 p-r-0">
											<ul class="list-inline item-ratting">
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
											</ul>
										</div>
										<div class="col-8 p-l-0">
											<div class="progress">
												<div class="progress-bar pro-25" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</div>
										<div class="col-1 p-l-0 text-left">
											<span class="rattin_count">02</span>
										</div>
									</div>
									<div class="ratting_prog_contant row">
										<div class="col-3 p-r-0">
											<ul class="list-inline item-ratting">
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
											</ul>
										</div>
										<div class="col-8 p-l-0">
											<div class="progress">
												<div class="progress-bar pro-15" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</div>
										<div class="col-1 p-l-0 text-left">
											<span class="rattin_count">01</span>
										</div>
									</div>
									<div class="ratting_prog_contant row">
										<div class="col-3 p-r-0">
											<ul class="list-inline item-ratting">
												<li>
													<a href="#">
														<i class="fa fa-star"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-star font18 un_hightlight"></i>
													</a>
												</li>
											</ul>
										</div>
										<div class="col-8 p-l-0">
											<div class="progress">
												<div class="progress-bar pro-0" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</div>
										<div class="col-1 p-l-0 text-left">
											<span class="rattin_count">00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-6 hotel-review_form">
								<h4 class="dic_title float-left">Review</h4>
								<ul class="list-inline item-ratting float-right">
									<li>
										<a href="#">
											<i class="fa fa-star font18"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star un_hightlight font18"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star un_hightlight font18"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star un_hightlight font18"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star un_hightlight font18"></i>
										</a>
									</li>
								</ul>
								<form>
									<div class="form-group">
										<input type="text" placeholder="Name" class="form-control">
									</div>
									<div class="form-group">
										<input type="text" placeholder="Email" class="form-control">
									</div>
									<div class="form-group">
										<textarea placeholder="Comment" class="form-control textaria_height"></textarea>
									</div>
									<input type="submit" value="Submit" class="btn btn-success" />
								</form>
							</div>
						</div>
					</div>
					<div class="row cleint_review">
						<div class="col-lg-2 col-md-2 col-sm-3">
							<div class="cleint_pic">
								<img src="${resources}/assets/images/client_pic.jpg" class="img-fluid" alt="">
							</div>
						</div>
						<div class="col-lg-10 col-md-10 col-sm-9">
							<div class="clients_msg">
								<h4>Liza D'souza</h4>
								<div class="date_time">
									<span>10:45 AM</span>
									<span class="verti_divider">Nov 24, 2017</span>
									<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora
										incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem</p>
									<a href="#" class="reply_btn">
										<i class="fa fa-reply m-r-7"></i>
										Reply
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row cleint_review review_align_right">
						<div class="col-lg-2 col-md-2 col-sm-3">
							<div class="cleint_pic">
								<img src="${resources}/assets/images/client_pic2.jpg" class="img-fluid" alt="">
							</div>
						</div>
						<div class="col-lg-10 col-md-10 col-sm-9">
							<div class="clients_msg">
								<h4>John Deo</h4>
								<div class="date_time">
									<span>10:45 AM</span>
									<span class="verti_divider">Nov 24, 2017</span>
									<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora
										incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem</p>
									<a href="#" class="reply_btn">
										<i class="fa fa-reply m-r-7"></i>
										Reply
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hotel Detail-1 Warpper End -->

<script type="text/javascript">
	// Date Picker
	$(function() {
		/* global setting */
		var datepickersOpt = {
			dateFormat : 'yy/mm/dd',
			minDate : 0
		};

		$("#check-in").datepicker($.extend({
			onSelect : function() {
				var minDate = $(this).datepicker('getDate');
				minDate.setDate(minDate.getDate() + 1); //add two days
				$("#check-out").datepicker("option", "minDate", minDate);
			}
		}, datepickersOpt));

		$("#check-out").datepicker($.extend({
			onSelect : function() {
				var maxDate = $(this).datepicker('getDate');
				maxDate.setDate(maxDate.getDate() - 1);
				$("#check-in").datepicker("option", "maxDate", maxDate);
			}
		}, datepickersOpt));

	});

	
</script>

<script type="text/javascript">
$("#adult,#children").change(function () {
    var adult = Math.ceil($("#adult").val() / ${roomType.adultcapacity});
    var children = Math.ceil($("#children").val() / ${roomType.childrencapacity});
    if (adult > children || children == 0){
    	$("#room").val(adult);
	} else {
		$("#room").val(children);
	}
});
</script>
