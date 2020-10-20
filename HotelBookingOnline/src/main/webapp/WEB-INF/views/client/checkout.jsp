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
							<h2 class="page_title white-text">Checkout</h2>
							<ul class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item">
									<a href="#">Book Now</a>
								</li>
								<li class="breadcrumb-item active">Checkout</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- inner_window_banner End bg -->
<section class="padding_75">
	<div class="container">
		<div class="row checkout_yemm">
			<div class="col-12">
				<div class="pay_mathod_header">
					<strong class="total_pey">Total Amount: $${grandTotal}</strong>
					<h4 class="float-left">Choose a Payment Method :-</h4>
					<div class="dic_msg clear">Hurry! Avail 10% cashback upto INR50 now, pay via Freecharge Wallet. TnC apply.</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="pay_mathod_tab">
							<div class="col-lg-3 col-md-4 col-sm-4 p-0">
								<div class="nav_tab_items">
									<ul class="nav nav-pills " id="pills-tab" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" id="pills-creadit-tab" data-toggle="pill" href="#pills-creadit" role="tab" aria-controls="pills-creadit"
												aria-selected="true">Credit Card</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-dabit-tab" data-toggle="pill" href="#pills-dabit" role="tab" aria-controls="pills-dabit"
												aria-selected="false">Debit Card</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-paypal-tab" data-toggle="pill" href="#pills-paypal" role="tab" aria-controls="pills-paypal"
												aria-selected="false">Paypal</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-netbanking-tab" data-toggle="pill" href="#pills-netbanking" role="tab" aria-controls="pills-netbanking"
												aria-selected="false">Net Banking</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="pills-wallets-tab" data-toggle="pill" href="#pills-wallets" role="tab" aria-controls="pills-wallets"
												aria-selected="false">Wallets</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-9 col-md-8 col-sm-8">
								<div class="tab-content" id="pills-tabContent">
									<div class="tab-pane fade show active" id="pills-creadit" role="tabpanel" aria-labelledby="pills-creadit-tab">
										<form class="form-row" action="confirm" method="POST">
											<div class="form-group col-sm-12">
												<label class="font-bold18 d-block">Card Type</label>
												<img src="${resources}/assets/images/payment_card.png" alt="">
											</div>
											<div class="form-group col-sm-6">
												<label class="font-bold18">Card Number</label>
												<input name="cardNumber" class="form-control" type="text" />
											</div>
											<div class="form-group col-sm-6">
												<label class="font-bold18">Name on Card</label>
												<input name="ownerName" class="form-control" type="text" />
											</div>
											<div class="form-group col-sm-12">
												<label class="font-bold18">Expiry Date</label>
												<div class="form-row">
													<div class="col-6 select_cart_down">
														<select class="form-control" name="expiryMonth">
															<option>MM</option>
															<option value="1">January</option>
															<option value="2">February</option>
															<option value="3">March</option>
															<option value="4">April</option>
															<option value="5">May</option>
															<option value="6">June</option>
															<option value="7">July</option>
															<option value="8">August</option>
															<option value="9">September</option>
															<option value="10">October</option>
															<option value="11">November</option>
															<option value="12">December</option>
														</select>
													</div>
													<div class="col-6 select_cart_down">
														<select class="form-control" name="expiryYear">
															<option value="YY">YY</option>
															<option value="2009">2009</option>
															<option value="2010">2010</option>
															<option value="2011">2011</option>
															<option value="2012">2012</option>
															<option value="2013">2013</option>
															<option value="2014">2014</option>
															<option value="2015">2015</option>
															<option value="2016">2016</option>
															<option value="2017">2017</option>
															<option value="2019">2019</option>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group col-sm-12 ">
												<label class="font-bold18">CVV Number</label>
												<input name="cvvcode" class="form-control" type="text" />
											</div>
											<div class="col-12 text-center">
												<p class="note_text">
													<strong>Note:</strong>
													In the next step you will be redirected to your bank's website to verify yourself.
												</p>
												<input type="hidden" name="grandTotal" value="${grandTotal}">
												<input type="submit" value="Pay Now">
											</div>
										</form>
									</div>
									<div class="tab-pane fade" id="pills-dabit" role="tabpanel" aria-labelledby="pills-dabit-tab">
										<form class="form-row">
											<div class="form-group col-sm-12">
												<label class="font-bold18 d-block">Card Type</label>
												<img src="${resources}/assets/images/payment_card.png" alt="">
											</div>
											<div class="form-group col-sm-6">
												<label class="font-bold18">Card Number</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group col-sm-6">
												<label class="font-bold18">Name on Card</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group col-sm-12">
												<label class="font-bold18">Expiry Date</label>
												<div class="form-row">
													<div class="col-6 select_cart_down">
														<select class="form-control">
															<option>MM</option>
															<option>January</option>
															<option>February</option>
															<option>March</option>
															<option>April</option>
															<option>May</option>
															<option>June</option>
															<option>July</option>
															<option>August</option>
															<option>September</option>
															<option>October</option>
															<option>November</option>
															<option>December</option>
														</select>
													</div>
													<div class="col-6 select_cart_down">
														<select class="form-control">
															<option value="YY">YY</option>
															<option value="2009">2009</option>
															<option value="2010">2010</option>
															<option value="2011">2011</option>
															<option value="2012">2012</option>
															<option value="2013">2013</option>
															<option value="2014">2014</option>
															<option value="2015">2015</option>
															<option value="2016">2016</option>
															<option value="2017">2017</option>
															<option value="2019">2019</option>
														</select>
													</div>
												</div>
											</div>
											<div class="form-group col-sm-12 ">
												<label class="font-bold18">CVV Number</label>
												<input class="form-control" type="text">
											</div>
											<div class="col-12 text-center">
												<p class="note_text">
													<strong>Note:</strong>
													In the next step you will be redirected to your bank's website to verify yourself.
												</p>
												<input type="submit" value="Pay Now">
											</div>
										</form>
									</div>
									<div class="tab-pane fade" id="pills-netbanking" role="tabpanel" aria-labelledby="pills-netbanking-tab">Coming Soon</div>
									<div class="tab-pane fade" id="pills-paypal" role="tabpanel" aria-labelledby="pills-paypal-tab">
										<label class="custom-control custom-radio m-0 paypal_sec">
											<input id="radio1" name="radio" type="radio" class="custom-control-input">
											<span class="custom-control-indicator"></span>
											<span class="custom-control-description">Paypal</span>
										</label>
									</div>
									<div class="tab-pane fade" id="pills-wallets" role="tabpanel" aria-labelledby="pills-wallets-tab">Coming Soon</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>