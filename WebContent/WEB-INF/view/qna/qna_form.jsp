<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>고객의견접수 | The Shilla Hotel</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/qna/qnaboard.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qna/qnaForm.js?v=3"></script>
</head>
<body>
	<div>
		<header>
			<jsp:include page="/WEB-INF/common/header.jsp" />
		</header>
		<section>
			<div id="contentWrap">
				<jsp:include page="leftMenu.jsp" />
				<div id="rightArea">

					<div id="wrap_title">
						<h1 id="title">문의하기</h1>
						<div id="wrap_home">
							<img src="${pageContext.request.contextPath}/img/common/locaton.gif" id="home"> > 고객문의 > <span
								id="board">문의하기</span>
						</div>


					</div>

					<form action="qna.do" method="post" id="f" enctype="multipart/form-data">
						<input type="hidden" value="${MEMBER.id }" id="hiddenmember" name="hiddenId">
						<table id="wrap_form">
							<tr>
								<th><span class="dot">*</span>제목</th>
								<td><input type="text" name="title" class="import"></td>
							</tr>
							<tr id="content">
								<th><span class="dot">*</span>내용</th>
								<td><textarea rows="7" cols="" name="content" id="textarea" class="import"></textarea></td>
							</tr>
							<tr>
								<th><span class="dot">*</span>성명</th>
								<td><input type="text" name="name" onkeyup="this.value=this.value.replace(/[^a-zA-Z가-힣]/g,'');" class="import"class="import"></td>
								<c:if test="${MEMBER != null}">
									<script>
											$("input[name='name']").val("${MEMBER.nameKo}").attr("readonly","readonly");
									</script>
								</c:if>
								
							</tr>
							<tr>
								<th><span class="dot">*</span>이메일</th>
								<td><input type="text" name="email1" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');" class="import">
								<span id="email_">@ </span><input type="text" name="email2" id="com" onkeyup="this.value=this.value.replace(/[^a-zA-Z.]/g,'');" class="import">
								<select id="select_email">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value = "hanmail.net">hanmail.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="empas.com">empas.com</option>
									<option value="gmail.com">gmail.com</option>
								</select>
							
								</td>
										<c:if test="${MEMBER != null}">
									<script>
										var email ="${MEMBER.email}";
										var email1 = email.substring(0, email.indexOf("@"));
										var email2 = email.substring(email.indexOf("@")+1);
											$("input[name='email1']").val(email1).attr("readonly","readonly");
											$("input[name='email2']").val(email2).attr("readonly","readonly");
											$("select[name='email3']").attr("disabled","disabled");
									</script>
								</c:if>
							</tr>
							<tr>
								<th><span class="dot">*</span>휴대전화</th>
								<td><input type="tel" name="tel"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="import"></td>
								<c:if test="${MEMBER !=null }">
									<script>
										$("input[name='tel']").val("${MEMBER.phone}").attr("readonly","readonly");
									</script>
								</c:if>
							</tr>
							<tr>
								<th>첨부이미지</th>
								<td>
								<input type="file" name="filePath"><br><br>
									<span id="extra">*추가적으로 첨부할 이미지가 있으면 첨부해주세요</span>
								</td>
							</tr>
						</table>
						
						<c:if test="${MEMBER == null }">
										<div id="wrap_agree">
							<h3>필수적 개인정보 수집 및 이용에 대한 동의</h3>
							<textarea rows="4" cols="">신라호텔 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.

1. 필수적인 개인정보의 수집 ㆍ이용에 관한 사항
① 수집ㆍ이용 항목 | 성명,  이메일, 휴대전화번호, 유선 전화번호(자택 또는 직장)
② 수집ㆍ이용 목적 | 문의에 대한 안내 및 서비스 제공
③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 5년간
※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 제반 절차 진행이 불가능 할 수 있음을 알려드립니다.</textarea>
							<div id="wrap_check">
								<input type="checkbox" name="check" id="check_btn"><span id="check">동의함</span>
							</div>
						</div>
						</c:if>
						<div id="wrap_sub_btn">
							<input type="submit" value="등록" id="submit">
						</div>
						
					</form>
				</div>
			</div>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/common/footer.jsp" />
		</footer>
	</div>
</body>
</html>