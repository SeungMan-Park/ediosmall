<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<br><br>


<main role="main" class=".container-fluid">




<div class="row">


				
				<div class="col-3">
					<a href="/product/pro_list" style="float:none;">
					<h4 style="color: black; text-align:center;">Product Search</h4> 
					</a>
				</div>
				
				<div class="col-6">
				<div class="container" style="width: 30%; min-width: 900px; background-color: white; font-size: 14px;" >
				
			<div class="row" style="text-align: center;">
				<div class="col-lg-12">
					<form id="searchForm" action="/product/pro_list" method="get">					
						<select name="type" id="type">
							<option value=""    <c:out value="${pageMaker.cri.type == null  ? 'selected' : '' }" />>--</option>
							<option value="N"   <c:out value="${pageMaker.cri.type == 'N'   ? 'selected' : '' }" />>상품명</option>
							<option value="D"   <c:out value="${pageMaker.cri.type == 'D'   ? 'selected' : '' }" />>상품설명</option>
							<option value="C"   <c:out value="${pageMaker.cri.type == 'C'   ? 'selected' : '' }" />>제조사</option>
							<option value="ND"  <c:out value="${pageMaker.cri.type == 'ND'  ? 'selected' : '' }" />>상품명or상품설명</option>
							<option value="NC"  <c:out value="${pageMaker.cri.type == 'NC'  ? 'selected' : '' }" />>상품명or상품회사</option>
							<option value="NDC" <c:out value="${pageMaker.cri.type == 'NDC' ? 'selected' : '' }" />>상품명or내용+상품회사</option>
						</select>
							<input type="text"   name="keyword" value="${pageMaker.cri.keyword }">
			    			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			    			<input type="hidden" name="amount"  value="${pageMaker.cri.amount  }">
			    			<button id="btnSearch" class="btn btn-secondary" type="button">검색</button>					
					</form>
				</div>
				
			
			</div>				
			<br>
			
			<%--
			<div class="row">
			    	<div class="col-lg-12">
			    		<!-- 페이징 표시 -->

			    			<div class="panel-footer" style="text-align: center;">
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
							<!--
			    				<hr>    				
			    				${pageMaker }  -->
			    			</div>
			    			
			    			
			    		</div>	
			    			
			  </div>
			  
			   --%>
				
    
   	 	<div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
				<!--
    			<div class="panel-heading">
   			 BoardList.  <button id="regBtn" type="button" class="btn btn-primary pull-right">글쓰기</button>  
    			</div>--> 
    			
    			<div class="panel-body">
    			 <!-- 리스트 -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">상품명</th>
					  <th scope="col">이미지</th>
				      <th scope="col">가격</th>
				      <th scope="col">재고량</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${pro_list }" var="proVO" varStatus="status">
				    <tr>
				      <td>
				      	${(cri.pageNum - 1) * cri.amount + status.count}
				      </td>
				      <td>
				      	<c:out value="${proVO.pdtei_name }"></c:out>
				      </td>
					  <td>
					  	<a href="/product/product_read?pdtei_num=${proVO.pdtei_num}">
							<img src="/product/displayFile?fileName=${proVO.pdtei_image}">
						</a>	
					  </td>
				      <td><fmt:formatNumber type="currency" value="${proVO.pdtei_price }"></fmt:formatNumber></td>
				      <td><c:out value="${proVO.pdtei_amount }"></c:out></td>

				    </tr>
				   </c:forEach>
				   </tbody>
				</table>
    			</div>
    			
    			
			    </div>
			    <br>
	
	<!-- 페이지 번호 클릭시, 수정클릭시 상품코드정보추가, 삭제클릭시 상품코드정보추가 -->		    
	<form id="actionForm" action="/product/pro_list" method="get">
		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
		<input type="hidden" name="amount"  value='<c:out value="${pageMaker.cri.amount }" />'>		
		<input type="hidden" name="type"    value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>
			    
    			
    		</div>
    	</div>
    	
    	
			<div class="row">
			    	<div class="col-lg-12">
			    		<!-- 페이징 표시 -->

			    			<div class="panel-footer" style="text-align: center;">
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
							<!--
			    				<hr>    				
			    				${pageMaker }  -->
			    			</div>
			    			
			    			
			    		</div>	
			    			
			  </div>    	
    	
    	
    	
    </div>
		
		</div>
		<br><br><br><br><br><br>
		
				<div class="col-3">
				 
				</div>


	</div> 
     	
</main><!-- /.container -->

<script>
$(document).ready(function(){
	/* ckEditor 작업 */
	// config.js를 사용하지 않고 개별 설정하는 부분
	var ckeditor_config = {
			resize_enabled : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			toolbarCanCollapse : true,
			removePlugins : "elementspath", 
			// 파일 업로드 기능 추가
			// CKEditor를 이용해 업로드 사용 시 해당 주소에 업로드 됨
			filebrowserUploadUrl: '/admin/product/imgUpload'
	};
	CKEDITOR.replace("pdtei_detail", ckeditor_config);
	// config.js의 설정을 사용하려면, 다음과 같이 사용
	// CKEDITOR.replace("desc", "");

	/* 1차 카테고리에 따른 2차 카테고리 작업 */
	$("#mainCategory").on("change", function(){
		var mainCategoryCode= $(this).val(); // 선택한 1차카테고리 코드
		var url = "/admin/product/subCategoryList/" + mainCategoryCode;   // url매핑주소를 

		$.getJSON(url, function(subCGListData){		

			// 2차 카테고리 추가
			subCategoryList(subCGListData, $("#subCategory"), $("#subCGListTemplete"));

			
		});
	});

});
</script>     

<script>
	var subCategoryList = function(subCGListData, subCategoryTarget, subCategoryTemplete){
		var subCGTemplete = Handlebars.compile(subCategoryTemplete.html());
		var options = subCGTemplete(subCGListData);

		$("#subCategory option").remove();  // 기존 option태그 제거
		subCategoryTarget.append(options);  // 새로운 2차 카테고리 option태그 추가
	}
</script>

<script id="subCGListTemplete" type="text/x-handlebars-template">
	<option value="default">2차카테고리 선택</option>
	{{#each .}}
	<option value="{{cat_code}}">{{cat_name}}</option>
	{{/each}}
</script>

<script src="/js/admin/product/insert.js"></script>

<script>

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






		<!-- Main Footer -->
		
		<br>

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>
    
  </body>
</html>
