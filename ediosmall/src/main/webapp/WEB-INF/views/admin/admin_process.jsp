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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="canonical"
	href="https://getbootstrap.com/docs/3.4/examples/signin/">

<title>ADMIN SIGNIN</title>

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		
			<!-- Left side column. contains the logo and sidebar -->
			<!-- ??????????????? ?????? ??????-->	
			<%@include file="/WEB-INF/views/admin/include/main-header.jsp" %>
			
		
		<!-- Left side column. contains the logo and sidebar -->
		

			<%@include file="/WEB-INF/views/admin/include/main-sidebar.jsp" %>
			
		

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Main Page <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a href="#"><i class="fa fa-dashboard"></i> Level</a>
					</li>
					<li class="active">Here</li>
				</ol>
			</section>

			
			<!-- /.content -->
			


<section class="content container-fluid">
	
<table style="margin-left:50px; margin-right:auto;">    

<th>
<td>
			<!-- ????????? ????????? -->        
    <div class="row">
    	<div class="col-lg-12" style="width: 520px;">
    		<div class="panel panel-default">
    			<div style="text-align: center;">
    			<br>
    			 <h4><a href="${pageContext.request.contextPath }/admin/adreview/adreview_list">* ?????? ????????????</a></h4>
    			</div>
				
    			<div class="panel-body">
    			 <!-- ????????? -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">??????</th>	
				      <th scope="col">?????????</th>
				      <th scope="col">??????</th>
				      <th scope="col">??????</th>
				      <th scope="col">??????</th>
				      <th scope="col">?????????</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:set var="i" value="${cri.pageNum }" />
				  <c:forEach items="${adReview_list }" var="arvVO" varStatus="status">
				    <tr>
				      <td>
				      	${(cri.pageNum - 1) * cri.amount + status.count}
				      </td>
				      <td><a class="move_mbei_id" href="${arvVO.mbei_id }"><c:out value="${arvVO.mbei_id }"></c:out></a></td>
				      <td><a class="move_pdtei_num" href="${arvVO.pdtei_num }"><c:out value="${arvVO.pdtei_num }"></c:out></a></td>
				      <td><c:out value="${arvVO.rv_score }"></c:out></td>
				      <td><a class="move_rv_num" href="${arvVO.rv_num }"><c:out value="${arvVO.rv_contects }"></c:out></a></td>
				      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${arvVO.brd_date_reg }"/></td>
				      <%-- <td><a class="move" href="${arvVO.brd_num }"><c:out value="${arvVO.brd_title }"></c:out></a></td> --%>
				    </tr>
				  </c:forEach>  
				   </tbody>
				</table>
    			</div>
    		
    		
    		<form id="actionForm" action="/admin/adreview/adreview_list" method="get">	
		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
		<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>
    		
    	
				</div>
		 	</div>
		</div>
</td>

<script>

  $(document).ready(function(){

	
	var result = '${result}';
	if(result == 'modify'){
		alert('?????????????????????.');
	}else if(result == 'remove'){
		alert('?????????????????????.');
	}

	var searchForm = $("#searchForm");

	var actionForm = $("#actionForm");
	// ?????? ????????? ?????? ????????? ??????.
	$(".move_pdtei_num").on("click", function(e){
		// ????????? ?????????????????????(?????????,??????)??? ??????????????? ????????? ??????
		// form?????? ??????

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // ????????? ??????????????? ??????????????? ????????? ??????.
		actionForm.append("<input type='hidden' name='pdtei_num' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/admin/product/modify");
		actionForm.submit();
	});
	
	$(".move_mbei_id").on("click", function(e){
		// ????????? ?????????????????????(?????????,??????)??? ??????????????? ????????? ??????
		// form?????? ??????

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // ????????? ??????????????? ??????????????? ????????? ??????.
		actionForm.append("<input type='hidden' name='mbei_id' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/admin/member/user_modify");
		actionForm.submit();
	});	
	
	$(".move_rv_num").on("click", function(e){
		// ????????? ?????????????????????(?????????,??????)??? ??????????????? ????????? ??????
		// form?????? ??????

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // ????????? ??????????????? ??????????????? ????????? ??????.
		actionForm.append("<input type='hidden' name='rv_num' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/admin/adreview/review_read");
		actionForm.submit();
	});
	
	
	

	// [prev] 1 2 3 4 5 [next]
	$(".page-item a").on("click", function(e){
		e.preventDefault();

		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();

	});
	//???????????? ????????? ???????????? ???????????? ??????????????? on ?????? ???????????? ??????.
	$("#searchForm #btnSearch").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("??????????????? ???????????????");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("???????????? ???????????????");
			return false;
		}

		// ????????? ???????????? 1??? ???????????? ??????.
		// ??????????????? ????????? ?????????????????? ???????????? ??????????????? ???????????? ??????.
		searchForm.find("input[name='pageNum']").val("1");

		e.preventDefault();

		searchForm.submit();

	});



  });


  
