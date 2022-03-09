<!-- <<<<<<< HEAD -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPetInfoForm</title>
<style type="text/css">
div#insertContent {
    height: 800px;
    padding: 300px;
}
h3 {
    font-size: 23px;
    font-family: 'Jeju Gothic', sans-serif;
    font-style: normal;
    margin-top: 5%;
}
div#wrap {
   margin: 0 auto;
   width: 1024px; }
	    
hr {
    margin-top: 15px;
    margin-bottom: 12px;
    border: 0;
    border-top: 1px solid sandybrown;
}
	
	  
table.insertTable {
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  font-family: 'Jeju Gothic', sans-serif;
	}
table.insertTable th {
	  border-left: 1px;
	  border-left-color: orange;
	  padding: 10px;
	  font-weight: bold;
	  font-family: 'Jeju Gothic', sans-serif;
	}
table.insertTable td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	}
	
input[type=text]{ 
	  border: 2px solid orange;
	  border-radius: 5px 5px 20px 5px;
    }
    
input#submit_btn {
    background-color: sandybrown;
    border: 0px;
    margin: 10px;
    padding-left: 12px;
    padding-right: 12px;
    border-radius: 5px;
    color: ghostwhite;
}

input#cancelBtn {
    background-color: sandybrown;
    border: 0px;
    margin: 10px;
    padding-left: 12px;
    padding-right: 12px;
    border-radius: 5px;
    color: ghostwhite;
}
</style>
</head>
<body>
	<div id="wrap">
		
	
		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<div id="insertContent">
			<h3>반려동물 상세</h3>	
			<form id="frmPetInfoInsert" method="post" action="<c:url value='/insertPetInfo' /> ">	
				<div class="text-wrap">
					<p>반려동물을 선택해주세요.</p>
					<span><input type="radio" name="dogCat" id="dog" value="dog" checked><img src="/image/icon_dogbig.png" alt="">
								<input type="radio" name="dogCat" id="cat" value="cat"><img src="/image/icon_catbig.png" alt="">
					</span>
					<table class="insertTable">
						<tr><th>반려인</th><td><input type="text" name="userId" id="userId" value="${sessionScope.sid }" readonly></td></tr>
						<tr><th>이름</th><td><input type="text" name="petName" id="petName"></td></tr>
						<tr><th>품종</th><td><input type="text" name="petBreed" id="petBreed"></td></tr>
						<tr><th>나이</th><td><select name="petAge">
															<option value="0">0살</option>
															<option value="0">1살</option>
															<option value="0">2살</option>
															<option value="0">3살</option>
															<option value="0">4살</option>
															<option value="0">5살</option>
															<option value="0">6살</option>
															<option value="0">7살</option>
															<option value="0">8살</option>
															<option value="0">9살</option>
															<option value="0">10살</option>
															<option value="0">11살</option>
															<option value="0">12살</option>
															<option value="0">13살</option>
															<option value="0">14살</option>
															<option value="0">15살</option>
															<option value="0">16살</option>
															<option value="0">17살</option>
															<option value="0">18살</option>
															<option value="0">19살</option>
															<option value="0">20살</option>
															<option value="0">21살</option>
															<option value="0">22살</option>
															<option value="0">23살</option>
															<option value="0">24살</option>
															<option value="0">25살</option>
														</select></td></tr>
						<tr><th>성별</th><td><input type="radio" name="petGender" id="petF" value="암컷">암컷
														<input type="radio" name="petGender" id="petM" value="수컷">수컷</td></tr>
					</table>
				<div id="insertSubmit" align="center"><input id='submit_btn' type='submit' value='등록'>&nbsp;&nbsp;<input type='reset' value='취소' id="cancelBtn"></div>
				</div>
			</form>
		</div>
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
	</div>

		

</html>