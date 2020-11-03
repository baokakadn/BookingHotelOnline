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
							<h2 class="page_title white-text">Search</h2>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Search</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- inner_window_banner End bg -->
<section class="padding_75 conform-warpper">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" style="text-align: center;">
				<img alt="" src="https://cdn6.agoda.net/images/MMB-855/default/illustration-property.png">
				<h2 class="mmb-blc-title">${message}</h2>
				<button class="btn btn-success" onclick="goBack()">Back</button>
			</div>
		</div>
	</div>
</section>
<script>
function goBack() {
  window.history.back();
}
</script>