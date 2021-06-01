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
      
      /*상품후기 별 스타일*/
      #star_grade a{
     	font-size:22px;
        text-decoration: none;
        color: lightgray;
    }
    #star_grade a.on{
        color: rgb(235, 202, 18);
    }
    
    #star_grade_modal a{
     	font-size:22px;
        text-decoration: none;
        color: lightgray;
    }
    #star_grade_modal a.on{
        color: black;
    }
    
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
      }
     
    </style>
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
					Page Header <small>Optional description</small>
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

				<!-- 글수정 폼 -->
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Modify PRODUCT</h3>
							</div>
							<!-- /.box-header -->

							<form id='modifyForm' role="form" action="/admin/product/modify" method="post" enctype="multipart/form-data">
								<div class="box-body">
									<div class="form-group">
										<label for="exampleInputEmail1" style="width:30%; margin-right:20px;" >1차 카테고리</label>
										<label for="exampleInputEmail1" style="width:30%;" >2차 카테고리</label> <br />
										<select class="form-control" id="mainCategory" name="cat_code" style="width:30%; margin-right:10px; display: inline-block;" >
										  <option value="default">1차 카테고리 선택</option>
										  
										  <c:forEach items="${categoryList }" var="cate">
										  	<option value='<c:out value="${cate.cat_code }" />' <c:out value="${cate.cat_code == productVO.cat_code ? 'selected' : ''}" />>
										  		<c:out value="${cate.cat_name }" />
										  	</option>
										  </c:forEach>
										  
										  
										</select>
										<select class="form-control" id="subCategory" name="cat_code_prt" style="width: 30%; display: inline-block;">
										 	<option value="default">2차 카테고리 선택</option>
										 	
										 <c:forEach items="${subCategoryList }" var="subCate">
										  	<option value='<c:out value="${subCate.cat_code }" />' <c:out value="${subCate.cat_code == productVO.cat_code_prt ? 'selected' : ''}" />>
										  		<c:out value="${subCate.cat_name }" />
										  	</option>
										  </c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Product Name</label> <input
											type="text" id="pdtei_name" name="pdtei_name" value='<c:out value="${productVO.pdtei_name }" />' class="form-control"
											placeholder="Enter Product name">
											<input type="hidden" id="pdtei_num" name="pdtei_num" value='<c:out value="${productVO.pdtei_num }" />' class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Company</label> <input
											type="text" id="pdtei_producer" name="pdtei_producer" value='<c:out value="${productVO.pdtei_producer }" />' class="form-control"
											placeholder="Enter company">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1" style="width:40%; margin-right:10px;">Price</label> 
										<label for="exampleInputEmail1" style="width:40%;">Discount</label> 
										<input style="width:40%; margin-right:10px; display: inline-block;"
											type="text" id="pdtei_price" name="pdtei_price" value='<c:out value="${productVO.pdtei_price }" />' class="form-control" 
											placeholder="Enter price" />
										<input style="width:40%; display: inline-block;"
											type="text" id="pdtei_discount" name="pdtei_discount" value='<c:out value="${productVO.pdtei_discount }" />' class="form-control "
											placeholder="Enter discounted price" />
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Detail</label>
										<textarea class="form-control" id="pdt_detail" name="pdtei_detail" rows="8"
											placeholder="Enter ..."><c:out value="${productVO.pdtei_detail }" /></textarea>
									</div>

									<div class="form-group">
										<label for="exampleInputEmail1">Thumbnail Image</label> 
											<input type="file" id="file1" name="file1" class="form-control" />
											<input type="hidden" id="pdtei_image" name="pdtei_image" value='<c:out value="${productVO.pdtei_image }" />' class="form-control" />
									</div>
									
									<div class="form-group">
										<label for="exampleInputEmail1" style="width:30%; margin-right:10px;">Amount</label> 
										<label for="exampleInputEmail1" style="width:15%;">Buy availability</label><br /> 
										<input style="width:30%; margin-right:10px; display: inline-block;"
											type="text" id="pdtei_amount" name='pdtei_amount' value='<c:out value="${productVO.pdtei_amount }" />' class="form-control" 
											placeholder="Enter Amount" />
										<select class="form-control" id="pdtei_buy" name="pdtei_buy" style="width: 15%; display: inline-block;">
										  <option <c:out value="${productVO.pdtei_buy == 'Y' ? 'selected' : '' }"/>>Y</option>
										  <option <c:out value="${productVO.pdtei_buy == 'N' ? 'selected' : '' }"/>>N</option>
										</select>
										
										<!-- 원래 리스트상태의 페이지, 검색정보구성 -->
										<%-- 
										<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
										<input type="hidden" id="amount"  name="amount"  value="${cri.amount}">
										<input type="hidden" id="type"    name="type"    value="${cri.type}">
										<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">
										--%>
										
										
									</div>
									
									
								</div>

								<!-- /.box-body -->

								<div class="box-footer">
									<div>
										<hr>
									</div>

									<ul class="mailbox-attachments clearfix uploadedList">
									</ul>

									<!-- <button id="btn_Remove" type="button" class="btn btn-primary">Remove</button>  -->
									<%--<button id="btn_Reply_List" type="button" class="btn btn-primary">Reply_List</button> --%>
									<button id="btn_submit" type="button" class="btn btn-primary">Modify</button>
									<button id="btn_List"   type="button" class="btn btn-primary">List</button>

								</div>
								
								<!-- 리스트버튼,수정버튼을 클릭하면, 수정 폼페이지로 필요한 정보를 보내기위한 작업  -->					  
			    			 	<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum }" />
			    			 	<input type="hidden" id="amount" name="amount" value="${cri.amount }" />
								<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
								<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>	
							</form>


						</div>
						<!-- /.box -->	
					</div>
					<!--/.col (left) -->

				</div>
				
				
				<!-- 댓글관리 -->
				<div class="row">
				
				
				<div class="col-lg-12">
    		<div class="panel panel-default">
    			
    			
    			<div class="panel-body">
    			
	    			<div class="box-header">
						<h3 class="box-title">Review Register</h3>
						<br><br>
					
						<form role="form" method="post" action="/admin/product/review_register">
						
						  <div class="col-md-2 mb-2">
				            <label for="firstName">작성자</label>
				            <input type="text" name="mbei_id" class="form-control" id="exampleFormControlInput1" value="${sessionScope.adLoginStatus.admin_id}" readonly>
				            
				          </div>
				          <div class="col-md-2 mb-2">
				            <label for="lastName">평점</label>
				            <input type="text" name="rv_score" class="form-control" id="exampleFormControlInput1" value="5">
				            
				          </div>
				          <div class="col-md-8 mb-2">
				          <label for="lastName" style="display: none;">작성</label><br>
				            <button type="submit" id="review_reg" class="btn btn-secondary pull-right">리뷰등록</button>
				            <div class="invalid-feedback">
				            </div>
				          </div>
				          
				          <div class="col-md-12 mb-12">
				            <label for="lastName"></label>
				            <textarea  name="rv_contects" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용입력"></textarea>
				            
				          </div>
							
						</form>
    			</div>
    			
    			<br><br>
    			<div class="box-header">
						<h3 class="box-title">Review List</h3>
						<br><br>
    			 <!-- 리스트 -->
    			 <table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">작성자</th>
				      <th scope="col">평점</th>
				      <th scope="col">내용/수정</th>
				      <th scope="col">작성일</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${adReview_list }" var="arvVO" varStatus="status">
				    <tr>
				      <td><a class="move_mbei_id" href="${arvVO.mbei_id }"><c:out value="${arvVO.mbei_id }"></c:out></a></td>
				      <td><c:out value="${arvVO.rv_score }"></c:out></td>
				      <td><a class="move_rv_num" href="${arvVO.rv_num }"><c:out value="${arvVO.rv_contects }"></c:out></a></td>
				      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${arvVO.brd_date_reg }"/></td>
				      <%-- <td><a class="move" href="${arvVO.brd_num }"><c:out value="${arvVO.brd_title }"></c:out></a></td> --%>
				    </tr>
				  </c:forEach>  
				   </tbody>
				</table>
    			</div>
    			</div>
    			
    			
    		
    							

   
  
    



	<form id="actionForm" action="/admin/adreview/adreview_list" method="get">	
		<input type="hidden" name="pageNum" value='1'>
		<input type="hidden" name="amount" value='5'>
		<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
		<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }" />'>
	</form>


				</div>
		 	</div>
					



					

				</div>
				


