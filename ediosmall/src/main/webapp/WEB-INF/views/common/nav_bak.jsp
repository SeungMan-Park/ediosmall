<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">


  <div class="collapse navbar-collapse" id="navbarsExampleDefault">

    <ul class="navbar-nav mr-auto">
		<li class="nav-item active">
			<a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
		</li>
		<li>
			<span>최근 로그인한 시간 : 
				<fmt:formatDate value="${sessionScope.mbeiosVO.mbei_date_lastlogin}" pattern="yyyy-MM-dd HH:mm:ss" />
			</span>
		</li>
      <li>
        <span>
          ${sessionScope.mbeiosVO.mbei_id} 님 로그인증
        </span>
      </li>      
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
        <a class="nav-link" href="/member/modify">RegModify</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">RegDelete</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/cart/cart_list">CartList</a>
      </li>
      </c:if>
      <li class="nav-item">
        <a class="nav-link" href="#">MyPage</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Order Info</a>
      </li>
      
      
      
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
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>  
  
</nav>



