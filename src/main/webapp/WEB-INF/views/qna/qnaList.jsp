
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
    <link rel="stylesheet" href="/css/qna.css"> 

</head>
<body>
   <div id = "wrap">
            <div id="title">Q&amp;A</div>
                    <div class="qna-search"><!--검색창-->
                    <img src="/image/search.svg">
                        <input type="text" placeholder="찾으시는 질문이 있으신가요?" size="40" maxLength="200" style="width:300px;height:20px;font-size:17px;border:0;margin-bottom:5px;"  class="qnaserch-input" value=""/>
                    </div>
                        <div class="qnalist_filter"><!--글목록필터-->
                            <input type="radio" name="radio" id="최신 순" value="최신 순" checked />
                                <label for="최신 순">최신 순</label>                  
                            <input type="radio" name="radio" id="조회 수 순 " value="조회 수 순 "/>
                                    <label for="조회 수 순 ">조회 수 순 </label> 
                             <!-- 글쓰기 버튼 -->
                             <button class = "write_btn"> <a href ="<c:url value='/qna/write'/>">새 글</a></button> 
                        </div>
                                
                            <div class="qna-filter-box"><!--동물유형필터-->
                                <div class="qna-filter-box-title">동물유형</div>
                                <div class="qna-select-item">
                                    <input type="checkbox" name="dog" id="dog"/>
                                    <label for="dog">강아지</label>
                                </div>
                                <div class="qna-select-item">
                                    <input type="checkbox" name="cat" id="cat"/>
                                    <label for="cat">고양이</label>
                                </div>

                                <div class="qna-select-item">
                                    <input type="checkbox" name="etc" id="etc"/>
                                    <label for="etc">기타</label>
                                </div>
                                <div class="filter_apply">
                                    <input id="apply-btn" type="submit" value="적용">
                                </div>
                            </div>
                            <!--글목록-->
                            <div class="qnaContainer">
                        	    <div class="qnalist">
	                                <div class="qnalist-wrapper">
	                                    <c:forEach items="${qnaList }" var="qna"><a href="<c:url value='/qna/detailqna/${qna.qnaNo}'/>">
	                                        <div class="qnaTitle">${qna.qnaTitle }</div>
	                                       <%--  <div class="qnaContent">${qna.qnaContent}</div>    --%>                            
	                                        <div class="qnaHit"><div style="color: black;">조회수 ${qna.qnaHit}</div></div>
	                                        <div class="userid">${qna.userId}</div>        
	                                        <div class="date"><fmt:formatDate value="${qna.qnaCreateDate}" pattern="yyyy.MM.dd"/></div>      
			                                    <div class="animal-filter">
			                                   	 <button class="myanimal">고양이</button>
			                                    </div>
	                            		</c:forEach>
	                            		 </a>  
		                              </div>
		                            </div>
		                          </div>
		                          
		                <div class='paging'>
									<%-- 				<div calss="pageNum" style="position: left;">	
													
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
														</div><!-- 옵션선택 끝 --> --%>
							
									<!-- 페이지 넘기기 -->		
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
							
						</div>
		
	
	<!-- 페이지 넘기기 끝 -->


    </div>
  </body>
 </html>