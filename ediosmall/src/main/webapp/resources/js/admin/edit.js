$(document).ready(function(){

    var form = $("#modifyForm");


    /* 회원수정 버튼 클릭 시 */ 
	$("#btn_submit").on("click", function(){


        // 유효성검사 제외

     //   alert();

     //   return;

        form.submit();


    });
    
    /* 취소 버튼 클릭 시 */
	$("#btn_cancle").on("click", function(){
		
		var result = confirm("회원 정보 수정을 취소하시겠습니까?");
		if(result){
			location.href="/admin/admin_process/"; 
		} else{}
	});


});