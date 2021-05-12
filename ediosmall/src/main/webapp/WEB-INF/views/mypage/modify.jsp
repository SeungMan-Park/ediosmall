<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <meta name="theme-color" content="#563d7c">
    <title>회원정보수정</title>
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
						<%@include file="/WEB-INF/views/common/mypagelist2.jsp" %>
					
						<form id="modifyForm" action="/member/modify" method="post">
						
						<div  class="container" style="width: 800px; padding: 10% 5%;">
						
							<h4 class="form-signin-heading" style="text-align: center;">회원정보 수정</h4>
							<br><br><c:out value="" />
							
							<div class="form-group" style="width:100%;">
								<label for="inputId">* 아이디</label> <br /> <input type="text"
									class="form-control" id="mbei_id" name="mbei_id" value="<c:out value="${vo.mbei_id}"/>"
									placeholder="아이디를 입력해 주세요" readonly
									style="max-width:540px; width:calc(100% - 100px); margin-right: 5px; display: inline-block;">
							</div>
							
							<div class="form-group">
								<label for="inputPassword">* 비밀번호</label> <input type="password"
									class="form-control" id="mbei_password" name="mbei_password" 
									placeholder="비밀번호를 입력해주세요" style="max-width: 630px;">
							</div>
							
							<div class="form-group">
								<label for="inputName">* 이름</label> <input type="text"
									class="form-control" id="mbei_name" name="mbei_name" value="<c:out value="${vo.mbei_name}"/>"
									placeholder="이름을 입력해 주세요"  readonly style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputNickName">* 닉네임</label> <input type="text"
									class="form-control" id="mbei_nickname_u" name="mbei_nickname_u" value="<c:out value="${vo.mbei_nickname_u}"/>"
									placeholder="사용할 닉네임을 입력해 주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="InputEmail">* 이메일 주소</label><br /> <input type="email"
									class="form-control" id="mbei_email" name="mbei_email" value="<c:out value="${vo.mbei_email}"/>"
									placeholder="이메일 주소를 입력해주세요"
									style="max-width: 526px; width:calc(100% - 115px); margin-right: 5px; display: inline-block;">
							</div>
							<div class="form-group">
								<label for="inputMobile">* 휴대폰 번호</label> <input type="tel"
									class="form-control" id="mbei_phonenum" name="mbei_phonenum" value="<c:out value="${vo.mbei_phonenum}"/>"
									placeholder="휴대폰 번호를 입력해 주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputAddr">* 주소</label> <br />
								
								<!--  -->
								<input type="text" id="sample6_postcode" name="mbei_zipcode" class="form-control" 
	 								value="<c:out value="${vo.mbei_zipcode}"/>"
									style="max-width: 510px; width:calc(100% - 128px); margin-right: 5px; display: inline-block;" placeholder="우편번호" readonly>
								<input type="button" onclick="sample6_execDaumPostcode()" id="btn_postCode" class="btn btn-light" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" name="mbei_addr1st" class="form-control"
									value="<c:out value="${vo.mbei_addr1st}"/>"
									placeholder="주소" style="max-width: 630px; margin:3px 0px;" readonly>
								<input type="text" id="sample6_detailAddress" name="mbei_addr2nd" class="form-control" 
									value="<c:out value="${vo.mbei_addr2nd}"/>"
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
								<label>* 수신 동의</label><br /> 
								이벤트 등 프로모션 메일 알림 수신에 동의합니다.
								<label><input type="radio" name="mbei_approval" value="Y" style="margin-left: 20px;" <c:out value="${vo.mbei_approval == 'Y'?'checked':''}"/>> 예</label>
	      						<label><input type="radio" name="mbei_approval" value="N" style="margin-left: 20px;" <c:out value="${vo.mbei_approval == 'N'?'checked':''}"/>> 아니오</label>
							</div>
						</div>
						<div class="form-group text-center">
							<button type="button" id="btn_submit" class="btn btn-secondary">
								회원수정 <i class="fa fa-check spaceLeft"></i>
							</button>
							<button type="button" id="btn_cancle" class="btn btn-light">
								취소 <i class="fa fa-times spaceLeft"></i>
							</button>
						</div>
						<br><br><br><br>
					</form>
				</div>

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
			</section>


		</div>
		<!-- /.content-wrapper -->

		</main><!-- /.container -->
		<!-- Main Footer -->

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>
      
  </body>
</html>