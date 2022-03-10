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
	    <link  href="<c:url value='/css/insertPostView.css' />" rel="stylesheet"  type="text/css" >
	    <script src="<c:url value='/js/insertPostView.js' />"></script>
	    <title>게시글 작성 페이지</title>
	</head>
	<body>
		<div id="wrap">
			<h3>우리동네 중고거래 글쓰기</h3>
			<hr>
			<form id="frmMkInsert" method="post" action="<c:url value='/insertPost'/> ">
				<div id="insertWholePost">
					<table class="insertTable">
						<tr><th>작성자</th><td><input type="text" name="userId" id="userId" value="${sessionScope.sid }" readonly></td></tr>
						<tr><th>게시글 제목</th><td><input type="text" name="mkTitle" id="mkTitle"></td></tr>
					<%-- <div class="insertPost">지역<input type="text" name="mkRegion" id="mkRegion" value="${paging.mkRegion }" readonly></div> --%>
						<tr><th>제품 가격</th><td><input type="text" name="mkPrice" id="mkPrice"></td></tr>
						<tr><th>카테고리</th><td><input type="radio" id="ctgId1" name="ctgId" value="1" checked>강아지
			                                     			  <input type="radio" id="ctgId2" name="ctgId" value="2">고양이
			                                     			  <input type="radio" id="ctgId3" name="ctgId" value="3">기 타</td></tr>
					</table>
				</div>
		        <div>
			        <textarea id="summernote" name="mkContent"></textarea>
		        </div>
				<div id="insertSubmit" align="center"><input id='submit_btn' type='submit' value='등록'>&nbsp;&nbsp;<input type='reset' value='취소' id="cancelBtn"></div>
				<input type="hidden" name="mkImg" id="mkImg">
			</form>
		</div>
		
	</body>
</html>