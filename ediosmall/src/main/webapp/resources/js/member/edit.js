$(document).ready(function(){

    var form = $("#modifyForm");


    /* 회원수정 버튼 클릭 시 */ 
	$("#btn_submit").on("click", function(){


        var mbei_id = $("#mbei_id");
		var mbei_password = $("#mbei_password");
	//	var mbei_password_check = $("#mbei_password_check");
		var mbei_name = $("#mbei_name");
		var mbei_nickname_u = $("#mbei_nickname_u");
		var mbei_email = $("#mbei_email");
	//	var mem_authcode = $("#mem_authcode");
		var mbei_phonenum = $("#mbei_phonenum");
		var mbei_zipcode = $("input[name='mbei_zipcode']");
		var mbei_addr1st = $("input[name='mbei_addr1st']");
		var mbei_addr2nd = $("input[name='mbei_addr2nd']");
		
		
		/* 유효성 검사 */
		
		if(mbei_id.val()==null || mbei_id.val()==""){
			alert("아이디를 입력해주세요");
			mbei_id.focus();
			
		// } else if(isCheckId =="false"){   // 아이디 중복기능 사용여부 확인
		// 	alert("아이디 중복 체크를 해주세요.");
		// 	$("#btn_checkId").focus();
			
		} else if(mbei_password.val()==null || mbei_password.val()==""){
			alert("비밀번호를 입력해주세요.");
			mbei_password.focus();
            return;
			
		// } else if(mbei_password_check.val()==null || mbei_password_check.val()==""){
		// 	alert("비밀번호 확인 란을 입력해주세요.");
		// 	mbei_password_check.focus();
			
		// } else if(mbei_password.val() != mbei_password_check.val()){
		// 	alert("입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요.");
		// 	mbei_password_check.focus();

		} else if(mbei_name.val()==null || mbei_name.val()==""){
			alert("이름을 입력해주세요.");
			mbei_name.focus();
			return;
		
		} else if(mbei_nickname_u.val()==null || mbei_nickname_u.val()==""){
			alert("닉네임을 입력해주세요.");
			mbei_nickname_u.focus();
			return;
		
		} else if(mbei_email.val()==null || mbei_email.val()==""){
			alert("이메일을 입력해주세요.");
			mbei_email.focus();
			return;


		// } else if(mem_authcode.val()==null || mem_authcode.val()==""){
		// 	alert("이메일 인증 확인 후 인증 코드를 입력해주세요.");
		// 	mem_authcode.focus();

		// } else if(isCheckEmail=="false"){   // 이메일인증 확인여부
		// 	alert("이메일인증을 해주세요.");
		// 	$("#btn_sendAuthCode").focus();
		
		} else if(mbei_phonenum.val()==null || mbei_phonenum.val()==""){
			alert("휴대폰 번호를 입력해주세요.");
			mbei_phonenum.focus();
			return;

		} else if(mbei_zipcode.val()==null || mbei_zipcode.val()==""){
			alert("우편번호를 입력해주세요.");
			$("#btn_postCode").focus();
			
		} else if(mbei_addr1st.val()==null || mbei_addr1st.val()==""){
			alert("주소를 입력해주세요.");
			$("#btn_postCode").focus();
			
		} else if(mbei_addr2nd.val()==null || mbei_addr2nd.val()==""){
			alert("상세 주소를 입력해주세요.");
			mem_addr_d.focus();
			return;

		} //else {
		// 	//form.submit();  // 전송태그를 <button type="button"> 를 사용하여 서브밋메서들 호출함.
		// }

		// 현재 비밀번호 확인 검사
		// var mbei_password2 = $("#mbei_password").val();

		// console.log(mbei_password2);

		//return;

		// $.ajax({
		// 	url: "/member/checkPwDuplicate",
		// 	type: "post",
		// 	datatype: "json",
		// 	data: $("#mbei_password").serializeArray(),
		// 	success: function(data){
		// 		if(data==true){
		// 			alert("회원정보를 수정합니다.");
		// 			form.submit();
		// 		} else{
		// 			alert("비밀번호가 다릅니다.");
		// 			//mbei_password.val("");
		// 			mbei_password.focus();
		// 		}
		// 	}
		// });

		// $.ajax({
		// 	url: "/member/checkPwDuplicate",
		// 	type: "post",
		// 	datatype: "json",
		// 	data: {mbei_password : mbei_password2},
		// 	success: function(data){
		// 		if(data==true){
		// 			form.submit();
		// 		} else{
		// 			alert("비밀번호가 다릅니다.");
		// 			//mbei_password.val("");
		// 			mbei_password.focus();
		// 		}
		// 	}
		// });

		// 현재 비밀번호 확인 검사
		var mbei_password2 = $("#mbei_password").val();

		console.log(mbei_password2);
		



		$.ajax({
			url: "/member/checkPwPOST",
			type: "post",
			datatype: "text",
			data: {mbei_password : mbei_password2},
			success: function(data){
				if(data=='SUCCESS'){
					form.submit();
					alert("정보를 변경합니다.");
				} else{
					alert("비밀번호가 다릅니다.");
				//	mbei_password.val("");
					mbei_password.focus();
				}
			}
		});

		// $.ajax({
		// 	url: "/member/checkPwDuplicate",
		// 	type: "post",
		// 	datatype: "text",
		// 	data: {mbei_password : mbei_password2},
		// 	success: function(data){
		// 		if(data=='SUCCESS'){
		// 			form.submit();
		// 			alert("정보를 변경합니다.");
		// 		} else{
		// 			alert("비밀번호가 다릅니다.");
		// 		//	mbei_password.val("");
		// 			mbei_password.focus();
		// 		}
		// 	}
		// });


    });

    $("#btn_cancle").on("click", function(){
		
		var result = confirm("회원정보수정을을 취소하시겠습니까?");
		if(result){
			location.href="/"; 
		} else{}
	});


});