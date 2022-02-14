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
		                <!-- 상품 정보 삭제 : 삭제 여부 확인 처리 (자바스크립트로) -->
		                                    <button class ="qnadelete"><a href="javascript:deleteCheck();">삭제</a></button><br>
		                                   <script type="text/javascript">
												function deleteCheck(){
													var answer = confirm("해당 글을 삭제하시겠습니까?");
													if(answer == true){
														location.href="/qna/deleteqna/${qna.qnaNo}";
													}
												}
							</script>
            </div>
        </div><hr>
        <div class="qnaCommentbar">
            <div class="qnaComment">댓글 </div></div>
                <div class="qnaCommetList">
                    <div>${qna.qnaComment}</div>
                </div>
                
               
            </div>
             <div data-v-3b426d7d="" class="CommentWriter">
            <div class="comment_inbox">
            <strong class="blind"></strong><em class="comment_inbox_name">짱재이</em>
            <textarea  placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 17px;">
            </textarea><!---->
            <!----></div>
            <div data-v-3b426d7d="" class="register_box">
            <!----><a data-v-3b426d7d="" href="#" role="button" class="button btn_register">등록</a></div>
            <!-- 질문목록으로 돌아가 -->
             <button onclick="history.back(-1)" style="cursor:pointer;">목록</button>
        </div>

       
 </div>
  </body>
 </html>