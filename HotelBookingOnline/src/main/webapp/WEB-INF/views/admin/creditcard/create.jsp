<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="resources" value="/resources" />
<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Add CreditCard</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/creditcard">CreditCard</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Add CreditCard</li>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="card-box">
					<div class="card-head">
						<button id="panel-button" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
							<i class="material-icons">more_vert</i>
						</button>
						<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" data-mdl-for="panel-button">
							<li class="mdl-menu__item"><i class="material-icons">assistant_photo</i> Action</li>
							<li class="mdl-menu__item"><i class="material-icons">print</i> Another action</li>
							<li class="mdl-menu__item"><i class="material-icons">favorite</i> Something else here</li>
						</ul>
					</div>
					<form:form id="cardForm" action="saveCard" method="POST" modelAttribute="card">

						<form:hidden path="id" />
						<div class="card-wrapper"></div>

						<div class="card-body row">
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="cardNumber" class="mdl-textfield__input" type="text" id="number" maxlength="19" required="true" />
									<label class="mdl-textfield__label">CreditCard Number</label>
									<c:if test="${not empty msg}">
										<span class="mdl-textfield__error">${msg}</span>
									</c:if>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="ownerName" class="mdl-textfield__input" type="text" style="text-transform:uppercase;" required="true" />
									<label class="mdl-textfield__label">Owner Name</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<form:input path="expiryMonth" class="mdl-textfield__input" type="number" id="list1" value="" readonly="readonly" required="required" /> <label
										for="list1" class="pull-right margin-0"><i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i></label> <label for="list1"
										class="mdl-textfield__label">Expiry Month</label>
									<ul data-mdl-for="list1" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<c:forEach var = "i" begin = "1" end = "12">
											<c:choose>
												<c:when test="${i <= 9}">
													<li class="mdl-menu__item" data-val="${i}">0${i}</li>
												</c:when>
												<c:otherwise>
													<li class="mdl-menu__item" data-val="${i}">${i}</li>
												</c:otherwise>
											</c:choose>
								     	</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="expiryYear" class="mdl-textfield__input" type="number" required="required" maxlength="2" /> <label class="mdl-textfield__label">Expiry
										Year</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="cvvcode" class="mdl-textfield__input" type="number" min="0" required="true" />
									<label class="mdl-textfield__label">CVV Code</label> <span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<form:input path="balance" class="mdl-textfield__input" type="number" min="0" step=".01" required="true" />
									<label class="mdl-textfield__label">Balance</label> <span class="mdl-textfield__error">Number required!</span>
								</div>
							</div>
							<div class="col-lg-12 p-t-20 text-center">
								<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
								<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="${resources}/assets/plugin/card-master/dist/card.js"></script>

<script>
	var card = new Card({
		// a selector or DOM element for the form where users will
		// be entering their information
		form : '#cardForm', // *required*
		// a selector or DOM element for the container
		// where you want the card to appear
		container : '.card-wrapper', // *required* 

		formSelectors : {
			numberInput : 'input[name="cardNumber"]', // optional — default input[name="number"]
			expiryInput : 'input[name="expiryMonth"], input[name="expiryYear"]', // optional — default input[name="expiry"]
			cvcInput : 'input[name="cvvcode"]', // optional — default input[name="cvc"]
			nameInput : 'input[name="ownerName"]' // optional - defaults input[name="name"]
		},

		messages : {
			validDate : 'expire\ndate',
			monthYear : 'mm/yy'
		},

		placeholders : {
			number : '•••• •••• •••• ••••',
			name : 'Full Name',
			expiry : '••/••',
			cvc : '•••'
		}

	});
</script>