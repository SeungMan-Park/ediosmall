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
					board list <small>Optional description</small>
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
	
			<div class="row">
		    	<div class="col-lg-12">
		    		<form id="searchForm" action="/admin/board/adList" method="get">
		    			<select name="type" id="type">
		    				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>--</option>
		    				<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected':'' }" />>??????</option>
		    				<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected':'' }" />>??????</option>
		    				<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected':'' }" />>?????????</option>
		    				<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected':'' }" />>?????? or ??????</option>
		    				<option value="TW" <c:out value="${pageMaker.cri.type == 'TW' ? 'selected':'' }" />>?????? or ?????????</option>
		    				<option value="TCW" <c:out value="${pageMaker.cri.type == 'TCW' ? 'selected':'' }" />>?????? or ?????? or ?????????</option>
		    			</select>
		    			<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
		    			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		    			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		    			<button id="btnSearch" class="btn btn-primary" type="button">Search</button>
		    		</form>
		    	</div>
		    </div>
    
			<!-- ????????? ????????? -->        
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
    			<div class="panel-heading text-right">
    			 <button id="regBtn" type="button" class="btn btn-primary pull-right">?????????</button>
    			</div>
    			
    			<div class="panel-body">
    			 <!-- ????????? -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">??????</th>
				      <th scope="col">??????</th>
				      <th scope="col">?????????</th>
				      <th scope="col">?????????</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${list }" var="brdVO">
				    <tr>
				      <th scope="row"><c:out value="${brdVO.brd_num }"></c:out></th>
				      <td><a class="move" href="${brdVO.brd_num }"><c:out value="${brdVO.brd_title }"></c:out></a></td>
				      <td><c:out value="${brdVO.mbei_id }"></c:out></td>
				      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${brdVO.brd_date_reg }"/></td>
				    </tr>
				  </c:forEach>  
				   </tbody>
				</table>
    			</div>
    		
    	

   
  
    <div class="row">
    	<div class="col-lg-12">
    	<!-- ????????? ?????? -->
    			<div class="panel-footer" style="text-align: center;">
    			   <ul class="pagination">
    			   <c:if test="${pageMaker.prev }">
					    <li class="page-item">
					      <a href="${pageMaker.startPage - 1 }" class="page-link" href="#" tabindex="-1">Prev</a>
					    </li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="num">
				    	<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
				    		<a href="${num }" class="page-link" href="#">${num }</a>
				    	</li>
				    </c:forEach>
				    <c:if test="${pageMaker.next }">
					    <li class="page-item">
					      <a href="${pageMaker.endPage + 1 }" class="page-link" href="#">Next</a>
					    </li>
				    </c:if>
				  </ul>
		
							<!--
			    				<hr>    				
			    				${pageMaker }  -->
    			</div>
    	</div>
    </div>

	<form id="actionForm" action="/admin/board/adList" method="get">	
		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
		<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>



				</div>
		 	</div>
		</div>

    
 			</section>
			<!-- /.content -->
 
<script>

  $(document).ready(function(){

	
	var result = '${result}';
	if(result == 'modify'){
		alert('?????????????????????.');
	}else if(result == 'remove'){
		alert('?????????????????????.');
	}

	var searchForm = $("#searchForm");

	var actionForm = $("#actionForm");
	// ?????? ????????? ?????? ????????? ??????.
	$(".move").on("click", function(e){
		// ????????? ?????????????????????(?????????,??????)??? ??????????????? ????????? ??????
		// form?????? ??????

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // ????????? ??????????????? ??????????????? ????????? ??????.
		actionForm.append("<input type='hidden' name='brd_num' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/admin/board/read");
		actionForm.submit();
	});

	// [prev] 1 2 3 4 5 [next]
	$(".page-item a").on("click", function(e){
		e.preventDefault();

		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();

	});
	//???????????? ????????? ???????????? ???????????? ??????????????? on ?????? ???????????? ??????.
	$("#searchForm #btnSearch").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("??????????????? ???????????????");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("???????????? ???????????????");
			return false;
		}

		// ????????? ???????????? 1??? ???????????? ??????.
		// ??????????????? ????????? ?????????????????? ???????????? ??????????????? ???????????? ??????.
		searchForm.find("input[name='pageNum']").val("1");

		e.preventDefault();

		searchForm.submit();

	});



  });


  
</script> 


	<script src="/js/member/edit.js"></script>
  
    <script>
    	$(document).ready(function(){
	        $("#regBtn").click(function(){
	          location.href = "/admin/board/register";
	        });
      });
    </script>
    
    
    


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