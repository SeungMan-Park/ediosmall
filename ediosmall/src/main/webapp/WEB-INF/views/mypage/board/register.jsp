<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <meta name="theme-color" content="#563d7c">
    <title>자유게시판</title>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

	  .clearfix col6 {
		list-style-type: none;
		text-align: center;
		margin: 0;
		padding: 0;
	  }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
    </style>
	<%@include file="/WEB-INF/views/common/config.jsp" %>

	<script src="/js/member/edit.js"></script>
  
    <script>
    	$(document).ready(function(){
	        $("#regBtn").click(function(){
	          location.href = "/mypage/board/register";
	        });
      });
    </script>
    

  </head>
  <body>
    
		<!-- nav.jsp -->
		<%@include file="/WEB-INF/views/common/nav.jsp" %>
		
		
<div class="row">

<div class="col-3">
<%@ include file="/WEB-INF/views/common/nav_main.jsp" %>
</div>

<div class="col-9">
<br>
<%@ include file="/WEB-INF/views/common/category_list_try.jsp" %>
</div>
</div>	
		
	

    <main role="main" class=".container-fluid">

			<div class="row">

			<%-- Main content --%>
			<section class="content container-fluid">	
			
			<div class="container" style="width: 30%; min-width: 900px; background-color: white; font-size: 14px;" >
					
						<br>					

				<%@include file="/WEB-INF/views/common/mypagelist5.jsp" %>
								
					  <div class="starter-template">
    
        
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">

    			
    			<div class="panel-body">
    			 <!-- 글쓰기 -->
    			 <br>
    			 <form role="form" method="post" action="/mypage/board/register">
    			 
					<div class="form-group">
					    <label for="exampleFormControlInput1">Writer</label>
					    <input type="text" name="mbei_id" class="form-control" id="exampleFormControlInput1" value="${sessionScope.loginStatus.mbei_id}" readonly>
					</div>
				 						
					<div class="form-group">
					    <label for="exampleFormControlInput1">Title</label>
					    <input type="text" name="brd_title" class="form-control" id="exampleFormControlInput1" placeholder="제목입력">
					</div>
					<div class="form-group">
					    <label for="exampleFormControlTextarea1">Content</label>
					    <textarea  name="brd_contents" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					  </div>  					  
					<div class="form-group">
					   <button type="submit" class="btn btn-secondary">Submit</button>
					</div>
				</form>
    			</div>
    		</div>
    	</div>
    </div>
     
     <!-- /.row -->
  </div>			
					
					
					
					</div>
					</section>
				</div>
		</main><!-- /.container -->

