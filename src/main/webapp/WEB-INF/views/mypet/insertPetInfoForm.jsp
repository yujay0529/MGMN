<!-- <<<<<<< HEAD -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPetInfoForm</title>
</head>
<body>
	<!-- 반려동물 등록 모달 창 -->
	
	<div class="modal">
	<form id="frmPetInfoInsert" method="post" action="<c:url vlaue='/insertPetInfo' /> ">
		<h3>반려동물 상세</h3>	
		<div class="text-wrap">
			<p>반려동물을 선택해주세요.</p>
				<span><input type="radio" name="dogCat" id="dog" value="dog" checked><img src="/image/icon_dogbig.png" alt="">
							<input type="radio" name="dogCat" id="cat" value="cat"><img src="/image/icon_catbig.png" alt="">
				</span>
				<span><input type="hidden" id="petNo" name="petNo"></span>
				<span>이름<input type="text" id="petName" name="petName"></span>
				<span>나이<input type="text" id="petAge" name="petAge"></span>
				<span>성별<input type="text" id="petGender" name="petGender"></span>
				<span>품종<input type="text" id="petBreed" name="petBreed"></span>
				<span>userId<input type="text" id="userId" name="userId"></span>
				<span><input  type='submit' id='submit_btn' value="등록"></span>
		</div>
		</form>
	</div>
		

</html>