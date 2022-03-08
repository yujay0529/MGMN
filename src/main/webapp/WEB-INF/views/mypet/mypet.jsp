<!-- <<<<<<< HEAD -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>mypetForm</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript">
	function showPopUp() {
		//창 크기 지정 
		var width = 550;
		var height = 800;
	
		//pc화면기준 가운데 정렬 
		var left = (window.screen.width / 2);
		var top = (window.screen.height / 4);
		//윈도우 속성 지정 
		var windowStatus = 'width=' + width + ', height=' + height + ', left='
				+ left + ', top=' + top
				+ ', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		//연결하고싶은url 
		const url = "/mypet/insertPetInfoForm";
		//등록된 url 및 window 속성 기준으로 팝업창을 연다. 
		window.open(url, "hello popup", windowStatus);
	}
</script>
<style>
/* .mainMypage-content {
    text-align: center;
    padding: 100px;
    padding-top: 180px;
}
.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 50%;
	height: 50%;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
.modal2 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
	z-index:-30;
}

.modal2.show {
	display: block;
}

.modal2_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 50%;
	height: 50%;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
} */
</style>
</head>
<body>
	<div id="wrap">

		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div class="main-inner">
			<div class="mainMypage-content">
					<h3>반려동물정보</h3>
				<!-- 등록된 반려동물이 없는 경우 -->
				<div class="none-list">
					<img src="/image/none_basket.png" alt="">
					<p>등록된 반려동물이 없습니다.</p>
					<button class="chatbot-btn"
					style="border: none; background-color: transparent;">
					<a href="javascript:showPopUp()">반려동물 등록하기</a>
				</button>
				</div>
				<!-- 등록된 반려동물이 있는 경우 -->
				<div>
				
				</div>
			</div>
		</div>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
	</div> <!-- wrap -->
	<%-- 
		<!-- 반려동물 등록 모달 창 -->
		
		<div class="modal">
		<form id="frmPetInfoInsert" method="post" action="<c:url vlaue='/insertPetInfo' /> ">
			<h3>반려동물 상세</h3>	
			<div class="text-wrap">
				<p>반려동물을 선택해주세요.</p>
					<span><input type="radio" name="dogCat" id="dog" value="dog" checked><img src="/image/icon_dogbig.png" alt="">
								<input type="radio" name="dogCat" id="cat" value="cat"><img src="/image/icon_catbig.png" alt="">
					</span>
					<span><input type="hidden" id="petNo" name="petNo"></span>
					<span>이름<input type="text" id="petName" name="petName"></span>
					<span>나이<input type="text" id="petAge" name="petAge"></span>
					<span>성별<input type="text" id="petGender" name="petGender"></span>
					<span>품종<input type="text" id="petBreed" name="petBreed"></span>
					<span>userId<input type="text" id="userId" name="userId"></span>
					<span><input  type='submit' id='submit_btn' value="등록"></span>
			</div>
			</form>
		</div>
		
	<script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
    </script>
     --%>
</html>