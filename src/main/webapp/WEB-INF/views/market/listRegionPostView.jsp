<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지역별 상품 조회</title>
		<style type="text/css">
			a { 	
					text-decoration: none; }
			div#wrap {
   					width: 1024px;
    				margin: 0 auto; }
			div#thumbnail img{width:250px;}				 
			.productWrap {
				    width: 21%;
				    float: left;
				    margin: 2%; }
			.productWrap #thumbnail {
    				width: 100%; }
    		div#thumbnail img {
				    width: 100% !important;
				    height: 220px; }
		</style>
	</head>
	<body>
		<div id="wrap">
			<a href="<c:url value='/insertPostView' />">상품 등록</a>
			<h3 align = "center">상품 목록</h3><br><hr>
			<div id="wrapWholePost">
				<c:forEach items="${mkList }" var="mk">
				<div class="productWrap">
					<div id="thumbnail"><a href="<c:url value='/market/detailViewPost/${mk.mkNo }' />">
								 ${mk.mkImg }</a></div>
					<div>${mk.mkTitle }&nbsp;&nbsp;${mk.mkRegion }</div>
					<div><fmt:formatNumber value="${mk.mkPrice}" pattern="#,###" />원</div>
				</div>
				</c:forEach>
			</div>
			<!-- 페이지 넘기기 -->
			<div class="pagelist">
				<c:if test="${paging.startPage != 1 }">
					<a href="<c:url value='/market/listRegionPost/${1}?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">‹</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }&emsp;</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="<c:url value='/market/listRegionPost/${1 }/?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }&emsp;</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage }">
					<a href="<c:url value='/market/listRegionPost/${1 }/?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}'/>">›</a>
				</c:if>
			</div>
		</div>
	</body>
</html>