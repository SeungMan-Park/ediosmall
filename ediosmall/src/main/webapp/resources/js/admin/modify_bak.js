$(document).ready(function() {
	
	var form = $("#modifyForm");
	// 인증 확인 여부를 위한 변수

	
	/* 회원수정 버튼 클릭 시 */ 
	$("#btn_submit").on("click", function(){
		
		form.submit();
		
		/*
		var mbei_id = $("#mbei_id");
		var mbei_password = $("#mbei_password");
		var mbei_password_check = $("#mbei_password_check");
		var mem_name = $("#mbei_name");
		var mem_nick = $("#mbei_nickname_u");
		var mem_email = $("#mbei_email");
		var mem_authcode = $("#mem_authcode"); 
		var mem_phone = $("#mbei_phonenum");
		var mem_zipcode = $("input[name='mbei_zipcode']");
		var mem_addr = $("input[name='mbei_addr1st']");
		var mem_addr_d = $("input[name='mbei_addr2nd']");
		*/
		
		/* 유효성 검사 */
		/*
		 if(mbei_password.val()==null || mbei_password.val()==""){
			alert("현재 비밀번호를 입력해주세요.");
			mbei_password.focus();
			return;
			
		} else if(mbei_name.val()==null || mbei_name.val()==""){
			alert("이름을 입력해주세요.");
			mem_name.focus();
			return;
		
		} else if(mbei_nickname_u.val()==null || mbei_nickname_u.val()==""){
			alert("닉네임을 입력해주세요.");
			mbei_nickname_u.focus();
			return;
		
		} else if(mbei_email.val()==null || mbei_email.val()==""){
			alert("이메일을 입력해주세요.");
			mbei_email.focus();
			return;

		} else if(isCheckEmail=="false" && 
					(mem_authcode.val()==null || mem_authcode.val()=="")){
			alert("이메일 인증 확인 후 인증 코드를 입력해주세요.");
			mem_authcode.focus();
			return;

		} else if(isCheckEmail=="false"){
			alert("이메일인증을 해주세요.");
			$("#btn_sendAuthCode").focus();
			return;
		
		} else if(mbei_phonenum.val()==null || mbei_phonenum.val()==""){
			alert("휴대폰 번호를 입력해주세요.");
			mem_phone.focus();
			return;

		} else if(mbei_zipcode.val()==null || mbei_zipcode.val()==""){
			alert("우편번호를 입력해주세요.");
			$("#btn_postCode").focus();
			return;
			
		} else if(mbei_addr1st.val()==null || mbei_addr1st.val()==""){
			alert("주소를 입력해주세요.");
			$("#btn_postCode").focus();
			return;
			
		} else if(mbei_addr2nd.val()==null || mbei_addr2nd.val()==""){
			alert("상세 주소를 입력해주세요.");
			mem_addr_d.focus();
			return;
		} 
		*/ 
		// 현재 비밀번호 확인 검사
		var admin_pw_val = admin_pw.val();
		$.ajax({
			url: "/admim/checkPwAjax",
			type: "post",
			datatype: "text",
			data: {admin_pw : admin_pw_val},
			success: function(data){
				if(data=='SUCCESS'){
					form.submit();
				} else{
					alert("비밀번호가 다릅니다.");
					admin_pw_val.val("");
					admin_pw_val.focus();
				}
			} 
		});
	});
	
	/* 취소 버튼 클릭 시 */
	$("#btn_cancle").on("click", function(){
		
		var result = confirm("회원 정보 수정을 취소하시겠습니까?");
		if(result){
			location.href="/admim/admin_process/"; 
		} else{}
	});
	
});

