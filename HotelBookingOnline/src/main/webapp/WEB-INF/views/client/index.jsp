<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<!-- parallax Start bg -->
<section>
	<div class="parallax-window slider_video_responsive_img" data-parallax="scroll">
		<video class="slider_video" autoplay muted controls loop>
			<source src="${resources}/assets/images/incredible-santorini.mp4" type="video/mp4">
		</video>
		<div class="parallax_overlay">
			<div class="container">
				<div class="serching_yemm_sec text-center d-flex flex-column">
					<h1>Best Hotel to stay</h1>
					<p>The best hotel deal from all the top hotel sites.</p>
					<div class="green_trasp_bg">
						<div class="white_bg">
							<form action="/rooms" method="GET">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-6">
										<div class="form-group">
											<input id="check-in" name="arrival" placeholder="Check In" type="text" class="fancy_fild form-control" autocomplete="off" required>
											<i class="fa fa-calendar pointer_event_none"></i>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-6">
										<div class="form-group">
											<input id="check-out" name="depature" placeholder="Check Out" type="text" class="fancy_fild form-control" autocomplete="off" required>
											<i class="fa fa-calendar pointer_event_none"></i>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-4">
										<div class="form-group">
											<input type="number" name="adult" required="required" placeholder="Adult" class="fancy_fild form-control" autocomplete="off" min="0" />
											<!-- <select class="fancy_fild form-control" name="adult" required="required">
												<option value="">Adults</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
											</select> -->
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4">
										<div class="form-group">
											<input type="number" name="children" required="required" placeholder="Children" class="fancy_fild form-control" autocomplete="off" min="0" />
											<!-- <select class="fancy_fild form-control" name="children" required="required">
												<option value="">Children</option>
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select> -->
										</div>
									</div>
									<div class="col-lg-4 col-md-12 col-sm-12">
										<div class="form-group m-0">
											<input type="submit" class="btn btn-success btn-block" value="Search">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Recommended Destinations Start Here -->
<section class="padding_75 recommended_destinations">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="main_hadding">
					Recommended Destinations <span class="h2_babuls_style"></span>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<div class="yemm_desti_blog m-b30">
					<img src="${resources}/assets/images/lotus_hotel.jpg" class="img-fluid" alt="">
					<div class="yemm_desti_inner">
						<h3>Australia</h3>
						<label class="badge-success">240 HOTELS</label>
					</div>
				</div>
				<div class="yemm_desti_blog">
					<img src="${resources}/assets/images/eiffel_tower.jpg" class="img-fluid" alt="">
					<div class="yemm_desti_inner">
						<h3>Paris</h3>
						<label class="badge-success">430 HOTELS</label>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="yemm_desti_blog">
					<img src="${resources}/assets/images/russia_hotel.jpg" class="img-fluid" alt="">
					<div class="yemm_desti_inner">
						<h3>Russia</h3>
						<label class="badge-success">560 HOTELS</label>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3">
				<div class="yemm_desti_blog m-b30">
					<img src="${resources}/assets/images/china_hotel.jpg" class="img-fluid" alt="">
					<div class="yemm_desti_inner">
						<h3>China</h3>
						<label class="badge-success">320 HOTELS</label>
					</div>
				</div>
				<div class="yemm_desti_blog">
					<img src="${resources}/assets/images/singapore.jpg" class="img-fluid" alt="">
					<div class="yemm_desti_inner">
						<h3>Singapore</h3>
						<label class="badge-success">150 HOTELS</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Recommended Destinations End Here -->
<!-- How It Works Start Here -->
<section class="parallax-window2 xs-height-auto" data-parallax="scroll" data-image-src="${resources}/assets/images/how_it_work_bg.jpg">
	<div class="how_it_work_inner padding_75 xs-height-auto">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="main_hadding white-text">
						How It Works <span class="h2_babuls_style"></span>
					</h2>
				</div>
			</div>
			<div class="row m-t55">
				<div class="col-lg-4 col-md-4">
					<div class="yemm_how_blog text-center">
						<div class="green_icon_blog">
							<img src="${resources}/assets/images/mouse_white_icon.png" class="img-fluid" alt="">
						</div>
						<h4 class="white-text">Book Now</h4>
						<p class="white-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="yemm_how_blog text-center">
						<div class="green_icon_blog">
							<img src="${resources}/assets/images/edit_white_icon.png" class="img-fluid" alt="">
						</div>
						<h4 class="white-text">Enter Details</h4>
						<p class="white-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="yemm_how_blog text-center">
						<div class="green_icon_blog">
							<img src="${resources}/assets/images/check_white_icon.png" class="img-fluid" alt="">
						</div>
						<h4 class="white-text">Confirmed</h4>
						<p class="white-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- How It Works End Here -->
