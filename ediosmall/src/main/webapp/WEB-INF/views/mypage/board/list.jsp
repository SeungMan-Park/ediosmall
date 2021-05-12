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
			
			<%-- Main content --%>
			<section class="content container-fluid">
			
			<div class="container" style="width: 30%; min-width: 900px; background-color: white; font-size: 14px;" >
					
						<br>				
				<%@include file="/WEB-INF/views/common/mypagelist5.jsp" %>
				
					  <div class="starter-template">
    
        
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
    			<div class="panel-heading text-right">
    			 <button id="regBtn" type="button" class="btn btn-secondary pull-right">글쓰기</button>
    			 <br>
    			</div>
    			
    			<div class="panel-body">
    			 <!-- 리스트 -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성일</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${list }" var="brdVO">
				    <tr>
				      <th scope="row"><c:out value="${brdVO.brd_num }"></c:out></th>
				      <td><a class="move" href="${brdVO.brd_num }"><c:out value="${brdVO.brd_title }"></c:out></a></td>
				      <td><c:out value="${brdVO.mbei_id }"></c:out></td>
				      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${brdVO.brd_date_reg }"/></td>
				    </tr>
				  </c:forEach>  
				   </tbody>
				</table>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!-- 검색 / 페이징 -->
    <div class="row">
    	<div class="col-lg-12">
    		<form id="searchForm" action="/mypage/board/list" method="get">
    			<select name="type" id="type">
    				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':'' }" />>--</option>
    				<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected':'' }" />>제목</option>
    				<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected':'' }" />>내용</option>
    				<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected':'' }" />>작성자</option>
    				<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected':'' }" />>제목 or 내용</option>
    				<option value="TW" <c:out value="${pageMaker.cri.type == 'TW' ? 'selected':'' }" />>제목 or 작성자</option>
    				<option value="TCW" <c:out value="${pageMaker.cri.type == 'TCW' ? 'selected':'' }" />>제목 or 내용 or 작성자</option>
    			</select>
    			<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
    			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    			<button id="btnSearch" class="btn btn-secondary" type="button">Search</button>
    			<br><br>
    		</form>
    	</div>
    </div>
    <div class="row">
    	<div class="col-lg-12">
    	<!-- 페이징 표시 -->
    	
    			<div class="panel-footer">
    			<nav aria-label="Page navigation example">
    			   <ul class="pagination justify-content-center">
    			   
    			   <c:if test="${pageMaker.prev }">
					    <li class="page-item">
					      <a href="${pageMaker.startPage - 1 }" class="page-link" href="#" tabindex="-1">Prev</a>
					    </li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="num">
				    	<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
				    		<a href="${num }" class="page-link" href="#">${num }</a>
				    	</li>
				    </c:forEach>
				    <c:if test="${pageMaker.next }">
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

	<form id="actionForm" action="/mypage/board/list" method="get">
		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
		<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
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

	
	var result = '${result}';
	if(result == 'modify'){
		alert('수정되었습니다.');
	}else if(result == 'remove'){
		alert('제거되었습니다.');
	}

	var searchForm = $("#searchForm");

	var actionForm = $("#actionForm");
	// 제목 클릭시 다음 주소로 이동.
	$(".move").on("click", function(e){
		// 링크시 쿼리스트링정보(페이징,검색)를 다음주소로 보내는 작업
		// form태그 사용

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // 태그가 가지고있는 기본이벤트 성격을 취소.
		actionForm.append("<input type='hidden' name='brd_num' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/mypage/board/read");
		actionForm.submit();
	});

	// [prev] 1 2 3 4 5 [next]
	$(".page-item a").on("click", function(e){
		e.preventDefault();

		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();

	});
	//동적으로 추가된 요소에는 이벤트를 설정할려면 on 으로 작업해야 한다.
	$("#searchForm #btnSearch").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 선택하세요");
			return false;
		}

		// 검색시 페이지를 1로 시작해야 한다.
		// 리스트에서 변경된 페이지번호가 사용하여 검색결과가 안나올수 있다.
		searchForm.find("input[name='pageNum']").val("1");

		e.preventDefault();

		searchForm.submit();

	});



  });


  
</script>

      
  </body>
</html>