</script> 


<td>&nbsp;&nbsp;&nbsp;</td>
<td>
	
	<div class="row">
    	<div class="col-lg-12" style="width: 520px;">
    		<div class="panel panel-default">
    			<div style="text-align: center;">
    			<br>
    			 <h4><a href="${pageContext.request.contextPath }/admin/board/adList">* ?????? ?????????</a></h4>
    			</div>
    			
    			<div class="panel-body">
    			 <!-- ????????? -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">??????</th>
				      <th scope="col">?????????</th>
				      <th scope="col">??????</th>
				      <th scope="col">?????????</th>
				      <th scope="col">?????????</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:set var="i" value="${cri.pageNum }" />
				  <c:forEach items="${list }" var="brdVO" varStatus="status">
				    <tr>
				      <td>
				      	${(cri.pageNum - 1) * cri.amount + status.count}
				      </td>
				      <td scope="row"><c:out value="${brdVO.brd_num }"></c:out></td>
				      <td><a class="move" href="${brdVO.brd_num }"><c:out value="${brdVO.brd_title }"></c:out></a></td>
				      <td><c:out value="${brdVO.mbei_id }"></c:out></td>
				      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${brdVO.brd_date_reg }"/></td>
				    </tr>
				  </c:forEach>  
				   </tbody>
				</table>
    			</div>
    		
    	

   
  
    

	<form id="actionForm" action="/admin/board/adList" method="get">	
		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
		<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }" />'>
		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>



				</div>
		 	</div>
		</div>
	
	
	
</td>
<script>

  $(document).ready(function(){

	
	var result = '${result}';
	if(result == 'modify'){
		alert('?????????????????????.');
	}else if(result == 'remove'){
		alert('?????????????????????.');
	}

	var searchForm = $("#searchForm");

	var actionForm = $("#actionForm");
	// ?????? ????????? ?????? ????????? ??????.
	$(".move").on("click", function(e){
		// ????????? ?????????????????????(?????????,??????)??? ??????????????? ????????? ??????
		// form?????? ??????

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // ????????? ??????????????? ??????????????? ????????? ??????.
		actionForm.append("<input type='hidden' name='brd_num' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/admin/board/read");
		actionForm.submit();
	});

	// [prev] 1 2 3 4 5 [next]
	$(".page-item a").on("click", function(e){
		e.preventDefault();

		console.log("click");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();

	});
	//???????????? ????????? ???????????? ???????????? ??????????????? on ?????? ???????????? ??????.
	$("#searchForm #btnSearch").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("??????????????? ???????????????");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("???????????? ???????????????");
			return false;
		}

		// ????????? ???????????? 1??? ???????????? ??????.
		// ??????????????? ????????? ?????????????????? ???????????? ??????????????? ???????????? ??????.
		searchForm.find("input[name='pageNum']").val("1");

		e.preventDefault();

		searchForm.submit();

	});



  });


  
</script> 

</th> 





</table>

<table style="margin-left:50px; margin-right:auto;">    

<th>

<td>

	<div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
    			<div style="text-align: center;">
    			<br>
    			 <h4><a href="${pageContext.request.contextPath }/admin/order/order_list">* ?????? ????????????</a></h4>
    			</div>
    			
    			<div class="panel-body">
    			 <!-- ????????? -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">?????????</th>
				      <th scope="col">????????????</th>
				      <th scope="col">?????????</th>
				      <th scope="col">?????????</th>
				      <th scope="col">??????</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${order_list }" var="orderVO" varStatus="status">
				    <tr>
				      
				      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderVO.ord_date}"/></td>
				      
				      <td>
				      	${orderVO.odr_code}
				      	<button type="button" name="btn_order_detail" data-odr_code="${orderVO.odr_code}" class="btn btn-link">Order Detail</button> / <button type="button" name="btn_order_detail_close"class="btn btn-link">Detail Close</button> 
				      </td>
				      
				      <td>${orderVO.mbei_id}</td>
				      
				      <td>${orderVO.ord_name}</td>
				      				      				      
				      <td>
				      	<fmt:formatNumber type="currency" value="${orderVO.ord_price }"></fmt:formatNumber>
				      </td>
				      
				      
				    </tr>
				   </c:forEach>
				   </tbody>
				</table>
    			</div>
    			
    			
    			
	
	<!-- ????????? ?????? ?????????, ??????????????? ????????????????????????, ??????????????? ???????????????????????? -->		    
	<form id="actionForm" action="/admin/order/order_list" method="get">
		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }" />'>
		<input type="hidden" name="amount"  value='<c:out value="${pageMaker.cri.amount }" />'>		
		<input type="hidden" name="type"    value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>
			    
    			
    		</div>
    	</div>
    </div>



</td>

