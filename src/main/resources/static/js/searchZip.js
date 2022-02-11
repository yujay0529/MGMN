/**
 * searchZip.js
   우편번호 검색
 */
 
  $(document).ready(function(){
	
	$('#searchZip').on('click', function(){	
		new daum.Postcode({
			oncomplete:function(data){
				// 팝업 창에서 검색 결과 클릭했을 때 
				var address1 = '';
				//법정명과 건물명 : (~동, ~건물) (~동, ~아파트)
				//var dong_building='';
				
				//도로명 주소인 경우
				if(data.userSelectedType == 'R'){
					address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
				}else { //지번 주소인 경우
					address1 = data.jibunAddress;
				}
				
				// 우편번호와 주소1 출력
				document.getElementById('userZipcode').value = data.zonecode;
				document.getElementById('userAddress1').value = address1;
				
				// 상세주소 입력하도록 입력되어 있는 값 삭제하고 포커스
				var address2 = document.getElementById('userAddress2');
				address2.value = "";
				address2.focus();
				
			}
		}).open();		
	});		
});	