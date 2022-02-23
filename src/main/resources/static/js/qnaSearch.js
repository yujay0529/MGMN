/**
 * qnaSearch.js
 	상품 검색
 */


function getSearchList(){
	$.ajax({
		type:'POST',
		url : "/qna/qnaSearch",
		data : $("form[name=qnaSearch]").serialize(),
		success : function(result){
			//테이블 초기화
			$('#searchResultbox > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str += "<td>"+item.qnaTitle+"</td>";
					str+="<td>"+item.qnaHit+"</td>";
					str+="<td><a href = /qna/detailqna/" + item.qnaNo + ">" + item.qnaTitle + "</a></td>";
					str+="<td>"+item.qnaCreateDate+"</td>";
					str+="<td>"+item.userId+"</td>";
					str+="<td>"+item.category+"</td>";
					str+="</tr>"
					$('#searchResultbox').append(str);
        		})				 
			}
		}
	})
}
