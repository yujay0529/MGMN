<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<link href="<c:url value='/css/join.css'/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/memIdCheck.js'/>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- https 혹은 http로 고쳐야 api가 불러와짐 -->
<script src="<c:url value='/js/searchZip.js'/>"></script>
</head>
<body>
	<div id="wrap">

		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<!--  회원 가입 폼  -->
		<div class="register">
			<h2>회원가입</h2>
			<form id="joinForm" name="joinForm" method="post"
				action="<c:url value='/join'/>">
				<div class="flex">
					<ul class="container">
						<li class="item center">이름</li>
						<li class="item"><input id="userName" name="userName" placeholder="이름을 입력하세요." 
							autofocus required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">아이디</li>
						<li class="item"><input type="text" id="userId" name="userId"
							placeholder="아이디를 입력하세요." required></li>
						<li class="item">
							<button id="idCheck" class="idcheck">중복확인</button>
						</li>
					</ul>
					<ul class="container">
						<li class="item center">비밀번호</li>
						<li class="item"><input type="password" id="userPwd"
							name="userPwd" placeholder="비밀번호를 입력하세요." required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">비밀번호 확인</li>
						<li class="item"><input type="password" id="userPwd2"
							name="userPwd2" placeholder="비밀번호를 다시 입력하세요." required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">이메일</li>
						<li class="item"><input type="text" id="userEmail"
							name="userEmail" placeholder="이메일을 입력하세요." required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">생년월일</li>
						<li class="item"><input type="date" required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">성별</li>
						<li class="item"><select name="gender" id="gender">
								<option value="선택" selected>선택</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
						</select></li>
						<li class="item"></li>
					</ul>
					<ul class="container2">
						<li class="item center">전화번호</li>
						<li class="item3"><input type="text" id="userHp1"
							name="userHp1" size="3" placeholder="010">
							&nbsp&nbsp&nbsp&nbsp <input type="text" id="userHp2"
							name="userHp2" size="4" placeholder="0000">
							&nbsp&nbsp&nbsp&nbsp <input type="text" id="userHp3"
							name="userHp3" size="4" placeholder="0000"></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">우편번호</li>
						<li class="item">
						<input type="text" id="userZipcode"
							name="userZipcode" size="5" placeholder="우편번호 찾기를 눌러주세요." readonly>
						<li class="item">
							<button id="searchZip" class="searchZip">우편번호찾기</button>
						</li>
					</ul>
					
					
					<ul class="container">
						<li class="item center">주소1</li>
						<li class="item">	
						<input
							type="text" id="userAddress1" name="userAddress1" size="70" placeholder="우편번호 찾기를 눌러주세요." readonly
							>
					</ul>
					
					<ul class="container">
						<li class="item center">주소2</li>
						<li class="item"><input type="text" id="userAddress2"
							name="userAddress2" size="70" placeholder="상세 주소를 입력하세요." >
						
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center"></li>
						<li class="item">
							<button type="submit" class="submit">가입하기</button>
						</li>
						<li class="item"></li>
					</ul>
				</div>
			</form>
		</div>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />

	</div>

</body>
</html>


