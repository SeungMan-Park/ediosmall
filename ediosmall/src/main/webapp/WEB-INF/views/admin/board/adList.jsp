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
    			<div class="panel-heading text-right">
    			 <button id="regBtn" type="button" class="btn btn-primary pull-right">글쓰기</button>
    			</div>
    			
    			<div class="panel-body">
    			 <!-- 리스트 -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성일</th>
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
    		</div>
    	</div>
    </div>
    
    <!-- 검색 / 페이징 -->
    <div class="row">
    	<div class="col-lg-12">
    		<form id="searchForm" action="/mypage/board/list" method="get">
    			<select name="type" id="type">
    				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>--</option>
    				<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected':'' }" />>제목</option>
    				<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected':'' }" />>내용</option>
    				<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected':'' }" />>작성자</option>
    				<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected':'' }" />>제목 or 내용</option>
    				<option value="TW" <c:out value="${pageMaker.cri.type == 'TW' ? 'selected':'' }" />>제목 or 작성자</option>
    				<option value="TCW" <c:out value="${pageMaker.cri.type == 'TCW' ? 'selected':'' }" />>제목 or 내용 or 작성자</option>
    			</select>
    			<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
    			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    			<button id="btnSearch" class="btn btn-primary" type="button">Search</button>
    		</form>
    	</div>
    </div>
    <div class="row">
    	<div class="col-lg-12">
    	<!-- 페이징 표시 -->
    			<div class="panel-footer">
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
		
		    				<hr>
		    				${pageMaker }
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
    
 
 
<script>

  $(document).ready(function(){

	
	var result = '${result}';
	if(result == 'modify'){
		alert('수정되었습니다.');
	}else if(result == 'remove'){
		alert('제거되었습니다.');
	}

	var searchForm = $("#searchForm");

	var actionForm = $("#actionForm");
	// 제목 클릭시 다음 주소로 이동.
	$(".move").on("click", function(e){
		// 링크시 쿼리스트링정보(페이징,검색)를 다음주소로 보내는 작업
		// form태그 사용

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // 태그가 가지고있는 기본이벤트 성격을 취소.
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
	//동적으로 추가된 요소에는 이벤트를 설정할려면 on 으로 작업해야 한다.
	$("#searchForm #btnSearch").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 선택하세요");
			return false;
		}

		// 검색시 페이지를 1로 시작해야 한다.
		// 리스트에서 변경된 페이지번호가 사용하여 검색결과가 안나올수 있다.
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