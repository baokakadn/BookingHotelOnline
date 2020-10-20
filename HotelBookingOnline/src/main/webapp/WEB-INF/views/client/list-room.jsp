<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<!-- inner_window_banner Start bg -->
<tg:breadcrumb title1="Rooms" title2="Rooms" />
<!-- inner_window_banner End bg -->
<section class="p-45 owner_hotellisting">
	<div class="container">
		<div class="row">
			<c:forEach var="r" items="${listRoomType}">
				<div class="col-lg-4 col-md-4 yemm_items">
					<div class="most_pop_item_blog clearfix">
						<div class="item_img_blog">
								<img style="width: 347px; height: 230px;" src="${resources}/upload/room-type-image/${r.roomtypeid}/${r.image}" class="img-fluid" alt="">
							<div class="most_popu_overlay">
								<ul class="list-style-none yemm_most_facilities owl-carousel owl-theme">
									<li class="item"><img src="${resources}/assets/images/car-defult_icon.png" alt=""> <span class="d-block">Car Park</span></li>
									<li class="item"><img src="${resources}/assets/images/swmming_black_icon.png" alt=""> <span class="d-block">Swimming Pull</span></li>
									<li class="item"><img src="${resources}/assets/images/fitness_black_icon.png" alt=""> <span class="d-block">Fitness Center</span>
									</li>
									<li class="item"><img src="${resources}/assets/images/spa_balck_icon.png" alt=""> <span class="d-block">Spa &amp; Massage</span></li>
									<li class="item"><img src="${resources}/assets/images/swmming_black_icon.png" alt=""> <span class="d-block">Swimming Pull</span></li>
									<li class="item"><img src="${resources}/assets/images/fitness_black_icon.png" alt=""> <span class="d-block">Fitness Center</span>
									</li>
									<li class="item"><img src="${resources}/assets/images/spa_balck_icon.png" alt=""> <span class="d-block">Spa &amp; Massage</span></li>
								</ul>
								<div class="item-bottom">
									<ul class="list-inline item-ratting float-left">
										<li><a href="#"> <i class="fa fa-star"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-star"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-star"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-star"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-star"></i>
										</a></li>
									</ul>
									<ul class="bookmark_view">
										<li><a href="#"> <i class="fa fa-bookmark-o"></i>
										</a></li>
										<li><a href="#"> <i class="fa fa-eye"></i> 25
										</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="pop_item_description">
							<div class="yemm_hotel_location clearfix">
								<h5>${r.typename}</h5>
								<div class="hotel-addressdetail">
									<strong> <i class="fa fa-map-marker m-r-7"></i> ${r.adultcapacity}<span class="text-uppercase d-block">adult</span>
									</strong> <strong> <i class="fa fa-map-marker m-r-7"></i> ${r.childrencapacity}<span class="text-uppercase d-block">children</span>
									</strong>
								</div>
								<div class="clearfix"></div>
								<hr class="item_divder">
								<p class="float-left text-center">
									<strong class="green_text">$ ${r.price}</strong> <span class="text-uppercase d-block">PER NIGHT</span>
								</p>
								<a href="/room-detail/${r.roomtypeid}" class="btn btn-success float-right">View Details</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- <div class="col-12 mt-3">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">«</span> <span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">»</span> <span class="sr-only">Next</span>
					</a></li>
				</ul>
			</div> -->
		</div>
	</div>
</section>