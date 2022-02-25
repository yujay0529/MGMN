<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/detailNotice.css">
</head>
<body>
    <div id="wrap">

        <!-- TOP  -->
        <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />


        <div id="container">
            <div class="container_position">

                <!--글보기 table-->
                <div class="view_table_position">
                    <table class="view_table" cellspacing="0" border="0">
                        <tbody>
                            <tr class="table_title">
                                <th>제목</th>
                                <td colspan="3">${noti.noticeTitle }</td>
                            </tr>
                            <tr>
                                <th class="table_th">글쓴이</th>
                                <td class="table_name">${noti.userId }</td>
                                <th class="table_th" colspan="1">날짜</th>
                                <td class="table_date" colspan="1" align="center"><fmt:formatDate value='${noti.noticeCreateDate }' pattern="yyyy-MM-dd KK:mm:ss"/></td>
                            </tr>
                            <tr>
                                <th class="table_th">첨부파일</th>
                                <td colspan="1" class="table_file">
                                    
                                </td>
                                <th class="table_th">조회수</th>
                                <td class="table_hit" colspan="1" align="center"align="right">${noti.noticeHit }</td>
                            </tr>
                            <tr>
                                <td class="table_view" colspan="8">
                                    <div>
                                        ${noti.noticeContent } </div>
                                </td>
                            </tr>
                            <tr class="view_edit">
                                <td align="left"></td>
                                <td colspan="8" align="right">
                                    <button onclick="history.back(-1)" style="cursor:pointer;">목록</button>
                                    
                                    <button><a href ="<c:url value='/notice/updateNoticeForm/${noti.noticeNo}'/>"> 수정</a> </button>
                                  <!--  삭제 : 삭제 여부 확인 처리 (자바스크립트로) -->
		                                    <button class ="deleteNotice"><a href="javascript:deleteCheck();">삭제</a></button><br>
		                                   <script type="text/javascript">           
		                      
		                     
												function deleteCheck(){
													var answer = confirm("해당 글을 삭제하시겠습니까?");
													if(answer == true){
														location.href="/notice/deleteNotice/${noti.noticeNo}";
													}
												}
							</script>

                                    <a href="<c:url value='/'/>">메인 화면으로 이동</a>
                                    </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
               </div>
                  <!-- BOTTOM  -->
                    <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
            </div>
         </body>
    </html>





