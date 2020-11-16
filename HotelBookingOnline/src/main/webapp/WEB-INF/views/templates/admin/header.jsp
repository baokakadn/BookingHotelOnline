<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="resources" value="/resources"/>

<div class="page-header navbar navbar-fixed-top">
	<div class="page-header-inner ">
		<!-- logo start -->
		<div class="page-logo">
			<a href="<c:url value="/admin"/>">
				<img alt="" src="${resources}/assets/images/logo.png">
			</a>
		</div>
		<!-- logo end -->
		<ul class="nav navbar-nav navbar-left in">
			<li>
				<a href="#" class="menu-toggler sidebar-toggler">
					<i class="icon-menu"></i>
				</a>
			</li>
		</ul>
		<form class="search-form-opened" action="#" method="GET">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search..." name="query">
				<span class="input-group-btn search-btn">
					<a href="javascript:;" class="btn submit">
						<i class="icon-magnifier"></i>
					</a>
				</span>
			</div>
		</form>

		<!-- start mobile menu -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span></span>
		</a>
		<!-- end mobile menu -->
		<!-- start header menu -->
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<!-- end manage user dropdown -->
				<li class="dropdown dropdown-quick-sidebar-toggler">
					<a id="headerSettingButton" class="mdl-button mdl-js-button mdl-button--icon pull-right"
						data-upgraded=",MaterialButton">
						<i class="material-icons">settings</i>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>