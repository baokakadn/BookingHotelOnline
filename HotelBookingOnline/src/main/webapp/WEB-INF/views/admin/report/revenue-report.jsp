<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i></li>
					<li><a class="parent-item" href="">Report</a>&nbsp;<i class="fa fa-angle-right"></i></li>
					<li class="active">Revenue Report</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="card card-box">
					<div class="card-head">
						<header>Report Query</header>
					</div>
					<form action="revenue-report" method="GET">
						<div class="card-body row">

							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="text" id="startDate" name="startDate" required="required" /> <label class="mdl-textfield__label">Start
										Date</label>
								</div>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="text" id="endDate" name="endDate" required="required" /> <label class="mdl-textfield__label">End
										Date</label>
								</div>
							</div>
							<div class="col-lg-12 p-t-20 text-center">
								<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
								<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card card-box">
					<div class="card-head">
						<header>Revenue Report</header>
						<div style="margin: 5px 5px;" class="btn-group pull-right">
							<a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu pull-right">
								<li><a href="javascript:;"> <i class="fa fa-print"></i> Print
								</a></li>
								<li><a href="/admin/revenue-report/document/pdf${queryString}"> <i class="fa fa-file-pdf-o"></i> Save as PDF
								</a></li>
								<li><a href="/admin/revenue-report/document/excel${queryString}"> <i class="fa fa-file-excel-o"></i> Export to Excel
								</a></li>
								<li><a href="/admin/revenue-report/document/csv${queryString}"> <i class="fa fa-stack-overflow"></i> Export to CSV
								</a></li>
							</ul>
						</div>
					</div>
					<div class="card-body ">
						<%-- <div class="row p-b-20">
							<div class="col-md-6 col-sm-6 col-6">
								<div class="btn-group">
									<a href="<c:url value="booking/create"/>" id="addRow" class="btn btn-info"> Add New <i class="fa fa-plus"></i>
									</a>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-6"></div>
						</div> --%>
						<div class="table-scrollable">
							<table class="table table-hover table-checkable order-column full-width" id="example4">
								<thead>
									<tr>
										<th class="center">Invoice Id</th>
										<th class="center">Name</th>
										<th class="center">Booking</th>
										<th class="center">Date</th>
										<th class="center">Payment Method</th>
										<th class="center">Amount</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invoice" items="${invoiceList}">
										<tr class="odd gradeX">
											<td class="center">${invoice.invoiceId}</td>
											<td class="center"><a href="<c:url value="/admin/user/${invoice.booking.user.getUserId()}"/>">${invoice.booking.user.name}</a></td>
											<td class="center"><a href="<c:url value="/admin/booking/booking-details/${invoice.booking.bookingId}"/>">${invoice.booking.bookinguid}</a></td>
											<fmt:parseDate value="${invoice.invoiceDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" type="both" />
											<fmt:formatDate value="${parsedDate}" var="date" type="both" pattern="yyyy-MM-dd HH:mm" />
											<td class="center">${date}</td>
											<td class="center">${not empty invoice.creditcard ? 'CreditCard' : 'Cash'}</td>
											<td class="center">$${invoice.amount}</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th class="center"></th>
										<th class="center"></th>
										<th class="center"></th>
										<th class="center"></th>
										<th class="center"><h3>Total</h3></th>
										<th class="center"><h3>$${sum}</h3></th>
										
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$('#table').DataTable( {
	dom: 'Bfrtip',
    buttons: [
        'copy', 'excel', 'pdf'
    ]
} );
</script>