<!-- Most Popular Hotels Start Here -->
<section class="padding_75 most_popular_hotels">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="main_hadding">
					Our Rooms <span class="h2_babuls_style"></span>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<!-- Product Owl Slider-->
				<div id="new-products_slider" class="products_slider_style2">
					<div class="owl-carousel owl-theme">
						<c:forEach var="roomType" items="${roomTypeList}">
							<div class="item">
								<div class="most_pop_item_blog">
									<div class="item_img_blog">
										<img style="width: 348px; height: 230px;" src="${resources}/upload/room-type-image/${roomType.roomtypeid}/${roomType.image}"
											class="img-fluid" alt="">
										<div class="most_popu_overlay">
											<ul class="list-style-none yemm_most_facilities">
												<li><img src="${resources}/assets/images/car-defult_icon.png" alt=""> <span class="d-block">Car Park</span></li>
												<li><img src="${resources}/assets/images/swmming_black_icon.png" alt=""> <span class="d-block">Swimming Pull</span></li>
												<li><img src="${resources}/assets/images/fitness_black_icon.png" alt=""> <span class="d-block">Fitness Center</span></li>
												<li><img src="${resources}/assets/images/spa_balck_icon.png" alt=""> <span class="d-block">Spa & Massage</span></li>
											</ul>
										</div>
									</div>
									<div class="pop_item_description">
										<div class="yemm_hotel_location clearfix">
											<h5>
												<a href="hotel-detail-1.html">${roomType.typename}</a>
											</h5>
											<div class="hotel-addressdetail">
												<strong> <i class="fa fa-map-marker m-r-7"></i> ${roomType.adultcapacity}<span class="text-uppercase d-block">adult</span>
												</strong> <strong> <i class="fa fa-map-marker m-r-7"></i> ${roomType.childrencapacity}<span class="text-uppercase d-block">children</span>
												</strong>
											</div>
											<div class="clearfix"></div>
											<hr class="item_divder">
											<p class="float-left text-center">
												<strong class="green_text">$${roomType.price}</strong> <span class="text-uppercase d-block">PER NIGHT</span>
											</p>
											<a href="<c:url value="/room-detail/${roomType.roomtypeid}"/>" class="btn btn-success float-right">Book Now</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- Product Owl Slider ends -->
			</div>
		</div>
	</div>
</section>
<!-- Home-Blog Start Here -->
<!-- Testimonial Start Here -->
<section class="parallax-window3" data-parallax="scroll" data-image-src="${resources}/assets/images/testimonial_parallax_BG.jpg">
	<div class="testimonial_inner_yemm padding_75">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="main_hadding white-text">
						Testimonial <span class="h2_babuls_style"></span>
					</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div id="Testimonial_slider1">
						<div class="owl-carousel owl-theme">
							<div class="item">
								<blockquote class="blockquote_style1 text-center m-0">
									<div class="row">
										<div class="quote text-left col-lg-2 col-md-2 col-sm-2">
											<i class="fa fa-quote-left fa-4x"></i>
										</div>
										<div class="col-lg-10 col-md-10 col-sm-10">
											<p>Seded ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Etiam eget mi
												enim, non ultricies nisi voluptatem, illo inventore veritatis.</p>
											<h4 class="m-0">Jane Doe Junior</h4>
											<span>Hotel Master</span>
										</div>
										<div class="yemm_profile_pic">
											<img src="${resources}/assets/images/testimonial_profile_pic.jpg" class="img-fluid" alt="">
										</div>
									</div>
								</blockquote>
							</div>
							<div class="item">
								<blockquote class="blockquote_style1 text-center m-0">
									<div class="row">
										<div class="quote text-left col-lg-2 col-md-2 col-sm-2">
											<i class="fa fa-quote-left fa-4x"></i>
										</div>
										<div class="col-lg-10 col-md-10 col-sm-10">
											<p>Seded ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Etiam eget mi
												enim, non ultricies nisi voluptatem, illo inventore veritatis.</p>
											<h4 class="m-0">Jane Doe Junior</h4>
											<span>Hotel Master</span>
										</div>
										<div class="yemm_profile_pic">
											<img src="${resources}/assets/images/testimonial_profile_pic.jpg" class="img-fluid" alt="">
										</div>
									</div>
								</blockquote>
							</div>
							<div class="item">
								<blockquote class="blockquote_style1 text-center m-0">
									<div class="row">
										<div class="quote text-left col-lg-2 col-md-2 col-sm-2">
											<i class="fa fa-quote-left fa-4x"></i>
										</div>
										<div class="col-lg-10 col-md-10 col-sm-10">
											<p>Seded ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Etiam eget mi
												enim, non ultricies nisi voluptatem, illo inventore veritatis.</p>
											<h4 class="m-0">Jane Doe Junior</h4>
											<span>Hotel Master</span>
										</div>
										<div class="yemm_profile_pic">
											<img src="${resources}/assets/images/testimonial_profile_pic.jpg" class="img-fluid" alt="">
										</div>
									</div>
								</blockquote>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Testimonial End Here -->
<!-- Our-Partnersl Start Here -->
<section class="padding_75">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="main_hadding">
					Our Partners <span class="h2_babuls_style"></span>
				</h2>
			</div>
			<div class="col-lg-12">
				<div class="partners_logo_parent">
					<ul class="list-style-none">
						<li><a href="#"> <img src="${resources}/assets/images/brand_logo_img01.png" class="img-fluid" alt="">
						</a></li>
						<li><a href="#"> <img src="${resources}/assets/images/brand_logo_img02.png" class="img-fluid" alt="">
						</a></li>
						<li><a href="#"> <img src="${resources}/assets/images/brand_logo_img03.png" class="img-fluid" alt="">
						</a></li>
						<li><a href="#"> <img src="${resources}/assets/images/brand_logo_img04.png" class="img-fluid" alt="">
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Our-Partnersl End Here -->
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

