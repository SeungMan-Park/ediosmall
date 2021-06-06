<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<!-- css file -->
<%@include file="/WEB-INF/views/admin/include/head_inc.jsp" %>


</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->		
			<%@include file="/WEB-INF/views/admin/include/main-header.jsp" %>
			
		
		<!-- Left side column. contains the logo and sidebar -->
			<%@include file="/WEB-INF/views/admin/include/main-sidebar.jsp" %>
			
		

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					user_list <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a href="#"><i class="fa fa-dashboard"></i> Level</a>
					</li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
						
			<div class="row">

			
			</div>


			<!-- 상품리스트 -->
	<div class="row">
	

    <%-- Main content --%>
			<section class="content container-fluid">
				
					<div class="container" style="width: 30%; min-width: 900px; background-color: white; font-size: 14px;" >
					
						<br>
						<%@include file="/WEB-INF/views/admin/member/nav_editer/modify.jsp" %>
						
						<form id="admodifyForm_pw" action="/admin/member/modify_pw" method="post">
						
						<div  class="container" style="width: 800px; padding: 10% 5%;">
						
							<h4 class="form-signin-heading" style="text-align: center;">비밀번호 수정</h4>
							<br><br><c:out value="" />
							
							<div class="form-group">
								<label for="inputPassword">* 현재 비밀번호</label> <input type="password"
									class="form-control" id="admin_pw_ch" name="admin_pw_ch" 
									placeholder="현재 비밀번호를 입력해 주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputPassword">* 변경할 비밀번호</label> <input type="password"
									class="form-control" id="admin_pw" name="admin_pw" 
									placeholder="비밀번호를 입력해 주세요" style="max-width: 630px;">
							</div>
							<div class="form-group">
								<label for="inputPasswordCheck">* 변경할 비밀번호 확인</label> <input type="password"
									class="form-control" id="admin_pw_check" name="admin_pw_check" 
									placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" style="max-width: 630px;">
							</div>
						</div>
						<div class="form-group text-center">
							<button type="button" id="btn_submit_adpw" class="btn btn-secondary">
								회원수정 <i class="fa fa-check spaceLeft"></i>
							</button>

							<button type="button" id="btn_cancle" class="btn btn-light">
								취소 <i class="fa fa-times spaceLeft"></i>
							</button>
						</div>
						<br><br><br><br>
					</form>
				</div>

				
					
<script>
$(document).ready(function(){

    var form = $("#admodifyForm_pw");


    /* 회원수정 버튼 클릭 시 */ 
	$("#btn_submit_adpw").on("click", function(){

        // var mbei_password_ch = $("#mbei_password_ch").val();
        // var mbei_password = $("#mbei_password").val();
        // var mbei_password_check = $("#mbei_password_check").val();

        var admin_pw_ch = $("#admin_pw_ch").val();
        var admin_pw = $("#admin_pw").val();
        var admin_pw_check = $("#admin_pw_check").val();
        
        // var mbei_password_ch = $(this).parent().find("input[name='mbei_password_ch']").val();
        // var mbei_password = $(this).find("input[name='mbei_password']").val();
        // var mbei_password_check = $("#mbei_password_check").val();
	
		console.log("버튼인식 확인");
        console.log(admin_pw_ch);
        console.log(admin_pw);
        console.log(admin_pw_check);
        

        // 유효성검사
        if(admin_pw_ch == null || admin_pw_ch == ""){
            alert("현재 비밀번호를 입력하세요.");
            $("#admin_pw_ch").focus();
            return;
        }else if(admin_pw == null || admin_pw == ""){
            alert("변경할 비밀번호를 입력하세요.");
            $("#admin_pw").focus();
            return;
        }else if(admin_pw_check == null || admin_pw_check == ""){
            alert("변경할 비밀번호를 확인하세요.");
            $("#admin_pw_check").focus();
            return;
        }else if(admin_pw != admin_pw_check){
            alert("변경할 비밀번호와 비밀번호 확인값과 다릅니다.");
            $("#admin_pw").focus();
            $("#admin_pw_check").val("");
            return;
        }

		// 현재 비밀번호 확인 검사
		var admin_pw2 = $("#admin_pw_ch").val();

		console.log(admin_pw2);  
		
		
		//return;
        
        $.ajax({
			url: "/admin/adcheckPwPOST",
			type: "post",
			datatype: "text",
			data: {admin_pw : admin_pw2},
			success: function(data){
				if(data=='SUCCESS'){
					alert("정보를 변경합니다.");
					//return;
					
					form.submit();
					alert("정보를 변경합니다. 진행");
				} else{
					alert("비밀번호가 다릅니다.");
				//	mbei_password.val("");
					$("#admin_pw_ch").focus();
				}
			}
		});

        return;




    });

});
</script>					


			</section>
			
			
		

		</div>
				
				
				
				

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->

			<%@include file="/WEB-INF/views/admin/include/main-footer.jsp" %>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active">
					<a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a>
				</li>
				<li>
					<a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;"> <i class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design
									<span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading">
								Report panel usage
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 3 -->
		
		<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->



</body>
</html>