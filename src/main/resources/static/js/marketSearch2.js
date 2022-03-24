/*
	marketSearch2.js
*/

function callAjax(nowPage, cntPerPage) {
		var searchType = $('#searchType').val();
		var searchKeyword = $('#searchKeyword').val();		
		$.ajax({
			type:"post",
			url:"/market/marketSearch",
			//data:formData,	
			async: false,
			data:{
				'searchType':searchType,
				'searchKeyword':searchKeyword,
				'nowPage':nowPage,
				'cntPerPage':cntPerPage
			},				
			success:function(result) {			
				$("#resultBox").html(result);		
			},
			error:function(data, textStatus) {
				alert("전송 실패!");
			}
		});
		}
