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
					order_list <small>Optional description</small>
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
					<form id="searchForm" action="/admin/product/pro_list" method="get">					
						<select name="type" id="type">
							<option value=""    <c:out value="${pageMaker.cri.type == null  ? 'selected' : '' }" />>--</option>
							<option value="N"   <c:out value="${pageMaker.cri.type == 'N'   ? 'selected' : '' }" />>상품명</option>
							<option value="D"   <c:out value="${pageMaker.cri.type == 'D'   ? 'selected' : '' }" />>상품설명</option>
							<option value="C"   <c:out value="${pageMaker.cri.type == 'C'   ? 'selected' : '' }" />>제조사</option>
							<option value="ND"  <c:out value="${pageMaker.cri.type == 'ND'  ? 'selected' : '' }" />>상품명or상품설명</option>
							<option value="NC"  <c:out value="${pageMaker.cri.type == 'NC'  ? 'selected' : '' }" />>상품명or상품회사</option>
							<option value="NDC" <c:out value="${pageMaker.cri.type == 'NDC' ? 'selected' : '' }" />>상품명or내용+상품회사</option>
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
				      <th scope="col">선택</th>
				      <th scope="col">번호</th>
				      <th scope="col">주문일시</th>
				      <th scope="col">주문번호</th>
				      <th scope="col">주문자</th>
				      <th scope="col">받는분</th>
				      <th scope="col">금액</th>
				      <th scope="col">처리상태</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:set var="i" value="${cri.pageNum }" />
				  <c:forEach items="${order_list }" var="orderVO" varStatus="status">
				    <tr>
				      <th scope="row"><input type="checkbox" value="${orderVO.odr_code}"> </th>
				      
				      <td>
				      	${(cri.pageNum - 1) * cri.amount + status.count}
				      </td>
				      
				      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${orderVO.ord_date}"/></td>
				      
				      <td>
				      	${orderVO.odr_code}
				      	<button type="button" name="btn_order_detail" data-odr_code="${orderVO.odr_code}" class="btn btn-link">Order Detail</button> / <button type="button" name="btn_order_detail_close"class="btn btn-link">Order Detail Close</button> 
				      </td>
				      
				      <td>${orderVO.mbei_id}</td>
				      
				      <td>${orderVO.ord_name}</td>
				      				      				      
				      <td>
				      	<fmt:formatNumber type="currency" value="${orderVO.ord_price }"></fmt:formatNumber>
				      </td>
				      
				      <td>
				      	처리상태
				      </td>
				    </tr>
				   </c:forEach>
				   </tbody>
				</table>
    			</div>
    			
    			
    			<div class="row">
			    	<div class="col-lg-12">
			    		<!-- 페이징 표시 -->
			    			<div class="panel-footer"  style="text-align: center;">
								  <ul class="pagination">
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
							
							<!--
			    				<hr>    				
			    				${pageMaker }  -->
			    			</div>
			    	</div>
			    </div>
	
	<!-- 페이지 번호 클릭시, 수정클릭시 상품코드정보추가, 삭제클릭시 상품코드정보추가 -->		    
	<form id="actionForm" action="/admin/order/order_list" method="get">
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
	
		// 	<button type="button" name="btn_order_detail" data-odr_code="${orderVO.odr_code}"
		$("button[name='btn_order_detail']").on("click", function(){

			console.log("상품상세");

			// 파라미터 : 주문번호확보

			var odr_code = $(this).attr("data-odr_code");

			console.log(odr_code);
			
			var current_tr = $(this).parents("tr");

			// ajax호출작업 : url? 컨트롤러 매핑주소 생성하고, PostMan 테스트
			$.ajax({
				url : "/admin/order/orderDetailSeen",
				type : "get",
				data :  { 
							odr_code : odr_code  // <input type = "text" name = "odr_code" value="20"
						},
				dataType : "json",
				success : function(data){

					// alert(data.length);
					// 함수호출 subCategoryList
					orderDetailView(data, current_tr, $("#orderDetailTemplete"));

				}
				
			});

			
		});

		$("button[name='btn_order_detail_close']").on("click", function(){
			// alert("버튼테스트");

			//$("#orderDetailTemplete").off();
			$(".dy_order_detail").remove();


		});



	});
</script>     

<script>
								// 주문상세내역		// 	선택했던tr정보   // 
	var orderDetailView = function(orderDetailData, orderDetailTarget, orderDetailTemplete){
		var detailTemplete = Handlebars.compile(orderDetailTemplete.html());
		var details = detailTemplete(orderDetailData);

		console.log(details);

		$(".dy_order_detail").remove();  // 기존 option태그 제거
		orderDetailTarget.after(details);  // 새로운 2차 카테고리 option태그 추가
		
	}
</script>



<!-- 주문상세 데이터와 결합된 태그를 구성 //  tr 수준 밑에 넣어야 한다. -->
<!-- tr 테그를 작업해야 한다. -->
<script id="orderDetailTemplete" type="text/x-handlebars-template">

	<tr class="dy_order_detail"><td colspan="8">주문상세내역</td></tr>
	<tr class="dy_order_detail" style="background: #60c1ee;">
		<th>선택</th><th>번호</th><th>이미지</th><th>상품명</th><th>수량</th><th>상품가격</th><th>소개</th><th colspan="2">비고</th>
	</tr>
	{{#each .}}
	<tr class="dy_order_detail" style="background: white;">
		<td>선택</td>
		<td>번호</td>
		<td><img src="/admin/order/displayFile?fileName={{pdtei_image}}"></td>	
			
		<td>{{pdtei_name}}</td>
		<td>{{ord_amount}}개</td>
		<td>{{ord_price}}원</td>
		<td>{{total_price ord_price ord_amount}}원</td>
		<td colspan="2">비고</td>
	</tr>
	{{/each}}

</script>


<script>
//핸들바의 사용자정의 함수

Handlebars.registerHelper("total_price", function(ord_price, ord_amount){
	
	return ord_price * ord_amount;
});
</script>

<script>

	// 페이지번호 클릭
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
			
			// 상품번호값을 필드로 추가작업
			actionForm.append("<input type='hidden' name='pdtei_num' value='" + $(this).attr("data-pdtei_num") + "'>");

			actionForm.attr("action", "/admin/product/modify");
			actionForm.submit();

		});


		// 삭제 클릭시
		$("table td .btn-del").on("click", function(){
			console.log('삭제');
			
			// 상품번호값을 필드로 추가작업
			actionForm.append("<input type='hidden' name='pdtei_num' value='" + $(this).attr("data-pdtei_num") + "'>");
			actionForm.append("<input type='hidden' name='pdtei_image' value='" + $(this).attr("data-pdtei_image") + "'>");

			actionForm.attr("action", "/admin/product/delete");
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