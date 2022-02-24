<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/css/BoardList.css'/>" rel="stylesheet" type="text/css">
<title>이벤트 목록</title>
</head>
<body>
   <div id="wrap">

      <!-- TOP  -->
      <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
      <!--  이벤트 폼  -->
   
      <div class="container">
         <form id="insertForm" name="insertForm" method="post"
            action="<c:url value='/insertForm'/>">
            <h2 id="title"></h2>
            <br>
            <%-- <c:if test="${not empty sessionScope.sid }"> --%>
            <input id="botton" type="submit" value="글쓰기">
            <%-- </c:if> --%>
            <!--    <a href="/selectTag">안녕</a> -->
            
               <table class="table table-hover">
                  <c:forEach var="board" items="${boardList}">
                  <tr><td rowspan="2" id="img">${board.brdImg}</td><td colspan="2" id="title"><a
                           href="<c:url value='/board/detailView/${board.brdNo}'/>">${board.brdTitle}</a></td></tr>
                     <tr><td>${board.userId}</td><td><fmt:formatDate value="${board.brdDate }" pattern="yyyy-MM-dd"/> </td></tr>
                  
                  
                  
                  
                  
                  
                  
                     <%-- <tr>
                        <td id="blank_c"></td>
                        <td colspan="2"><a
                           href="<c:url value='/board/detailView/${board.brdNo}'/>">${board.brdTitle}</a></td>
                        <td rowspan="3" id="img">${board.brdImg}</td>
                     </tr>
                     <tr>
                        <td id="blank_c"></td>
                        <td>${board.userId}</td>
                        <td><fmt:formatDate value="${board.brdDate }" pattern="yyyy-MM-dd"/> </td>
                     </tr>
                     <tr id="blank">
                        <td colspan="4"></td>
                     </tr> --%>
                  </c:forEach>
               </table>
         </form>

      </div>

      <!-- BOTTOM  -->
      <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />

   </div>
</body>
</html>




pagePopup.openPetType()