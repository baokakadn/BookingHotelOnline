<%@ include file="/common/taglib.jsp"%>
<%@ attribute name="title1" required="true" type="java.lang.String"%>
<%@ attribute name="title2" required="true" type="java.lang.String"%>
<c:url var="resources" value="/resources" />
<!-- inner_window_banner Start bg -->
<section>
	<div class="inner_window_banner" data-parallax="scroll" data-image-src="${resources}/assets/images/inner_banner1.jpg">
		<div class="inner_window_overlay">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb_parent text-center">
							<h2 class="page_title white-text">${title1}</h2>
							<ul class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="<c:url value="/"/>">Home</a>
								</li>
								<li class="breadcrumb-item active">
									${title2}
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- inner_window_banner End bg -->