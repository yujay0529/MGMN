<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
				
			<!-- TOP  -->
		   <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		   
			<section>
	         <a href="<c:url value='qnaList' />">qna페이지</a><br><br>
	         <a href="<c:url value='shops' />">동네 샵정보</a><br><br>
	         <a href="<c:url value='market' />">중고거래</a>
			</section>
			
			
			
			
			<!-- BOTTOM  -->
		   <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
			</div>
	</body>
</html>