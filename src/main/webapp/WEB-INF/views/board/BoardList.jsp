<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/css/BoardList.css'/>" rel="stylesheet" type="text/css">
<title>이벤트 목록</title>
</head>
<body>
	<div id="wrap">

		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<!--  이벤트 폼  -->
		
		<div class="area_head">
			<div class="list-title">
				<h2>이벤트</h2>
			</div>
			
			
		</div>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />

	</div>
</body>
</html>




pagePopup.openPetType()