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
							<form action="<c:url value="/rooms"/>" method="get">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-6">
										<div class="form-group">
											<input id="check-in" name="arrival" placeholder="Check In" type="text" class="fancy_fild form-control">
											<i class="fa fa-calendar pointer_event_none"></i>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-6">
										<div class="form-group">
											<input id="check-out" name="depature" placeholder="Check Out" type="text" class="fancy_fild form-control">
											<i class="fa fa-calendar pointer_event_none"></i>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-4">
										<div class="form-group select_cart_down">
											<select class="fancy_fild form-control" name="adult">
												<option>Adults</option>
												<option>0</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
											</select>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4">
										<div class="form-group select_cart_down">
											<select class="fancy_fild form-control" name="children">
												<option>Children</option>
												<option>0</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
											</select>
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
					Recommended Destinations
					<span class="h2_babuls_style"></span>
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
<section class="parallax-window2 xs-height-auto" data-parallax="scroll"
	data-image-src="${resources}/assets/images/how_it_work_bg.jpg">
	<div class="how_it_work_inner padding_75 xs-height-auto">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="main_hadding white-text">
						How It Works
						<span class="h2_babuls_style"></span>
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
					Our Rooms
					<span class="h2_babuls_style"></span>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<!-- Product Owl Slider-->
				<div id="new-products_slider" class="products_slider_style2">
					<div class="owl-carousel owl-theme">
						<div class="item">
							<div class="most_pop_item_blog">
								<div class="item_img_blog">
									<img src="${resources}/assets/images/most_popular_item1.png" class="img-fluid" alt="">
									<div class="most_popu_overlay">
										<ul class="list-style-none yemm_most_facilities">
											<li>
												<img src="${resources}/assets/images/car-defult_icon.png" alt="">
												<span class="d-block">Car Park</span>
											</li>
											<li>
												<img src="${resources}/assets/images/swmming_black_icon.png" alt="">
												<span class="d-block">Swimming Pull</span>
											</li>
											<li>
												<img src="${resources}/assets/images/fitness_black_icon.png" alt="">
												<span class="d-block">Fitness Center</span>
											</li>
											<li>
												<img src="${resources}/assets/images/spa_balck_icon.png" alt="">
												<span class="d-block">Spa & Massage</span>
											</li>
										</ul>
									</div>
								</div>
								<div class="pop_item_description">
									<div class="yemm_hotel_location clearfix">
										<h5>
											<a href="hotel-detail-1.html">Atlantis Hotel</a>
										</h5>
										<div class="hotel-addressdetail">
											<strong>
												<i class="fa fa-map-marker m-r-7"></i>
												Sanguily, Cuba
											</strong>
											<p class="adv-spac">
												<span class="outline_bages m-r-7">Ad</span>
												<i class="fa fa-check-circle"></i>
											</p>
										</div>
										<div class="clearfix"></div>
										<hr class="item_divder">
										<p class="float-left text-center">
											<strong class="green_text">$40.8</strong>
											<span class="text-uppercase d-block">PER NIGHT</span>
										</p>
										<a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="most_pop_item_blog">
								<div class="item_img_blog">
									<img src="${resources}/assets/images/most_popular_item2.jpg" class="img-fluid" alt="">
									<div class="most_popu_overlay">
										<ul class="list-style-none yemm_most_facilities">
											<li>
												<img src="${resources}/assets/images/car-defult_icon.png" alt="">
												<span class="d-block">Car Park</span>
											</li>
											<li>
												<img src="${resources}/assets/images/swmming_black_icon.png" alt="">
												<span class="d-block">Swimming Pull</span>
											</li>
											<li>
												<img src="${resources}/assets/images/fitness_black_icon.png" alt="">
												<span class="d-block">Fitness Center</span>
											</li>
											<li>
												<img src="${resources}/assets/images/spa_balck_icon.png" alt="">
												<span class="d-block">Spa & Massage</span>
											</li>
										</ul>
									</div>
								</div>
								<div class="pop_item_description">
									<div class="yemm_hotel_location clearfix">
										<h5>
											<a href="hotel-detail-1.html">Wellington Hotel</a>
										</h5>
										<div class="hotel-addressdetail">
											<strong>
												<i class="fa fa-map-marker m-r-7"></i>
												La Teresa, Cuba
											</strong>
											<p class="adv-spac">
												<span class="outline_bages m-r-7">Ad</span>
												<i class="fa fa-check-circle"></i>
											</p>
										</div>
										<div class="clearfix"></div>
										<hr class="item_divder">
										<p class="float-left text-center">
											<strong class="green_text">$35.8</strong>
											<span class="text-uppercase d-block">PER NIGHT</span>
										</p>
										<a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="most_pop_item_blog">
								<div class="item_img_blog">
									<img src="${resources}/assets/images/most_popular_item3.jpg" class="img-fluid" alt="">
									<div class="most_popu_overlay">
										<ul class="list-style-none yemm_most_facilities">
											<li>
												<img src="${resources}/assets/images/car-defult_icon.png" alt="">
												<span class="d-block">Car Park</span>
											</li>
											<li>
												<img src="${resources}/assets/images/swmming_black_icon.png" alt="">
												<span class="d-block">Swimming Pull</span>
											</li>
											<li>
												<img src="${resources}/assets/images/fitness_black_icon.png" alt="">
												<span class="d-block">Fitness Center</span>
											</li>
											<li>
												<img src="${resources}/assets/images/spa_balck_icon.png" alt="">
												<span class="d-block">Spa & Massage</span>
											</li>
										</ul>
									</div>
								</div>
								<div class="pop_item_description">
									<div class="yemm_hotel_location clearfix">
										<h5>
											<a href="hotel-detail-1.html">InterContinental New York Barclay</a>
										</h5>
										<div class="hotel-addressdetail">
											<strong>
												<i class="fa fa-map-marker m-r-7"></i>
												Orlando Gonzales, Cuba
											</strong>
											<p class="adv-spac">
												<span class="outline_bages m-r-7">Ad</span>
												<i class="fa fa-check-circle"></i>
											</p>
										</div>
										<div class="clearfix"></div>
										<hr class="item_divder">
										<p class="float-left text-center">
											<strong class="green_text">$80</strong>
											<span class="text-uppercase d-block">PER NIGHT</span>
										</p>
										<a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="most_pop_item_blog">
								<div class="item_img_blog">
									<img src="${resources}/assets/images/most_popular_item1.png" class="img-fluid" alt="">
									<div class="most_popu_overlay">
										<ul class="list-style-none yemm_most_facilities">
											<li>
												<img src="${resources}/assets/images/car-defult_icon.png" alt="">
												<span class="d-block">Car Park</span>
											</li>
											<li>
												<img src="${resources}/assets/images/swmming_black_icon.png" alt="">
												<span class="d-block">Swimming Pull</span>
											</li>
											<li>
												<img src="${resources}/assets/images/fitness_black_icon.png" alt="">
												<span class="d-block">Fitness Center</span>
											</li>
											<li>
												<img src="${resources}/assets/images/spa_balck_icon.png" alt="">
												<span class="d-block">Spa & Massage</span>
											</li>
										</ul>
									</div>
								</div>
								<div class="pop_item_description">
									<div class="yemm_hotel_location clearfix">
										<h5>
											<a href="#">The Emperor's Crown Hostel</a>
										</h5>
										<div class="hotel-addressdetail">
											<strong>
												<i class="fa fa-map-marker m-r-7"></i>
												Sanguily, Cuba
											</strong>
											<p class="adv-spac">
												<span class="outline_bages m-r-7">Ad</span>
												<i class="fa fa-check-circle"></i>
											</p>
										</div>
										<div class="clearfix"></div>
										<hr class="item_divder">
										<p class="float-left text-center">
											<strong class="green_text">$60.5</strong>
											<span class="text-uppercase d-block">PER NIGHT</span>
										</p>
										<a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="most_pop_item_blog">
								<div class="item_img_blog">
									<img src="${resources}/assets/images/most_popular_item2.jpg" class="img-fluid" alt="">
									<div class="most_popu_overlay">
										<ul class="list-style-none yemm_most_facilities">
											<li>
												<img src="${resources}/assets/images/car-defult_icon.png" alt="">
												<span class="d-block">Car Park</span>
											</li>
											<li>
												<img src="${resources}/assets/images/swmming_black_icon.png" alt="">
												<span class="d-block">Swimming Pull</span>
											</li>
											<li>
												<img src="${resources}/assets/images/fitness_black_icon.png" alt="">
												<span class="d-block">Fitness Center</span>
											</li>
											<li>
												<img src="${resources}/assets/images/spa_balck_icon.png" alt="">
												<span class="d-block">Spa & Massage</span>
											</li>
										</ul>
									</div>
								</div>
								<div class="pop_item_description">
									<div class="yemm_hotel_location clearfix">
										<h5>
											<a href="hotel-detail-1.html">The Witch's Hat</a>
										</h5>
										<div class="hotel-addressdetail">
											<strong>
												<i class="fa fa-map-marker m-r-7"></i>
												La Teresa, Cuba
											</strong>
											<p class="adv-spac">
												<span class="outline_bages m-r-7">Ad</span>
												<i class="fa fa-check-circle"></i>
											</p>
										</div>
										<div class="clearfix"></div>
										<hr class="item_divder">
										<p class="float-left text-center">
											<strong class="green_text">$100</strong>
											<span class="text-uppercase d-block">PER NIGHT</span>
										</p>
										<a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="most_pop_item_blog">
								<div class="item_img_blog">
									<img src="${resources}/assets/images/most_popular_item3.jpg" class="img-fluid" alt="">
									<div class="most_popu_overlay">
										<ul class="list-style-none yemm_most_facilities">
											<li>
												<img src="${resources}/assets/images/car-defult_icon.png" alt="">
												<span class="d-block">Car Park</span>
											</li>
											<li>
												<img src="${resources}/assets/images/swmming_black_icon.png" alt="">
												<span class="d-block">Swimming Pull</span>
											</li>
											<li>
												<img src="${resources}/assets/images/fitness_black_icon.png" alt="">
												<span class="d-block">Fitness Center</span>
											</li>
											<li>
												<img src="${resources}/assets/images/spa_balck_icon.png" alt="">
												<span class="d-block">Spa & Massage</span>
											</li>
										</ul>
									</div>
								</div>
								<div class="pop_item_description">
									<div class="yemm_hotel_location clearfix">
										<h5>
											<a href="hotel-detail-1.html">Grace Building, Sydney</a>
										</h5>
										<div class="hotel-addressdetail">
											<strong>
												<i class="fa fa-map-marker m-r-7"></i>
												Orlando Gonzales, Cuba
											</strong>
											<p class="adv-spac">
												<span class="outline_bages m-r-7">Ad</span>
												<i class="fa fa-check-circle"></i>
											</p>
										</div>
										<div class="clearfix"></div>
										<hr class="item_divder">
										<p class="float-left text-center">
											<strong class="green_text">$55.8</strong>
											<span class="text-uppercase d-block">PER NIGHT</span>
										</p>
										<a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Product Owl Slider ends -->
			</div>
		</div>
	</div>
