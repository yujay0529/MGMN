<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

  	<link rel="stylesheet" href="/css/reference.css">

    <link rel="stylesheet" href="/css/reference.css">

    <title>공지사항</title>
</head>
<style>

.paging{

	 position: absolute;
        margin-left: 44%;
        top: 75%;
        display: flex;
        height: 20%;
        border: solid 0px;
}
.pageNum{
		position:absolute;
		padding:50px;
}
</style>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="notiList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>

<body>
	<div id="wrap">
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

	       <div id="container">

            <div id="center">

                <div class="containter_table">
                    <center>
                       <div class="table_title">

                           <h1 style="color:rgba(51,51,51);">공지사항</h1>
                           <h3 style="color:rgba(51,51,51);">Notice</h3>

                       </div>

                       <div id="writeBtn">
                           <!-- 카테고리 찾기 -->
                           <select class="select_ctg" name="select_ctg">
                               <option value="7">최신순</option>
                               <option value="6">오래된순</option>
                           </select>
                           
                           
                           <!-- 글쓰기 버튼 -->
                           <button id="write_btn"> <a href ="<c:url value='/notice/write'/>">새 글</a></button>

                       </div>



                       <table class="table" border="0.5" cellspacing="0">

                           <caption>
                           <colgroup>
                               <col width=100px>
                               <col width=450px>
                               <col width=150px>
                               <col width=150px>
                               <col width=100px>
                           </colgroup>

                           <thead>
                               <tr>
                                   <th scope="col">번호</th>
                                   <th scope="col">제목</th>
                                   <th scope="col">글쓴이</th>
                                   <th scope="col">날짜</th>
                                   <th scope="col">조회수</th>
                               </tr>
                           </thead>
                         </caption>
                           
                           <!-- 공지사항 테이블 -->
                        
                         <tbody class="sub_news" border="1" cellspacing="0">
                         <c:choose>
                         <c:when test="${empty notiList}">
                         	<tr align="center"><td colspan="6">찾는 상품이 없습니다.</td></tr>
                         </c:when>
						<c:otherwise>
							<c:forEach items="${notiList }" var="noti">
	                            <tr>
	                                <td>${noti.noticeNo }</td>
	                                <td class="title">
	                                    <a href="<c:url value='/notice/detailNotice/${noti.noticeNo}'/>">${noti.noticeTitle }
	                                        <font color="black">(${noti.comment })</font>
	                                    </a>
	                                </td>
	                                <td class="name">${noti.memId }</td>
	                                <td class="date"><fmt:formatDate value="${noti.createDate}" pattern="yyyy.MM.dd"/></td>
	                                <td class="hit">${noti.noticeHit }</td>
	                                </tr>
	                         </c:forEach>
                         </c:otherwise>
                         </c:choose>
                               
            <!-- ~~~~~~~~~~페이징  ~~~~~~~-->
			 <div class='paging'>
				<div calss="pageNum" style="position: left;">	
				
					<select id="cntPerPage" name="sel" onchange="selChange()" >
						<option value="5"
							<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개 보기</option>
						<option value="10"
							<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개 보기</option>
						<option value="15"
							<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개 보기</option>
						<option value="20"
							<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개 보기</option>
					</select>
					</div><!-- 옵션선택 끝 -->
				 
				
						
						<!-- 페이지 넘기기 -->		
		      			<div class="pagelist">
					<c:if test="${paging.startPage != 1 }">
						<a href="<c:url value='/notiList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">◀</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="<c:url value='/notiList?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="<c:url value='/notiList?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}'/>">▶</a>
					</c:if>
					</div>
				
			</div>
		
	
	<!-- 페이지 넘기기 끝 -->
                            </tbody>
                    </center>
                    </table>

                    <table class="search_table">
                        <form action="">
                            <tr>

                                <td>
                                    <select class="search_mode" name="search_mode">
                                        <option value="3">제목+내용</option>
                                        <option value="1">제목</option>
                                        <option value="2">내용</option>
                                    </select>
                                </td>
                                <td class="search_text"><input type="text" name="search_text" size="10"></td>
                                <td class="search_btn"><input type="submit" value="검색"></td>

                            </tr>
                        </form>
                    </table> 


                </div>

            </div>
		<!-- 공부할 수 있는 사이트 연결 -->

		<!-- bottom -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
	</div>
</body>

</html>