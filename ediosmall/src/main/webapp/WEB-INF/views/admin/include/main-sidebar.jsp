<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="main-sidebar">
<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>관리자 모드</p>
						<!-- Status -->
						<a href="https://blog.naver.com/paradigm2"><i class="fa fa-circle text-success"></i> 제작자 개인 블로그</a>
					</div>
				</div>

				<!-- search form (Optional) -->
				<form action="/admin/product/pro_list" method="get" class="sidebar-form">
					<div class="input-group">
						<!-- <input type="text" name="q" class="form-control" placeholder="Search...">  -->
						<input type="hidden" name="type" value="N"   <c:out value="${pageMaker.cri.type == 'N'   ? 'selected' : '' }" />>
            			<input class="form-control mr-sm-2" type="text" placeholder="Search..." aria-label="Search" name="keyword" value="${pageMaker.cri.keyword }">
						<span class="input-group-btn">
							<button type="submit" name="search" id="search-btn" class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->

				<!-- Sidebar Menu -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">HEADER</li>
					<!-- Optionally, you can add icons to the links
					<li class="active">
						<a href="#"><i class="fa fa-link"></i> <span>Link</span></a>
					</li>
					<li>
						<a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a>
					</li>
					 -->
					<li class="treeview">
						<a href="#"><i class="fa fa-link"></i> <span>상품관리</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span> </a>
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath }/admin/product/product_insert">상품등록</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/admin/product/pro_list">상품목록</a>
							</li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#"><i class="fa fa-link"></i> <span>주문관리</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span> </a>
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath }/admin/order/order_list">주문목록</a>
							</li>
							<!-- 
							<li>
								<a href="#">Link in level 2</a>
							</li>
							 -->
						</ul>
					</li>
					<!--
					<li class="treeview">
						<a href="#"><i class="fa fa-link"></i> <span>회원관리</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span> </a>
						<ul class="treeview-menu">
							<li>
								<a href="#">Link in level 2</a>
							</li>
							 
							<li>
								<a href="#">Link in level 2</a>
							</li>
							 
						</ul>
					</li>
					-->
					<li class="treeview">
						<a href="#"><i class="fa fa-link"></i> <span>게시판/리뷰관리</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span> </a>
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath }/admin/board/adList">게시판</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/admin/adreview/adreview_list">리뷰</a>
							</li>
							<!-- 
							<li>
								<a href="#">Link in level 2</a>
							</li>
							 -->
						</ul>
					</li>
					<li class="treeview">
						<a href="#"><i class="fa fa-link"></i> <span>통계/재고관리</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span> </a>
						<ul class="treeview-menu">
							<!-- 
							<li>
								<a href="/admin/order/order_sale">매뉴통계</a>
							</li>
							 -->
							<li>
								<a href="${pageContext.request.contextPath }/admin/order/order_sale_hit">히트상품</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/admin/product/pro_amount">재고관리</a>
							</li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#"><i class="fa fa-link"></i> <span>회원관리</span> <span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span> </a>
						<ul class="treeview-menu">
							<!-- 
							<li>
								<a href="/admin/order/order_sale">매뉴통계</a>
							</li>
							 -->
							<li>
								<a href="/admin/member/user_list">회원목록</a>
							</li>
						</ul>
					</li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
</aside>