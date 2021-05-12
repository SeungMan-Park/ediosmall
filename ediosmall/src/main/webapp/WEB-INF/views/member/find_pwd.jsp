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

    


<div role="main" class="container">

    <!-- Content Wrapper. Contains page content -->
		<div class="wrapper">
			<%-- Main content  로그인 UI --%>
			<section class="content container-fluid">
				<div class="container" style="width: 450px; height:620px; background-color: white; margin-top:30px;">
					<div style="padding:50px 30px;">
						<h4 class="form-signin-heading" style="text-align: center;">PW Search</h4>
						<br><br>
						<input type="text" id="id2" name="id2" class="form-control" style="margin-bottom: 15px"
							placeholder="Id를 입력하세요" required autofocus>
							<br>

						<button type="button" id="btn_PW_Search" class="btn btn-lg btn-secondary btn-block" disabled>
							Search PW
						</button>
						<p id="result" style="color: blue; text-align: center;"></p>
						<span>가입한 이메일로 임시 비밀번호를 전송</span> 
						<br><span style="color: red; text-align: center;">다만, aws 보안정책으로 기능을 막아둠</span> 
					</div>	
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

<script>
$(document).ready(function(){
	
	

	// 비밀번호 찾기 : 메일전송
    $("#btn_PW_Search").on("click", function(){
    	
    	var id3 = $("#id2").val();
    
    	    	
    	// console.log(id3);

	   	  $.ajax({
	   	      url : "/member/pw_search",
	   	      type : "get",
	   	      data : {id : id3},
	   	      dataType : "text",
	   	      success : function(data){
	   	        if(data == "SUCCESS")
	   	          alert("임시 비밀번호를 메일로 보냈습니다. 비번을 변경하세요.");      
	   	        else {
	   	          alert("로그인을 요청 합니다.");
	   	        } 
	   	     	location.href = "/member/login"
	   	        
	   	      }
	   	    });      
    	
    	return;


    });


});
</script>
      
  </body>
</html>