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
    <title>비밀번호 수정</title>
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

	<script src="/js/member/modify_pw.js"></script>
  

    

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
		
		<div class="col-3">
		<br><br>
		<h4 style="color: black; text-align:center;">MyPage</h4>
		</div>
	
		<div class="col-6">
								
		<%-- Main content --%>
		<section class="content container-fluid">		
				
					<div class="container" style="width: 30%; min-width: 900px; background-color: white; font-size: 14px;" >
					
						<br>
						<%@include file="/WEB-INF/views/common/mypagelist3.jsp" %>					
					
						<form id="modifyForm_pw" action="/mypage/modify_pw" method="post">
						<div  class="container" style="width: 800px; padding: 10% 5%;">
							<h4 class="form-signin-heading" style="text-align: center;">비밀번호 수정</h4>
							<br><br><c:out value="" />
							
							<div class="form-group">
								<label for="inputPassword">* 현재 비밀번호</label> <input type="password"
									class="form-control" id="mbei_password_ch" name="mbei_password_ch" 
									placeholder="현재 비밀번호를 입력해주세요" style="max-width: 630px;">
							</div>							
							
							<div class="form-group">
								<label for="inputPassword">* 변경할 비밀번호</label> <input type="password"
									class="form-control" id="mbei_password" name="mbei_password" 
									placeholder="비밀번호를 입력해주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputPasswordCheck">* 변경할 비밀번호 확인</label> <input
									type="password" class="form-control" id="mbei_password_check" name="mbei_password_check"
									placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" style="max-width: 630px;" >
							</div>
							</div>
							<div class="form-group text-center">
								<button type="button" id="btn_submit_mpw" class="btn btn-secondary">
									회원수정 <i class="fa fa-check spaceLeft"></i>
								</button>
								<button type="button" id="btn_cancle" class="btn btn-light">
									취소 <i class="fa fa-times spaceLeft"></i>
								</button>
							</div>						
							
						<br><br><br><br>
					</form>
					</div>
				</section>	
</div>
				</div>
		</main><!-- /.container -->

		<!-- Main Footer -->

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>
      
  </body>
</html>