<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<header class="main-header">    
<!-- Logo -->
			<a href="/admin/admin_process" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span class="logo-mini">
					<b>E</b>FM
				</span> <!-- logo for regular state and mobile devices --> <span class="logo-lg">
					<b>EidosFashion</b>Mall
				</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li>
							<span>최근 로그인한 시간 : 
								<fmt:formatDate value="${sessionScope.adLoginStatus.admin_date_late}" pattern="yyyy-MM-dd HH:mm:ss" />
							</span>
						</li>
						<li>
							<span>
								${sessionScope.adLoginStatus.admin_name} 님 로그인증
							</span>
						</li>
						<li>
							<form action="/admin/admin_logout" method="post">
								<input type="submit" value="로그아웃">
							</form>
						</li>
						<li>
							<form action="/admin/member/admodify" method="get">
								<input type="submit" value="계정수정">
							</form>
						</li>
					</ul>
				</div>
			</nav>
</header>