<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="<c:url value='/css/login.css'/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/login.js'/>"></script>
</head>
<body>
	<div id="wrap">

		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<!--  로그인 폼  -->

		<form action="<c:url value="loginForm"/>" method="post" id="loginForm"
			class="loginForm">
			<h2>Login</h2>
			<div class="idForm">
				<input type="text" id="id" class="id" placeholder="ID">
			</div>
			<div class="passForm">
				<input type="password" id="pwd" class="pw" placeholder="PW">
			</div>
			<button type="submit" id="button" class="btn" onclick="button()">
				LOG IN</button>

			<div class="bottomText">
				Don't you have ID? <a href="#">sign up</a>
			</div>

			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		</form>
	</div>
</body>
</html>


