$(document).ready(function(){

    var form = $("#modifyForm_pw");


    /* 회원수정 버튼 클릭 시 */ 
	$("#btn_submit_mpw").on("click", function(){

        // var mbei_password_ch = $("#mbei_password_ch").val();
        // var mbei_password = $("#mbei_password").val();
        // var mbei_password_check = $("#mbei_password_check").val();

        var mbei_password_ch = $("#mbei_password_ch");
        var mbei_password = $("#mbei_password");
        var mbei_password_check = $("#mbei_password_check");

        // var mbei_password_ch = $(this).parent().find("input[name='mbei_password_ch']").val();
        // var mbei_password = $(this).find("input[name='mbei_password']").val();
        // var mbei_password_check = $("#mbei_password_check").val();
	
		// console.log("버튼인식 확인");
        // console.log(mbei_password_ch);
        // console.log(mbei_password);
        // console.log(mbei_password_check);

        // 유효성검사
        if(mbei_password_ch.val() == null || mbei_password_ch.val() == ""){
            alert("현재 비밀번호를 입력하세요.");
            mbei_password_ch.focus();
            return;
        }else if(mbei_password.val() == null || mbei_password.val() == ""){
            alert("변경할 비밀번호를 입력하세요.");
            mbei_password.focus();
            return;
        }else if(mbei_password_check.val() == null || mbei_password_check.val() == ""){
            alert("변경할 비밀번호를 확인하세요.");
            mbei_password_check.focus();
            return;
        }else if(mbei_password.val() != mbei_password_check.val()){
            alert("변경할 비밀번호와 비밀번호 확인값과 다릅니다.");
            mbei_password.focus();
            return;
        }

		// 현재 비밀번호 확인 검사
		var mbei_password2 = $("#mbei_password_ch").val();

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

        return;




    });


});