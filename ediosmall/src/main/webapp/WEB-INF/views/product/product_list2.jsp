<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<main role="main" class=".container-fluid">


<div class="row">
    <div class="col-2">    	
		<%@ include file="/WEB-INF/views/common/category_list.jsp" %>   	
    </div>  

    <div class="col-10">

    <div class="album py-5 bg-light text-center">
          
          <div class="row">

            <c:forEach items="${productVOList}" var="productVO">
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <div class="card-body">
                  <a href="/product/product_read?pdtei_num=${productVO.pdtei_num}">
                    <img src="/product/displayFile?fileName=${productVO.pdtei_image}" />
                  </a>
                </div>
                <div class="card-body">
                  <p class="card-text"><input type="hidden" name="pdtei_num" value="${productVO.pdtei_num}">
                    <span><c:out value="${productVO.pdtei_name}" /></span><br>
                    <span><fmt:formatNumber type="currency" value="${productVO.pdtei_price }"></fmt:formatNumber></span><br></p>
                  <div class="justify-content-between align-items-center">
                    <input type="number" style="width: 50px" name="ord_amount" value="1"> 개<br><br>
                    <div class="btn-group">
                      <button type="button" name="btn_direct_buy" class="btn btn-sm btn-outline-secondary">즉시구매</button>
                      <button type="button" name="btn_cart_add" class="btn btn-sm btn-outline-secondary">장바구니</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
            
            <form id="order_direct_form" method="POST" action="/order/order"> 
              <input type="hidden" name="type" value="1">

            </form>
            
          </div>

    </div>


	</div>   
    
    	
</div>





</main><!-- /.container -->


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

      return;

      order_direct_form.submit();

 


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
