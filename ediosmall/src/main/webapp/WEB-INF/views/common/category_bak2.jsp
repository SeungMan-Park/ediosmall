<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul>
	<c:forEach items="${mainCateList}" var="cateVO">
		<li class="nav-item mainCategory">
		    <a class="nav-link" herf="#" data-code="${cateVO.cat_code}">${cateVO.cat_name}</a>
	
	        	<!-- 1차카테고리 선택에 의한 2차카테고리 출력위치 -->
	    	<ul class="subCategory"></ul>
		</li>
	</c:forEach>  
</ul> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="subCGListTemplate" type="text/x-handlebars-template">
  {{#each .}}
    <li><a href="/product/product_list?cat_code={{cat_code}}">{{cat_name}}</a></li>
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
  });

  var subCGList = function(subCGData, targetSubCategory, templeteObjcet){

    var template = Handlebars.compile(templeteObjcet.html());
    var subCGLi = template(subCGData);

    $(".mainCategory .subCategory").empty();

    targetSubCategory.find(".subCategory").append(subCGLi);

  };
</script>	