<script>

  $(document).ready(function(){


	var searchForm = $("#searchForm");

	var actionForm = $("#actionForm");
	// 제목 클릭시 다음 주소로 이동.
	$(".move_pdtei_num").on("click", function(e){
		// 링크시 쿼리스트링정보(페이징,검색)를 다음주소로 보내는 작업
		// form태그 사용

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // 태그가 가지고있는 기본이벤트 성격을 취소.
		actionForm.append("<input type='hidden' name='pdtei_num' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/admin/product/modify");
		actionForm.submit();
	});
	
	$(".move_mbei_id").on("click", function(e){
		// 링크시 쿼리스트링정보(페이징,검색)를 다음주소로 보내는 작업
		// form태그 사용

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // 태그가 가지고있는 기본이벤트 성격을 취소.
		actionForm.append("<input type='hidden' name='mbei_id' value='"  + $(this).attr("href") + "'>");
		actionForm.attr("action", "/admin/member/user_modify");
		actionForm.submit();
	});	
	
	$(".move_rv_num").on("click", function(e){
		// 링크시 쿼리스트링정보(페이징,검색)를 다음주소로 보내는 작업
		// form태그 사용

		// <a href=""></a>, <input type="submit">
		e.preventDefault(); // 태그가 가지고있는 기본이벤트 성격을 취소.
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
	//동적으로 추가된 요소에는 이벤트를 설정할려면 on 으로 작업해야 한다.
	$("#searchForm #btnSearch").on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}

		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 선택하세요");
			return false;
		}

		// 검색시 페이지를 1로 시작해야 한다.
		// 리스트에서 변경된 페이지번호가 사용하여 검색결과가 안나올수 있다.
		searchForm.find("input[name='pageNum']").val("1");

		e.preventDefault();

		searchForm.submit();

	});



  });


  
