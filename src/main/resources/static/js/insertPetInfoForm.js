/*
	insertPetInfoForm.js
*/

$(document).ready(function(){
	 $('#submit_btn').on('click', function () {
	            	
    	 if($("#petName").val() == "") {		// 값을 비워둔 경우
     		alert("반려동물의 이름을 입력해주세요.");
     		$("#petName").focus();
     		return false;
     	} else if($("#petBreed").val() == "") {		
     		alert("반려동물의 종을 입력해주세요.");
     		$("#petBreed").focus();
     		return false;
  
    	}else {
            alert("반려동물 등록을 완료했습니다.");
            window.history.go(-1);
         	}
    });
    
    $('#cancelBtn').on('click',function() {
    	window.history.go(-1);
    })
	   
});
