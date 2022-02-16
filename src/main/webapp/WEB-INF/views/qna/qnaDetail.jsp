<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head> 
    <meta name="viewport" content="width=device-width"/>
    <meta charSet="utf-8"/>
    <title>반려동물 Q&amp;A - 물개무냥</title>  
     <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <link rel="stylesheet" href="/css/qnaDetail.css"> 

</head>
<body>
 <div id="wrap">
    <div class="qnaDetailView">
        <div class="qnaDetail">
            <div class="qnaDetailTitle">
                <button class="myanimal">고양이 </button>
		                
    
                <div class="qnaTitle">${qna.qnaTitle }</div><hr>
                </div>
                <div class="qnaContent">${qna.qnaContent }</div>
                <div class="qnaImgbox">
                <img class="img" src="">
                </div>
                <div>
                <div class="qnaDetail-userid" style="color: black;">${qna.userId }	</div>		
                <div class="qnaDetail-date"><fmt:formatDate value="${qna.qnaCreateDate}" pattern="yyyy.MM.dd"/></div>
                 <button calss = "qnaupdate"><a href ="<c:url value='/qna/updateqnaForm/${qna.qnaNo}'/>"> 수정</a></button>
		                <!--  삭제 : 삭제 여부 확인 처리 (자바스크립트로) -->
		                                    <button class ="qnadelete"><a href="javascript:deleteCheck();">삭제</a></button><br>
		                                   <script type="text/javascript">
												function deleteCheck(){
													var answer = confirm("해당 글을 삭제하시겠습니까?");
													if(answer == true){
														location.href="/qna/deleteqna/${qna.qnaNo}";
													}
												}
							</script>
			  <button calss = "qnaList"><a href ="<c:url value='/qnaList'/>"> 목록 </a></button>
            </div>
        </div><hr>
      
		          <!--                     추가                         -->
					    <!--  댓글  -->
					    <div class="container">
					        <label for="content">댓글</label>
					        <form name="commentInsertForm" >
					            <div class="input-group">
					               <input type="hidden" name="qnaNo" value="${qna.qnaNo }"/>
					               <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 남겨보세요 .">
					               <span class="input-group-btn">
					                    <button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button>
					               </span>
					              </div>
					        </form>
					    </div>
					    
					    <div class="container">
					        <div class="commentList"></div>
					    </div>
					</div>
					 
		<!--                     추가                         -->
		<%@ include file="commentS.jsp" %>


       
 </div>
  </body>
 </html>