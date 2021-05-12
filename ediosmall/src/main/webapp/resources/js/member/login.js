$(document).ready(function() {
	
	var form = $("#loginForm");
	
	// 로그인 버튼 클릭 시 
	$("#btn_login").on("click", function(){
		
		e.preventDefault();  // 전송기능 취소
		
		var mbei_id = $("#mbei_id");
		var mbei_password = $("#mbei_password");

		if(mbei_id.val()==null || mbei_id.val()==""){
			alert("Please enter your ID.");
			mbei_id.focus();
			
		} else if(mbei_password.val()==null || mbei_password.val()==""){
			alert("Please enter your Password.");
			mbei_password.focus();

		} else {
			//form.submit();
		}
	});
	
});

