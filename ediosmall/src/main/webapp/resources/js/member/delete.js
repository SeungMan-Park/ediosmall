$(document).ready(function(){

    var form = $("#deleteForm");


    /* 회원탈뢰 버튼 클릭 시 */ 
	$("#btn_submit_delete").on("click", function(){


		var mbei_password = $("#mbei_password");
	
		
		/* 유효성 검사 */
		
		if(mbei_password.val()==null || mbei_password.val()==""){
			alert("비밀번호를 입력해주세요.");
			mbei_password.focus();
            return;
		} 

		
		

		// 현재 비밀번호 확인 검사
		var mbei_password2 = $("#mbei_password").val();

		console.log(mbei_password2);
		
		var result = confirm("계정을 탈퇴하시겠습니까?");
		if(result){

			$.ajax({
				url: "/member/checkPwPOST",
				type: "post",
				datatype: "text",
				data: {mbei_password : mbei_password2},
				success: function(data){
					if(data=='SUCCESS'){
						alert("계정을 삭제합니다.");
						//return;
						form.submit();
						
					} else{
						alert("비밀번호가 다릅니다.");
					//	mbei_password.val("");
						mbei_password.focus();
					}
				}
			});
		
			
		} else{
			location.href="/"; 
		}

		return;


    });

    $("#btn_cancle").on("click", function(){
		
		var result = confirm("탈퇴를 취소하시겠습니까?");
		if(result){
			location.href="/"; 
		} else{}
	});


});