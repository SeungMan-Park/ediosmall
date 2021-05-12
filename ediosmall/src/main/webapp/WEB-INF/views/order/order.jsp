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
			
				<section class="content container-fluid">					

				<div class="container" style="width: 30%; min-width: 900px; background-color: white; font-size: 14px;" >
			
			
				
					<div class="panel panel-default">
					<br>
					<br>
					<h5>* 주문 상품명</h5>
					<br>


						<div class="panel-body">
							<!-- 리스트 -->
							<table class="table table-striped">
								<thead>
									<tr>
									<th scope="col">번호</th>
									<th scope="col">사진</th>
									<th scope="col">상품명</th>
									<th scope="col">수량</th>
									<th scope="col">금액</th>
									</tr>
								</thead>
								<tbody>
									<%-- 데이터가 존재하지 않는 경우 --%>
									<c:if test="${empty cartVOList}">
										<tr>
											<td colspan="5">
												<p style="color:red;">장바구니가 비워있습니다.</p>
											</td>
										</tr>
									</c:if>

									<c:set var="i" value="1"></c:set>
									<c:set var="price" value="0"></c:set>  
									<c:forEach items="${cartVOList }" var="cartList">
										<c:set var="price" value="${cartList.pdtei_price * cartList.cart_amount}"></c:set>								
											<tr>
												<th scope="row">${i}</th>
												<td>
													<img src="/order/displayFile?fileName=${cartList.pdtei_image}">
												</td>
												<td>
													<c:out value="${cartList.pdtei_name}"></c:out>
												</td>
												<td>
													<c:out value="${cartList.cart_amount}"></c:out>EA
												</td>
												<td>
													<fmt:formatNumber type="currency" value="${price}"></fmt:formatNumber>
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
									<td><fmt:formatNumber type="currency" value="${sum}"></fmt:formatNumber></td>
									
								</tr> 
							</table>
						</div>
					</div>
					<br>
					<br>
					<!-- 주문입력정보 -->
					<div class="panel panel-default">
						<div class="panel-body">
							<h5>* 주문자 정보</h5>
							<br>
							
								<div class="form-group">
									<label for="inputName">* 이름</label> <input type="text"
										class="form-control" id="ord_name" name="ord_name" value="${sessionScope.loginStatus.mbei_name}"
										placeholder="이름을 입력해 주세요" style="max-width: 630px;">
									
								</div>
							
							
							
							<div class="form-group">
								<label for="inputAddr">* 주소</label> <br />
								
								<!--  -->
								<input type="text" id="sample6_postcode" name="ord_zipcode" value="${sessionScope.loginStatus.mbei_zipcode}" class="form-control" 
									style="max-width: 510px; width:calc(100% - 128px); margin-right: 5px; display: inline-block;" placeholder="우편번호" readonly>
								<input type="button" onclick="sample6_execDaumPostcode()" id="btn_postCode" class="btn btn-light" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" name="ord_addr1st" value="${sessionScope.loginStatus.mbei_addr1st}" class="form-control" 
									placeholder="주소" style="max-width: 630px; margin:3px 0px;" readonly>
								<input type="text" id="sample6_detailAddress" name="ord_addr2nd" value="${sessionScope.loginStatus.mbei_addr2nd}" class="form-control" 
									placeholder="상세주소" style="max-width: 630px;">
								<input type="hidden" id="sample6_extraAddress" class="form-control" 
									placeholder="참고항목">
								
								 	
								<!-- 
								<input type="text" id="sample6_postcode" name="" class="form-control" placeholder="우편번호" readonly>
								<input type="button" onclick="sample6_execDaumPostcode()" name="" class="form-control" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address"  name="" class="form-control" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress"  name="" class="form-control" placeholder="상세주소">
								<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">	
								 -->	
								
							</div>
							
							<div class="form-group">
								<label for="inputMobile">* 휴대폰 번호</label> <input type="tel"
									class="form-control" id="mbei_phonenum" name="ord_phonenum" value="${sessionScope.loginStatus.mbei_phonenum}"
									placeholder="휴대폰 번호를 입력해 주세요" style="max-width: 630px;">
							</div>
							
							<%--
							<!-- 
							<div id="email_authcode" class="form-group" style="display: none;">
								<label for="inputAuthCode">* 이메일 인증코드</label><br /> 
								<input type="text"
									class="form-control" id="mem_authcode" 
									placeholder="이메일 인증코드를 입력해 주세요" 
									style="max-width: 570px; width:calc(100% - 70px); margin-right: 5px; display: inline-block;" />
								<button id="btn_checkAuthCode" class="btn btn-default" type="button" >확인</button>
							</div>
							 -->
							 --%>
							
							<br>
							<br>
							<h5>* 배송정보</h5>
							<br>
							
							 <!-- 
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
							 
							  <label class="form-check-label" for="defaultCheck1">
							    주문고객 정보와 동일
							  </label>
							   
							</div>
							-->
							
							<form id="orderForm" action="/order/order_buy" method="post">
							<div class="form-group">
								<input type="hidden" name="pdtei_num" value="${pdtei_num }">
								<input type="hidden" name="ord_amount" value="${ord_amount }">
								<input type="hidden" name="ord_price" value="${ord_price }">
								
							
							
									<label for="inputName">* 이름</label> <input type="text"
										class="form-control" id="ord_name" name="ord_name" value="${sessionScope.loginStatus.mbei_name}"
										placeholder="이름을 입력해 주세요" style="max-width: 630px;">
										<input type="hidden" name="type" value="${type}">
							</div>
							
							<div class="form-group">
								<label for="inputAddr">* 주소</label> <br />
								
								<!--  -->
								<input type="text" id="sample6_postcode" name="ord_zipcode" value="${sessionScope.loginStatus.mbei_zipcode}" class="form-control" 
									style="max-width: 510px; width:calc(100% - 128px); margin-right: 5px; display: inline-block;" placeholder="우편번호" readonly>
								<input type="button" onclick="sample6_execDaumPostcode()" id="btn_postCode" class="btn btn-light" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" name="ord_addr1st" value="${sessionScope.loginStatus.mbei_addr1st}" class="form-control" 
									placeholder="주소" style="max-width: 630px; margin:3px 0px;" readonly>
								<input type="text" id="sample6_detailAddress" name="ord_addr2nd" value="${sessionScope.loginStatus.mbei_addr2nd}" class="form-control" 
									placeholder="상세주소" style="max-width: 630px;">
								<input type="hidden" id="sample6_extraAddress" class="form-control" 
									placeholder="참고항목">
								
								 	
								<!-- 
								<input type="text" id="sample6_postcode" name="" class="form-control" placeholder="우편번호" readonly>
								<input type="button" onclick="sample6_execDaumPostcode()" name="" class="form-control" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address"  name="" class="form-control" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress"  name="" class="form-control" placeholder="상세주소">
								<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">	
								 -->	
								
							</div>
							
							<div class="form-group">
								<label for="inputMobile">* 휴대폰 번호</label> <input type="tel"
									class="form-control" id="ord_phonenum" name="ord_phonenum" value="${sessionScope.loginStatus.mbei_phonenum}"
									placeholder="휴대폰 번호를 입력해 주세요" style="max-width: 630px;">
									<input type="hidden" name="ord_price" value="${sum}" />
							</div>
							
							
							<div id="email_authcode" class="form-group" style="display: none;">
								<label for="inputAuthCode">* 이메일 인증코드</label><br /> 
								<input type="text"
									class="form-control" id="mem_authcode" 
									placeholder="이메일 인증코드를 입력해 주세요" 
									style="max-width: 570px; width:calc(100% - 70px); margin-right: 5px; display: inline-block;" />
								<button id="btn_checkAuthCode" class="btn btn-default" type="button" >확인</button>
							</div>
							
							<br>
							<div class="form-group text-center">
								<button type="submit" id="btn_submit" class="btn btn-secondary">
									구매하기 <i class="fa fa-check spaceLeft"></i>
								</button>
								<button type="button" id="btn_cancle" class="btn btn-light">
									구매취소 <i class="fa fa-times spaceLeft"></i>
								</button>
							</div>							
							<br><br><br><br><br>
							
					
						</form>
						
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						 -->
						
						<%-- 우편번호API 동작코드 
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script type="text/javascript" src="/js/member/postCode.js"></script>
						--%>
						
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							    function sample6_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수
							
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("sample6_extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("sample6_extraAddress").value = '';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample6_postcode').value = data.zonecode;
							                document.getElementById("sample6_address").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("sample6_detailAddress").focus();
							            }
							        }).open();
							    }
							</script>
						
					</div>
					</div>
				</div>
				</section>
			</div>
		</main><!-- /.container -->

		<!-- Main Footer -->

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>

		<script>

			$(document).ready(function(){

				var form = $("#orderForm");
				
				 /* 구매버튼 등 클릭 시 */ 
				$("#btn_submit").on("click", function(){

					var result = confirm("구매 하시겠습니까?");
					if(result){
						form.submit(); 
					} else{}

				});


				$("#btn_cancle").on("click", function(){
		
					var result = confirm("구매를 취소하시겠습니까?");
					if(result){
						location.href="/"; 
					} else{}
				});	
				
				
			});

		</script>

  </body>
</html>
