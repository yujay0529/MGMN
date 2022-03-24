<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지역별 상품 조회</title>
		<script src="<c:url value='/js/marketSearch2.js' />"></script>
	</head>
	<body>
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
				<a href="javascript:callAjax(${paging.startPage - 1 }, ${paging.cntPerPage});">‹</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }&emsp;</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="javascript:callAjax(${p }, ${paging.cntPerPage});">${p }&emsp;</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage }">
				<a href="javascript:callAjax(${paging.startPage + 1 }, ${paging.cntPerPage});">›</a>
			</c:if>
		</div>
		<br><hr><br>
	</body>
</html>