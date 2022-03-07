<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title>
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
		const url = "/ChatbotForm";
		//등록된 url 및 window 속성 기준으로 팝업창을 연다. 
		window.open(url, "hello popup", windowStatus);
	}
</script>



</head>
<body data-spy="scroll" data-target="#main-navbar">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->


	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>

	<!-- TOP  -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

	<!--Home page style-->
	<header id="home" class="sections">
		<div class="container">

			<div class="row">
				<div class="homepage-style">



					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="unique-apps">
							<h2>
								물어볼개🐶<br>무엇이냥😺
							</h2>
							<p>
								커져가는 반려동물 시장! 보호자에게는 집 근처 나와 우리 아이에게 딱 맞는 정보가 필요하다!<br>

								반려동물을 키우는 사람들을 위해 사용자의 위치를 기반으로 거주지 근처 시설들을 추천하고 <br>실사용자들의
								후기를 공유하는 플랫폼
							</p>

							<div class="home-btn">
								<button class="btn btn-primary" style="color: white;">
									<a href="https://github.com/yujay0529/MGMN">View More <span><i
											class="fa fa-paper-plane"></i></span></a>
								</button>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="slider-area">

							<div id="carousel-example-generic" class="carousel slide"
								data-ride="carousel" data-interval="3000">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li data-target="#carousel-example-generic" data-slide-to="0"
										class="active"></li>
									<li data-target="#carousel-example-generic" data-slide-to="1"></li>
									<li data-target="#carousel-example-generic" data-slide-to="2"></li>
									<li data-target="#carousel-example-generic" data-slide-to="3"></li>


								</ol>

								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">

									<div class="item active">
										<img src="assets/images/cat1.jpeg" alt="" />
									</div>

									<div class="item">
										<img src="assets/images/dog1.jpeg" alt="" />
									</div>

									<div class="item">
										<img src="assets/images/dog2.jpeg" alt="" />
									</div>

									<div class="item">
										<img src="assets/images/cat2.jpeg" alt="" />
									</div>

								</div>

							</div>

						</div>
					</div>

				</div>
			</div>

		</div>

	</header>

	<!-- Sections -->
	<section id="our-portfolio" class="sections">
		<div class="container">

			<div class="row">
				<div class="heading">
					<div class="title text-center arrow-right">
						<h4 class="">WHAT WE DO</h4>
						<img class="hidden-xs" src="assets/images/right-arrow.png" alt="" />

					</div>
				</div>


				<!-- Example row of columns -->

				<div class="portfolio-wrap">

					<div class="portfolio">

						<div class="col-md-6 col-sm-6 col-xs-12">
							<img src="assets/images/park1.png" alt="" />
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="portfolio-item">
								<h4>간단한 로그인/회원가입, 개성있는 마이페이지, 신나는 이벤트!</h4>
								<p>
									깔끔한 오렌지 디자인의 로그인 페이지, 회원가입 페이지 구현.<br> 개성있는 마이페이지+반려견 페이지를
									구현하여 내 반려견 정보를 한눈에!<br> 모두가 참여하는 신나는 이벤트!!
								</p>
								<button class="btn pt-btn btn-primary">
									<a href="<c:url value='/loginForm'/>">View More</a>
								</button>

							</div>
						</div>

					</div>



					<div class="portfolio">

						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="portfolio-item">
								<h4>Q&A🙋‍♀️</h4>
								<p>
									사료 하나를 사도 수 많은 웹사이트를 뒤져야 하는 반려인! <br> 이제 물어볼개 무엇이냥의
									Q&A페이지로 강아지나 고양이 나에게 딱 맞는 카테고리를 선택해 질문을 올릴 수 있다. 사진을 첨부한 글 작성
									기능과 원하는 내용만 쏙쏙 골라 볼 수 있는 검색 기능 그리고 귀여운 효과와 함께 원하는 카테고리를 고를 수 있는
									기능까지!<br> 더 이상 여러 사이트 돌아다니며 시간낭비하지 말고 물어볼개 무엇이냥 Q&A페이지에서 한
									번에 해결하자
								</p>
								<button class="btn pt-btn btn-primary">
									<a href="<c:url value='/qnaList'/>">View More</a>
								</button>
							</div>
						</div>

						<div class="col-md-6 col-sm-6 col-xs-12">
							<img class="portfolio-img img-responsive"
								src="assets/images/qnaimg.png" alt="" />
						</div>

					</div>



					<div class="portfolio">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<img class="portfolio-img img-responsive"
								src="assets/images/monitorMarket.png" alt="" />
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="portfolio-item">
								<h4>우리동네 중고거래 페이지</h4>
								<p>
									가까운 반려인들끼리 다양한 반려동물 물품들을<br> 구매/판매/나눔 할 수 있는 우리동네 중고거래 게시판
									페이지입니다.<br> 접속 IP를 바탕으로 이용자의 위치정보를 가져오고<br> 이를 기반으로
									동네마다 다른 페이지를 구성하여<br> 가까운 이용자들끼리의 다양하고 편리한거래를 기대할 수 있습니다.
								</p>
								<button class="btn pt-btn btn-primary">View More</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- /container -->
	</section>








	<section id="our-team" class="sections">
		<div class="container">

			<div class="heading">
				<div class="title text-center arrow-left">
					<img class="hidden-xs" src="assets/images/left-arrow.png" alt="" />

					<h4 class="">Our Team Members</h4>
				</div>
			</div>
		</div>

		<div class="container-fluid project-bg">
			<div class="row">

				<div class="main-team text-center">

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="team-member">

							<img class="img-circle" src="assets/images/team/4.png" alt="" />
							<h5>KIM TAE HYEONG</h5>
							<p>DEVELOPER</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="team-member">
							<img class="img-circle" src="assets/images/team/p2.png" alt="" />
							<h5>YU JEONG EUN</h5>
							<p>DEVELOPER</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="team-member">
							<img class="img-circle" src="assets/images/team/3.png" alt="" />
							<h5>PARK KEUN WOO</h5>
							<p>DEVELOPER</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="team-member">
							<img class="img-circle" src="assets/images/mjs.png" alt="" />
							<h5>MOON JAE SUB</h5>
							<p>DEVELOPER</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="team-member">
							<img class="img-circle" src="assets/images/team/1.png" alt="" />
							<h5>LEE SEUNG JUN</h5>
							<p>DEVELOPER</p>
						</div>
					</div>

				</div>

			</div>
		</div>
	</section>


	<div class="scroll-top">

		<div class="scrollup">
			<i class="fa fa-angle-double-up"></i>

		</div>

	</div>

	<div class="chatbot">

		<div class="chatbot-btn">
			<button class="chatbot-btn"
				style="border: none; background-color: transparent;">
				<a href="javascript:showPopUp()"><img
					src="assets/images/chatbot.png"></a>
			</button>
		</div>

	</div>
	<div class="teachable">

		<div class="teachable-btn">
			<button class="teachable-btn"
				style="border: none; background-color: transparent;">
				<a href="/TeachableForm"><img
					src="assets/images/none_basket.png"></a>
			</button>
		</div>
	</div>

	  <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
  </body>
</html>
