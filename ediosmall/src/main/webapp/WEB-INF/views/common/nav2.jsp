<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top justify-content-end">
  <a class="navbar-brand" href="/">Home</a>
  <c:if test="${sessionScope.loginStatus != null }">
	<span style="color: gray;">
          ${sessionScope.loginStatus.mbei_id} 님 환영합니다
    </span>
  </c:if>	
  
  <button class="btn btn-secondary ml-auto mr-1" >추천상품</button>
   
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
            <li class="nav-item">
        <a class="nav-link" id="btn_pw_search">비밀번호 찾기</a> <!-- ajax 구문으로 처리해야 한다. -->
      </li>
      
      </c:if>
      <!-- 인증 후 표시 -->
      <c:if test="${sessionScope.loginStatus != null }">
      <li class="nav-item">
        <a class="nav-link" href="/member/logout">LogOut</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/member/modify">RegModify</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">RegDelete</a>
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
  <div class="search-wrap">
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </form> 
  </div>  
</nav>


<script>
  $(document).ready(function(){

$("#btn_pw_search").on("click", function(){

  $.ajax({
      url : "/member/pw_search",
      type : "get",
      data : {id : 'paradigm2'},
      dataType : "text",
      success : function(data){
        if(data == "SUCCESS")
          alert("임시 비밀번호를 메일로 보냈습니다. 비번을 변경하세요.");      
        else {
          alert("로그인을 요청 합니다.");
        }            
      }
    });

});
 

});

var subCGList = function(subCGData, targetSubCategory, templeteObjcet){

var template = Handlebars.compile(templeteObjcet.html());
var subCGLi = template(subCGData);

$(".mainCategory .subCategory").empty();

targetSubCategory.find(".subCategory").append(subCGLi);

};  
</script>