</section>
<!-- Hotels-Offers Start Here -->
<%-- <section class="parallax-window3" data-parallax="scroll" data-image-src="${resources}/assets/images/parallax_BG3.jpg">
	<div class="yemm_hotel_offer padding_75">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="main_hadding white-text">
						Hotels Offers
						<span class="h2_babuls_style"></span>
					</h2>
				</div>
			</div>
			<div class="padding_l-r">
				<div id="popular_category" class="products_slider_style2">
					<div class="owl-carousel owl-theme">
						<div class="item">
							<div class="smooth_slide_img">
								<img src="${resources}/assets/images/3d_slider_img1.jpg" class="img-fluid" alt="">
								<div class="smooth_overlay">
									<ul class="list-style-none yemm_most_facilities">
										<li>
											<img src="${resources}/assets/images/gray_car_icon.png" alt="">
											<span class="d-block">Car Park</span>
										</li>
										<li>
											<img src="${resources}/assets/images/swmming_gray_icon.png" alt="">
											<span class="d-block">Swimming Pull</span>
										</li>
										<li>
											<img src="${resources}/assets/images/fitness_gray_icon.png" alt="">
											<span class="d-block">Fitness Center</span>
										</li>
										<li>
											<img src="${resources}/assets/images/spa_gray_icon.png" alt="">
											<span class="d-block">Spa &amp; Massage</span>
										</li>
										<li class="dicount_yemm">
											<del>$350</del>
											<strong>$250</strong>
											<small>Per Night</small>
										</li>
									</ul>
								</div>
								<div class="offer_yemm_bottom">
									<div class="float-left">
										<h2 class="white-text">Park Hyatt Sydney</h2>
										<strong class="d-block">5 Star Hotel in Dubai</strong>
										<a href="#" class="btn btn-success">Book Now</a>
									</div>
									<div class="promocoad_blog">
										<strong class="promooff">30% OFF</strong>
										<span class="promocoad">BOOK636F</span>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="smooth_slide_img">
								<img src="${resources}/assets/images/3d_slider_img2.jpg" class="img-fluid" alt="">
								<div class="smooth_overlay">
									<ul class="list-style-none yemm_most_facilities">
										<li>
											<img src="${resources}/assets/images/gray_car_icon.png" alt="">
											<span class="d-block">Car Park</span>
										</li>
										<li>
											<img src="${resources}/assets/images/swmming_gray_icon.png" alt="">
											<span class="d-block">Swimming Pull</span>
										</li>
										<li>
											<img src="${resources}/assets/images/fitness_gray_icon.png" alt="">
											<span class="d-block">Fitness Center</span>
										</li>
										<li>
											<img src="${resources}/assets/images/spa_gray_icon.png" alt="">
											<span class="d-block">Spa &amp; Massage</span>
										</li>
										<li class="dicount_yemm">
											<del>$350</del>
											<strong>$250</strong>
											<small>Per Night</small>
										</li>
									</ul>
								</div>
								<div class="offer_yemm_bottom">
									<div class="float-left">
										<h2 class="white-text">Australia Hotel</h2>
										<strong class="d-block">5 Star Hotel in Dubai</strong>
										<a href="#" class="btn btn-success">Book Now</a>
									</div>
									<div class="promocoad_blog">
										<strong class="promooff">30% OFF</strong>
										<span class="promocoad">BOOK636F</span>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="smooth_slide_img">
								<img src="${resources}/assets/images/3d_slider_img3.jpg" class="img-fluid" alt="">
								<div class="smooth_overlay">
									<ul class="list-style-none yemm_most_facilities">
										<li>
											<img src="${resources}/assets/images/gray_car_icon.png" alt="">
											<span class="d-block">Car Park</span>
										</li>
										<li>
											<img src="${resources}/assets/images/swmming_gray_icon.png" alt="">
											<span class="d-block">Swimming Pull</span>
										</li>
										<li>
											<img src="${resources}/assets/images/fitness_gray_icon.png" alt="">
											<span class="d-block">Fitness Center</span>
										</li>
										<li>
											<img src="${resources}/assets/images/spa_gray_icon.png" alt="">
											<span class="d-block">Spa &amp; Massage</span>
										</li>
										<li class="dicount_yemm">
											<del>$350</del>
											<strong>$250</strong>
											<small>Per Night</small>
										</li>
									</ul>
								</div>
								<div class="offer_yemm_bottom">
									<div class="float-left">
										<h2 class="white-text">Shangri-La Hotel, Sydney</h2>
										<strong class="d-block">5 Star Hotel in Dubai</strong>
										<a href="#" class="btn btn-success">Book Now</a>
									</div>
									<div class="promocoad_blog">
										<strong class="promooff">30% OFF</strong>
										<span class="promocoad">BOOK636F</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> --%>
