<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	    <!--  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	    <link rel="stylesheet" href="/css/write.css">
	    <title>게시글 작성 페이지</title>
	    <style type="text/css">
			h3 {
  					text-align: center; }
  			div#wrap {
				    margin: 0 auto;
				    width: 1024px; }
  					
		</style>
	    <script>
	        $(document).ready(function () {
	            $('#summernote').summernote({
	                placeholder: '내용을 입력해주세요',
	                tabsize: 2,
	                height: 400
	              
	            });
	     
	            $('#submit_btn').on('click', function () {
	            	
	            	var result = $("#summernote").val().indexOf("<p><img");			// indexOf 값을 못찾으면 -1 반환 => 유효성에 이용 가능
	            	/* alert(result); */
	            	 if($("#summernote").val() == "") {		// 값을 비워둔 경우
	             		alert("게시글 내용을 입력해주세요.");
	             		frmMkInsert.summernote.focus();
	             		return false;
	             	} else if(result == -1) {					// 값을 못찾은 경우
	             		alert("이미지를 추가해주세요.");
	             		frmMkInsert.summernote.focus();
	             		return false;
	             	} else {
	                alert("글 작성 완료");
	                window.history.go(-1);
	             	}
	            });
	            
	            $('#cancelBtn').on('click',function() {
	            	window.history.go(-1);
	            })
	           
	        });
	        
	
	    </script>
	</head>
	<body>
		<div id="wrap">
			<h3>우리동네 중고거래 상품 등록</h3>
			<hr>
			<form id="frmMkInsert" method="post" action="<c:url value='/insertPost'/> ">
				<div id="insertWholePost">
					<div class="insertPost">작성자 <input type="text" name="userId" id="userId" value="kim" readonly></div>	<!-- id 값 일단 고정 로그인이랑 연동시킬 예정 -->
					<div class="insertPost">게시글 제목<input type="text" name="mkTitle" id="mkTitle"></div>
					<%-- <div class="insertPost">지역<input type="text" name="mkRegion" id="mkRegion" value="${paging.mkRegion }" readonly></div> --%>
					<div class="insertPost">제품 가격<input type="text" name="mkPrice" id="mkPrice"></div>
					<div class="insertPost">카테고리<input type="text" name="ctgId" id="ctgId"></div>
				</div>
		        <div>
			        <textarea id="summernote" name="mkContent"></textarea>
		        </div>
				<div><input id='submit_btn' type='submit' value='등록'>&nbsp;&nbsp;<input type='reset' value='취소' id="cancelBtn"></div>
				<input type="hidden" name="mkImg" id="mkImg">
				
			</form>
			
		</div>
	</body>
</html>