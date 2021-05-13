<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/common/config.jsp" %>

   
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top justify-content-end">
  <!-- <a class="navbar-brand" href="/">Home</a>  -->
  <c:if test="${sessionScope.loginStatus != null }">
	<span style="color: gray;">
          ${sessionScope.loginStatus.mbei_id} 님 환영합니다
    </span>
  </c:if>	
  <!--  -->
  <button class="btn ml-auto mr-1" disabled></button>
   
  <div class="collapse navbar-collapse flex-grow-0" id="navbarsExampleDefault">    
    <ul class="navbar-nav text-right">
      <!-- 인증 전 표시 -->
      <c:if test="${sessionScope.loginStatus == null }">
      <li class="nav-item">
        <a class="nav-link" href="/member/login">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/member/join">Register</a>
      </li>  
      </c:if>
      <!-- 인증 후 표시 -->
      <c:if test="${sessionScope.loginStatus != null }">
      <li class="nav-item">
        <a class="nav-link" href="/member/logout">LogOut</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/mypage/modify">RegModify</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/cart/cart_list">CartList</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/mypage/modify">MyPage</a>
      </li>
  
      </c:if>  
      
      <!-- 
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
       -->
    </ul>
  </div>
  <!--  -->
  <div class="search-wrap">
        <form class="form-inline my-2 my-lg-0" id="searchForm" action="/product/pro_list" method="get">
			<input type="hidden" name="type" value="N" <c:out value="${pageMaker.cri.type == 'N'   ? 'selected' : '' }" />>
            <input class="form-control mr-sm-2" type="text" placeholder="ex) 티셔츠" aria-label="Search" name="keyword" value="${pageMaker.cri.keyword }">
            <button class="btn btn-secondary my-2 my-sm-0" type="button" id="btnSearch">Search</button>
        </form> 
  </div>  
</nav>





<script>
  $(document).ready(function(){

$("#btn_pw_search").on("click", function(){
	

    $("#modalLabel").html("비밀번호 찾기");  
    
    $("button.btnModal").hide();
    $("#btnId_pw_search").show();

    $("#pw_search_modal").modal("show");
    
        
    
    $("#btnId_pw_search").on("click", function(){
    	
    	let id = $("#id").val();
    	
    	console.log(id);
    	
    	// return;
    	
	   	  $.ajax({
	   	      url : "/member/pw_search",
	   	      type : "get",
	   	      data : {id : id},
	   	      dataType : "text",
	   	      success : function(data){
	   	        if(data == "SUCCESS")
	   	          alert("임시 비밀번호를 메일로 보냈습니다. 비번을 변경하세요.");      
	   	        else {
	   	          alert("로그인을 요청 합니다.");
	   	        } 
	   	        
	   	     	$("#pw_search_modal").modal("hide");
	   	      }
	   	    });
    	
    	
    });

    return;
   

});
 

});
 
</script>

<script>
	$(document).ready(function() {
		
		var searchForm = $("#searchForm");
		
		$("#searchForm #btnSearch").on("click", function(e){

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();
		});
		
		
		
	});
</script>


    <!-- Reply Modal (모달대화상자) 상품후기 모달대화상자-->
    <!-- 후기쓰기, 후기수정, 후기삭제 -->
    <div class="modal fade" id="pw_search_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalLabel">Product Review Modal-Register</h5>
        
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label>아이디</label>
          <input type="hidden" class="form-control" name="pdtei_num" id="pdtei_num" value="${productVO.pdtei_num}">
              <input type="hidden" name="rv_num" id="rv_num">
              <input type="text" class="form-control" name="id" id="id"><span>가입한 이메일로 임시 비밀번호를 전송해 드립니다.</span>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" id="btnId_pw_search" class="btn btn-primary btnModal">임시비번 전송</button>
          </div>
        </div>
      </div>
    </div>