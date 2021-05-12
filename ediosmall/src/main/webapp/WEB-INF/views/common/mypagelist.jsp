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


<div class="aside-my-menu">
	<ul class="clearfix col6">
		<li>
			<div class="aside-my-menu-section on">
				<a href="/mypage/modify">
						<p>회원정보</p>
						<p><span class="fa fa-user" aria-hidden="true"></span></p>
				</a>
			</div>
		</li>
		<li>
			<div class="aside-my-menu-section on">
				<a href="/mypage/modify_pw">
						<p>비밀번호변경</p>
						<p><span class="fa fa-user" aria-hidden="true"></span></p>
				</a>
			</div>
		</li>
		<li>
			<div class="aside-my-menu-section ">
				<a href="/mypage/order_list">
					<p>주문내역/배송조회</p>
					<p><span class="fa fa-truck" aria-hidden="true"></span></p>
				</a>
			</div>
		</li>
		<li>
			<div class="aside-my-menu-section ">
				<a href="/mypage/board/list">
					<p>자유게시판</p>
					<p>
						<span class="fa fa-bars" aria-hidden="true"></span>
					</p>
				</a>
			</div>
		</li>
	</ul>
</div>