<!-- <<<<<<< HEAD -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPetInfoForm</title>
<link  href="<c:url value='/css/insertPetInfoForm.css' />" rel="stylesheet"  type="text/css" >
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="<c:url value='/js/insertPetInfoForm.js' />"></script>
</head>
<body>
	<div id="wrap">
		
		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<div id="insertContent">
			<h3>반려동물 정보 등록</h3>	
			<form id="frmPetInfoInsert" method="post" action="<c:url value='/insertPetInfo' /> ">	
				<div class="text-wrap">
					<p>반려동물을 선택해주세요.</p>
					<span><input type="radio" name="dogCat" id="dog" value="dog" checked><img src="/image/icon_dogbig.png" alt="">
								<input type="radio" name="dogCat" id="cat" value="cat"><img src="/image/icon_catbig.png" alt="">
					</span>
					<table class="insertTable">
						<tr><th>반려인</th><td><input type="text" name="userId" id="userId" value="${sessionScope.sid }" readonly></td></tr>
						<tr><th>이름</th><td><input type="text" name="petName" id="petName"></td></tr>
						<tr><th>품종</th><td><input type="text" name="petBreed" id="petBreed"></td></tr>
						<tr><th>나이</th><td><select name="petAge">
															<option value="0">0살</option>
															<option value="1">1살</option>
															<option value="2">2살</option>
															<option value="3">3살</option>
															<option value="4">4살</option>
															<option value="5">5살</option>
															<option value="6">6살</option>
															<option value="7">7살</option>
															<option value="8">8살</option>
															<option value="9">9살</option>
															<option value="10">10살</option>
															<option value="11">11살</option>
															<option value="12">12살</option>
															<option value="13">13살</option>
															<option value="14">14살</option>
															<option value="15">15살</option>
															<option value="16">16살</option>
															<option value="17">17살</option>
															<option value="18">18살</option>
															<option value="19">19살</option>
															<option value="20">20살</option>
															<option value="21">21살</option>
															<option value="22">22살</option>
															<option value="23">23살</option>
															<option value="24">24살</option>
															<option value="25">25살</option>
														</select></td></tr>
						<tr><th>성별</th><td><input type="radio" name="petGender" id="petF" value="암컷" checked>암컷
														<input type="radio" name="petGender" id="petM" value="수컷">수컷</td></tr>
					</table>
				<div id="insertSubmit" align="center"><input id='submit_btn' type='submit' value='등록'>&nbsp;&nbsp;<input type='reset' value='취소' id="cancelBtn"></div>
				</div>
			</form>
		</div>
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
	</div>

		

</html>