<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<!-- css file -->
<%@include file="/WEB-INF/views/admin/include/head_inc.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
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
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
			<%@include file="/WEB-INF/views/admin/include/main-header.jsp" %>
			
	
		<!-- Left side column. contains the logo and sidebar -->
			<%@include file="/WEB-INF/views/admin/include/main-sidebar.jsp" %>

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

			<!-- Main content -->
			<section class="content container-fluid">
	
	
			

<!-- 주문통계리스트 -->
	<div class="row">
	  	<div class="col-lg-12">
	  		
	  		
	  		<div class="starter-template">
    
    <div class="row">
    	<div class="col-lg-12">
    		<h1 class="page-header">Tables List</h1>
    	</div>
    </div>
        
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    			 Modify Page
    			</div>
    			
    			<div class="panel-body">
    		
    		 	<form role="form" id="myForm" method="post" action="/admin/board/modify">
					  <div class="form-group">
					    <label for="exampleFormControlInput1">BNO</label>
					    <input type="text" name="brd_num" value="<c:out value="${board.brd_num }"></c:out>" class="form-control" readonly> 
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlInput1">Title</label>
					    <input type="text" name="brd_title" value="<c:out value="${board.brd_title }"></c:out>" class="form-control"> 
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlTextarea1">Content</label>
					    <textarea  name="brd_contents" class="form-control" rows="3"><c:out value="${board.brd_contents }"></c:out></textarea> 
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlInput1">Writer</label>
					    <input type="text" name="mbei_id" value="<c:out value="${ board.mbei_id}"></c:out>" class="form-control"  readonly> 
					  </div>
					  
    			 <!-- 리스트버튼,수정버튼을 클릭하면, 수정 폼페이지로 필요한 정보를 보내기위한 작업  -->					  
    			 	<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum }" />
    			 	<input type="hidden" id="amount" name="amount" value="${cri.amount }" />
					<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>					  
    			 </form>					  
					  					  
					  <div class="form-group">
					  
					   <button id="btnRemove" type="button" class="btn btn-danger">Remove</button>
					   <button id="btnModify" type="button" class="btn btn-primary">Modify</button>
					   <button id="btnList"   type="button" class="btn btn-info">List</button>
					  </div>


    			


    			 
    			</div>
    			
    			
    			
    		</div>
    	</div>
    </div>
     
  </div>
	  		
	  		
	  		
	  		
	  	</div>
	  </div>
    
 
 
<script>

  $(document).ready(function(){

	var form = $("#myForm");

	//리스트버튼 클릭
	$("#btnList").click(function(){
		//location.href = "/board/list";  // 페이지 이동(주소)

		form.attr("action","/admin/board/adList").submit();
		//form.submit();

	});	
	
	// 수정버튼 클릭
	$("#btnModify").click(function(){
		//<form>태그정보를 submit작업
		// 리스트, 수정에 따라서 action주소가 다르기때문에 그에 따른 주소작업을 설정한다.
		form.attr("action","/admin/board/modify").submit();
		//form.submit();
	});	
	
	//삭제버튼 클릭
	$("#btnRemove").click(function(){
		//<form>태그정보를 submit작업
		// 리스트, 수정에 따라서 action주소가 다르기때문에 그에 따른 주소작업을 설정한다.
		
		var result = confirm("게시물을 삭제합니까?");
		if(result){
		form.attr("action","/admin/board/remove").submit();
		//form.submit();
		} else {
			
		}
	});	


  });


  
</script>


    

			</section>
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

	<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->


</body>
</html>