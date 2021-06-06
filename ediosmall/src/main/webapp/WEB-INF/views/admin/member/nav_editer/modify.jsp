<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.sm {
  list-style-type: none;
  margin: 0;
  padding: 0;
  text-align: center;
}

      
</style>


  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link" href="/admin/member/admodify">회원정보</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/admin/member/modify_pw">비밀번호변경</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/admin/member/adRegDelete">탈퇴</a>
    </li>   
    <%--
    <li class="nav-item">
      <a class="nav-link" href="/admin/member/modify_pw_imsi">비밀번호변경(삭제예정)</a>
    </li>
     --%>
  </ul>
