<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head> 
    <meta name="viewport" content="width=device-width"/>
    <meta charSet="utf-8"/>
    <title>반려동물 Q&amp;A - 물개무냥</title>  
   
     <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

      <link rel="stylesheet" href="/css/qna.css"> 
   


</head>

<body>
<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' /> 
  
   <div id = "qnawrap">
      <!-- TOP  -->
		
	            <div id="title">Q&amp;A</div>
	                    <div class="qna-search"><!--검색창-->
	                    <form id = "qnaSearch" action="/qna/qnaSearch" name="qnaSearch" method="POST">
		                    <select id="type" name="type" style="display:none">
								<option value="qnaTandC" >제목 + 내용  </option>
								<option value="qnaTitle">제목 </option>
								<option value="qnaContent">내용 </option>
							</select>
	
	                      
	                        <input type="text"	 name="keyword" id="keyword" placeholder="찾으시는 질문이 있으신가요?" value=""
	                        		 size="80" maxLength="300" style="width:650px;height:20px;font-size:17px;border:0;margin-bottom:5px;"  class="qnaserch-input" />
	                         <button type ="submit" class ="searchbtn" onclick=""style="border:none; background-color:transparent;"> <img src="/image/search.svg"></button>
					   </form>
	             </div>
	
                    
                        <div id="qnalist_filter"><!--글목록필터-->
	                            <input type="radio" name="radio" id="최신 순" value="최신 순" checked />
	                                <label for="최신 순">최신 순</label>                  
	                            <input type="radio" name="radio" id="조회 수 순 " value="조회 수 순 "/>
	                                    <label for="조회 수 순 ">조회 수 순 </label> 
	                             
	                            <!-- 글쓰기 버튼 -->
									 <!-- 로그인 함  -->
									<c:if test="${not empty sessionScope.sid }">									
											<button class = "write_btn"> <a href ="<c:url value='/qna/qnawrite'/>">새 글</a></button> 											
									</c:if>
									
									<!-- 로그인안함  -->		
									<c:if test="${empty sessionScope.sid }">
											<button class = "write_btn"><a href="<c:url value='/loginForm'/>">새 글</a></button> 
									</c:if>
	                          
	                        </div>
	        
	                      
	                            <div class="qna-filter-box"><!--동물유형필터-->
	                                   <form id = "qnaCheck" action="/qna/qnaCheck" name="qnaCheck" method="POST">
	                                <div class="qna-filter-box-title">동물유형</div>
	                                
	                                <div class="checkitem">
	                                <label class="checkbox" for ="dog">
	                                    <input type="checkbox"  name ="animal" id="dog" value="강아지"/>
	                                     <span class="icon"></span>   강아지 </label>
	                                </div>
	                                
	                                 <div class="checkitem">
	                                <label class="checkbox" for="cat">
	                                    <input type="checkbox"name ="animal"  id="cat"value="고양이"/>
	                                    <span class="icon"></span>  고양이 </label>
	                                    </div>
	                                
	  							<div class="checkitem">
	                                <label class="checkbox" for ="etc">
	                                    <input type="checkbox"name ="animal" id="etc"value="기타"/>
	                                    <span class="icon"></span>  기타 </label>
	                                   </div>
	                              <div class="filter_none">
	                                <button class ="none-btn" style="color:black;"> <a href="/qnaList"> 적용해제 </a></button>  
	                                </div>
	                                <div class="filter_apply">
	                                <button class ="apply-btn" type="submit">  적용 </button>  
	                                </div>
	                                </form>
                          	  </div>
                           
                            
     
                            <!--글목록-->
                            <div class="qnaContainer">
                        	    <div class="qnalist">
	                                <div class="qnalist-wrapper">
	                                    <c:forEach items="${qnaList}" var="qna"><a href="<c:url value='/qna/detailqna/${qna.qnaNo}'/>">
	                                        <div class="qnaTitle">${qna.qnaTitle }</div>                     
	                                        <div class="qnaHit"><div style="color: black;">조회수 ${qna.qnaHit}</div></div>
	                                        <div class="userid">${qna.userId}</div>        
	                                        <div class="date"><fmt:formatDate value="${qna.qnaCreateDate}" pattern="yyyy.MM.dd"/></div>      
			                                 <div class="animal-filter">
			                                   	 <button class="myanimal">${qna.category}</button>
			                                  </div>
	                            		</c:forEach>
	                            		 </a>  
		                              </div>
		                            </div>
		                          </div>
		                          
		                <div class='paging'>
										
					      	<div class="pagelist">
								<c:if test="${paging.startPage != 1 }">
									<a href="<c:url value='/qnaList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">‹&emsp;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }&emsp;</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="<c:url value='/qnaList?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }&emsp;</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="<c:url value='/qnaList?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}'/>">›</a>
								</c:if>
								</div>
							
						</div><br><br>
		
	
	<!-- 페이지 넘기기 끝 -->

    </div> 
     <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' /> 
  </body>

 </html>