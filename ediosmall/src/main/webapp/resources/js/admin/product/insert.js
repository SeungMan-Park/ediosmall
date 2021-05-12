$(document).ready(function(){

    var form = $("#registerForm");

    $("#btn_submit_insert").on("click", function(){
    
    	console.log("버튼동작 확인");
    	
    	//return;

        //form.submit();
        
        
        
		var result = confirm("상품을 등록하시겠습니까?");
		
		console.log("confirm 동작확인");
		
		//return;
		
		if(result){
			// 유효성 검사
			var mainCategory = $("#mainCategory option:selected");
			var subCategory = $("#subCategory option:selected");
			var pdtei_name = $("#pdtei_name");
			var pdtei_producer = $("#pdtei_producer");
			var pdtei_price = $("#pdtei_price");
			var pdtei_discount = $("#pdtei_discount");
			var ckeditor = CKEDITOR.instances['pdtei_detail'];
			var file1 = $("#file1");
			var pdtei_amount = $("#pdtei_amount");
			var pdtei_buy = $("#pdtei_buy");
			var fileSize = file1.size;
			var fileFormat  = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
			var maxSize = 5 * 1024 * 1024; // 5MB
			
			if(mainCategory.val()==null || mainCategory.val()=="default"){
				alert("1차 카테고리를 선택해주세요.");
				mainCategory.focus();
				return;
				
			} else if(subCategory.val()==null || subCategory.val()=="default"){
				alert("2차 카테고리를 선택해주세요.");
				subCategory.focus();
				return;
				
			} else if(pdtei_name.val()==null || pdtei_name.val()==""){
				alert("상품명을 입력해주세요.");
				pdtei_name.focus();
				return;
				
			} else if(pdtei_producer.val()==null || pdtei_producer.val()==""){
				alert("제조사를 입력해주세요.");
				pdtei_producer.focus();
				return;
				
			}else if(pdtei_price.val()==null || pdtei_price.val()==""){
				alert("상품 가격을 입력해주세요.");
				pdtei_price.focus();
				return;
				
			}else if(pdtei_discount.val()==null || pdtei_discount.val()==""){
				alert("할인 가격을 입력해주세요.");
				pdtei_discount.focus();
				return;
				
			}else if(ckeditor.getData()==null || ckeditor.getData()==""){
				alert("상품 상세 내용을 입력해주세요.");
				ckeditor.focus();	
				return;
				
			}else if(file1.val()==null || file1.val()==""){
				alert("이미지 파일을 추가해주세요.");
				file1.focus();
				return;
				
			}else if(!file1.val().match(fileFormat)){
				alert("이미지 파일만 업로드 가능합니다.");
				file1.focus();
				return;
				
			}else if(fileSize > maxSize){
				alert("파일 사이즈는 5MB까지만 가능합니다.");
				file1.focus();
				return;
				
			}else if(pdtei_amount.val()==null || pdtei_amount.val()==""){
				alert("상품 수량을 입력해주세요.");
				pdtei_amount.focus();
				return;
				
			}else {
			
				//console.log("유효성검사 확인");		
				
				//return;
						
				form.submit();
			}
		} else {}        
        
        
        
        
    });
});