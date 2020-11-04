<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="page-content-wrapper">
	<div class="page-content">
		<div class="page-bar">
			<div class="page-title-breadcrumb">
				<div class=" pull-left">
					<div class="page-title">Add Room Type</div>
				</div>
				<ol class="breadcrumb page-breadcrumb pull-right">
					<li><i class="fa fa-home"></i> &nbsp; <a class="parent-item" href="/admin/dashboard">Dashboard</a> &nbsp; <i class="fa fa-angle-right"></i>
					</li>
					<li><a class="parent-item" href="/admin/room-type">Room Types</a> &nbsp; <i class="fa fa-angle-right"></i></li>
					<li class="active">Add Room Type</li>
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
					<form action="saveRoom" method="POST" id="createForm">
					<div class="card-body row">
						
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="text" id="txtRoomName" name="title"> <label class="mdl-textfield__label">Title</label>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<input class="mdl-textfield__input" type="number" step=".01" name="price"> <label class="mdl-textfield__label" for="text8">Price</label> <span
										class="mdl-textfield__error">Price should be format ####(.##)!</span>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<input class="mdl-textfield__input" name="adult" type="text" id="list2" value="" readonly tabIndex="-1"> <label for="list2"
										class="pull-right margin-0"> <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
									</label> <label for="list2" class="mdl-textfield__label">Adult Capacity</label>
									<ul data-mdl-for="list2" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<li class="mdl-menu__item" data-val="1">1</li>
										<li class="mdl-menu__item" data-val="2">2</li>
										<li class="mdl-menu__item" data-val="3">3</li>
										<li class="mdl-menu__item" data-val="4">4</li>
										<li class="mdl-menu__item" data-val="5">5</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
									<input class="mdl-textfield__input" name="children" type="text" id="list3" value="" readonly tabIndex="-1"> <label for="list2"
										class="pull-right margin-0"> <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
									</label> <label for="list3" class="mdl-textfield__label">Children Capacity</label>
									<ul data-mdl-for="list3" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
										<li class="mdl-menu__item" data-val="1">1</li>
										<li class="mdl-menu__item" data-val="2">2</li>
										<li class="mdl-menu__item" data-val="3">3</li>
										<li class="mdl-menu__item" data-val="4">4</li>
										<li class="mdl-menu__item" data-val="5">5</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-12 p-t-20">
								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
									<textarea class="mdl-textfield__input" name="description" rows="2" id="text7"></textarea>
									<label class="mdl-textfield__label" for="text7">Description</label>
								</div>
							</div>
							
							<!-- <div class="col-lg-12 p-t-20">
								<label class="control-label col-md-3">Upload Room Photos</label>
								<div id="dZUpload" class="dropzone">
									<div class="dz-message">
										<div class="dropIcon">
											<i class="material-icons">cloud_upload</i>
										</div>
										<h3>Drop files here or click to upload.</h3>
										<em> (This is just a demo. Selected files are <strong>not</strong> actually uploaded.)
										</em>
									</div>
								</div>
							</div> -->
						
						<div class="col-lg-12 p-t-20 text-center">
							<button onclick="document.getElementById('createForm').submit();" type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
							<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>