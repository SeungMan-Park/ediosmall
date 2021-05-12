$(document).ready(function(){

	// 비밀번호 찾기 : 메일전송
    $("#btn_PW_Search").on("click", function(){
      //  alert();

        var userInfo ={mbei_id:$("#mbei_id").val(), mbei_name:$("#mbei_name").val()};

        $.ajax({
            url : '/member/find_pwd',
            type : 'post',
            data : userInfo,
            dataType : 'text',
            success: function(data){
                // 비밀번호 출력작업

                if(data == "SUCCESS"){
                   alert("가입하신 메일로 전송 하였습니다.");
                }else{
                   $("#result").html("아이디와 이름이 일치하지 아니합니다");
                }
            }
        })
    });

    // 아이디 찾기 : 화면출력
    $("#btn_ID_Search").on("click", function(){

        $.ajax({
            url : '/member/find_id',
            type : 'post',
            data : {mbei_name:$("#mbei_name").val()},
            dataType : 'text',
            success: function(data){
                // 비밀번호 출력작업

                if(data != ""){
                   // alert(data);
                   $("#result").html($("#mbei_name").val() + "님의 아이디는 " +data+ " 입니다.");
                }else{
                   $("#result").html("아이디가 존재하지 아니합니다.");
                }

                $("#mbei_name").val("");
            }
        })
    });


});