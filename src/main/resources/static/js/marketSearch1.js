/*
	marketSearch3.js
*/

$(document).ready(function(){
	
	$('#searchForm').on('submit', function(){
		event.preventDefault();
		//alert("aaa");		
		
		var searchType = $('#searchType').val();
		var searchKeyword = $('#searchKeyword').val();
		var nowPage = 1;
		var cntPerPage = 8;  		
		
		//alert(searchType);
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
	});
});

