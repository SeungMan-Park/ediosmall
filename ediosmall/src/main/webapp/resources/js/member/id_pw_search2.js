  $(document).ready(function(){

$("#btn_pw_search").on("click", function(){

  $.ajax({
      url : "/member/pw_search",
      type : "get",
      data : {id : mbei_id},
      dataType : "text",
      success : function(data){
        if(data == "SUCCESS")
          alert("임시 비밀번호를 메일로 보냈습니다. 비번을 변경하세요.");      
        else {
          alert("로그인을 요청 합니다.");
        }            
      }
    });

});
 

});