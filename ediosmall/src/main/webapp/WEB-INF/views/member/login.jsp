<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>Study DocMall - Bootstrap v4.6</title>

<%@include file="/WEB-INF/views/common/config.jsp" %>

<script src="/js/member/login.js"></script>
   
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


    
  <!-- 콘텐츠 내용 -->    

<div role="main" class="container">

    <!-- Content Wrapper. Contains page content -->
		<div class="wrapper">
			<%-- Main content  로그인 UI --%>
			<section class="content container-fluid">
				<div class="container" style="width: 450px; height:620px; background-color: white; margin-top:30px;">
					<form id="loginForm" class="form-signin" action="/member/loginPost" method="post" style="padding:50px 30px;">
						<h4 class="form-signin-heading" style="text-align: center;">Log In</h4>
						<br><br>
						<label for="inputId" class="sr-only">Id</label> 
						<input type="text" id="mbei_id" name="mbei_id" class="form-control" style="margin-bottom: 15px"
							placeholder="Id" required autofocus> 
						<label for="inputPassword" class="sr-only">Password</label> 
						<input type="password" id="mbei_password" name="mbei_password" class="form-control"
							placeholder="Password" required>
						<br><br>
						<!-- 
						<div class="checkbox">
							<label> <input type="checkbox" name="useCookie" />
								로그인 상태유지
							</label>
						</div>
						 -->
						<button id="btn_login" class="btn btn-lg btn-secondary btn-block" 
								type="submit"  >
							Log In
						</button>
						<br>
						<!-- 
						<button type="button" class="btn btn-secondary btn-sm ">ID/PW 찾기</button>
<button type="button" class="btn btn-secondary btn-sm float-right">회원가입</button>
						 -->
						 <div class="float-right">
						 	<a href="/member/find_id" class="">ID 찾기</a> | <a href="/member/find_pwd" class="">PW 찾기</a> | <a href="/member/join" class="">회원가입</a>
						</div>
					</form>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
  </div>


		</div>

	</div>

</main>

		<!-- Main Footer -->

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>
      
  </body>
</html>