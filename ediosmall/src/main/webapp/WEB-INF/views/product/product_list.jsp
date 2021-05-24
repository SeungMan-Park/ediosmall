<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>eidos fashion Bootstrap v4.6</title>
    
<%@include file="/WEB-INF/views/common/config.jsp" %>

<meta name="theme-color" content="#563d7c">

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
    </style>
    
  </head>
  <body>
    
<!-- nav.jsp -->
<%@ include file="/WEB-INF/views/common/nav.jsp" %>



<div class="row">

<div class="col-3">
<%@ include file="/WEB-INF/views/common/nav_main.jsp" %>
</div>

<div class="col-9">
<br>
<%@ include file="/WEB-INF/views/common/category_list_try.jsp" %>
</div>
</div>
<br><br>


<main role="main" class=".container-fluid">

<div class="row">


				
				<div class="col-2">
				 
				</div>
				
				<div class="col-8">
    
   	 	<div class="card-deck mb-3 text-center">
   	 		<c:set var="i" value="0" />
   	 		<c:set var="j" value="2" />
   	 		<table border="1">
   	 		<c:choose>
   	 		<c:when test="${productVOList != null && fn:length(productVOList) > 0 }">
	    	<c:forEach items="${productVOList}" var="productVO">
	    	
	    	<c:if test="${i%j == 0 }">
				 <div class="card mb-2 shadow-sm">
			</c:if>
				      <div class="card-body">
				    <!--    <a href="/product/product_read?pdtei_num=${productVO.pdtei_num}">  --> 
				    	<a href="/product/product_read?pdtei_num=${productVO.pdtei_num}">
				        	<img src="/product/displayFile?fileName=${productVO.pdtei_image}" />
				        </a>
				        <br>
				        <input type="hidden" name="pdtei_num" value="${productVO.pdtei_num}">
				        <span><c:out value="${productVO.pdtei_name}" /></span><br>
				        <span><fmt:formatNumber type="currency" value="${productVO.pdtei_price }"></fmt:formatNumber></span><br>
				        <span>재고량 : <c:out value="${productVO.pdtei_amount}" />개</span><br>
				                주문 : <input type="number" style="width: 50px" name="ord_amount" value="1"> 개<br><br>
				   
				   
				   <c:if test="${productVO.pdtei_amount != 0}">
				   		<button type="button" name="btn_direct_buy" class="btn btn-link">즉시구매</button>
				   		<c:if test="${sessionScope.loginStatus != null }">
				        
				        <button type="button" name="btn_cart_add" class="btn btn-link">장바구니</button>
				        </c:if>
				   </c:if>
				   				   
				   
				      </div>
			<c:if test="${i%j == j-1 }">
				 </div>
			</c:if>
			<c:set var="i" value="${i+1 }" />	 
				 
		    </c:forEach>
		    </c:when>
		    
		    </c:choose>
		    
		    </table>
		    
		    
		    <form id="order_direct_form" method="get" action="/order/order"> 
              <input type="hidden" name="type" value="1">
        	</form>

		</div> 
		<c:if test="${sessionScope.loginStatus == null }"><p style="color: blue;" align="center">* 로그인을 통해 다양한 기능을 경험하세요</p></c:if><br><br>
		</div>
		
				<div class="col-2">
				 
				</div>


	</div> 
     	
</main><!-- /.container -->

		<!-- Main Footer -->

		<%@include file="/WEB-INF/views/common/footer2.jsp" %>


<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="subCGListTemplate" type="text/x-handlebars-template">
  {{#each .}}
    <li><a href="2차카테고리 참조하는 상품목록?cat_code={{cat_code}}">{{cat_name}}</a></li>
  {{/each}}
</script>


<script>
  $(document).ready(function(){

    $(".mainCategory").on("click", function(){

        var mainCategory = $(this);
        var cat_code = $(this).find("a").attr("data-code");
        var url ="/product/subCategoryList/" + cat_code;

        // alert(url);        
        // 1차 카테고리를 참조하는 2차카테고리 정보
        $.getJSON(url, function(data){
          subCGList(data, mainCategory, $("#subCGListTemplate"));
        });

    });
    
 	  // <button type="button" name="btn_direct_buy"
    // 즉시구매 클릭
    $("button[name='btn_direct_buy']").on("click", function(){

      console.log("즉시구매");

      // 상품코드, 구매수량

      var pdtei_num = $(this).parent().find("input[name='pdtei_num']").val();  // <input type='hidden' name='pdtei_num' 
      var ord_amount = $(this).parent().find("input[name='ord_amount']").val();  //<input type="number" style="width: 50px" name="ord_amount" 

      console.log("상품코드 : " + pdtei_num);
      console.log("구매수량 : " + ord_amount);

      

      var order_direct_form = $("#order_direct_form");

      order_direct_form.append("<input type='hidden' name='pdtei_num' value='" + pdtei_num + "'>");
      order_direct_form.append("<input type='hidden' name='ord_amount' value='" + ord_amount + "'>");


      // return;

      order_direct_form.submit();

      });
      

      $("button[name='btn_cart_add']").on("click", function(){


        console.log("장바구니");

        // return;

        // 상품코드, 구매수량

        var pdtei_num = $(this).parent().find("input[name='pdtei_num']").val();  // <input type='hidden' name='pdtei_num' 
        var pdtei_amount = $(this).parent().find("input[name='ord_amount']").val();  //<input type="number" style="width: 50px" name="ord_amount" 

        console.log("상품코드 : " + pdtei_num);
        console.log("구매수량 : " + pdtei_amount);


        $.ajax({
          url : "/cart/add",
          type : "post",
          data : {pdtei_num : pdtei_num, pdtei_amount : pdtei_amount},
          dataType : "text",
          success : function(data){

            if(data == "LoginRequired"){

              console.log("인식은 되니?");


              alert("로그인을 요청 합니다.");
        	    location.href = "/member/login"


            }else if(data == "SUCCESS"){
            	
            	console.log("인식은 되니? 2");

              if(confirm("장바구니 추가되었습니다. \n 확인 하시겠습니까?")){
                location.href = "/cart/cart_list";
              }


          	} 


          }
        });


        // $.ajax({
        //   url : "/cart/add",
        //   type : "post",
        //   data : {pdtei_num : pdtei_num, pdtei_amount : pdtei_amount},
        //   dataType : "text",
        //   success : function(data){
        //     if(data == "SUCCESS"){
        //       if(confirm("장바구니 추가되었습니다. \n 확인 하시겠습니까?")){
        //         location.href = "/cart/cart_list";
        //       }
        //     }else if(data == "LoginRequired"){
        // 	  alert("로그인을 요청 합니다.");
        // 	  location.href = "/member/login"
        //   	}            
        //   }
        // });




      });
    
    
  });

  var subCGList = function(subCGData, targetSubCategory, templeteObjcet){

    var template = Handlebars.compile(templeteObjcet.html());
    var subCGLi = template(subCGData);

    $(".mainCategory .subCategory").empty();

    targetSubCategory.find(".subCategory").append(subCGLi);

  };
</script>	




    
  </body>
</html>