<script>

	// 일반 자바스크립트 함수는 read()이벤트메서드 영역을 벗어나서 작업
	// 태그의 이벤트설정은 read()이벤트메서드 영역안에서 작업

	$(document).ready(function(e){

		var formObj = $("form[role='form']");
		//글쓰기 전송작업
		$("button[type='submit']").on("click", function(e){

			e.preventDefault();// submit전송기능을 취소

			console.log("글쓰기 전송");

			//파일첨부 전송작업 처리부분.<input type='hidden' name='attachList[0].fileName' value='파일정보'>

			var str = "";

			$(".uploadResult ul li").each(function(i, obj){
				var objLi = $(obj);

				//console.dir(objLi.htm);
				console.log(objLi.html());
				console.log(objLi.data("file"));  /// data-file
				
				// 파일첨부테이블에 저장용도.
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+objLi.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+objLi.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+objLi.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+objLi.data("type")+"'>";

			});

			console.log(str);

			formObj.append(str).submit();


		});

		// 파일업로드가 진행되기전에 복제
		/*
		<div class="form-group uploadDiv">
	            <input type="file" id="txtFile" name='uploadFile' multiple>
	        </div>
		*/
		var cloneObj = $(".uploadDiv").clone();

		// 파일첨부시 업로드 설정이벤트
		// 파일첨부 상태가 변경이 발생이되면
		//$(".uploadDiv").on("change", "input[type='file']", function(e){
		    // 파일첨부태그가 동적으로 추가되어서 이벤트 설정을 다음과 같이해야 한다.
			$(".uploadDiv").on("change", "input[type='file']", function(e){

			console.log("변경");

			var formData = new FormData(); // <form>태그의 기능을 대신한다.

			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files;

			if(files.length == 0) return;

			for(var i=0;i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}

				formData.append("uploadFile", files[i]);
			}

			

			// ajax로 파일업로드
			$.ajax({
				url : "/uploadAjaxAction",
				processData : false, // 서버로 보낸 데이터를 쿼리스트링으로 변환할지 여부를 나타내는 값.(기본값 true)
				contentType : false, // 기본값(true) : application/x-www-form-urlencoded
				data : formData,
				type : "POST",
				dataType : 'json', // 리턴되는 데이타형
				success : function(result){ // List<AttachFileDTO> -> JSON 포맷변환
					alert('ok');
					console.log(result);

					// 서버로부터 받아온 업로드 한 파일들의 정보를(result)  화면에 리스트형태로 출력작업
					showUploadedFile(result);
					// 파일첨부 정보가 clear됨.
					$(".uploadDiv").html(cloneObj.html());
					
				}
			});
		});

		
		// 파일업로드 제약(파일형식, 파일크기) - 클라이언트/서버측에서 모두 체크기능
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880 //5mb

		function checkExtension(fileName, fileSize){

		if (fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}

		return true; // 첨부된 파일이 1)파일형식 검증2)파일크기 검증
		}


		// 서버로부터 받아온 파일정보를 리스트형태로 출력해주는위치
		var uploadResult = $(".uploadResult ul");

		function showUploadedFile(uploadResultArr){
		
		var str = "";
		
		//  선택자에 해당하는 대상이 여러개였을 때 반복적인 작업 기능을 제공하는 메서드
		$(uploadResultArr).each(function(i, obj){
		
		if(!obj.image){  //일반파일작업
			
			//  obj.uploadPath : "2021\03\31"
			// obj.uuid : "5c345afc-76e9-4477-92df-6879dd961748"
			// obj.fileName : "ProductTest_memory_info.png"
			// fileCallPath : "2021\03\31" "/" "5c345afc-76e9-4477-92df-6879dd961748" "_" "ProductTest_memory_info.png"
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
			
			// fileLink : "2021/03/31" "/" "5c345afc-76e9-4477-92df-6879dd961748" "_" "ProductTest_memory_info.png"
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/"); //  \ -> /(역슬래쉬->슬래쉬로 변경)
			
			str += "<li data-path='"+obj.uploadPath+"'";
			str += " data-uuid='"+obj.uuid+"'";
			str += " data-filename='"+obj.fileName+"'";
			str += " data-type='"+obj.image+"'>";
			str += "<div><a href='/download?fileName="+fileCallPath+"'>"+
				"<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"+
				"<span style='cursor:pointer' data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
				"<div></li>";
				
		}else{  // 이미지파일작업
			
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			
			var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
			
			originPath = originPath.replace(new RegExp(/\\/g),"/");
			
			str += "<li data-path='"+obj.uploadPath+"'";
			str += " data-uuid='"+obj.uuid+"'";
			str += " data-filename='"+obj.fileName+"'";
			str += " data-type='"+obj.image+"'>";
			str +=	"<a href=\"javascript:showImage(\'"+originPath+"\')\">"+
					"<img src='/display?fileName="+fileCallPath+"'></a>"+
					"<span style='cursor:pointer' data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
					"</li>";
		}
		});
		
		uploadResult.append(str);
		}

		// X 파일삭제
	$(".uploadResult").on("click","span", function(e){
		
		var targetFile = $(this).data("file");
	
		//var targetFile = $(this).attr("data-file");
		var type = $(this).data("type");
		console.log(targetFile);

		var targetLi = $(this).closest("li"); // 선택자의 부모중 첫번째 엘리먼트를 가리킴.
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType:'text',
			type: 'POST',
			success: function(result){
				alert(result);

				// 삭제파일에 해당하는 li태그를 제거.
				targetLi.remove(); 



				}
		}); //$.ajax
		
		});

	});

</script>

      
  </body>
</html>