<script>
	$(document).ready(function(){
	
		// 	<button type="button" name="btn_order_detail" data-odr_code="${orderVO.odr_code}"
		$("button[name='btn_order_detail']").on("click", function(){

			console.log("????????????");

			// ???????????? : ??????????????????

			var odr_code = $(this).attr("data-odr_code");

			console.log(odr_code);
			
			var current_tr = $(this).parents("tr");

			// ajax???????????? : url? ???????????? ???????????? ????????????, PostMan ?????????
			$.ajax({
				url : "/admin/order/orderDetailSeen",
				type : "get",
				data :  { 
							odr_code : odr_code  // <input type = "text" name = "odr_code" value="20"
						},
				dataType : "json",
				success : function(data){

					// alert(data.length);
					// ???????????? subCategoryList
					orderDetailView(data, current_tr, $("#orderDetailTemplete"));

				}
				
			});

			
		});

		$("button[name='btn_order_detail_close']").on("click", function(){
			// alert("???????????????");

			//$("#orderDetailTemplete").off();
			$(".dy_order_detail").remove();


		});



	});
</script>     

<script>
								// ??????????????????		// 	????????????tr??????   // 
	var orderDetailView = function(orderDetailData, orderDetailTarget, orderDetailTemplete){
		var detailTemplete = Handlebars.compile(orderDetailTemplete.html());
		var details = detailTemplete(orderDetailData);

		console.log(details);

		$(".dy_order_detail").remove();  // ?????? option?????? ??????
		orderDetailTarget.after(details);  // ????????? 2??? ???????????? option?????? ??????
		
	}
</script>

<!-- ???????????? ???????????? ????????? ????????? ?????? //  tr ?????? ?????? ????????? ??????. -->
<!-- tr ????????? ???????????? ??????. -->
<script id="orderDetailTemplete" type="text/x-handlebars-template">

	<tr class="dy_order_detail"><td colspan="8">??????????????????</td></tr>
	<tr class="dy_order_detail" style="background: #60c1ee;">
		<th>?????????</th><th>?????????</th><th>??????</th><th>????????????</th><th>??????</th>
	</tr>
	{{#each .}}
	<tr class="dy_order_detail" style="background: white;">
		
		<td><img src="/admin/order/displayFile?fileName={{pdtei_image}}"></td>	
			
		<td>{{pdtei_name}}</td>
		<td>{{ord_amount}}???</td>
		<td>{{ord_price}}???</td>
		<td>{{total_price ord_price ord_amount}}???</td>
		
	</tr>
	{{/each}}

</script>


<script>
//???????????? ??????????????? ??????

Handlebars.registerHelper("total_price", function(ord_price, ord_amount){
	
	return ord_price * ord_amount;
});
</script>

<td>&nbsp;&nbsp;&nbsp;</td>


<td>
	

<div class="row">
	  	<div class="col-lg-12">
	  		<div class="panel panel-default">
				<div style="text-align: center;">
    			<br>
    			 <h4><a href="${pageContext.request.contextPath }/admin/product/pro_amount">* ???????????? ??????</a></h4>
    			</div>
	  			
	  			<div class="panel-body">
	  			 <!-- ????????? -->
	  			 <table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">????????????</th>
			      <th scope="col">?????????</th>
			      <th scope="col">??????</th>
			      <th scope="col">?????????</th>
			      <th scope="col">????????????</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${pro_amount }" var="pro_amount" varStatus="status">
			    <tr>
			      <td>
			     	 ${pro_amount.pdtei_num}
			      </td>
			      <td>			
			         ${pro_amount.pdtei_name}
			      </td>			      
			      <td>			
			         ${pro_amount.pdtei_price}
			      </td>
			      <th scope="row">
			      	 ${pro_amount.pdtei_amount}
			      </th>
			      <td>
			      	<button type="button" data-pdtei_num="${pro_amount.pdtei_num}" class="btn btn-primary btn-edit">??????</button>
			      </td>
			      	
		       </tr>
			   </c:forEach>
			   </tbody>
			</table>
	  			</div>
	  		</div>
	  	</div>
	  	
	<!-- ????????? ?????? ?????????, ??????????????? ????????????????????????, ??????????????? ???????????????????????? -->		    
	<form id="actionForm" action="/admin/product/pro_list" method="get">
		<input type="hidden" name="pageNum" value='<c:out value="1" />'>
		<input type="hidden" name="amount"  value='<c:out value="5" />'>		
		<input type="hidden" name="type"    value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>
	
	
	  </div>
	
	
	
</td>


</th> 


<script>

	$(document).ready(function(){

		var actionForm = $("#actionForm");

		$(".page-item a").on("click", function(e){

			e.preventDefault();

			console.log("click");

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();

		});

		// ?????? ?????????

		$("table td .btn-edit").on("click", function(){
			console.log('??????');
			
			// ?????????????????? ????????? ????????????
			actionForm.append("<input type='hidden' name='pdtei_num' value='" + $(this).attr("data-pdtei_num") + "'>");

			actionForm.attr("action", "/admin/product/modify");
			actionForm.submit();

		});

		
	});
	


</script>


</table>
    
 			</section>			
			
			
			
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