<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역 | My Page |The Shilla Hotel</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/common.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage/leftMenu.css?v=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage/qnaRecord.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypage/qnaRecord.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	<section>
		<div id="contentWrap">
				<jsp:include page="mypageLeftMenu.jsp" />
				<div id="rightArea">
					<div id="wrap_title">
						<h1 id="title">문의내역</h1>
						<div id="wrap_home">
							<img src="${pageContext.request.contextPath}/img/common/locaton.gif" id="home"> >My Page> <span
								id="board">문의 내역</span>
						</div>	
					</div>
					<span id="info1">회원님께서 문의하신 내역과 답변을 확인하실 수 있습니다.</span>
					<div id="qnaRecordContent">
						<div id="record_title">
							<span id="date_title">기간 조회</span>
							<a href="#"><button>1주</button></a>
							<a href="#"><button>1개월</button></a>
							<a href="#"><button>3개월</button></a>
							<a href="#"><button>6개월</button></a>
							<a href="#"><button>전체</button></a>
							<a href="#"><img src="${pageContext.request.contextPath}/img/mypage/Btnsearch.gif"></a>
						</div>
						<div id="record_table">
							<span id="total"></span>
							<table border="1" id="tableRecord">
								<tr id="title_table">
									<th id="num">No</th>
									<th id="qna_title">제목</th>
									<th id="date">문의일자</th>
									<th id="answer">답변여부</th>
								</tr>
							</table>
							<input type="hidden" value="${MEMBER.id }" id="hiddenId">
						</div>
					</div>
				</div>
			</div>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>