<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<!-- inner_window_banner Start bg -->
<tg:breadcrumb title1="Contact Us" title2="Contact Us"/>
<!-- inner_window_banner End bg -->
<!-- Contact-us Content Start Here -->
<section class="padding_75 contact-us-vc">
	<div class="container">
		<div class="row mb-5 ">
			<div class="col-lg-4 col-md-4">
				<div class="contact_info_modulus">
					<div class="info_icon">
						<img src="${resources}/assets/images/map_maker_icon.png" alt="">
					</div>
					<h4>Our Location</h4>
					<p>PO Box 1025MNO Collins Street West Victoria 8007 Australia</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="contact_info_modulus">
					<div class="info_icon">
						<img src="${resources}/assets/images/phone_icon.png" alt="">
					</div>
					<h4>Phone Number</h4>
					<p>
						+61-1234-5678-90
						<br>
						+210-232-232
					</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="contact_info_modulus">
					<div class="info_icon">
						<img src="${resources}/assets/images/mail_icon.png" alt="">
					</div>
					<h4>Our Location</h4>
					<a href="#">contact@example.com </a>
					<a href="#">info@example.com</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 col-md-12 hotel-review_form">
				<div class="contant_form">
					<h4 class="dic_title float-left">Let's get in touch</h4>
					<form>
						<div class="form-group">
							<input type="text" placeholder="Full Name" class="form-control">
						</div>
						<div class="form-group">
							<input type="text" placeholder="Email" class="form-control">
						</div>
						<div class="form-group">
							<input type="text" placeholder="Phone Number" class="form-control">
						</div>
						<div class="form-group">
							<textarea placeholder="Message" class="form-control textaria_height"></textarea>
						</div>
						<input type="submit" value="Submit" class="btn btn-success">
					</form>
				</div>
			</div>
			<div class="col-lg-6 col-md-12">
				<div class="contant_map h-100">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d958.4760602096882!2d108.24280959031654!3d16.070458223141745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314217868635413b%3A0x518805c37fec2f8!2zUGjhu5EgTsaw4bubbmcgVG9reW8gxJDDoCBO4bq1bmcgLSDrj4Tsv4QgQkJRIO2DgOyatCAtIOS4nOS6rOeDp-eDpOmVhw!5e0!3m2!1sen!2s!4v1601180376228!5m2!1sen!2s"
						allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Contact-us Content End Here -->