</script> 


<script>

$(document).ready(function(e){
	
	var formObj = $("form[role='form']");
	
	
	//글쓰기 전송작업
	$("button[type='submit']").on("click", function(e){

		e.preventDefault();// submit전송기능을 취소

		console.log("댓글전송");
		
		var pdtei_num = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find("input[name='pdtei_num']").val();
		var mbei_id = $(this).parent().parent().find("input[name='mbei_id']").val();
		var rv_score = $(this).parent().parent().find("input[name='rv_score']").val();
		var rv_contects = $(this).parent().parent().find("textarea[name='rv_contects']").val();
		
		
		console.log("상품코드 : " + pdtei_num);
		console.log("작성자 : " + mbei_id);
		console.log("평점 : " + rv_score);
		console.log("내용 : " + rv_contects);
		
		//return;
		
		if(rv_score == null || rv_score == ""){
			alert("평점을 입력 하세요");
			return;
			
		} else if(rv_contects == null || rv_contects  == ""){ 
			alert("내용을 입력하세요");
			return;
			
		} else {
			
			$.ajax({
		          url : "/admin/product/review_register",
		          type : "post",
		          data : {pdtei_num : pdtei_num, mbei_id : mbei_id, rv_score : rv_score, rv_contects : rv_contects},
		          dataType : "text",
		          success : function(data){
		        	  
		        	  formObj.submit(); 
		        	  return;

		          }
		        }); 
		}

		return;
				
		//formObj.submit();
		


	});
	
});


</script>

  				
				
				

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
	CKEDITOR.replace("pdt_detail", ckeditor_config);
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

<script src="/js/admin/product/modify.js"></script>
</body>
</html>