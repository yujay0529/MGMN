<!-- <<<<<<< HEAD -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypetForm</title>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/pet.js'/>"></script>
<link href="<c:url value='/css/mypet.css'/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/css/mypet2.css'/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/css/style5.css'/>" rel="stylesheet"
	type="text/css">
<style>
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
</style>
<style>
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
}
</style>
</head>
<body>
	<div class="modal">
		<div class="modal_body">
			반려동물 상세

			<div class="list-content">
				<!-- contact 클래스 추가시 채택 -->
				<div class="text-wrap">
					<p>반려동물을 선택해주세요.</p>

					<div class="radio-wrap">
						<div class="dog-wrap">
							<img src="/image/icon_dogbig.png" alt="">
							<div class="dog">
								<input type="radio" id="dog" name="type" value="dog" /> <label
									for="dog"><span class="checkbox-custom"><span
										class="inner-circle"></span></span><span class="checkbox-label">강아지</span></label>
							</div>
						</div>
						<div class="cat-wrap">
							<img src="/image/icon_catbig.png" alt="">
							<div class="cat">
								<input type="radio" id="cat" name="type" value="cat" /> <label
									for="cat"><span class="checkbox-custom"><span
										class="inner-circle"></span></span><span class="checkbox-label">고양이</span></label>
							</div>
						</div>
					</div>
					<div class="btn-wrap">
						<button class="btn-select" onclick="pagePopup.openPetType()">선택</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="wrap">

		<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<!--  회원 가입 폼  -->

		<div class="content-body">
			<!-- active클래스 추가시 사진 포함게시물 아이콘 등장 -->
			<div class="container-wrapper mypage-container">
				<div class="list-title">
					<h2>${sessionScope.sid}님의페이지</h2>
				</div>
				<div class="main-content">
					<div class="tab-content">
						<div class="tab-inner">
							<ul>
								<li onclick="location.href='/mypage/main/home?page=1'">마이 홈</li>
								<li onclick="location.href='/mypage/main/agree?page=1'">알림설정</li>
								<li onclick="location.href='/mypage/main/info?page=1'">프로필</li>
								<li class="active"
									onclick="location.href='/mypage/main/pet?page=1'">반려동물</li>
								<li onclick="location.href='/mypage/main/board/total?page=1'">나의
									게시글</li>
								<li onclick="location.href='/mypage/main/like/total?page=1'">좋아요</li>
								<li onclick="location.href='/mypage/main/point?page=1'">MY포인트</li>

							</ul>
						</div>
					</div>
					<div class="main-inner">
						<div class="side-content">
							<div class="side-profile">
								<div class="my-area">
									<div class="img-circle">
										<span>1</span>
									</div>
									<p>
										<span>Lv.1</span>${sessionScope.sid}
									</p>
								</div>
								<div class="follows">
									<div class="follower"
										onclick="pagePopup.followListPopup('receiver', 6252)">
										<span>0</span>
										<p>팔로워</p>
									</div>
									<div class="following"
										onclick="pagePopup.followListPopup('sender', 6252)">
										<span id="myPage_followCnt">0</span>
										<p>팔로잉</p>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-wrapper">
							<div class="tab-target ">
								<div class="mainMypage-content show-list">
									<div class="block-title">
										<h2>MY 레벨</h2>
										<button type="button" class="tooltip-btn">
											등급별 혜택<img src="/web/img/ico_tooltip.png" alt="">
										</button>
										<div class="tooltip-wrap">
											<img src="/web/img/tooltip_con.png" alt="">
											<table>
												<tbody>
													<tr>
														<th>등급</th>
														<th>등급 점수 범위</th>
														<th>구매 적립율</th>
														<th>상시 할인율</th>
													</tr>
													<tr>
														<th>LEV 1</th>
														<td>0 ~ 2,000</td>
														<td rowspan="7" class="center">0.5%</td>
														<td>0.0%</td>
													</tr>
													<tr>
														<th>LEV 2</th>
														<td>2,001 ~ 10,000</td>
														<td>1.0%</td>
													</tr>
													<tr>
														<th>LEV 3</th>
														<td>10,001 ~ 30,000</td>
														<td>2.0%</td>
													</tr>
													<tr>
														<th>LEV 4</th>
														<td>30,001 ~ 300,000</td>
														<td>3.0%</td>
													</tr>
													<tr>
														<th>LEV 5</th>
														<td>300,001 ~ 600,000</td>
														<td>4.0%</td>
													</tr>
													<tr>
														<th>LEV 6</th>
														<td>600,001 ~ 1,500,000</td>
														<td>6.0%</td>
													</tr>
													<tr>
														<th>LEV 7</th>
														<td>1,500,001 ~ 9,999,999</td>
														<td>8.0%</td>
													</tr>
												</tbody>
											</table>
											<ul>
												<li>등급 점수 범위 계산식 = [ 스토어 구매금액 X 10% + 커뮤니티 활동 포인트]</li>
												<li>스토어 구매금액은 배송완료된 주문기준입니다.</li>
												<li>스토어 구매금액은 최근 1년까지 누적되며, 그 이후 소멸됩니다.</li>
												<li>커뮤니티 활동 포인트의 누적기간은 3년이며, 그 이후 소멸됩니다.</li>
												<li>정책에 의해 회원등급 점수범위,적립률, 상시할인율은 예고없이 변경될 수 있습니다.</li>
												<li>회원 등급은 매일 00시00분에 산정되어 새로운 등급이 적용됩니다.</li>
											</ul>
										</div>
									</div>
									<div class="active-list">
										<div class="exp-wrap">
											<div class="exp-bar">
												<div class="level-box level-01 ">
													<img src="/web/img/level_box01.png" alt="">
												</div>
												<div class="level-box level-02  next-level ">
													<img src="/web/img/level_box02.png" alt="">
												</div>
												<div class="level-box level-03  next-level ">
													<img src="/web/img/level_box03.png" alt="">
												</div>
												<div class="level-box level-04  next-level ">
													<img src="/web/img/level_box04.png" alt="">
												</div>
												<div class="level-box level-05  next-level ">
													<img src="/web/img/level_box05.png" alt="">
												</div>
												<div class="level-box level-06  next-level ">
													<img src="/web/img/level_box06.png" alt="">
												</div>
												<div class="level-box level-07  next-level ">
													<img src="/web/img/level_box07.png" alt="">
												</div>
											</div>
										</div>
										<div class="exp-etc false">
											<p class="false-max">
												현재 <strong><span>0</span>점</strong>입니다. <strong>Lv.<span>2</span></strong>
												까지 <strong><span>2,001</span>점</strong> 남았습니다!
											</p>
											<div class="point_desc_wrap">
												<a href="/member/level" class="point_desc">포인트 쌓는법 보러가기</a>
											</div>
										</div>
										<p class="sub-etc">회원 등급은 1일 1회 산정되어 00:00 기준으로 새로운 등급이
											적용됩니다.</p>
									</div>
								</div>
								<div class="mainMypage-content show-list">
									<div class="active-list new-price">
										<div class="save-price">
											<p>
												<strong><span>0</span>원</strong> / 10
											</p>
										</div>
										<div class="present-price">
											<p>
												<strong><span>0</span>점</strong>
											</p>
										</div>
										<div class="total-price">
											<p>
												<strong><span>0</span>점</strong>
											</p>
										</div>
									</div>
								</div>
								<!-- show-list 클래스 추가시 리스트생성 -->
								<div class="mainMypage-content">
									<div class="block-title">
										<h2>반려동물</h2>
										<button onclick="location.href='/mypage/main/pet?page=1'">
											더보기<img src="/web/img/ico_arrow_more.png" alt="">
										</button>
									</div>
									<div class="none-list">
										<img src="/web/img/none_basket.png" alt="">
										<p>등록된 반려동물이 없습니다.</p>
									</div>
								</div>
								<div class="mainMypage-content">
									<div class="block-title">
										<h2>게시글</h2>
										<button onclick="location.href='/mypage/main/board?page=1'">
											더보기<img src="/web/img/ico_arrow_more.png" alt="">
										</button>
									</div>
									<div class="none-list">
										<img src="/web/img/none_basket.png" alt="">
										<p>작성한 게시글이 없습니다.</p>
									</div>
								</div>
								<!-- show-list 클래스 추가시 리스트생성 -->
								<div class="mainMypage-content">
									<div class="block-title">
										<h2>좋아요</h2>
										<button onclick="location.href='/mypage/main/like?page=1'">
											더보기<img src="/web/img/ico_arrow_more.png" alt="">
										</button>
									</div>
									<div class="none-list">
										<img src="/image/none_basket.png" alt="">
										<p>추천한 게시글이 없습니다.</p>
									</div>
								</div>
							</div>
							<!-- 2021-09-08 전수현 알림설정(마케팅동의) 탭 추가-->
							<div class="tab-target ">
								<div class="mainMypage-content">
									<div class="block-title">
										<h2>이벤트 및 혜택 알림</h2>
									</div>
									<div class="block-title">
										<span>특가, 쿠폰 등 이벤트 정보를 빠르게 알려드릴게요.</span>
									</div>
									<div class="agree-wrapper">
										<div class="agree-inner-div">
											<span class="agree-span">이메일</span>
											<div>
												<label class="switch"> <input type="checkbox"
													onclick="pageMypage.setEmailAlarm(this);"
													autocomplete="off"> <span class="slider round"></span>
												</label>
											</div>
										</div>
										<div class="agree-inner-div">
											<span class="agree-span">문자 메시지</span>
											<div>
												<label class="switch"> <input type="checkbox"
													onclick="pageMypage.setSMSAlarm(this);" autocomplete="off">
													<span class="slider round"></span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-target ">
								<div class="mainMypage-content">
									<div class="block-title">
										<h2>정보수정</h2>
										<button type="button"
											onclick="location.href='https://shop.witkorea.kr/mypage/withdrawal'">
											회원탈퇴하기<img src="/web/img/ico_arrow_more.png" alt="">
										</button>
									</div>
									<form action="">
										<div class="input-content">
											<div class="input-label">
												<label for="">아이디<span class="essential">*</span></label>
												<div class="input-wrap">
													<input type="text" name="user_id" value="giga68@naver.com"
														disabled="" autocomplete="off">
												</div>
											</div>
											<div class="input-label">
												<label for="">이름<span class="essential">*</span></label>
												<div class="input-wrap">
													<input type="text" name="user_name" value="박근우"
														autocomplete="off">
												</div>
											</div>
											<div class="input-label">
												<label for="">닉네임<span class="essential">*</span></label>
												<div class="input-wrap">
													<input type="text" name="user_nickname" maxlength="6"
														oninput="maxLengthCheck(this)" value="박근우"
														autocomplete="off">
													<p class="padding-custom">공백 없는 문자 최대 6자</p>
												</div>
											</div>
											<div class="input-label">
												<label for="">이메일<span class="essential">*</span></label>
												<div class="input-wrap ">
													<input type="text" placeholder="" name="user_email"
														value="giga68@naver.com" autocomplete="off">

												</div>
											</div>
											<div class="input-label">
												<label for="">휴대폰번호<span class="essential">*</span></label>
												<div class="input-wrap">
													<div class="drop-content phone">
														<div class="drop-item" id="user_phone"
															style="pointer-events: none; background-color: #ebebe4;">
															<span id="user_phone1">010</span><img
																src="/web/img/btn_arrow_down.png" alt="">
														</div>
														<ul class="item-list">
															<li>010</li>
														</ul>
													</div>
													<div class="drop-content phone">
														<input name="user_phone2" type="number" maxlength="4"
															oninput="maxLengthCheck(this)" value="6828" disabled=""
															autocomplete="off">
													</div>
													<div class="drop-content phone">
														<input name="user_phone3" type="number" maxlength="4"
															oninput="maxLengthCheck(this)" value="6177" disabled=""
															autocomplete="off">
													</div>
													<button type="button" id="sendSMSbtn"
														onclick="pageMypage.sendSMSphone()" value="edit">수정</button>
												</div>
											</div>
											<div class="input-label" id="check_sms"
												style="display: none;">
												<label for="">인증번호<span class="essential">*</span></label>
												<div class="input-wrap margin-custom account">
													<input type="text" id="sms_str" maxlength="4"
														placeholder="인증번호를 입력해주세요." autocomplete="off"> <input
														type="hidden" name="phone_check" id="phone_check"
														value=" Y " autocomplete="off">
													<button type="button"
														onclick="pageMypage.check_phone_sms()">인증하기</button>
												</div>
											</div>
											<div class="input-label">
												<label for="">생년월일</label>
												<div class="input-wrap birth-box">
													<div class="drop-content birth">
														<div class="drop-item">
															<span id="user_birth_year">연도</span><img
																src="/web/img/btn_arrow_down.png" alt="">
														</div>
														<ul class="item-list sel-birth">
															<li>2022</li>
															<li>2021</li>
															<li>2020</li>
															<li>2019</li>
															<li>2018</li>
															<li>2017</li>
															<li>2016</li>
															<li>2015</li>
															<li>2014</li>
															<li>2013</li>
															<li>2012</li>
															<li>2011</li>
															<li>2010</li>
															<li>2009</li>
															<li>2008</li>
															<li>2007</li>
															<li>2006</li>
															<li>2005</li>
															<li>2004</li>
															<li>2003</li>
															<li>2002</li>
															<li>2001</li>
															<li>2000</li>
															<li>1999</li>
															<li>1998</li>
															<li>1997</li>
															<li>1996</li>
															<li>1995</li>
															<li>1994</li>
															<li>1993</li>
															<li>1992</li>
															<li>1991</li>
															<li>1990</li>
															<li>1989</li>
															<li>1988</li>
															<li>1987</li>
															<li>1986</li>
															<li>1985</li>
															<li>1984</li>
															<li>1983</li>
															<li>1982</li>
															<li>1981</li>
															<li>1980</li>
															<li>1979</li>
															<li>1978</li>
															<li>1977</li>
															<li>1976</li>
															<li>1975</li>
															<li>1974</li>
															<li>1973</li>
															<li>1972</li>
															<li>1971</li>
															<li>1970</li>
															<li>1969</li>
															<li>1968</li>
															<li>1967</li>
															<li>1966</li>
															<li>1965</li>
															<li>1964</li>
															<li>1963</li>
															<li>1962</li>
															<li>1961</li>
															<li>1960</li>
															<li>1959</li>
															<li>1958</li>
															<li>1957</li>
															<li>1956</li>
															<li>1955</li>
															<li>1954</li>
															<li>1953</li>
															<li>1952</li>
															<li>1951</li>
															<li>1950</li>
															<li>1949</li>
															<li>1948</li>
															<li>1947</li>
															<li>1946</li>
															<li>1945</li>
															<li>1944</li>
															<li>1943</li>
															<li>1942</li>
															<li>1941</li>
															<li>1940</li>
															<li>1939</li>
															<li>1938</li>
															<li>1937</li>
															<li>1936</li>
															<li>1935</li>
															<li>1934</li>
															<li>1933</li>
															<li>1932</li>
															<li>1931</li>
															<li>1930</li>
															<li>1929</li>
															<li>1928</li>
															<li>1927</li>
															<li>1926</li>
															<li>1925</li>
															<li>1924</li>
															<li>1923</li>
															<li>1922</li>
														</ul>
													</div>
													<div class="drop-content birth">
														<div class="drop-item">
															<span id="user_birth_month">월</span><img
																src="/web/img/btn_arrow_down.png" alt="">
														</div>
														<ul class="item-list sel-birth sel-month">
															<li>1</li>
															<li>2</li>
															<li>3</li>
															<li>4</li>
															<li>5</li>
															<li>6</li>
															<li>7</li>
															<li>8</li>
															<li>9</li>
															<li>10</li>
															<li>11</li>
															<li>12</li>
														</ul>
													</div>
													<div class="drop-content birth">
														<div class="drop-item">
															<span id="user_birth_day">일</span><img
																src="/web/img/btn_arrow_down.png" alt="">
														</div>
														<ul class="item-list sel-birth sel-day"></ul>
													</div>
												</div>
											</div>
											<div class="input-label">
												<label for="">주소</label>
												<div class="input-wrap margin-custom account">
													<input type="text" name="user_addr1" placeholder="우편번호"
														value="" disabled="" autocomplete="off">
													<button type="button" onclick="return_execDaumPostcode()">주소검색</button>
												</div>
												<div class="input-wrap margin-custom">
													<input type="text" name="user_addr2" placeholder="주소"
														value="" disabled="" autocomplete="off">
												</div>
												<div class="input-wrap margin-custom">
													<input type="text" name="user_addr3" placeholder="상세주소 입력"
														value="" autocomplete="off">
												</div>
											</div>
											<div class="input-label">

												<label for="">프로필사진</label>
												<div class="input-wrap">
													<input type="hidden" name="user_orientation" value=""
														autocomplete="off">
													<div class="my-profile">
														<label for="user_temp_img" id="user_img_view"></label> <input
															type="file" id="user_img" accept="image/*, .jfif"
															name="user_img" autocomplete="off"> <input
															type="file" id="user_temp_img" accept="image/*, .jfif"
															name="user_temp_img" autocomplete="off">
													</div>
												</div>
											</div>
											<div class="input-label">
												<label for="">자기소개</label>
												<div class="input-wrap">
													<textarea style="resize: none;" name="user_etc"
														placeholder="자기소개를 입력해주세요.(50자 이내)"></textarea>
												</div>
											</div>
										</div>
										<div class="action-btn">
											<button type="button" onclick="pageMypage.userUpdate(6252)">정보수정</button>
										</div>
									</form>
								</div>
							</div>
							<div class="tab-target  active ">
								<div class="mainMypage-content">
									<div class="block-title">
										<h2>반려동물정보</h2>
									</div>
									<div class="none-list">
										<img src="/image/none_basket.png" alt="">
										<p>등록된 반려동물이 없습니다.</p>
										<button type="button" class="btn-open-popup"
											onclick="pagePopup.openPetType()">반려동물 추가하기</button>
									</div>
								</div>
							</div>
							<div class="tab-target ">
								<div class="mainMypage-content">
									<!-- 2021.04.16 마이페이지 > 게시글 카테고리 세부화로 인한 추가  -->
									<div class="noticeBtn-content">
										<div>
											<div class="noticeBtn-item  active "
												onclick="pageMypage.setBoardList('total')">
												<img src="/web/img/ico_write07.png" alt="">
												<h2>전체</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setBoardList('knowhow')">
												<img src="/web/img/ico_write04.png" alt="">
												<h2>댕냥노하우</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setBoardList('pet')">
												<img src="/web/img/ico_write01.png" alt="">
												<h2>댕냥경험기</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setBoardList('user')">
												<img src="/web/img/ico_write02.png" alt="">
												<h2>유저 경험기</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setBoardList('news')">
												<img src="/web/img/ico_write05.png" alt="">
												<h2>댕냥한컷</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setBoardList('story')">
												<img src="/web/img/ico_write06.png" alt="">
												<h2>이야기</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
										</div>
									</div>
									<!-- ******************************************************************  -->
									<!-- 2021.04.20 클라이언트 요청으로 삭제 처리 및 해당 부분 마진 처리 
                                <div class="block-title">
                                    <h2>좋아한 게시글</h2>
                                </div> -->
									<div class="active-list"></div>
									<div class="none-list">
										<img src="/web/img/none_basket.png" alt="">
										<p>작성한 게시글이 존재하지 않습니다.</p>
									</div>
								</div>
							</div>
							<div class="tab-target ">
								<div class="mainMypage-content">
									<!-- 2021.04.16 마이페이지 > 게시글 카테고리 세부화로 인한 추가  -->
									<div class="noticeBtn-content">
										<div>
											<div class="noticeBtn-item  active "
												onclick="pageMypage.setLikeList('total')">
												<img src="/web/img/ico_write07.png" alt="">
												<h2>전체</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setLikeList('knowhow')">
												<img src="/web/img/ico_write04.png" alt="">
												<h2>댕냥노하우</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setLikeList('pet')">
												<img src="/web/img/ico_write01.png" alt="">
												<h2>댕냥경험기</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setLikeList('user')">
												<img src="/web/img/ico_write02.png" alt="">
												<h2>유저 경험기</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setLikeList('news')">
												<img src="/web/img/ico_write05.png" alt="">
												<h2>댕냥한컷</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
											<div class="noticeBtn-item "
												onclick="pageMypage.setLikeList('story')">
												<img src="/web/img/ico_write06.png" alt="">
												<h2>이야기</h2>
												<p>
													[<span>0</span>]
												</p>
											</div>
										</div>
									</div>
									<!-- ******************************************************************  -->
									<!-- 2021.04.20 클라이언트 요청으로 삭제 처리 및 해당 부분 마진 처리 
                                <div class="block-title">
                                    <h2>좋아한 게시글</h2>
                                </div> -->
									<div class="none-list">
										<img src="/web/img/none_basket.png" alt="">
										<p>추천한 게시글이 존재하지 않습니다.</p>
									</div>
								</div>
							</div>
							<div class="tab-target ">
								<div class="mainMypage-content">
									<div class="block-title">
										<h2>포인트 현황</h2>
										<button type="button" class="tooltip-btn">
											포인트 제도<img src="/web/img/ico_tooltip.png" alt="">
										</button>
										<div class="tooltip-wrap">
											<img src="/web/img/tooltip_con.png" alt="">
											<table class="point">
												<tbody>
													<tr>
														<th>카테고리</th>
														<th>게시판</th>
														<th>구매전환</th>
														<th>게시글 작성</th>
														<th>댓글 작성</th>
														<th>게시글 좋아요<br>(추천) 받음
														</th>
														<th>댓글 좋아요<br>(추천) 받음
														</th>
													</tr>
													<tr>
														<td rowspan="3">댕이경험기</td>
														<td>식사시간</td>
														<td rowspan="6">200</td>
														<td rowspan="6">40</td>
														<td rowspan="8">10</td>
														<td rowspan="6">5</td>
														<td rowspan="10">5</td>
													</tr>
													<tr>
														<td>놀이시간</td>
													</tr>
													<tr>
														<td>휴식/케어</td>
													</tr>
													<tr>
														<td rowspan="3">냥이경험기</td>
														<td>식사시간</td>
													</tr>
													<tr>
														<td>놀이시간</td>
													</tr>
													<tr>
														<td>휴식/케어</td>
													</tr>
													<tr>
														<td>댕냥 노하우</td>
														<td>-</td>
														<td>-</td>
														<td rowspan="2">50</td>
														<td rowspan="2">10</td>
													</tr>
													<tr>
														<td>댕냥 한컷</td>
														<td>댕냥 한컷</td>
														<td>-</td>
													</tr>
													<tr>
														<td rowspan="2">이야기</td>
														<td>댕냥 이야기</td>
														<td>-</td>
														<td>10</td>
														<td>5</td>
														<td>5</td>
													</tr>
													<tr>
														<td>자유 이야기</td>
														<td>-</td>
														<td>10</td>
														<td>5</td>
														<td>5</td>
													</tr>
												</tbody>
											</table>
											<!--포인트 제도 변경표-->
											<!--<table class="point">
                                            <tr>
                                                <th>카테고리</th>
            
                                                <th>구매전환</th>
                                                <th>게시글 작성</th>
                                                <th>댓글 작성</th>
                                                <th>게시글 좋아요<br>(추천) 받음</th>
                                                <th>댓글 좋아요<br>(추천) 받음</th>
                                            </tr>
                                            <tr>
                                                <td>댕냥노하우</th>
                                                <td rowspan="2">200</td>
                                                <td rowspan="2">40</td>
                                                <td rowspan="3">10</td>
                                                <td rowspan="2">5</td>
                                                <td rowspan="5">5</td>
                                                
                                            </tr>
                                            <tr>
                                                <td>댕냥경험기</td>
												
                                            </tr>
                                            <tr>
                                                <td>유저경험기</td>
												<td></td>
												<td>50</td>
												<td>10</td>
                                            </tr>
                                            <tr>
                                                <td>댕냥한컷</td>
                                                <td></td>
												<td rowspan="2">10</td>
												<td rowspan="2">5</td>
												<td rowspan="2">5</td>
                                            </tr>
                                            <tr>
												<td>이야기</td>
												<td></td>
                                            </tr>
                                        </table>-->
											<ul>
												<li>좋아요 포인트 지급은 1개의 게시글에 1회에 한하며 지급하며, 동일 게시글에 중복은
													불가합니다.</li>
												<li>작성한 글의 삭제 혹은 좋아요(추천)가 취소되는 경우 지급된 포인트는 회수처리 됩니다.</li>
												<li>댕냥 한컷 게시글 작성에 대한 포인트 지급은 최대 1일 3회까지 가능합니다.</li>
												<li>'구매전환'은 해당 게시판의 컨텐츠 중 상품 사진의 태그를 통해 스토어로 이동 &gt;
													[구매하기] 버튼을 클릭해 결제 &gt; 배송완료까지 완료되었을 경우 지급되는 건입니다.</li>
											</ul>
										</div>
									</div>
									<div class="my-point">
										<p>총 포인트</p>
										<strong><span>0</span>P</strong>
									</div>
									<div class="date-setting">
										<div class="date-custom">
											<div class="date-box">
												<input id="searchStartDt" type="text" name="startDate"
													value="2022-02-17" disabled="" class="hasDatepicker"
													autocomplete="off"><img
													class="ui-datepicker-trigger"
													src="/web/img/ico_calendar.png" alt="Select date"
													title="Select date">
											</div>
											<b>~</b>
											<div class="date-box">
												<input id="searchEndDt" type="text" name="endDate"
													value="2022-02-24" disabled="" class="hasDatepicker"
													autocomplete="off"><img
													class="ui-datepicker-trigger"
													src="/web/img/ico_calendar.png" alt="Select date"
													title="Select date">
											</div>
										</div>
										<div class="date-choice">
											<ul>
												<li class="active"
													onclick="pageMypage.setPointSearchDate('1weekly')">1주일</li>
												<li onclick="pageMypage.setPointSearchDate('1month')">1개월</li>
												<li onclick="pageMypage.setPointSearchDate('6month')">6개월</li>
												<li onclick="pageMypage.setPointSearchDate('1year')">1년</li>
											</ul>
											<button onclick="pageMypage.searchPointHistory()">조회</button>
										</div>
									</div>
									<div class="none-list">
										<img src="/web/img/none_basket.png" alt="">
										<p>데이터가 존재하지 않습니다.</p>
									</div>

									<div class="popup-wrapper mypage-petType-popup active">
										<div class="popup-content">
											<button class="closed" type="button"
												onclick="pagePopup.closePopup()">
												<img src="/web/img/btn_close_popup.png" alt="">
											</button>
											<div class="popup-inner fixed-size-424">
												<span>반려동물 선택</span>
												<div class="radio-content">
													<div class="input-wrap">
														<div class="radio">
															<img src="/web/img/ico_write01.png" alt=""> <input
																type="radio" id="q3" name="q3" value="dog"
																autocomplete="off"> <label for="q3"><span
																class="checkbox-custom"></span><span
																class="checkbox-label">강아지</span></label>
														</div>
														<div class="radio">
															<img src="/web/img/ico_write02.png" alt=""> <input
																type="radio" id="q4" name="q3" value="cat"
																autocomplete="off"> <label for="q4"><span
																class="checkbox-custom"></span><span
																class="checkbox-label">고양이</span></label>
														</div>
													</div>
												</div>
												<div class="btn-wrap">
													<button class="submit fixed-size"
														onclick="pagePopup.openAddPetForm()">선택하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />

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
    <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal2');
      const btnOpenPopup = document.querySelector('.btn-select');

      btnselect.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal2) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
    </script>
    <div class="modal2">
    <div class="modal2_body">
    <div class="popup-wrapper mypage-petAddDog-popup active"><div class="popup-addPet">
    <button class="closed" type="button" onclick="pagePopup.closePopup()"><img src="/web/img/btn_close_popup.png" alt=""></button>
    <div class="popup-inner">
        <span>강아지 정보입력</span>
        <div class="input-content">
            <div class="double-content left-content">
                <div class="input-label custom-margin">
                    <label for="">성별<span class="essential">*</span></label>
                    <div class="input-wrap radio-wrap">
                        <div class="radio">
                            <input type="radio" id="dog_gender_m" name="dog_gender" value="M">
                            <label for="dog_gender_m"><span class="checkbox-custom"></span><span class="checkbox-label">수컷</span></label>
                        </div>
                        <div class="radio">
                            <input type="radio" id="dog_gender_w" name="dog_gender" value="W">
                            <label for="dog_gender_w"><span class="checkbox-custom"></span><span class="checkbox-label">암컷</span></label>
                        </div>
                    </div>
                </div>
                <div class="input-label">
                    <label for="">중성화<span class="essential">*</span></label>
                    <div class="input-wrap radio-wrap">
                        <div class="radio">
                            <input type="radio" id="dog_gender_y" name="dog_neutrality" value="Y">
                            <label for="dog_gender_y"><span class="checkbox-custom"></span><span class="checkbox-label">예</span></label>
                        </div>
                        <div class="radio">
                            <input type="radio" id="dog_gender_n" name="dog_neutrality" value="N">
                            <label for="dog_gender_n"><span class="checkbox-custom"></span><span class="checkbox-label">아니오</span></label>
                        </div>
                    </div>
                </div>
                <div class="input-label">
                    <label for="">품종<span class="essential">*</span></label>
                    <div class="input-wrap">
                        <!-- none-data 제거시 검색종류 show -->
                        <div class="searching">
                            <input type="text" placeholder="반려동물 품종" id="search_dog" name="dog_kind" autocomplete="off">
                            <input type="hidden" id="search_dog_id" name="dog_id">
                        </div>
                    </div>
                </div>
                <div class="input-label">
                    <label for="">이름<span class="essential">*</span></label>
                    <div class="input-wrap">
                        <input type="text" placeholder="반려동물 이름" name="dog_name" maxlength="10">
                    </div>
                </div>
                <div class="input-label">
                    <label for="">생년월일<span class="essential">*</span></label>
                    <div class="input-wrap birth-box">
                        <div class="drop-content birth">
                            <div class="drop-item"><span id="dog_birth_year">연도</span><img src="/web/img/btn_arrow_down.png" alt=""></div>
                            <ul class="item-list sel-birth">
                                                                    <li>2022</li>
                                                                    <li>2021</li>
                                                                    <li>2020</li>
                                                                    <li>2019</li>
                                                                    <li>2018</li>
                                                                    <li>2017</li>
                                                                    <li>2016</li>
                                                                    <li>2015</li>
                                                                    <li>2014</li>
                                                                    <li>2013</li>
                                                                    <li>2012</li>
                                                                    <li>2011</li>
                                                                    <li>2010</li>
                                                                    <li>2009</li>
                                                                    <li>2008</li>
                                                                    <li>2007</li>
                                                                    <li>2006</li>
                                                                    <li>2005</li>
                                                                    <li>2004</li>
                                                                    <li>2003</li>
                                                                    <li>2002</li>
                                                                    <li>2001</li>
                                                                    <li>2000</li>
                                                                    <li>1999</li>
                                                                    <li>1998</li>
                                                                    <li>1997</li>
                                                                    <li>1996</li>
                                                                    <li>1995</li>
                                                                    <li>1994</li>
                                                                    <li>1993</li>
                                                                    <li>1992</li>
                                                                    <li>1991</li>
                                                                    <li>1990</li>
                                                                    <li>1989</li>
                                                                    <li>1988</li>
                                                                    <li>1987</li>
                                                                    <li>1986</li>
                                                                    <li>1985</li>
                                                                    <li>1984</li>
                                                                    <li>1983</li>
                                                                    <li>1982</li>
                                                                    <li>1981</li>
                                                                    <li>1980</li>
                                                                    <li>1979</li>
                                                                    <li>1978</li>
                                                                    <li>1977</li>
                                                                    <li>1976</li>
                                                                    <li>1975</li>
                                                                    <li>1974</li>
                                                                    <li>1973</li>
                                                                    <li>1972</li>
                                                                    <li>1971</li>
                                                                    <li>1970</li>
                                                                    <li>1969</li>
                                                                    <li>1968</li>
                                                                    <li>1967</li>
                                                                    <li>1966</li>
                                                                    <li>1965</li>
                                                                    <li>1964</li>
                                                                    <li>1963</li>
                                                                    <li>1962</li>
                                                                    <li>1961</li>
                                                                    <li>1960</li>
                                                                    <li>1959</li>
                                                                    <li>1958</li>
                                                                    <li>1957</li>
                                                                    <li>1956</li>
                                                                    <li>1955</li>
                                                                    <li>1954</li>
                                                                    <li>1953</li>
                                                                    <li>1952</li>
                                                                    <li>1951</li>
                                                                    <li>1950</li>
                                                                    <li>1949</li>
                                                                    <li>1948</li>
                                                                    <li>1947</li>
                                                                    <li>1946</li>
                                                                    <li>1945</li>
                                                                    <li>1944</li>
                                                                    <li>1943</li>
                                                                    <li>1942</li>
                                                                    <li>1941</li>
                                                                    <li>1940</li>
                                                                    <li>1939</li>
                                                                    <li>1938</li>
                                                                    <li>1937</li>
                                                                    <li>1936</li>
                                                                    <li>1935</li>
                                                                    <li>1934</li>
                                                                    <li>1933</li>
                                                                    <li>1932</li>
                                                                    <li>1931</li>
                                                                    <li>1930</li>
                                                                    <li>1929</li>
                                                                    <li>1928</li>
                                                                    <li>1927</li>
                                                                    <li>1926</li>
                                                                    <li>1925</li>
                                                                    <li>1924</li>
                                                                    <li>1923</li>
                                                                    <li>1922</li>
                                                            </ul>
                        </div>
                        <div class="drop-content birth">
                            <div class="drop-item"><span id="dog_birth_month">월</span><img src="/web/img/btn_arrow_down.png" alt=""></div>
                            <ul class="item-list sel-birth sel-month">
                                                                    <li>1</li>
                                                                    <li>2</li>
                                                                    <li>3</li>
                                                                    <li>4</li>
                                                                    <li>5</li>
                                                                    <li>6</li>
                                                                    <li>7</li>
                                                                    <li>8</li>
                                                                    <li>9</li>
                                                                    <li>10</li>
                                                                    <li>11</li>
                                                                    <li>12</li>
                                                            </ul>
                        </div>
                        <div class="drop-content birth">
                            <div class="drop-item"><span id="dog_birth_day">일</span><img src="/web/img/btn_arrow_down.png" alt=""></div>
                            <ul class="item-list sel-birth sel-day"></ul>
                        </div>
                        <div class="estimate-box">
                            <div class="checkbox-wrap">
                                <input type="checkbox" id="dog_birth_check" name="dog_birth_check" value="Y">
                                <label for="dog_birth_check"><span class="checkbox-custom"></span><span class="checkbox-label4">추정</span></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="input-label">
                    <label for="">사진</label>
                    <input type="hidden" name="dog_orientation" value="">
                    <div class="input-wrap">
                        <label for="temp_img" class="pet-profile" id="dog_img_view"></label>
                        <input type="file" id="dog_img" name="dog_img" accept="image/*, .jfif" style="display: none;">
                        <input type="file" id="temp_img" name="temp_img" accept="image/*, .jfif" style="display: none;">
                    </div>
                </div>
            </div>
            <div class="double-content right-content">
                <div class="input-label">
                    <label class="has-tooltip" for="">
                        사이즈<span class="essential">*</span>
                        <div class="tool-box">
                            <img src="/web/img/ico_tooltip.png" alt="">
                            <div class="tooltip-wrap">
                                <img src="/web/img/tooltip_con.png" alt="">
                                <table>
                                    <tbody><tr>
                                        <th>소형견</th>
                                        <td>7kg 이하<br>(시츄, 미니핀, 닥스훈트 등)</td>
                                    </tr>
                                    <tr>
                                        <th>중형견</th>
                                        <td>7~15kg<br>(비글, 웰시코기, 시바견 등)</td>
                                    </tr>
                                    <tr>
                                        <th>대형견</th>
                                        <td>15kg 이상<br>(리트리버, 콜리, 허스키 등)</td>
                                    </tr>
                                </tbody></table>
                            </div>
                        </div>
                    </label>
                    <div class="input-wrap radio-wrap">
                        <div class="radio">
                            <input type="radio" id="dog_size_s" name="dog_size" value="S">
                            <label for="dog_size_s"><span class="checkbox-custom"></span><span class="checkbox-label">소형견</span></label>
                        </div>
                        <div class="radio">
                            <input type="radio" id="dog_size_m" name="dog_size" value="M">
                            <label for="dog_size_m"><span class="checkbox-custom"></span><span class="checkbox-label">중형견</span></label>
                        </div>
                        <div class="radio">
                            <input type="radio" id="dog_size_l" name="dog_size" value="L">
                            <label for="dog_size_l"><span class="checkbox-custom"></span><span class="checkbox-label">대형견</span></label>
                        </div>
                    </div>
                </div>
                <div class="input-label">
                    <label for="">몸무게<span class="essential">*</span></label>
                    <div class="input-wrap">
                        <input type="text" placeholder="반려동물 몸무게" name="dog_weight" maxlength="4" onkeypress="return WitCommon.onlyNumber(event)" onkeyup="return WitCommon.removeChar(event)">
                        <img src="/web/img/ico_kg.png" alt="">
                    </div>
                </div>
                <div class="input-label">
                    <label for="">목둘레</label>
                    <div class="input-wrap">
                        <input type="text" placeholder="반려동물 목둘레" name="dog_nack" maxlength="4" onkeypress="return WitCommon.onlyNumber(event)" onkeyup="return WitCommon.removeChar(event)">
                        <img src="/web/img/ico_cm.png" alt="">
                    </div>
                </div>
                <div class="input-label">
                    <label for="">등길이</label>
                    <div class="input-wrap">
                        <input type="text" placeholder="반려동물 등길이" name="dog_back" maxlength="4" onkeypress="return WitCommon.onlyNumber(event)" onkeyup="return WitCommon.removeChar(event)">
                        <img src="/web/img/ico_cm.png" alt="">
                    </div>
                </div>
                <div class="input-label">
                    <label for="">가슴둘레</label>
                    <div class="input-wrap">
                        <input type="text" placeholder="반려동물 가슴둘레" name="dog_chest" maxlength="4" onkeypress="return WitCommon.onlyNumber(event)" onkeyup="return WitCommon.removeChar(event)">
                        <img src="/web/img/ico_cm.png" alt="">
                    </div>
                </div>
                <div class="input-label">
                    <label for="">특이사항</label>
                    <div class="input-wrap">
                        <textarea style="resize: none;" placeholder="성격, 알러지, 과거병력등을 입력해주세요.(50자 이내)" id="dog_uniqueness" maxlength="50"></textarea>
                    </div>
                </div>
            </div>
            <div class="btn-wrap">
                <button class="submit" onclick="pageMypage.addPet('dog')">저장하기</button>
            </div>
        </div>
    </div>
    </div>
