<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/css/BoardList.css'/>" rel="stylesheet"
	type="text/css">
<title>List</title>
		<style type="text/css">
			#img img {width:100px; 
				   	  width: 100% !important; 
				   	 height: 100px; 
				   	 }
			table {
				width: 70%;

			}
			#blank {
				
				background-color: black; 
			}
		</style>
</head>
<body>
 	<div id="wrap">


<div class="container">
	<form id="insertForm" name="insertForm" method="post"  action="<c:url value='/insertForm'/>">
		<h2 id="title"> 게시판 </h2><br>
		<%-- <c:if test="${not empty sessionScope.sid }"> --%>
		<input id="botton" type="submit" value="글쓰기">
  
              
        <table class="table table-hover">
		 <c:forEach var="board" items="${boardList}">
			<tr><td colspan="2"><a href="<c:url value='/board/detailView/${board.brdNo}'/>">${board.brdTitle}</a></td>
			<td rowspan="3" id="img">${board.brdImg}</td></tr>
			<tr><td>${board.userId}</td><td>${board.brdDate}</td></tr>
			<tr id="blank"><td colspan="3"></td></tr>
		</c:forEach>
    </table>
   
   	</form>	
   	 																
</div>
	
	</div>
</body>
</html>

  <%-- <table class="table table-hover">
     
          <c:forEach var="board" items="${boardList}">
              <tr><td><a href="<c:url value='/board/detailView/${board.brdNo}'/>">${board.brdNo}</a></td>
                  <td id="ti">${board.brdTitle}</td>
                  <td>${board.userId}</td>
                  <td id="date">${board.brdDate}</td>
              </tr> --%>