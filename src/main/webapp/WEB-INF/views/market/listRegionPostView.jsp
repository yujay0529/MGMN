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
		<script src="<c:url value='/js/marketSearch1.js' />"></script>
		<style type="text/css">
			
			
		</style>
	</head>
	<body>
	
		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	
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
			<div id="pageTitle">
				<h3 align = "center">우리동네 중고거래</h3>
				<br><hr>
			</div>
			<div class="marketSearch">
				<h4>현재 우리 동네 : ${paging.mkRegion } </h4>
				<form  name="searchForm" id="searchForm"><!-- action에 공백으로 주면 현재 페이지 주소까지 넣은것과 같다. -->
				  <select name="searchType" id="searchType">
				      <option id="optTitle" value="mkTitle">제목</option>
				      <option value="mkContent">내용</option>
				      <!-- <option value="mk_title_content">제목+내용</option>
				      <option value="userId">작성자</option> -->
				  </select>
				  <input type="hidden" name="nowPage" value="1">
				  <input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색어를 입력해주세요" >
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
		
		 <!--Footer-->
        <footer id="footer" class="footer">
            <div class="container">

                <div class="row">
                    <div class="main-footer">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>PORTFOLIO</h2>
                                <ul>
                                    <li><a href="#">Web Design</a></li>
                                    <li><a href="#">Brand & Identity</a></li>
                                    <li><a href="#">Mobile Design</a></li>
                                    <li><a href="#">Print</a></li>
                                    <li><a href="#">User Interface</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>ABOUT</h2>
                                <ul>
                                    <li><a href="#">The Company</a></li>
                                    <li><a href="#">History</a></li>
                                    <li><a href="#">Vision</a></li>

                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>GALLERY</h2>
                                <ul>
                                    <li><a href="#">lickr</a></li>
                                    <li><a href="#">Picasa</a></li>
                                    <li><a href="#">iStockPhoto</a></li>
                                    <li><a href="#">PhotoDune</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <h2>CONTACT</h2>
                                <ul>
                                    <li><a href="#">Basic Info</a></li>
                                    <li><a href="#">Map</a></li>
                                    <li><a href="#">Conctact Form</a></li>

                                </ul>
                            </div>
                        </div>

                    </div>

                    <div class="socio-copyright">

                        <div class="social">
                            <a target="_blank" href="#"><i class="fa fa-facebook"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-twitter"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-google-plus"></i></a>
                            <a target="_blank" href="#"><i class="fa fa-linkedin"></i></a>
                        </div>

                        <p>Made with <i class="fa fa-heart"></i> by <a target="_blank" href="http://bootstrapthemes.co"> Bootstrap Themes </a>2016. All rights reserved.</p>
                    </div>

                </div>	
            </div>

        </footer>


        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
	</body>
</html>