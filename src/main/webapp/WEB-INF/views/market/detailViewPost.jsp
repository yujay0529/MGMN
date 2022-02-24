<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width"/>
		<meta charset="UTF-8">
		<title>중고마켓 상세 페이지</title>
		<link  href="<c:url value='/css/detailViewPost.css' />" rel="stylesheet"  type="text/css" >
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript">
			function deleteCheck() {
				var answer = confirm("해당 게시글을 삭제하시겠습니까?");
				if(answer) {
					location.href="/market/deletePost/${mkVO.mkNo}/${mkVO.mkRegion}";				// 컨트롤러에서 사용할 값을 주소로 넘겨준다.
				}
			}
			
		</script>
	</head>
	<body>
		<div id="wrap">
			<a href="<c:url value='/market/listRegionPost' />"><h3>우리동네 중고거래</h3></a>
			<!-- 게시글 삭제 -->
		<c:if test="${sessionScope.sid == mkVO.userId }">
			<input type="button" id="deleteBtn" value="게시글 삭제" onClick = "location.href='javascript:deleteCheck();'">
		</c:if>
		
		<!-- 수정 화면으로 이동 -->
		<c:if test="${sessionScope.sid == mkVO.userId }">
			<input type="button" id="updateBtn" value="게시글 수정" onClick ="location.href='<c:url value="/market/updatePostForm/${mkVO.mkNo }" />'">
		</c:if>
			<hr>
			<div id="detailViewInfo">
				<table class="insertTable">
					<tr><th>글쓴이</th><td>${mkVO.userId }</td></tr>
					<tr><th>제 목</th><td>${mkVO.mkTitle }</td></tr>
					<tr><th>가 격</th><td>${mkVO.mkPrice }</td></tr>
					<tr><th>지 역</th><td>${mkVO.mkRegion }</td></tr>
				</table>
				<div id="detailViewContent">
					${mkVO.mkContent }
				</div>
			</div>
		<br>
	
			<!--  댓글 창 -->
		    <div class="container">
		        <label for="content" id="commentList">댓글 목록</label>
		        <form name="commentInsertForm" id="commentInsertForm">
		            <div class="input-group">
		               <input type="hidden" name="mkNo" value="${mkVO.mkNo }"/>
		               <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 작성해주세요.">
		               <span class="input-group-btn">
		                    <button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button>
		               </span>
		              </div>
		        </form>
		    </div>
		    <br>
		    <hr>
		    
		    <div class="container">
		        <div class="commentList"></div>
		    </div>
		    
		    <!-- 스크립트 include로 추가 -->
			<%@ include file="mkComment.jsp" %>
		</div>	
	</body>
</html>