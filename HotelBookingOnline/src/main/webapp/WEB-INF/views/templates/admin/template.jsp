<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="resources" value="/resources/admin"/>
<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta name="description" content="Responsive Admin Template" />
<meta name="author" content="SmartUniversity" />
<title>Gwesty | Admin</title>
<!-- google font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"
	type="text/css" />
<!-- icons -->
<link href="${resources}/assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet"
	type="text/css" />
<link href="${resources}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!--bootstrap -->
<link href="${resources}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${resources}/assets/plugins/summernote/summernote.css" rel="stylesheet">
<!-- morris chart -->
    <link href="${resources}/assets/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
<!-- Material Design Lite CSS -->
<link rel="stylesheet" href="${resources}/assets/plugins/material/material.min.css">
<link rel="stylesheet" href="${resources}/assets/css/material_style.css">
<!-- data tables -->
<link href="${resources}/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
<link href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
<!-- animation -->
<link href="${resources}/assets/css/pages/animate_page.css" rel="stylesheet">
<link rel="stylesheet" href="${resources}/assets/plugins/sweet-alert/sweetalert.min.css">
<!-- Template Styles -->
<link href="${resources}/assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
<link href="${resources}/assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="${resources}/assets/css/responsive.css" rel="stylesheet" type="text/css" />
<link href="${resources}/assets/css/theme-color.css" rel="stylesheet" type="text/css" />
<link href="${resources}/assets/css/pages/formlayout.css" rel="stylesheet" type="text/css" />
<!-- dropzone -->
<link href="${resources}/assets/plugins/dropzone/dropzone.css" rel="stylesheet" media="screen">
<!-- Date Time item CSS -->
<link rel="stylesheet" href="${resources}/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css" />

<style type="text/css">
.getmdl-select__fix-height .mdl-menu__container .mdl-menu {
	overflow-y: auto;
	max-height: 288px !important
}

.getmdl-select__fix-height .mdl-menu.mdl-menu--top-left {
	bottom: auto;
	top: 0
}
</style>
<!-- favicon -->
<link rel="shortcut icon" href="${resources}/assets/img/favicon.png" />
<script src="${resources}/assets/plugins/jquery/jquery.min.js"></script>
<!-- data tables -->
    <script src="${resources}/assets/plugins/datatables/jquery.dataTables.min.js" ></script>
 	<script src="${resources}/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
 	<script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js" ></script>
 	<script src="${resources}/assets/js/pages/table/table_data.js" ></script>
</head>
<!-- END HEAD -->
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
	<div class="page-wrapper">
		<!-- start header -->
		<tiles:insertAttribute name="header"/>
		<!-- end header -->
		<!-- start page container -->
		<div class="page-container">
			<!-- start sidebar menu -->
			<tiles:insertAttribute name="sidebar-menu"/>
			<!-- end sidebar menu -->
			<!-- start page content -->
			<tiles:insertAttribute name="content"/>
			<!-- end page content -->
			<!-- start chat sidebar -->
			<tiles:insertAttribute name="chat-sidebar"/>
			<!-- end chat sidebar -->
		</div>
		<!-- end page container -->
		<!-- start footer -->
		<tiles:insertAttribute name="footer"/>
		<!-- end footer -->
	</div>
	<!-- start js include path -->
	
	<script src="${resources}/assets/plugins/popper/popper.min.js"></script>
	<script src="${resources}/assets/plugins/jquery-blockui/jquery.blockui.min.js"></script>
	<script src="${resources}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- bootstrap -->
	<script src="${resources}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${resources}/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script src="${resources}/assets/js/pages/sparkline/sparkline-data.js"></script>
	
	<!-- Sweet Alert -->
    <script src="${resources}/assets/plugins/sweet-alert/sweetalert.min.js" ></script>
    <script src="${resources}/assets/js/pages/sweet-alert/sweet-alert-data.js" ></script>
	<!-- Common js-->
	<script src="${resources}/assets/js/app.js"></script>
	<script src="${resources}/assets/js/layout.js"></script>
	<script src="${resources}/assets/js/theme-color.js"></script>
	<!-- data tables -->
    <%-- <script src="${resources}/assets/plugins/datatables/jquery.dataTables.min.js" ></script>
 	<script src="${resources}/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
 	<script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js" ></script>
 	<script src="${resources}/assets/js/pages/table/table_data.js" ></script> --%>
	<!-- material -->
	<!-- <script src="https://code.getmdl.io/1.3.0/material.min.js"></script> -->
	<script src="${resources}/assets/plugins/material/material.min.js"></script>
	<script src="${resources}/assets/js/pages/material_select/getmdl-select.js" ></script>
    <script src="${resources}/assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
	<script src="${resources}/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
	<script src="${resources}/assets/plugins/material-datetimepicker/datetimepicker.js"></script>
	<!-- dropzone -->
    <%-- <script src="${resources}/assets/plugins/dropzone/dropzone.js" ></script> --%>
    <%-- <script src="${resources}/assets/plugins/dropzone/dropzone-call.js" ></script> --%>
	<!-- animation -->
	<script src="${resources}/assets/js/pages/ui/animations.js"></script>
	<!-- end js include path -->
	<script src="${resources}/assets/plugins/bootstrap-inputmask/bootstrap-inputmask.min.js" ></script>
	
	<script>
$(document).ready(function() {
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
		   $($.fn.dataTable.tables(true)).DataTable()
		      .columns.adjust();
		});
});
</script>
</body>
</html>