<!-- Hotels-Offers End Here -->
<!-- Home-Blog Start Here -->
<%-- <section class="padding_75">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="main_hadding">
					Our Blogs
					<span class="h2_babuls_style"></span>
				</h2>
			</div>
		</div>
		<div class="row m-0">
			<div class="col-lg-4 col-md-4 p-0">
				<div class="home_blog_prent">
					<img src="${resources}/assets/images/home_blog_img1.jpg" class="img-fluid" alt="">
					<div class="home_blog_disc">
						<span class="green_text text-uppercase">ROOMS & SUITES</span>
						<h4>Finding Best Places to Visit in California</h4>
						<p class="text_gary18">Hotella Hotel will manage a new hotel in Rome that will incorporate a restaurant from Michelin-starred chef
							Revolutions of the lorem points that first lami toresta...</p>
						<div class="blog_user_info clearfix">
							<span class="float-left">
								<i class="fa fa-user-circle-o m-r-7"></i>
								By Jhone Snow
							</span>
							<span class="float-right">
								<i class="fa fa-calendar m-r-7"></i>
								September 6, 2019
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4  p-0">
				<div class="home_blog_prent xs-column-reverse">
					<div class="home_blog_disc rel-top15">
						<span class="green_text text-uppercase">FACILITIES</span>
						<h4>Details of Seventh Hotella Hotel Branch in Italy.</h4>
						<p class="text_gary18">Hotella Hotel will manage a new hotel in Rome that will incorporate a restaurant from Michelin-starred chef
							Revolutions of the lorem points that first lami toresta...</p>
						<div class="blog_user_info clearfix">
							<span class="float-left">
								<i class="fa fa-user-circle-o m-r-7"></i>
								By Jhone Snow
							</span>
							<span class="float-right">
								<i class="fa fa-calendar m-r-7"></i>
								September 6, 2019
							</span>
						</div>
					</div>
					<img src="${resources}/assets/images/home_blog_img2.jpg" class="img-fluid" alt="">
				</div>
			</div>
			<div class="col-lg-4 col-md-4 p-0">
				<div class="home_blog_prent">
					<img src="${resources}/assets/images/home_blog_img3.jpg" class="img-fluid" alt="">
					<div class="home_blog_disc">
						<span class="green_text text-uppercase">CLOUD COMPUTING</span>
						<h4>Weekly Meeting in Compa- nies Think Room</h4>
						<p class="text_gary18">Hotella Hotel will manage a new hotel in Rome that will incorporate a restaurant from Michelin-starred chef
							Revolutions of the lorem points that first lami toresta...</p>
						<div class="blog_user_info clearfix">
							<span class="float-left">
								<i class="fa fa-user-circle-o m-r-7"></i>
								By Jhone Snow
							</span>
							<span class="float-right">
								<i class="fa fa-calendar m-r-7"></i>
								September 6, 2019
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> --%>
<!-- Home-Blog Start Here -->
<!-- Testimonial Start Here -->
<section class="parallax-window3" data-parallax="scroll"
	data-image-src="${resources}/assets/images/testimonial_parallax_BG.jpg">
	<div class="testimonial_inner_yemm padding_75">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="main_hadding white-text">
						Testimonial
						<span class="h2_babuls_style"></span>
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
					Our Partners
					<span class="h2_babuls_style"></span>
				</h2>
			</div>
			<div class="col-lg-12">
				<div class="partners_logo_parent">
					<ul class="list-style-none">
						<li>
							<a href="#">
								<img src="${resources}/assets/images/brand_logo_img01.png" class="img-fluid" alt="">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="${resources}/assets/images/brand_logo_img02.png" class="img-fluid" alt="">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="${resources}/assets/images/brand_logo_img03.png" class="img-fluid" alt="">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="${resources}/assets/images/brand_logo_img04.png" class="img-fluid" alt="">
							</a>
						</li>
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