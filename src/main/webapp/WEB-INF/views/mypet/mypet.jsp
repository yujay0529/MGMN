<!-- <<<<<<< HEAD -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypetForm</title>
<style type="text/css">
.mainMypage-content {
   height: 600px;
   padding: 200px;
   padding-left: 600px;
}
</style>
</head>
<body>
	<div id="wrap">

		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div class="main-inner">
			<div class="mainMypage-content">
					<h3>반려동물정보</h3>
				<!-- 등록된 반려동물이 없는 경우 -->
				<div class="none-list">
					<img src="/image/none_basket.png" alt="">
					<p>등록된 반려동물이 없습니다.</p>
					
				<input type="button" onClick="location.href='<c:url value="/insertPetInfoView" />'" value="반려동물 등록">
					  
				</div>
				<%-- <!-- 등록된 반려동물이 있는 경우 -->
				<c:if test="${sessionScope.sid == petVO.userId }">
				<div>
					<table class="petInfoTable">
					<tr><th>반려동물 이름</th><td>${petVO.petName }</td></tr>
					<tr><th>반려동물 나이</th><td>${petVO.petAge }</td></tr>
					<tr><th>반려동물 성별</th><td>${petVO.petGender }</td></tr>
					<tr><th>반려동물 종</th><td>${petVO.petBreed }</td></tr>
				</table>
				</div>
				</c:if> --%>
			</div>
		</div>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
	</div> <!-- wrap -->

		<!-- 반려동물 등록 모달 창 -->
		
  </body>
  <script>

	</script>
</html>