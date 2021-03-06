<!-- <<<<<<< HEAD -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypetForm</title>
<link  href="<c:url value='/css/mypetForm.css' />" rel="stylesheet"  type="text/css" >
<script type="text/javascript">
	function deleteCheck() {
		var answer = confirm("반려동물 정보를 삭제하시겠습니까?");
		if(answer) {
			location.href='/deletePetInfo/${petVO.petNo}';				// 컨트롤러에서 사용할 값을 주소로 넘겨준다.
		}
	}
</script>
</head>
<body>
	<div id="wrap">

		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<div id="content">
		<div class="main-inner">
			<div class="mainMypage-content">
					<%-- <h3>${sessionScope.sid}님의 반려동물정보</h3> --%>
					
					<!-- 등록된 반려동물이 없는 경우 -->
					<c:if test="${sessionScope.sid != petVO.userId }">
						<div class="none-list">
							<img src="/image/noneBasket.jpg" alt="">
							<p>등록된 반려동물이 없습니다.</p>
							
						<input type="button" onClick="location.href='<c:url value="/insertPetInfoView" />'" value="반려동물 등록">
						</div>
						</c:if>	  
				
				
					<!-- 등록된 반려동물이 있는 경우 -->
					<c:if test="${sessionScope.sid == petVO.userId }">
						<div id="petInfo">
							<div id="dogCatImg">		
								<c:if test="${petVO.dogCat == 'dog'}">
									<img src="/image/ifdog.png">
								</c:if>
								<c:if test="${petVO.dogCat == 'cat'}">
									<img src="/image/ifcat.png">
								</c:if>
							</div>
							<div id="petTable">
								<table class="petInfoTable">
									<tr><th>반려동물 이름</th><td>${petVO.petName }</td></tr>
									<tr><th>반려동물 나이</th><td>${petVO.petAge }살</td></tr>
									<tr><th>반려동물 성별</th><td>${petVO.petGender }</td></tr>
									<tr><th>반려동물 종</th><td>${petVO.petBreed }</td></tr>
								</table>
							</div>
						<div id="deleteBtn">
							<%-- <button onClick="location.href='<c:url value="/deletePetInfo/${petVO.petNo}" />'">반려동물 정보 삭제</button> --%>
							<button onClick="location.href='javascript:deleteCheck();'">반려동물 정보 삭제</button>
						</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
	</div> <!-- wrap -->

  </body>
  
</html>