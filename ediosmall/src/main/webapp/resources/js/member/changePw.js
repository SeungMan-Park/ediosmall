$(document).ready(function(){
	
	var form = $("#changePwForm");
	
	var mbei_password = $("#mbei_password");
	var mbei_password_change = $("#mbei_password_change");
	var mbei_password_check = $("#mbei_password_check");
	
	/* 확인 버튼 클릭 시 */
	$("#btn_submit").on("click", function(){
		// 유효성 검사
		if(mbei_password.val()==null || mbei_password.val()==""){
			alert("현재 비밀번호를 입력해주세요.");
			mbei_password.focus();
			return;
			
		} else if(mbei_password_change.val() ==null || mbei_password_change.val() ==""){
			alert("변경할 비밀번호를 입력해주세요.");
			mbei_password_change.focus();
			return;
			
		} else if(mbei_password_check.val() ==null || mbei_password_check.val() ==""){
			alert("변경할 비밀번호 확인 란을 입력해주세요.");
			mbei_password_check.focus();
			return;
			
		} else if(mbei_password_change.val() != mbei_password_check.val()){
			alert("변경할 비밀번호와 비밀번호 확인 란의 비밀번호가 다릅니다.");
			
			mbei_password_change.val("");
			mbei_password_check.val("");
			mbei_password_change.focus();
			return;
		}
		
		// 현재 비밀번호 확인 검사
		var mbei_password_val = mbei_password.val();
		
		$.ajax({
			url: "/member/checkPwAjax",
			type: "post",
			datatype: "text",
			data: {mbei_password : mbei_password_val},
			success: function(data){
				if(data=='SUCCESS'){
					form.submit();
					
				} else{
					alert("현재 비밀번호가 다릅니다.");
					mbei_password.val("");
					mbei_password.focus();
				}
			} 
		});
	});
});