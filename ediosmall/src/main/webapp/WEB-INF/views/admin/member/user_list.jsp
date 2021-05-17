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
					user_list <small>Optional description</small>
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
					<form id="searchForm" action="/admin/member/user_list" method="get">					
						<select name="type" id="type">
							<option value=""    <c:out value="${pageMaker.cri.type == null  ? 'selected' : '' }" />>--</option>
							<option value="N"   <c:out value="${pageMaker.cri.type == 'N'   ? 'selected' : '' }" />>아이디</option>
							<option value="D"   <c:out value="${pageMaker.cri.type == 'D'   ? 'selected' : '' }" />>이름</option>
							<option value="C"   <c:out value="${pageMaker.cri.type == 'C'   ? 'selected' : '' }" />>닉네임</option>
							<option value="ND"  <c:out value="${pageMaker.cri.type == 'ND'  ? 'selected' : '' }" />>아이디or이름</option>
							<option value="NC"  <c:out value="${pageMaker.cri.type == 'NC'  ? 'selected' : '' }" />>아이디or닉네임</option>
							<option value="NDC" <c:out value="${pageMaker.cri.type == 'NDC' ? 'selected' : '' }" />>아이디or이름+닉네임</option>
						</select>
							<input type="text"   name="keyword" value="${pageMaker.cri.keyword }">
			    			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			    			<input type="hidden" name="amount"  value="${pageMaker.cri.amount  }">
			    			<button id="btnSearch" class="btn btn-primary" type="button">검색</button>					
					</form>
				</div>
			
			</div>


			<!-- 상품리스트 -->
	<div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
				<!--
    			<div class="panel-heading">
   			 BoardList.  <button id="regBtn" type="button" class="btn btn-primary pull-right">글쓰기</button>  
    			</div>--> 
    			
    			<div class="panel-body">
    			 <!-- 리스트 -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">아이디</th>
					  <th scope="col">이름</th>
				      <th scope="col">닉네임</th>
				      <th scope="col">이메일주소</th>
				      <th scope="col">가입일</th>
				      <th scope="col">기본정보</th>
				      <th scope="col">비밀번호</th>
				      <th scope="col">일반계정</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:set var="i" value="${cri.pageNum }" />
				  <c:forEach items="${user_list }" var="user_list" varStatus="status">
				    <tr>
				      <td>${(cri.pageNum - 1) * cri.amount + status.count}</td>
				      <td>
				      	<c:out value="${user_list.mbei_id }"></c:out>
				      </td>
					  <td>
						<c:out value="${user_list.mbei_name }"></c:out>
					  </td>
					  <td>
						<c:out value="${user_list.mbei_nickname_u }"></c:out>
					  </td>
					  <td>
						<c:out value="${user_list.mbei_email }"></c:out>
					  </td>
				      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${user_list.mbei_date_sub }"/></td>
				      <td>
				      	<button type="button" data-mbei_id="${user_list.mbei_id}" class="btn btn-primary btn-edit">수정</button>
				      </td>
				      <td>
				      	<button type="button" data-mbei_id="${user_list.mbei_id}" class="btn btn-primary btn-edit-pw">변경</button>
				      </td>
				      <td>
				      	<button type="button" data-mbei_id="${user_list.mbei_id}" class="btn btn-primary btn-edit-del">삭제</button>
				      </td>
				    </tr>
				   </c:forEach>
				   </tbody>
				</table>
    			</div>
    			
    			
    			<div class="row">
			    	<div class="col-lg-12">
			    		<!-- 페이징 표시 -->

			    			<div class="panel-footer" style="text-align: center;">
							<nav aria-label="Page navigation example">	
								<ul class="pagination justify-content-center">
								  <c:if test="${pageMaker.prev}">
									    <li class="page-item">
									      <a href="${pageMaker.startPage - 1 }" class="page-link" href="#" tabindex="-1" >Prev</a>
									    </li>
								  </c:if>  
								    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="num">
								   	  <li class="page-item  ${pageMaker.cri.pageNum == num ? "active" : ""}">
								   	  	<a href="${num }" class="page-link" href="#">${num}</a></li>
								    </c:forEach>
								  
								  <c:if test="${pageMaker.next}">
									    <li class="page-item">
									      <a href="${pageMaker.endPage + 1 }" class="page-link" href="#">Next</a>
									    </li>
								  </c:if>    
								</ul>
							</nav>	  
							<!--
			    				<hr>    				
			    				${pageMaker }  -->
			    			</div>
			    			
			    			
			    			
			    			
			    	</div>
			    </div>
	
	<!-- 페이지 번호 클릭시, 수정클릭시 상품코드정보추가, 삭제클릭시 상품코드정보추가 -->		    
	<form id="actionForm" action="/admin/member/user_list" method="get">
		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
		<input type="hidden" name="amount"  value='<c:out value="${pageMaker.cri.amount }" />'>		
		<input type="hidden" name="type"    value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>
			    
    			
    		</div>
    	</div>
    </div>
				
				
				
				

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

	<!-- jQuery 3 -->
		
		<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->



<script>

	$(document).ready(function(){

		var actionForm = $("#actionForm");

		$(".page-item a").on("click", function(e){

			e.preventDefault();

			console.log("click");

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();

		});

		// 수정 클릭시
		$("table td .btn-edit").on("click", function(){
			console.log('수정');
			
			// 아이디값을 필드로 추가작업
			actionForm.append("<input type='hidden' name='mbei_id' value='" + $(this).attr("data-mbei_id") + "'>");

			actionForm.attr("action", "/admin/member/user_modify");
			actionForm.submit();

		});

		// 계정삭제 클릭시
		$("table td .btn-edit-pw").on("click", function(){
			console.log('비번변경');
			
			// 아이디값을 필드로 추가작업
			actionForm.append("<input type='hidden' name='mbei_id' value='" + $(this).attr("data-mbei_id") + "'>");

			actionForm.attr("action", "/admin/member/user_modify_pw");
			actionForm.submit();

		});		
		

		// 삭제 클릭시
		$("table td .btn-edit-del").on("click", function(){
			console.log('삭제');
			
			// 아이디값을 필드로 추가작업
			actionForm.append("<input type='hidden' name='mbei_id' value='" + $(this).attr("data-mbei_id") + "'>");

			actionForm.attr("action", "/admin/member/regDelete");
			actionForm.submit();

		});



		var searchForm = $("#searchForm");

		$("#searchForm #btnSearch").on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}

			if(!searchForm.find("input[name='keyword']").val()){
				alert("검색어를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();
		});

	});
	


</script>
</body>
</html>