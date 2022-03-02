<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width"/>
		<meta charset="UTF-8">
		<title>중고마켓 상세 페이지</title>
		<link  href="<c:url value='/css/detailViewPost.css' />" rel="stylesheet"  type="text/css" >
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript">
			function deleteCheck() {
				var answer = confirm("해당 게시글을 삭제하시겠습니까?");
				if(answer) {
					location.href="/market/deletePost/${mkVO.mkNo}/${mkVO.mkRegion}";				// 컨트롤러에서 사용할 값을 주소로 넘겨준다.
				}
			}
			
		</script>
	</head>
	<body>
	
		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<!-- CONTENT -->
		<div id="wrap">
			<a href="<c:url value='/market/listRegionPost' />"><h3>우리동네 중고거래</h3></a>
		<!-- 게시글 삭제 -->
		<c:if test="${sessionScope.sid == mkVO.userId }">
			<input type="button" id="deleteBtn" value="게시글 삭제" onClick = "location.href='javascript:deleteCheck();'">
		</c:if>
		
		<!-- 수정 화면으로 이동 -->
		<c:if test="${sessionScope.sid == mkVO.userId }">
			<input type="button" id="updateBtn" value="게시글 수정" onClick ="location.href='<c:url value="/market/updatePostForm/${mkVO.mkNo }" />'">
		</c:if>
			<hr>
			<div id="detailViewInfo">
				<table class="insertTable">
					<tr><th>글쓴이</th><td>${mkVO.userId }</td></tr>
					<tr><th>제 목</th><td>${mkVO.mkTitle }</td></tr>
					<tr><th>가 격</th><td>${mkVO.mkPrice }</td></tr>
					<tr><th>지 역</th><td>${mkVO.mkRegion }</td></tr>
				</table>
				<div id="detailViewContent">
					${mkVO.mkContent }
				</div>
			</div>
		<br>
	
			<!--  댓글 창 -->
		    <div class="container">
		        <label for="content" id="commentList">댓글 목록</label>
		        <form name="commentInsertForm" id="commentInsertForm">
		            <div class="input-group">
		               <input type="hidden" name="mkNo" value="${mkVO.mkNo }"/>
		               <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 작성해주세요.">
		               <span class="input-group-btn">
		               		 <c:if test="${empty sessionScope.sid }">
		               			<input type="button" id="toLogin" value="등록" onClick="location.href='<c:url value="/loginForm" />' ">
		               		</c:if>
		               		<c:if test="${not empty sessionScope.sid }">
		                    	<button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button>
		                    </c:if>
		               </span>
		               <input type="hidden" name="userId" value="${sessionScope.sid }" />
		              </div>
		        </form>
		    </div>
		    <br>
		    <hr>
		    
		    <div class="container">
		        <div class="commentList"></div>
		    </div>
		    
		    <!-- 스크립트 include로 추가 -->
			<%@ include file="mkComment.jsp" %>
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