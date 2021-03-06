<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<!-- css file -->
<%@include file="/WEB-INF/views/admin/include/head_inc.jsp" %>

<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="canonical"
	href="https://getbootstrap.com/docs/3.4/examples/signin/">

<title>ADMIN SIGNIN</title>


	<script src="/js/admin/join.js"></script>

</head>

<body class="hold-transition skin-blue sidebar-mini">


	<div class="wrapper">

		<!-- Main Header -->
		
			<!-- Left side column. contains the logo and sidebar -->
			<!-- ??????????????? ?????? ??????-->	
		<%@include file="/WEB-INF/views/admin/include/main-header.jsp" %> 
			
		 
		<!-- Left side column. contains the logo and sidebar -->
		

		<%-- <%@include file="/WEB-INF/views/admin/include/main-sidebar.jsp" %> --%>
			
		

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Page Header <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a href="#"><i class="fa fa-dashboard"></i> Level</a>
					</li>
					<li class="active">Here</li>
				</ol>
			</section>
			
<main role="main" class="container">

  <div>
    <%-- Main content --%>
			<section class="content container-fluid">
				<div class="container" style="width: 70%; min-width: 900px; background-color: white; font-size: 14px;" >
					<form id="joinForm" action="/admin/join" method="post">
						<div class="container" style="width: 800px; padding: 10% 5%;">
							<h2 class="form-signin-heading">Please Register</h2>
							<br><br>
							<div class="form-group">
								<label for="InputEmail">* ?????????</label><br /> <input type="text" class="form-control" id="admin_id" name="admin_id"
								placeholder="???????????? ????????? ?????????"	style="max-width:540px; width:calc(100% - 100px); margin-right: 5px; display: inline-block;">
								<button id="btn_checkId" class="btn btn-light" type="button">?????? ??????</button>
								<p id="id_availability" style="color: red;"></p>
							</div>
							<div class="form-group">
								<label for="inputPassword">* ????????????</label> <input type="password"
									class="form-control" id="admin_pw" name="admin_pw"
									placeholder="??????????????? ??????????????????" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputPasswordCheck">* ???????????? ??????</label> <input
									type="password" class="form-control" id="admin_pw_check"
									placeholder="???????????? ????????? ?????? ???????????? ?????? ??? ?????????" style="max-width: 630px;" >
							</div>
							<div class="form-group">
								<label for="inputName">* ??????</label> <input type="text"
									class="form-control" id="admin_name" name="admin_name"
									placeholder="????????? ????????? ?????????" style="max-width: 630px;">
							</div>	
							<div class="form-group">
								<label for="inputName">* ??????????????????</label> <input type="text"
									class="form-control" id="admin_phonenum" name="admin_phonenum"
									placeholder="????????????????????? ???????????????" style="max-width: 630px;">
							</div>	
							<div class="form-group">
								<label for="inputName">* ?????????</label> <input type="text"
									class="form-control" id="admin_email" name="admin_email"
									placeholder="?????????????????? ???????????????" style="max-width: 630px;">
							</div>							
						</div>
						<div class="form-group text-center">
							<button type="button" id="btn_submit" class="btn btn-primary">
								???????????? <i class="fa fa-check spaceLeft"></i>
							</button>
							<button type="button" id="btn_cancle" class="btn btn-warning">
								???????????? <i class="fa fa-times spaceLeft"></i>
							</button>
						</div>
						<br><br><br><br>
					</form>
				</div>
				
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
 

</main><!-- /.container -->			

			
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->

			<%@include file="/WEB-INF/views/admin/include/main-footer.jsp" %>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active">
					<a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a>
				</li>
				<li>
					<a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;"> <i class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design
									<span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading">
								Report panel usage
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 3 -->
		
		<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>