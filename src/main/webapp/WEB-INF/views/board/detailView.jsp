<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value='/css/detailView.css'/>" rel="stylesheet"
	type="text/css">
<title>List</title>
</head>
<body>
 	<div id="wrap">
			
		<!-- TOP  -->
		
	<form id="detailForm" method="post" action="<c:url value='/BoardList'/>">
		<h3 id="title">게시글 조회</h3>
		<table border="1">
			<tr><th>${board.brdNo }</th><th colspan="3">${board.brdTitle }</th></tr>
			
			<tr><th>작성자</th><th>${board.userId }</th><th>작성일</th><th>${board.brdDate }</th><tr>
				<tr><td colspan="4">${board.brdCon }</td></tr>
				<tr><th colspan="4"><input type="submit" value="뒤로가기"> <%-- <button><a href="./updateForm/${board.brdNo}">수정하기</a></button> --%>


				
					<%-- <c:if test="${not empty sessionScope.sid }"> --%>
					<button><a href="#" onclick="javascript:deleteCheck();">삭제하기</a></button>
			<script type="text/javascript">
			
				function deleteCheck(){
					var answer = confirm("게시글을 삭제하시겠습니까?");
					if(answer == true){
						location.href="/board/deleteBoard/${board.brdNo}";
					}
				}
			</script>
					<%-- </c:if> --%></th>
				</tr>
		</table>
	</form>		  
	</div>
</body>
</html>