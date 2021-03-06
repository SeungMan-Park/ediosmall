<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>eidos fashion Bootstrap v4.6</title>
    
<%@include file="/WEB-INF/views/common/config.jsp" %>

<meta name="theme-color" content="#563d7c">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
  </head>
  <body>
    
		<!-- nav.jsp -->
		<%@ include file="/WEB-INF/views/common/nav.jsp" %>
		
		
		
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
			
			<div class="col-3">
			<br><br>
			<h4 style="color: black; text-align:center;">CartList</h4>
			</div>
		
			<div class="col-6">
			
			<%-- Main content --%>
			<section class="content container-fluid">
			
			<div class="container" style="width: 30%; min-width: 1000px; background-color: white; font-size: 14px;" >	
				
					<div class="panel panel-default">
						<div class="panel-heading text-right">
							<button id="btn_cart_check_del" type="button" class="btn btn-secondary pull-right">선택삭제</button>
						</div>

						<div class="panel-body">
							<!-- 리스트 -->
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col"><input type="checkbox" id="check_all"></th>
										<th scope="col">번호</th>
										<th scope="col">사진</th>
										<th scope="col">상품명</th>
										<th scope="col">주문수량</th>
										<th scope="col">금액</th>
										<th scope="col">배송비</th>
										<th scope="col">취소</th>
									</tr>
								</thead>
								<tbody>
									<%-- 데이터가 존재하지 않는 경우 --%>
									<c:if test="${empty cartVOList}">
										<tr>
											<td colspan="8">
												<p style="color:red;">장바구니가 비워있습니다.</p>
											</td>
										</tr>
									</c:if>

									<c:set var="i" value="1"></c:set>
									<c:set var="price" value="0"></c:set>  
									<c:forEach items="${cartVOList }" var="cartList">
										<c:set var="price" value="${cartList.pdtei_price * cartList.cart_amount}"></c:set>								
											<tr>
												<td>
													<input type="checkbox" name="cart_check" value="${cartList.cart_code}">
												</td>
												<th scope="row">${i}</th>
												<td>
												
												<a href="/product/product_read?pdtei_num=${cartList.pdtei_num}">
													<img src="/cart/displayFile?fileName=${cartList.pdtei_image}">
												</a>	
													
												</td>
												<td>
													<c:out value="${cartList.pdtei_name}"></c:out>
												</td>
												<td>
													<input type="number" value="<c:out value="${cartList.cart_amount}"></c:out>" name="cart_amount" />
													<button type="button" name="btnCartEdit" data-cart_code="${cartList.cart_code}" class="btn btn-link">Edit</button>
												</td>
												<td data-price="${price}">
													<fmt:formatNumber type="currency" value="${price}"></fmt:formatNumber>
												</td>
												<td>[기본배송조건]</td>
												<td>
													<button type="button" name="btnCartDel" data-cart_code="${cartList.cart_code}" class="btn btn-link">Delete</button>
												</td>								
											</tr>
										<c:set var="i" value="${i+1}"></c:set>
										<c:set var="sum" value="${sum + price }"></c:set>
									</c:forEach>							
								</tbody>
							</table>
						</div>

						<div id="sum_price" class="panel-body">
							<table class="table table-striped">
								<tr>
									<td>총 금액</td>
									<td data-sum="${sum}"><fmt:formatNumber type="currency" value="${sum}"></fmt:formatNumber></td>
								</tr> 
							</table>
						</div>

						<div>
							<table>
								<tr>
									<td>
									<button name="btn_cart_clear" type="button" class="btn btn-link">장바구니 비우기</button>
									

									<button name="btn_order" type="button" class="btn btn-link">전체상품 주문</button>
									<button name="btn_chk_order" type="button" class="btn btn-link">선택상품 주문</button>
						
								
								
									</td>
								</tr> 
							
							
							<%--<c:forEach items="${cartVOList2 }" var="cartList2">
								<tr>
									<td>
									<button name="btn_cart_clear" type="button" class="btn btn-link">장바구니 비우기</button>
									

								<c:if test="${cartList2.pdtei_amount != 0}">
									<button name="btn_order" type="button" class="btn btn-link">전체상품 주문</button>
									<button name="btn_chk_order" type="button" class="btn btn-link">선택상품 주문</button>
								</c:if>
						
								<c:if test="${cartList2.pdtei_amount == 0}">
									<span style="color: red;">상품페이지에 재고량 관련 댓글을 남겨주시면, 우선적으로 제고량을 확보하기 위해 노력하겠습니다. </span>
								</c:if>	
								
								
									</td>
								</tr> 
							 	
							</c:forEach>
							--%>
							</table>
						</div>
						</div>
					</div>
					</section>
					</div>
				</div>
		</main><!-- /.container -->

		<!-- Main Footer -->
	<br><br><br><br><br><br><br><br>
		<%@include file="/WEB-INF/views/common/footer2.jsp" %>


		<script>

			$(document).ready(function(){

				// 작업1> 장바구니상품 개별삭제
				$("button[name='btnCartDel']").on("click", function(){

					// console.log("장바구니 삭제");

					var cart_code = $(this).attr("data-cart_code");

					var cart_tr = $(this).parents("tr");

					var cart_price = cart_tr.find("td[data-price]").attr("data-price");

					console.log(cart_price);

					var sum_price = $("div#sum_price td[data-sum]").attr("data-sum");

					console.log(sum_price);

					$.ajax({
						url: '/cart/delete',
						type: 'post',
						dataType: 'text',  
						data: {cart_code : cart_code}, 
						success : function(data){
							if(data== 'SUCCESS'){
								
								alert("장바구니 상품: " + cart_code + "가 삭제되었습니다.");
								// location.href = "/cart/cart_list";


								// 행을 화면에서 제거
								cart_tr.remove();

								// 합계 계산

								sum_price = parseInt(sum_price) - parseInt(cart_price);
								$("div#sum_price td[data-sum]").attr("data-sum" ,sum_price); // 삭제시 값이 변경이 지속적으로 처리해야 한다.
								$("div#sum_price td[data-sum]").text(sum_price);																				
							}
						}					
					});
				});

				// 수량텍스트박스 변경이벤트 작업
				$("input[name='cart_amount']").on("change", function(){
					console.log("수량변경");

				});


				// 작업2> 수량변경 수정버튼 클릭시
				// <button type="button" name="btnCartEdit"
				$("button[name='btnCartEdit']").on("click", function(){

					console.log("수량버튼변경");

					// 주요 파라미터 : 장바구니 코드, 변경된 수량

					// <input type="number" value="<c:out value="${cartList.cart_amount}"></c:out>" name="cart_amount" />
					var cart_code = $(this).attr("data-cart_code");
					var cart_amount = $(this).parent().find("input[name='cart_amount']").val();
					// var qty = $(this).siblings("input[name='cart_amount']").val();  // cart_tr.find("input[name='cart_amount']").val();

					console.log(cart_code);
					console.log(cart_amount);
					var cart_tr = $(this).parents("tr");

					$.ajax({
						url: "/cart/cart_amount_update",
						type: "post",
						data: {cart_code : cart_code, cart_amount : cart_amount},
						dataType: 'text',  
						success : function(data){
							if(data== 'SUCCESS'){
								alert("수량이 변경되었습니다.");
							}
						}
					});

				});

				// 장바구니 비우기
				$("button[name='btn_cart_clear']").on("click", function(){

					console.log("장바구니 비우기");
					location.href = "/cart/cart_all_delete";

				});

				// 장바구니 비우기2
				$("button[name='btn_cart_clear2']").on("click", function(){

					console.log("장바구니 비우기");

					$.ajax({
						url: '/cart/cart_all_delete2',
						type: 'post',
						dataType: 'text',  
						success : function(data){
							if(data== 'SUCCESS'){								
								alert("장바구니를 비웠습니다.");
								location.href = "/cart/cart_list";																				
							}
						}					
					});
					
				});

				// <button name="btn_order"
				// 주문하기 이동
				$("button[name='btn_order']").on("click", function(){
					location.href = "/order/order?type=2";
				});

				
				// btn_chk_order
				// 선택상품 주문
				$("button[name='btn_chk_order']").on("click", function(){

					// console.log("선택삭제");
					// console.log($("input[name='cart_check']:checked").length);

					if($("input[name='cart_check']:checked").length == 0){
						alert("구매할 상품을 선택하세요.");
						return;
					}

					var result = confirm("선택한 상품을 구매하시겠습니까?");

					if(result){
						var checkArr = [];

						$("input[name='cart_check']:checked").each(function(){
							var cart_code = $(this).val();
							checkArr.push(cart_code);
						});


						$.ajax({
							url: '/cart/cart_check_order',
							type: 'post',
							data: {checkArr : checkArr}, 
							dataType: 'text',  
							success : function(data){
								if(data== 'SUCCESS'){								
									// alert("선택된 상품이 삭제되었습니다.");
									location.href = "/order/order?type=2";
																					
								}
							}						
						});

					}

				});
			


				// 장바구니 선택삭제 <input type="checkbox" name="cart_check" value="${cartList.cart_code}" >
				$("#btn_cart_check_del").on("click", function(){

					// console.log("선택삭제");
					// console.log($("input[name='cart_check']:checked").length);

					if($("input[name='cart_check']:checked").length == 0){
						alert("삭제할 상품을 선택하세요.");
						return;
					}

					var result = confirm("선택한 상품을 삭제하시겠습니까?");

					if(result){
						var checkArr = [];

						$("input[name='cart_check']:checked").each(function(){
							var cart_code = $(this).val();
							checkArr.push(cart_code);
						});


						$.ajax({
							url: '/cart/cart_check_delete',
							type: 'post',
							data: {checkArr : checkArr}, 
							dataType: 'text',  
							success : function(data){
								if(data== 'SUCCESS'){								
									alert("선택된 상품이 삭제되었습니다.");
									location.href = "/cart/cart_list";
																					
								}
							}						
						});

					}

				});

				// 제목행의 체크박스 선택시 전체시 전체선택기능
				$("#check_all").on("click", function(){
					$("input[name='cart_check']").prop("checked", this.checked);
				});

				// 데이터 행의 체크박스 클릭
				$("input[name='cart_check']").on("click", function(){

					if($("input[name='cart_check']:checked").length == $("input[name='cart_check']").length){
						$("#check_all").prop("checked", true);
					}else{
						$("#check_all").prop("checked", false);
					}
				});

			});
			
		</script>
  </body>
</html>