</div>
</div>
<script>
    //드롭박스
    $('.drop-item').click(function () {
        $(this).siblings('ul').fadeToggle();
        $(this).children('img').toggleClass('active');
        if ($(this).hasClass('active')) {
            $(this).removeClass('active').children('img').attr("src", $(this).children('img').attr("src").replace("up", "down"));
        } else {
            $(this).addClass('active').children('img').attr("src", $(this).children('img').attr("src").replace("down", "up"));
        }
    });

    $('.drop-content .item-list li').click(function () {
        var listValue = $(this).text();
        $(this).parent().siblings().children('span').text(listValue);
        $(this).parent().fadeOut().siblings().removeClass('active').children('img').attr("src", $(this).parent().siblings().children('img').attr("src").replace("up", "down"));
    });

    $('.checked .item-list li').click(function () {
        $(this).parents('.checked').next('.drop-content').children('.drop-item').children('.impact').show();
    });

    //견종 검색
    $('#search_dog').keyup(function() {
        var k = $(this).val();
        $(".mypage-petAddDog-popup .search-wrap > .search-item > .item-box").hide();
        var temp = $(".mypage-petAddDog-popup .search-wrap > .search-item > .item-box > p:contains('" + k + "')");
        var tempUp = $(".mypage-petAddDog-popup .search-wrap > .search-item > .item-box > p:contains('" + k.toUpperCase() + "')");
        if(k == "" || k == null || tempUp.length == 0 || temp.length == 0) $(".search-wrap").hide();
        else $(".mypage-petAddDog-popup .search-wrap").show();
        $(temp).parent().show();
        $(tempUp).parent().show();
    });

    //검색한 견종 선택
    $('.mypage-petAddDog-popup .item-box').click(function(){
        var kind = $(this).find('span').text();
        var id = $(this).find('a').text();
        $('#search_dog').val(kind);
        $('#search_dog_id').val(id);
        $(".mypage-petAddDog-popup .search-wrap").hide();
    });

    //tooltip
    $('.has-tooltip').mouseenter(function (e) {
        $(this).find('.tooltip-wrap').show();
    });
    $('.has-tooltip').mouseleave(function (e) {
        $(this).find('.tooltip-wrap').hide();
    });

    //검색바
    $('.searching').mouseover(function () {
        if ($('.searching').not('.active')) {
            $(this).addClass('active');
        }
    });

    $('.searching').mouseleave(function () {
        $(this).removeClass('active');
    });

    function readImage(input, val) {
        if (input.files && input.files[0]) {
            //파일의 확장자명
            var extension = input.files[0].name.substring(input.files[0].name.lastIndexOf('.') + 1, input.files[0].name.length);
            pagePopup.openProgressPopup('로딩중 입니다. 잠시만 기다려주세요.');
            try{
                //input file temp -> real 교체
                $('#dog_img').remove();
                $('#temp_img').attr('name', 'dog_img');
                $('#temp_img').attr('id', 'dog_img');
                var tagHtml = '<input type="file" id="temp_img" name="temp_img" accept="image/*, .jfif" style="display: none;">';
                $('#dog_img').after(tagHtml);

                if(extension.toLowerCase() == 'gif'){
                    $(val).css({"background":"url(" + window.URL.createObjectURL(input.files[0]) + ") center center no-repeat", 'background-size':'cover'});
                    pagePopup.closeProgressPopup();
                }else{
                    var orientation = 0;
                    EXIF.getData(input.files[0], function(){
                        orientation = EXIF.getTag(input.files[0], 'Orientation');
                        var rotate = 0;
                        switch(orientation){
                            case 0:
                                rotate = 0;
                                break;
                            case 1:
                                rotate = 0;
                                break;
                            case 2:
                                rotate = 0;
                                break;
                            case 3:
                                rotate = 180;
                                break;
                            case 4:
                                rotate = 180;
                                break;
                            case 5:
                                rotate = 90;
                                break;
                            case 6:
                                rotate = 90;
                                break;
                            case 7:
                                rotate = -90;
                                break;
                            case 8:
                                rotate = -90;
                                break;
                            default:
                                rotate = 0;
                                break;
                        }
                        console.log(rotate);
                        $('input[name=dog_orientation]').val(rotate);
                        if(WitCommon._config.CURRENT_BROWSER == 'CHROME' || rotate == 0){
                            loadImage(input.files[0], function(image){
                                $(val).css({"background":"url(" + WitCommon.getUrlToBlobUrl(image.toDataURL()) + ") center center no-repeat", 'background-size':'cover'});
                                pagePopup.closeProgressPopup();
                            },{orientation:1, maxWidth:1055});
                        }
                        if(WitCommon._config.CURRENT_BROWSER != 'CHROME' && rotate != 0){
                            loadImage(input.files[0], function(image){
                                $(val).css({"background":"url(" + WitCommon.getUrlToBlobUrl(image.toDataURL()) + ") center center no-repeat", 'background-size':'cover'});
                                pagePopup.closeProgressPopup();
                            },{orientation:true, maxWidth:1055});
                        }
                    });
                }

            }catch(e){
                pagePopup.closeProgressPopup();
            }
        }
    }

    $(document).on('change', '#temp_img', function(){
        if($(this)[0].files.length <= 0 && WitCommon._config.TEMP_IMAGE != null){
            $(this).replaceWith(WitCommon._config.TEMP_IMAGE);
        }else if($(this)[0].files.length > 0){
            if(WitCommon.checkIsImage(this, '#dog_img_view')) {
                readImage(this, '#dog_img_view');
            }
        }
        WitCommon._config.TEMP_IMAGE = null;
    });

    $(document).on('click', '#temp_img', function(){
        if($(this)[0].files.length > 0){
            WitCommon._config.TEMP_IMAGE = $(this).eq(0).clone();
        }
    });

    $(document).ready(function(){
        var petList;
        $.get('/mypage/get/pet/dog', function(res){
            petList = res;
        });

        var dogList = petList;
        var items = dogList.map(function (n) { return { label: n.kind, id:n.id }});
        var allowedChars = new RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/)

        function charsAllowed(value) {
            return allowedChars.test(value);
        }

        autocomplete({
            input: document.getElementById('search_dog'),
            minLength: 1,
            onSelect: function (item, inputfield) {
                inputfield.value = item.label
                $('#search_dog_id').val(item.id);
            },
            fetch: function (text, callback) {
                var match = text.toLowerCase();
                callback(items.filter(function(n) { return n.label.toLowerCase().indexOf(match) !== -1; }));
            },
            render: function(item, value) {
                var itemElement = document.createElement("div");
                if (charsAllowed(value)) {
                    var regex = new RegExp(value, 'gi');
                    var inner = item.label.replace(regex, function(match) { return "<strong>" + match + "</strong>" });
                    itemElement.innerHTML = inner;
                } else {
                    itemElement.textContent = item.label;
                }
                return itemElement;
            },
            emptyMsg: "검색 된 견종이 없습니다.",
            customize: function(input, inputRect, container, maxHeight) {
                if (maxHeight < 100) {
                    container.style.top = "";
                    container.style.bottom = (window.innerHeight - inputRect.bottom + input.offsetHeight) + "px";
                    container.style.maxHeight = "140px";
                }
                if(maxHeight > 300){
                    container.style.maxHeight = "300px";
                }
            }
        })

        document.querySelector("input").focus();

        //# 기본값 셋팅
        var sel_year = $('#dog_birth_year').text();
        var sel_month = $('#dog_birth_month').text();
        if(sel_year != '연도' && sel_month != '월'){
            var dayCnt = new Date(sel_year, sel_month, 0).getDate();
            var html = '';
            for(var i=1; i<=dayCnt; i++){
                html += '<li>' + i + '</li>';
            }
            $('.drop-content .sel-day').html(html);
        }

        $('.drop-content .sel-birth li').click(function () {
            var today = new Date();
            var mm = today.getMonth()+1;
            var yyyy = today.getFullYear();
            var sel_year = $('#dog_birth_year').text();
            var sel_month = $('#dog_birth_month').text();
            var sel_day = $('#dog_birth_day').text();

            if(sel_year == '연도'){
                pagePopup.alramPopup('연도를 먼저 선택해주세요.');
                $('#dog_birth_month').text('월');
                $('#dog_birth_day').text('일');
            }else if(sel_month == '월' && sel_day != '일'){
                pagePopup.alramPopup('월을 먼저 선택해주세요.');
                $('#dog_birth_day').text('일');
            }
            if(sel_year == yyyy && sel_month > mm){
                pagePopup.alramPopup('생년월일을 확인해주세요.');
                $('#dog_birth_month').text('월');
                $('#dog_birth_day').text('일');
            }
        });

        $('.drop-content .sel-month li').click(function () {
            $('#dog_birth_day').text('일');
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth()+1;
            var yyyy = today.getFullYear();
            var sel_year = $('#dog_birth_year').text();
            var sel_month = $('#dog_birth_month').text();

            if(sel_year != '연도' && sel_month != '월'){
                $('.drop-content .sel-day').html("");
                var dayCnt = new Date(sel_year, sel_month, 0).getDate();
                var html = '';
                for(var i=1; i<=dayCnt; i++){
                    html += '<li>' + i + '</li>';
                }
                $('.drop-content .sel-day').html(html);

                $('.drop-content .sel-day li').click(function () {
                    var listValue = $(this).text();
                    $(this).parent().siblings().children('span').text(listValue);
                    $(this).parent().fadeOut().siblings().removeClass('active').children('img').attr("src", $(this).parent().siblings().children('img').attr("src").replace("up", "down"));

                    if(sel_year == yyyy && sel_month == mm && listValue > dd){
                        pagePopup.alramPopup('생년월일을 확인해주세요.');
                        $('#dog_birth_day').text('일');
                    }
                });
            }
        });
    });
</script>
</div>
</body>
<%-- =======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
				
			<!-- TOP  -->
		   <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		   
			<section>
			<a href="<c:url value='/loginForm'/>">반려동물 등록</a>
			
			</section>
			
			
			
			
			<!-- BOTTOM  -->
		   <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
			</div>
	</body>
>>>>>>> refs/remotes/origin/main10(bootstrap_merge) --%>
</html>