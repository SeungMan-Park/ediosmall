<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <meta name="theme-color" content="#563d7c">
    <title>주문내역</title>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

	  .clearfix col6 {
		list-style-type: none;
		text-align: center;
		margin: 0;
		padding: 0;
	  }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
    </style>
	<%@include file="/WEB-INF/views/common/config.jsp" %>

	<script src="/js/member/edit.js"></script>
  

    

  </head>
  <body>
    
		<!-- nav.jsp -->
		<%@include file="/WEB-INF/views/common/nav.jsp" %>
		
<div class="row">

<div class="col-3">
<%@ include file="/WEB-INF/views/common/nav_main.jsp" %>
</div>

<div class="col-9">
<br>
<%@ include file="/WEB-INF/views/common/category_list_try.jsp" %>
</div>
</div>

	

			<main role="main" class=".container-fluid">

				<div class="row">
				
				<%-- Main content --%>
				<section class="content container-fluid">
				
					<div class="container" style="width: 30%; min-width: 900px; background-color: white; font-size: 14px;" >

					<br>
					<%@include file="/WEB-INF/views/common/mypagelist4.jsp" %>
					
						<div class="panel panel-default">

							<br><br><br>
							
							<div class="panel-body">
							<!-- 리스트 -->
							<table class="table table-striped">
							<thead>
								<tr>
								<!-- <th scope="col">선택</th>  -->
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
								<!-- <th scope="row"><input type="checkbox" value="${orderVO.odr_code}"> </th>  -->
								
								<td>
									${(cri.pageNum - 1) * cri.amount + status.count}
								</td>
								
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${orderVO.ord_date}"/></td>
								
								<td>
									${orderVO.odr_code}
								<!-- 	<button type="button" name="btn_order_detail" data-odr_code="${orderVO.odr_code}" class="btn btn-link">Order Detail</button>  -->
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
							
							<br>
							<div class="row">
								<div class="col-lg-12">
								
									<!-- 페이징 표시 -->
									
										<div class="panel-footer">
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
											<%--
									    				<hr>
									    				${pageMaker }   --%>
										</div>
								</div>
							</div>
				
							<!-- 페이지 번호 클릭시, 수정클릭시 상품코드정보추가, 삭제클릭시 상품코드정보추가 -->		    
							<form id="actionForm" action="/mypage/order_list" method="get">
								<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
								<input type="hidden" name="amount"  value='<c:out value="${pageMaker.cri.amount }" />'>		
								<input type="hidden" name="type"    value='<c:out value="${pageMaker.cri.type }" />'>
								<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
							</form>	


						</div>						
					</div>
					
					</section>	
				</div>

	</main><!-- /.container -->
  
 		<!-- Main Footer -->

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>     

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
			<td>{{ord_amount}}</td>
			<td>{{ord_price}}</td>
			<td>{{total_price ord_price ord_amount}}</td>
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