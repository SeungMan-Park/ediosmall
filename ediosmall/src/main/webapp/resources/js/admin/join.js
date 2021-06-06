$(document).ready(function() {
	
	var form = $("#joinForm");
	
	// 아이디중복체크 기능 사용여부확인 변수
	var isCheckId = "false";

	/* 아이디 중복체크 클릭 시 */
	$("#btn_checkId").on("click", function(){
		
		if($("#admin_id").val()=="" || $("#admin_id").val()== null){
			$("#id_availability").html("아이디를 먼저 입력해주세요.");
			
			return;
		} 		
		
		var admin_id = $("#admin_id").val();
		
		// ajax방식은 제어의 흐름이 클라이언트시작 -> 서버요청 -> 클라이언트  종료
		// ajax방식은 서버요청에 실행되는 코드가 response.redirect,redirect: 주소이동 구문이 사용안하거나 
		// 동작되어서는 안된다.
		$.ajax({
			url: '/admin/checkIdDuplicate',
			type: 'post',
			dataType: 'text',  //  '/admin/checkIdDuplicate'주소에서 넘어오는 리턴값의 형식
			data: {admin_id : admin_id},  // javasciprt object 표현구문.www.w3school.com 참고
			success : function(data){
				if(data== 'SUCCESS'){
					// 사용 가능한 아이디
					$("#id_availability").css("color", "blue");
					$("#id_availability").html("사용가능한 아이디 입니다.");
					// 아이디를 중복체크하고 나서 아이디 텍스트박스 읽기모드, ,중복체크 비활성화
					//$("#mbei_id").attr("readonly", true);
					//$("#btn_checkId").attr("disabled", true);
					
					isCheckId = "true";  // 아이디 중복체크를 한 용도
				} else {
					// 사용 불가능 - 이미 존재하는 아이디
					$("#id_availability").html("이미 존재하는 아이디입니다. \n다시 시도해주세요.");
				}
			}
		});
	});
	
	
	
	
	/* 회원가입 버튼 클릭 시  <button type= */
	$("#btn_submit").on("click", function(){

		//form.submit();  // 필요한 경우 생략하기로 한다.
		
		// 유효성 검사 skip
		
		var admin_id = $("#admin_id");
		var admin_pw = $("#admin_pw");
		var admin_pw_check = $("#admin_pw_check");
		var admin_name = $("#admin_name");
		var admin_phonenum = $("#admin_phonenum");
		var admin_email = $("#admin_email");
		
		/* 유효성 검사 */
		
		if(admin_id.val()==null || admin_id.val()==""){
			alert("아이디를 입력해주세요");
			admin_id.focus();
			return;
			
		} else if(isCheckId =="false"){   // 아이디 중복기능 사용여부 확인
			alert("아이디 중복 체크를 해주세요.");
			$("#btn_checkId").focus();
			
		} else if(admin_pw.val()==null || admin_pw.val()==""){
			alert("비밀번호를 입력해주세요.");
			admin_pw.focus();
			
		} else if(admin_pw_check.val()==null || admin_pw_check.val()==""){
			alert("비밀번호 확인 란을 입력해주세요.");
			admin_pw_check.focus();
			
		} else if(admin_pw_check.val() != admin_pw.val()){
			alert("입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요.");
			admin_pw_check.focus();

		} else if(admin_name.val()==null || admin_name.val()==""){
			alert("이름을 입력해주세요.");
			admin_name.focus();
		
		} else if(admin_phonenum.val()==null || admin_phonenum.val()==""){
			alert("휴대전화번호를 입력해주세요.");
			admin_phonenum.focus();
		
		} else if(admin_email.val()==null || admin_email.val()==""){
			alert("이메일을 입력해주세요.");
			admin_email.focus();
		} else {
			alert("회원가입이 되었습니다.");
			//return;
			form.submit();
		}
		
		
	});
	
	$("#btn_cancle").on("click", function(){
		
		var result = confirm("가입을 취소하시겠습니까?");
		if(result){
			location.href="/admin/"; 
		} else{}
	});
	
});

