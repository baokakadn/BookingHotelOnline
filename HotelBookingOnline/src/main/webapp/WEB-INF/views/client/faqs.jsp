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
							<h2 class="page_title white-text">FAQ</h2>
							<ul class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item active">FAQ</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- inner_window_banner End bg -->
<!-- Contact-us Content Start Here -->
<section class="faq-vc">
	<div class="col-lg-12 text-center light_grayBG padding_75">
		<h2>Frequently Asked Questions</h2>
		<p class="font-light-22 m-0">Here are answers to most common questions. Can't find an answer? Call us!</p>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-4">
				<div id="getFixed" class="faq-sidebar scrollpay_nav">
					<h5>Questions Category</h5>
					<ul class="border-0 p-0">
						<li class="active">
							<a href="#faq_general">General Options</a>
						</li>
						<li>
							<a href="#faq_user-ac">User Account</a>
						</li>
						<li>
							<a href="#faq_manager-ac">Manager Account</a>
						</li>
						<li>
							<a href="#faq_mathods">Shipping Methods</a>
						</li>
						<li>
							<a href="#faq_troub">Troubleshooting</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9 col-md-8">
				<div id="faq_general" class="faq_yemm_contant">
					<h4>General Options</h4>
					<div id="accordion" role="tablist" aria-multiselectable="true">
						<div class="card">
							<div class="card-header" role="tab" id="headingOne">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> Transfer account
									ownership </a>
							</div>
							<div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
								<div class="card-block">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper, dui in cursus porttitor, lacus ipsum
									dapibus nisl, eu venenatis augue diam a nunc. Nulla aliquam ligula enim, tempus semper ex commodo ut. Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Phasellus et faucibus mauris. Pellentesque efficitur bibendum ante.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingTwo">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									Shipping options page settings </a>
							</div>
							<div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
								<div class="card-block">Cras ultrices leo quis libero placerat egestas. Etiam euismod malesuada urna a consectetur. Etiam non purus
									bibendum, egestas libero eu,</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingThree">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									Setting up product attributes </a>
							</div>
							<div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="card-block">maximus neque. Duis ac placerat nulla, nec cursus ligula. Suspendisse id metus elit. Ut a massa sapien.
									Vestibulum nec nibh turpis. Quisque bibendum odio sit amet fringilla sollicitudin. Curabitur non turpis nec sapien tempor tempus et ac justo.
									Duis in ante scelerisque, ultrices lorem at, scelerisque est.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingfour">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
									Downloadable product </a>
							</div>
							<div id="collapsefour" class="collapse" role="tabpanel" aria-labelledby="headingfour">
								<div class="card-block">maximus neque. Duis ac placerat nulla, nec cursus ligula. Suspendisse id metus elit. Ut a massa sapien.
									Vestibulum nec nibh turpis. Quisque bibendum odio sit amet fringilla sollicitudin. Curabitur non turpis nec sapien tempor tempus et ac justo.
									Duis in ante scelerisque, ultrices lorem at, scelerisque est.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingfive">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapsefive" aria-expanded="false" aria-controls="collapsefive">
									Manage payment settings and invoices </a>
							</div>
							<div id="collapsefive" class="collapse" role="tabpanel" aria-labelledby="headingfive">
								<div class="card-block">Suspendisse et interdum purus, id malesuada nibh. Vivamus euismod pharetra neque, eleifend tempus nunc finibus
									et. Donec bibendum velit ut felis aliquam, nec egestas nibh aliquam. Sed vel consequat arcu, vitae ullamcorper arcu. Integer suscipit
									fermentum arcu, sit amet vestibulum orci fermentum sit amet.</div>
							</div>
						</div>
					</div>
				</div>
				<div id="faq_user-ac" class="faq_yemm_contant">
					<h4>User Account</h4>
					<div id="accordionUesr" role="tablist" aria-multiselectable="true">
						<div class="card">
							<div class="card-header" role="tab" id="headingsix">
								<a data-toggle="collapse" data-parent="#accordionUesr" href="#collapsesix" aria-expanded="true" aria-controls="collapsesix"> Pricing and
									plans guide </a>
							</div>
							<div id="collapsesix" class="collapse show" role="tabpanel" aria-labelledby="headingsix">
								<div class="card-block">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper, dui in cursus porttitor, lacus ipsum
									dapibus nisl, eu venenatis augue diam a nunc. Nulla aliquam ligula enim, tempus semper ex commodo ut. Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Phasellus et faucibus mauris. Pellentesque efficitur bibendum ante.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingseven">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordionUesr" href="#collapseseven" aria-expanded="false"
									aria-controls="collapseseven"> Shipping options page settings </a>
							</div>
							<div id="collapseseven" class="collapse" role="tabpanel" aria-labelledby="headingseven">
								<div class="card-block">Cras ultrices leo quis libero placerat egestas. Etiam euismod malesuada urna a consectetur. Etiam non purus
									bibendum, egestas libero eu,</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingeight">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordionUesr" href="#collapseeight" aria-expanded="false"
									aria-controls="collapseeight"> Setting your company office hours </a>
							</div>
							<div id="collapseeight" class="collapse" role="tabpanel" aria-labelledby="headingeight">
								<div class="card-block">maximus neque. Duis ac placerat nulla, nec cursus ligula. Suspendisse id metus elit. Ut a massa sapien.
									Vestibulum nec nibh turpis. Quisque bibendum odio sit amet fringilla sollicitudin. Curabitur non turpis nec sapien tempor tempus et ac justo.
									Duis in ante scelerisque, ultrices lorem at, scelerisque est.</div>
							</div>
						</div>
					</div>
				</div>
				<div id="faq_manager-ac" class="faq_yemm_contant">
					<h4>Manager Account</h4>
					<div id="accordionManager" role="tablist" aria-multiselectable="true">
						<div class="card">
							<div class="card-header" role="tab" id="heading8">
								<a data-toggle="collapse" data-parent="#accordionManager" href="#collapse8" aria-expanded="true" aria-controls="collapse8"> Pricing and
									plans guide </a>
							</div>
							<div id="collapse8" class="collapse show" role="tabpanel" aria-labelledby="heading8">
								<div class="card-block">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper, dui in cursus porttitor, lacus ipsum
									dapibus nisl, eu venenatis augue diam a nunc. Nulla aliquam ligula enim, tempus semper ex commodo ut. Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Phasellus et faucibus mauris. Pellentesque efficitur bibendum ante.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headings9">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordionManager" href="#collapse9" aria-expanded="false" aria-controls="collapse9">
									Shipping options page settings </a>
							</div>
							<div id="collapse9" class="collapse" role="tabpanel" aria-labelledby="headings9">
								<div class="card-block">Cras ultrices leo quis libero placerat egestas. Etiam euismod malesuada urna a consectetur. Etiam non purus
									bibendum, egestas libero eu,</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="heading10">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordionManager" href="#collapse10" aria-expanded="false"
									aria-controls="collapse10"> Setting your company office hours </a>
							</div>
							<div id="collapse10" class="collapse" role="tabpanel" aria-labelledby="heading10">
								<div class="card-block">maximus neque. Duis ac placerat nulla, nec cursus ligula. Suspendisse id metus elit. Ut a massa sapien.
									Vestibulum nec nibh turpis. Quisque bibendum odio sit amet fringilla sollicitudin. Curabitur non turpis nec sapien tempor tempus et ac justo.
									Duis in ante scelerisque, ultrices lorem at, scelerisque est.</div>
							</div>
						</div>
					</div>
				</div>
				<div id="faq_mathods" class="faq_yemm_contant">
					<h4>Shipping Methods</h4>
					<div id="accordionShipping" role="tablist" aria-multiselectable="true">
						<div class="card">
							<div class="card-header" role="tab" id="heading12">
								<a data-toggle="collapse" data-parent="#accordionShipping" href="#collapse12" aria-expanded="true" aria-controls="collapse12"> Shipping
									components</a>
							</div>
							<div id="collapse12" class="collapse show" role="tabpanel" aria-labelledby="heading12">
								<div class="card-block">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper, dui in cursus porttitor, lacus ipsum
									dapibus nisl, eu venenatis augue diam a nunc. Nulla aliquam ligula enim, tempus semper ex commodo ut. Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Phasellus et faucibus mauris. Pellentesque efficitur bibendum ante.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="heading13">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordionShipping" href="#collapse13" aria-expanded="false"
									aria-controls="collapse13"> Shipping options page settings </a>
							</div>
							<div id="collapse13" class="collapse" role="tabpanel" aria-labelledby="heading13">
								<div class="card-block">Cras ultrices leo quis libero placerat egestas. Etiam euismod malesuada urna a consectetur. Etiam non purus
									bibendum, egestas libero eu,</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="heading14">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordionShipping" href="#collapse14" aria-expanded="false"
									aria-controls="collapse14"> Customizing Forms </a>
							</div>
							<div id="collapse14" class="collapse" role="tabpanel" aria-labelledby="heading14">
								<div class="card-block">maximus neque. Duis ac placerat nulla, nec cursus ligula. Suspendisse id metus elit. Ut a massa sapien.
									Vestibulum nec nibh turpis. Quisque bibendum odio sit amet fringilla sollicitudin. Curabitur non turpis nec sapien tempor tempus et ac justo.
									Duis in ante scelerisque, ultrices lorem at, scelerisque est.</div>
							</div>
						</div>
					</div>
				</div>
				<div id="faq_troub" class="faq_yemm_contant border-0">
					<h4>Troubleshooting</h4>
					<div id="accordiontrou" role="tablist" aria-multiselectable="true">
						<div class="card">
							<div class="card-header" role="tab" id="heading15">
								<a data-toggle="collapse" data-parent="#accordiontrou" href="#collapse15" aria-expanded="true" aria-controls="collapse15"> Fully
									Responsive Design</a>
							</div>
							<div id="collapse15" class="collapse show" role="tabpanel" aria-labelledby="heading15">
								<div class="card-block">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper, dui in cursus porttitor, lacus ipsum
									dapibus nisl, eu venenatis augue diam a nunc. Nulla aliquam ligula enim, tempus semper ex commodo ut. Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Phasellus et faucibus mauris. Pellentesque efficitur bibendum ante.</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="heading16">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordiontrou" href="#collapse16" aria-expanded="false" aria-controls="collapse16">
									Manage user comments </a>
							</div>
							<div id="collapse16" class="collapse" role="tabpanel" aria-labelledby="heading16">
								<div class="card-block">Cras ultrices leo quis libero placerat egestas. Etiam euismod malesuada urna a consectetur. Etiam non purus
									bibendum, egestas libero eu,</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="heading17">
								<a class="collapsed" data-toggle="collapse" data-parent="#accordiontrou" href="#collapse17" aria-expanded="false" aria-controls="collapse17">
									Multiple installs on one domain </a>
							</div>
							<div id="collapse17" class="collapse" role="tabpanel" aria-labelledby="heading17">
								<div class="card-block">maximus neque. Duis ac placerat nulla, nec cursus ligula. Suspendisse id metus elit. Ut a massa sapien.
									Vestibulum nec nibh turpis. Quisque bibendum odio sit amet fringilla sollicitudin. Curabitur non turpis nec sapien tempor tempus et ac justo.
									Duis in ante scelerisque, ultrices lorem at, scelerisque est.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Contact-us Content End Here -->
