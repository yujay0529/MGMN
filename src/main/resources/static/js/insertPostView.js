/*
	insertPetInfoForm.js
*/

  $(document).ready(function () {
   	 $('#summernote').summernote({
        placeholder: '내용을 입력해주세요',
        tabsize: 2,
        height: 400
      
   	 });
     
    $('#submit_btn').on('click', function () {
    	
    	var result = $("#summernote").val().indexOf("<img");			// indexOf 값을 못찾으면 -1 반환 => 유효성에 이용 가능
    	/* alert(result); */
    	 if($("#summernote").val() == "") {		// 값을 비워둔 경우
     		alert("게시글 내용을 입력해주세요.");
     		frmMkInsert.summernote.focus();
     		return false;
     	} else if(result == -1) {					// 값을 못찾은 경우
     		alert("이미지를 추가해주세요.");
     		frmMkInsert.summernote.focus();
     		return false;
   
     	} else if($("#mkTitle").val().length > 20 || $("#mkTitle").val().length < 5 ) {
     		// alert($("#mkTitle").val().length);
    		alert("게시글 제목은 5~20자로 적어주세요");
    		mkTitle.focus();
    		return false;
    	
    	} else if($("#mkPrice").val().length > 20 || $("#mkPrice").val().length == 0 ) {
    		alert("가격 항목을 확인해주세요");
    		mkPrice.focus();
    		return false;
    	
    	}else {
            alert("글 작성 완료");
            window.history.go(-1);
         	}
    });
            
    $('#cancelBtn').on('click',function() {
    	window.history.go(-1);
    })
   
           
});
        
