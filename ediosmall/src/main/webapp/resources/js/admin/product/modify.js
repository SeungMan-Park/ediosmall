$(document).ready(function(){

    var form = $("#modifyForm");

    $("#btn_submit").on("click", function(){

        form.submit();
    });
    
    $("#btn_List").on("click", function(){

        location.href="/admin/product/pro_list"; 
        
        //form.attr("action","/admin/product/pro_list");
		//form.submit();
    }); 
 
    
});