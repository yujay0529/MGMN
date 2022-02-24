/*
	marketSearch.js
*/

$(document).ready(function(){
	$('#searchForm').on('submit', function(){
		event.preventDefault();
		alert("ddd");
		
		var formData = $(this).serialize();
		// serialize() : 폼에 입력한 값을 쿼리 스트링 방식의 데이터로 변환
		//type=prdName&keyword=노트북
		
		$.ajax({
			type:"post",
			url:"/market/marketSearch",
			data:formData,	
			success:function(result) {
				// var mkList = result;
				// $("#mkListValue").text(result[0].mkTitle);
				$("#resultBox").html(result);
				// alert(result.length);
				// alert(mkList[0].mkImg);
				/*$("#wrapWholePost").html('<div class="productWrap">' 
									+ '<div id="thumbnail"><a href="<c:url value='
									+ "'/market/detailViewPost/${"
									+ mk.mkNo + "}' />" + '">${' + mk.mkImg + '}</a></div><div>${'
									+ mk.mkTitle + '}&nbsp;&nbsp;${' + mk.mkRegion + '}</div><div>'
									+ '<fmt:formaterNumber value="${' + mk.mkPrice + '}" pattern="#,###" />원</div></div>')
				*/
				/*$("#wrapWholePost").html('<div class="productWrap">' 
									+ '<div id="thumbnail"><a href="<c:url value='
									+ "'/market/detailViewPost/"
									+ mk.mkNo + "' />" + '">' + mk.mkImg + '</a></div><div>'
									+ mk.mkTitle + '&nbsp;&nbsp;' + mk.mkRegion + '</div><div>'
									+ '<fmt:formaterNumber value="' + mk.mkPrice + '" pattern="#,###" />원</div></div>')*/ 
			},
			error:function(data, textStatus) {
				alert("전송 실패!");
			}
		});
	});
});
