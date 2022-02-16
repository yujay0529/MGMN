<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
		<title>게시글 수정 페이지</title>
		<script type="text/javascript">
			 $(document).ready(function () {
		            $('#summernote').summernote({
		                tabsize: 2,
		                height: 400
		            });
		            
		            $('#submit_btn').on('click', function () {
		                alert("글 수정 완료");
		                window.history.go(-1);
		            });
		            
		            $('#cancelBtn').on('click',function() {
		            	window.history.go(-1);
		            })
		        });
		</script>
	</head>
	<body>
		<div id="wrap">
		<h3>상품 정보 수정</h3>
		<hr>
			<form method="post" action="<c:url value='/market/updatePost'/>">				<!-- action이 Controller 지정 값이랑 같아야 함 -->
				<input type="hidden" name="mkNo" id="mkNo" value="${mkVO.mkNo}">		<!-- 게시글 수정을 위해 hidden으로 값을 넘겨줌  -->
				<div>작성자 <input type="text" name="userId" id="userId" value="${mkVO.userId}" readonly></div>
				<div>게시글 제목<input type="text" name="mkTitle" id="mkTitle" value="${mkVO.mkTitle}"></div>
				<div>지역<input type="text" name="mkRegion" id="mkRegion" value="${mkVO.mkRegion}"></div>
				<div>제품 가격<input type="text" name="mkPrice" id="mkPrice" value="${mkVO.mkPrice}"></div>
				<div>카테고리<input type="text" name="ctgId" id="ctgId" value="${mkVO.ctgId}"></div>
		        <div>
			        <textarea id="summernote" name="mkContent">${mkVO.mkContent}</textarea>
		        </div>
				<div><input id='submit_btn' type='submit' value='등록'>&nbsp;&nbsp;<input type='reset' value='취소' id="cancelBtn"></div>
			</form>
		</div>
	</body>
</html>