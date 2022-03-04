<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

  	<link rel="stylesheet" href="/css/notice.css">
	<script src="<c:url value='/js/notice.js'/>"></script>
   
    <title>공지사항</title>
</head>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="notiList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>

<body>
<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' /> 
	<div id="wrap">
		
	       <div id="container">

            <div id="center">

                <div class="containter_table">
                    <center>
                       <div class="table_title">

                           <h2 style="color:rgba(51,51,51);">공지사항</h2>
                           <h4 style="color:rgba(51,51,51);">Notice</h4>

                       </div>

                
                             <div class="noticelist_filter"><!--글목록필터-->
                            <input type="radio" name="radio" id="최신 순" value="최신 순" checked />
                                <label for="최신 순">최신 순</label>                  
                            <input type="radio" name="radio" id="오래된 순  " value="오래된 순  "/>
                                    <label for="오래된 순 ">오래된 순  </label> 
                             <!-- 글쓰기 버튼 -->
                       <c:choose>

						    <c:when test="${sessionScope.userId=='admin'}">
						
						 <button class = "write_btn"> <a href ="<c:url value='/notice/noticewrite'/>">공지사항 쓰기 </a></button> 
						
						    </c:when>
						
						</c:choose>
                            
             
                            <%--    <button class = "write_btn"> <a href ="<c:url value='/notice/write'/>">새 글</a></button>  --%>
                        </div>
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
                           <tbody class="sub_news" border="1" cellspacing="0">

						<c:forEach items="${noticeList }" var="noti">
                            <tr>
                                <td>${noti.noticeNo }</td>
                                <td class="title">
                                    <a href="<c:url value='/notice/detailNotice/${noti.noticeNo}'/>">${noti.noticeTitle }
                                      
                                    </a>
                                </td>
                                <td class="name">${noti.userId }</td>
                                <td class="date"><fmt:formatDate value="${noti.noticeCreateDate}" pattern="yyyy.MM.dd"/></td>
                                <td class="hit">${noti.noticeHit }</td>
                                </tr>
                         </c:forEach>

                    </center>
                    </table>

                    <table class="search_table">
                        <form id = "noticeSearch"  action="/notice/noticeSearch" name="noticeSearch" method="POST">
                            <tr>

                                <td>
                                    <select class="type" name="type">
                                        <option value="TnC">제목+내용</option>
                                        <option value="T">제목</option>
                                        <option value="C">내용</option>
                                    </select>
                                </td>
                     
                                <td class="search_text"><input type="text" name="keyword" size="20"    id="keyword" placeholder="검색어를 입력해주세요." value=""></td>
                                <td class="search_btn"><input type="submit" onclick="" value="검색"></td>

                            </tr>
                        </form>
                    </table> 
                    
            
				
				  <div class='paging'>
										
					      	<div class="pagelist">
								<c:if test="${paging.startPage != 1 }">
									<a href="<c:url value='/noticeList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">‹&emsp;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }&emsp;</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="<c:url value='/noticeList?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }&emsp;</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="<c:url value='/noticeList?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}'/>">›</a>
								</c:if>
								</div>
							
						</div><br><br>
		
		
		
	
	<!-- 페이지 넘기기 끝 -->


                </div>

            </div>
		<!-- 공부할 수 있는 사이트 연결 -->

	</div>
	<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' /> 
</body>

</html>