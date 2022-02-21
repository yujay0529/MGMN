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
			<div>글번호&nbsp;&nbsp;${mkVO.mkNo }</div>
			<div>글이름&nbsp;&nbsp;${mkVO.mkTitle }</div>
			<div>글내용&nbsp;&nbsp;${mkVO.mkContent }</div>
			<div>가격&nbsp;&nbsp;${mkVO.mkPrice }</div>
			<div>지역&nbsp;&nbsp;${mkVO.mkRegion }</div>
			<div>등록자 아이디&nbsp;&nbsp;${mkVO.userId }</div>
			<div>카테고리&nbsp;&nbsp;${mkVO.ctgId }</div>
		<br>
		
		<!-- 수정 화면으로 이동 -->
		<a href="<c:url value='/market/updatePostForm/${mkVO.mkNo }' />">정보 수정</a><br><br>
		
		<!-- 게시글 삭제 -->
		<a href="javascript:deleteCheck();">게시글 삭제</a><br><br>
		
			
			<!--  댓글 창 -->
		    <div class="container">
		        <label for="content">댓글 목록</label>
		        <form name="commentInsertForm" >
		            <div class="input-group">
		               <input type="hidden" name="mkNo" value="${mkVO.mkNo }"/>
		               <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 작성해주세요.">
		               <span class="input-group-btn">
		                    <button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button>
		               </span>
		              </div>
		        </form>
		    </div>
		    
		    <div class="container">
		        <div class="commentList"></div>
		    </div>
		    
		    <!-- 스크립트 include로 추가 -->
			<%@ include file="mkComment.jsp" %>
		</div>	
	</body>
</html>