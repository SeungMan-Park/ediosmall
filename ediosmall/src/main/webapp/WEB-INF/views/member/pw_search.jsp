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

<script src="/js/member/id_pw_search2.js"></script>
   
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

<%@ include file="/WEB-INF/views/common/nav_main.jsp" %>


<div role="main" class="container">

    <!-- Content Wrapper. Contains page content -->
		<div class="wrapper">
			<%-- Main content  로그인 UI --%>
			<section class="content container-fluid">
				<div class="container" style="width: 450px; height:620px; background-color: white; margin-top:30px;">
					<h2 class="form-signin-heading" style="text-align: center;">PW Search</h2>
						<br><br>
						<label for="mbei_id" class="sr-only">Id</label> 
						<input type="text" id="mbei_id" name="mbei_id" class="form-control" style="margin-bottom: 15px"
							placeholder="Id" required autofocus> 

						<br><br>

						<button id="btn_PW_Search" class="btn btn-lg btn-primary btn-block" type="submit"  >
							Search PW
						</button>
						<p id="result" style="color: blue; text-align: center;"></p>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
  </div>



      
  </body>
</html>