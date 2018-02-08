<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STEP1 날짜&인원 선택</title>
<link rel="stylesheet" type="text/css" href="css/common/reset.css">
<link rel="stylesheet" type="text/css" href="css/common/common.css">
<link rel="stylesheet" type="text/css" href="css/reservation/step1.css?a=ddf">
<link rel="stylesheet" type="text/css" href="css/reservation/Loading.css">
<link rel="stylesheet" type="text/css" href="css/reservation/calendar.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/common/common.js"></script>
<script type="text/javascript" src="js/reservation/Loading.js"></script>
<script type="text/javascript" src="js/reservation/step1.js?a=df"></script>
<script type="text/javascript" src="js/reservation/calendar.js"></script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="/WEB-INF/common/header.jsp" />
		</header>
		<section> 
			<div id="main">
				<table>
					<tr>
						<th>STEP1 날짜/인원/객실 선택 </th>
						<th class="noSelect">STEP1 옵션 선택</th>
						<th class="noSelect">STEP2 고객 정보 입력</th>
						<th class="noSelect">STEP3 예약 완료</th>
					</tr>
					<tr>
						<td colspan="3">
							<div class="selectText">제주신라호텔</div>
							<div>
								<div class="selectText">체크인</div>
								<div class="selectDay">
									<div class="dayWrap">
										<div class="year">2018</div>
										<div class="month">02</div>
									</div>
									<div class="day">07</div>
								</div>
							</div>
							<div>
								<div class="selectText">체크아웃</div>
								<div class="selectDay">
									<div class="dayWrap">
										<div class="year">2018</div>
										<div class="month">02</div>
									</div>
									<div class="day">07</div>
								</div>
							</div>
							<div class="selectType">
								<div class="selectText">성인</div>
								<div class="selectNum">
									<div class="num" id="adultNum">1</div>
									<div class="selectBtn">
										<span class="selectPlus">
											<img src="/Project_JSP/img/reservation/selectPlus.png">
										</span>
										<span class="selectMinus">
											<img src="/Project_JSP/img/reservation/noMinus.png">
										</span>
									</div>
								</div>
							</div>
							<div class="selectType"> 
								<div class="selectText">어린이</div>
								<img class="importantImg" src="/Project_JSP/img/reservation/important.gif">
								<span class="alertText">어린이 : 37개월 이상~ 만 12세 이하</span>
								<div class="selectNum">
									<div class="num" id="kidNum">0</div>
									<div class="selectBtn">
										<span class="selectPlus">
											<img src="/Project_JSP/img/reservation/selectPlus.png">
										</span>
										<span class="selectMinus">
											<img src="/Project_JSP/img/reservation/noMinus.png">
										</span>
									</div>
								</div>
							</div>
							<div class="selectType">
								<div class="selectText">유아</div>
								<img class="importantImg" src="/Project_JSP/img/reservation/important.gif">
								<span class="alertText" id="babyAlert">
									유아: 36개월 이하
								</span>
								<div class="selectNum">
									<div class="num" id="babyNum">0</div>
									<div class="selectBtn">
										<span class="selectPlus">
											<img src="/Project_JSP/img/reservation/selectPlus.png">
										</span>
										<span class="selectMinus">
											<img src="/Project_JSP/img/reservation/noMinus.png">
										</span>
									</div>
								</div>
							</div>
						</td>
						<td id="searchBtn">
							<img src="/Project_JSP/img/reservation/searchBtn.jpg">
						</td>
					</tr>
					<tr>
						<td colspan="4" id="tdText">
							예약을 원하시면 호텔, 날짜, 인원을 선택 후 검색 버튼을 눌러주세요.
						</td>
					</tr>
				</table>
			</div>
			


<!--   <div class="main">
				    <div class="custom-calendar-wrap">
					      <div id="custom-inner" class="custom-inner">
						        <div class="custom-header clearfix">
							          <nav>
								            <span id="custom-prev" class="custom-prev"></span>
								            <span id="custom-next" class="custom-next"></span>
							          </nav>
							          <h2 id="custom-month" class="custom-month"></h2>
							          <h3 id="custom-year" class="custom-year"></h3>
						        </div>
						        <div id="calendar" class="fc-calendar-container"></div>
					      </div>
				    </div>
  </div> -->

		</section>
		<footer>
			<jsp:include page="/WEB-INF/common/footer.jsp" />
		</footer>
	</div>
</body>
</html>