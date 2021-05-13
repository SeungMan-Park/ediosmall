$(document).ready(function() {
	
	var form = $("#loginForm");
	
	// 로그인 버튼 클릭 시 
	$("#btn_login").on("click", function(){
		
		//e.preventDefault();  // 전송기능 취소
		
	
		var mbei_id2 = $("#mbei_id").val();
		var mbei_password = $("#mbei_password").val();
		
		console.log(mbei_id);
		console.log(mbei_password);
		
		


		if(mbei_id2==null || mbei_id2==""){
			alert("Please enter your ID.");
			mbei_id.focus();
			
		} else if(mbei_password==null || mbei_password==""){
			alert("Please enter your Password.");
			mbei_password.focus();

		} else {
			//form.submit();
		}
		
		// ajax방식은 제어의 흐름이 클라이언트시작 -> 서버요청 -> 클라이언트  종료
		// ajax방식은 서버요청에 실행되는 코드가 response.redirect,redirect: 주소이동 구문이 사용안하거나 
		// 동작되어서는 안된다.
		$.ajax({
			url: '/member/checkIdDuplicate',
			type: 'post',
			dataType: 'text',  //  '/member/checkIdDuplicate'주소에서 넘어오는 리턴값의 형식
			data: {mbei_id : mbei_id2},  // javasciprt object 표현구문.www.w3school.com 참고
			success : function(data){
				if(data== 'FAIL'){
				
				} else {
					
					alert("아이디가 존재하지 아니합니다.");
					mbei_id.focus();
					location.href="/member/login";
				}
			}
		});


		
		
		return;
		







	});
	
});

