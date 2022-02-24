<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지역별 상품 조회</title>
		<link  href="<c:url value='/css/listRegionPostView.css' />" rel="stylesheet"  type="text/css" >
		<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
		<script src="<c:url value='/js/marketSearch.js' />"></script>
	</head>
	<body>
		<div id="wrap">
			<!-- 로그인 -->
			
			<c:if test="${not empty sessionScope.sid }">
				<div class="insertBtn">
					<a href="<c:url value='/insertPostView/${mk.userId }' />">
						<img src="<c:url value='/image/footPrintWrite.png' />">
					</a>
				</div>
			</c:if>
			
			<!-- 비로그인 -->
			
			<c:if test="${empty sessionScope.sid }">
				<div class="insertBtn">
					<a href="<c:url value='/loginForm'/>">
						<img src="<c:url value='/image/footPrintWrite.png' />">
					</a>
				</div>
			</c:if>
		
			<h3 align = "center">우리동네 중고거래</h3>
			<br><hr>
			
			<div class="marketSearch">
				<h4>현재 우리 동네 : ${paging.mkRegion } </h4>
				<form action="<c:url value='/market/marketSearch'/>" name="searchForm" id="searchForm"><!-- action에 공백으로 주면 현재 페이지 주소까지 넣은것과 같다. -->
				  <select name="searchType">
				      <option id="optTitle" value="mkTitle">제목</option>
				      <option value="mkContent">내용</option>
				      <!-- <option value="mk_title_content">제목+내용</option>
				      <option value="userId">작성자</option> -->
				  </select>
				  <input type="hidden" name="nowPage" value="1">
				  <input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" >
				  <input type="submit" value="검색">
			  	</form>	
			</div>
			
			<hr>
			
			<div id="resultBox">
				<div id="wrapWholePost">
					<div id="mkListValue"></div>
					<c:forEach items="${mkList }" var="mk">
					<div class="productWrap">
						<div id="thumbnail"><a href="<c:url value='/market/detailViewPost/${mk.mkNo }' />">
									 ${mk.mkImg }</a></div>
						<div class="boardTitle" align="center">${mk.mkTitle }<%-- &nbsp;&nbsp;${mk.mkRegion } --%></div>
						<div class="boardPrice" align="center"><fmt:formatNumber value="${mk.mkPrice}" pattern="#,###" />원</div>
						<div class="boardDateHit" align="center">
							<div id="boardDate">
								<fmt:formatDate value="${mk.mkCreateDate}" pattern="yyyy-MM-dd"/>
							</div>
							<div id="boardHit" align="right">
								<img src="<c:url value='/image/eye.png' />"><h4>${mk.mkHit }</h4>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
	
				<!-- 페이지 넘기기 -->
				<div class="pagelist">
					<c:if test="${paging.startPage != 1 }">
						<a href="<c:url value='/market/listRegionPost/?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">‹</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }&emsp;</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="<c:url value='/market/listRegionPost/?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }&emsp;</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage }">
						<a href="<c:url value='/market/listRegionPost/?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}'/>">›</a>
					</c:if>
				</div>
				<br><hr><br>
			</div>
		</div>
	</body>
</html>