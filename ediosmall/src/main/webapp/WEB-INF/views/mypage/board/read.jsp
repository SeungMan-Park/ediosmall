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
    <title>자유게시판</title>
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
  
    <script>
    	$(document).ready(function(){
	        $("#regBtn").click(function(){
	          location.href = "/mypage/board/register";
	        });
      });
    </script>
    

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
				<%@include file="/WEB-INF/views/common/mypagelist5.jsp" %>
												
					  <div class="starter-template">
    
         
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">

    			
    			<div class="panel-body">
    		
					  <div class="form-group">
					    <label for="exampleFormControlInput1">BNO</label>
					    <input type="text" name="brd_num" value="${board.brd_num }" class="form-control" readonly>
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlInput1">Title</label>
					    <input type="text" name="brd_title" value="${board.brd_title }" class="form-control" readonly>
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlTextarea1">Content</label>
					    <textarea  name="brd_contents" class="form-control" rows="3" readonly>${board.brd_contents }</textarea>
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlInput1">Writer</label>
					    <input type="text" name="mbei_id" value="${ board.mbei_id}" class="form-control"  readonly>
					  </div>
					  					  
					  <div class="form-group">
					  
					  <c:if test="${sessionScope.loginStatus.mbei_id == board.mbei_id}">
					   <button id="btnModify" type="button" class="btn btn-secondary">Modify</button>
					  </c:if>
					   <button id="btnList" type="button" class="btn btn-light">List</button>
					  </div>

    			 <!-- 리스트버튼,수정버튼을 클릭하면, 수정 폼페이지로 필요한 정보를 보내기위한 작업  -->
    			 <form id="operForm" action="/mypage/board/modify" method="get">
    			 	<input type="hidden" id="brd_num" name="brd_num" value="<c:out value="${board.brd_num }"></c:out>">
    			 	<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum }" />
    			 	<input type="hidden" id="amount" name="amount" value="${cri.amount }" />
					<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
    			 </form>
    			 
    			</div>
    			
    			
    			
    		</div>
    	</div>
    </div>
     
  </div>				
					
					
					
				</div>	
				</section>	
				</div>
				</div>
				
</main><!-- /.container -->

		<!-- Main Footer -->

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>

<script>

  $(document).ready(function(){

	var form = $("#operForm");



	//리스트버튼 클릭
	$("#btnList").click(function(){
		//location.href = "/board/list";  // 페이지 이동(주소)

		form.attr("action","/mypage/board/list");
		form.submit();

	});	
	
	// 수정버튼 클릭
	$("#btnModify").click(function(){
		//<form>태그정보를 submit작업
		// 리스트, 수정에 따라서 action주소가 다르기때문에 그에 따른 주소작업을 설정한다.
		form.attr("action","/mypage/board/modify").submit();
		//form.submit();
	});	


  });


  
</script>

      
  </body>
</html>