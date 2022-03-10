<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>챗봇</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/Chatbot.js'/>"></script>		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/Chatbot.css'/>">
	</head>
	<body>			
		<div id="wrap">
		<div id="chatbot">
			<!-- Header -->
			<div id="chatHeader">
				<span>무무 </span>
			
			</div>
		
		<!-- 채팅 내용 출력 -->
			
			<!-- 응답 메시지 출력  -->
			<div id="chatBox"></div><br>
			
			<div>
				<!-- 질문 메시지 입력 폼 -->
				<form id="chatForm" >
				<div>
					<input type="text" id="message" name="message" placeholder="질문을 입력하세요" 
					style="width:350px;height:20px;font-size:19px;border:1px;">	
					<button type="submit" value="전송" style="border:0; background-color:transparent;"><img src="/assets/images/send1.png"></button>
					 <button id="record"style="border:0;background-color:transparent;"><img src="/assets/images/mic.png"></button> 
					<button id="stop"style="border:0;background-color:transparent;"><img src="/assets/images/stop.png"></button>
					<div id="sound-clips"></div><br>
					</div>
				</form>		
			</div><br>
			
		</div>
	</body>
</html>