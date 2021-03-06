<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | The Shilla Hotel</title>
<link rel="stylesheet" type="text/css" href="css/common/reset.css">
<link rel="stylesheet" type="text/css" href="css/common/common.css">
<link rel="stylesheet" type="text/css" href="css/login/loginForm.css?v=5">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script src="js/common/common.js"></script>
<script src="js/login/loginForm.js?v=4"></script>
</head>
<body>
	<div id="bodybg"></div>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
		<div id="loginForm_wrap">
		<div id="loginForm_title">
			<h2 >로그인</h2>
					<div id="wrap_home">
							<img src="${pageContext.request.contextPath}/img/common/locaton.gif" id="home"> > <span
								id="board">로그인</span>
						</div>
		</div>
		<div id="info">
			<h2>신라리워즈에 오신 것을 환영합니다.</h2>
			<h3>아이디와 비밀번호를 입력해주시기 바랍니다.</h3>
			<h4>※신라호텔의 회원이되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다.</h4>
		</div>
		
		
		<fieldset>
		
			<form action="login.do" method="post" id="member_form">
				<c:if test="${noMember ==null && admin==null}">
					<input type="radio" name="clientGrade" value="MEMBER" id="mem" checked="checked">회원
				<input type="radio" name="clientGrade" value="NONMEMBER" id="no">비회원(예약번호)
				<input type="radio" name="clientGrade" value="ADMIN" id="ad">관리자
				</c:if>
				<c:if test="${noMember !=null }">
					<input type="radio" name="clientGrade" value="MEMBER" id="mem" >회원
				<input type="radio" name="clientGrade" value="NONMEMBER" id="no" checked="checked">비회원(예약번호)
				<input type="radio" name="clientGrade" value="ADMIN" id="ad">관리자
				</c:if>
				<c:if test="${admin !=null }">
				<input type="radio" name="clientGrade" value="MEMBER" id="mem" >회원
				<input type="radio" name="clientGrade" value="NONMEMBER" id="no">비회원(예약번호)
				<input type="radio" name="clientGrade" value="ADMIN" id="ad"  checked="checked">관리자
				</c:if>
				<br><br>
			
				<div id="member">
						<div class="login">
							<p>
								<input type="text" placeholder="아이디 " name="id" style="ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');">
							</p>
							<p>	
								<input type="password" placeholder="비밀번호" name="pw">
								<c:if test="${error3 !=null }">
								<br><span class="error1">${error3 }</span>	
							</c:if>
							</p>
								<a href="#" id="member_btn"><img src="/Project_JSP/img/login/login.gif"></a>
							</div>	
							<c:if test="${error1 !=null }">
								<span class="error">${error1 }</span><br>
							</c:if>
							
						<br>
						
							<input type="hidden" name="clientGrade" value="MEMBER">
							<a href="join.do"><button type="button" id="join">신라리워즈 가입</button></a>
							<a href=""><button type="button" id="searchId">아이디 찾기</button></a>
							<a href=""><button type="button" id="searchPw">비밀번호 찾기</button></a>
					</div>
					 
			</form>
				
			<form action="login.do" method="post" id="no_member_form">
				<div id="no_member">
							<div class="login">
								<p>
									<input type="text" placeholder="예약번호" name="id">
								</p>
								<p>	
									<input type="text" placeholder="FIRST NAME(이름)" name="name2" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');">
									<input type="text" placeholder="LAST NAME(성)" name="name1" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');">
									<c:if test="${error4 !=null }">
										<br><span class="error1">${error4 }</span>
									</c:if>
								</p>
									<input type="hidden" value="NONMEMBER" name="clientGrade">
									<a href="#"  id="nomember_btn"><img src="/Project_JSP/img/login/login.gif"></a>
							</div>	
							
							<c:if test="${error2 !=null }">
								<span class="error">${error2 }</span>	
							</c:if>
							<div id="reservation_num">
								<a href="#" id="reser_search"><button>예약번호 찾기</button></a>
							</div>
					</div> 
			</form>
			
			<form id="admin_form" action="login.do" method="post">
				<div id="admin">
					<div class="login">
						<p>
							<input type="text" placeholder="관리자 아이디" name="id">
						</p>
						<p>
							<input type="password" placeholder="관리자 비밀번호" name="pw">
							<c:if test="${error6 !=null }">
										<br><span class="error1">${error6 }</span>
									</c:if>
						</p>
						<input type="hidden" value="ADMIN" name="clientGrade">
						<a href="#" id="admin_btn"><img src="/Project_JSP/img/login/login.gif"></a>
						<c:if test="${error5 !=null }">
										<br><span class="error">${error5 }</span>
									</c:if>
					</div>
				</div>
			</form>
		</fieldset>
		<div id="info2">
			이메일, 연락처 등의 정보가 변경되면 웹 사이트(마이페이지)에서 회원정보를 수정해주시기 바랍니다
		</div>
	</div>
	</section>
	<div id="pop_search_id">
		<div id="pop_id_title">
			<h1>신라리워즈 아이디 찾기</h1>
			<a href="#" id="close"><img src="${pageContext.request.contextPath}/img/join/popLayerBtnClose.gif"></a>
		</div>
		<span id="title_find_id"></span>
		<div id="input_form">
			<div id="input_info">
				<p>
				<label>성명</label>
				<input type="text" id="en1" placeholder="FIRST NAME(이름)" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');" class="search_id_input">
				<input type="text" id="en2" placeholder="LAST NAME(성)" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');" class="search_id_input">
			</p>
			<p>
				<label>이메일</label>
				<input type="text" id="email_id" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9@.]/g,'');" class="search_id_input">
				<span id="pop_id_err"></span>
			</p>
			</div>
			
			<div id="find_info">
			</div>
		</div>
		<div id="pop_ok">
		<div id="original_btn">
			<a href="#" id="search_id"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnSubmit.gif"></a>
		</div>
			<div id="after_find_id_btn">
				<a href="#" id="close_pop"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnSubmit.gif"></a>
				<a href="#" id="pop_search_pw_btn"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnLostPw.gif"></a>
			</div>
		</div>
	</div>
	<div id="pop_search_pw">
		<div id="pop_pw_title">
			<h1>비밀번호 찾기</h1>
			<a href="#" class="close_pop_pw"><img src="${pageContext.request.contextPath}/img/join/popLayerBtnClose.gif"></a>
		</div>
		<div id="input_pw">
			<div id="input_pw_title">
				<p>임시 비밀번호 발급</p>
				<p></p>
			</div>
			<div id="main_pw">
				<span id="main_pw_info">회원가입 시 등록하신 이메일로 임시비밀번호를 발급해드립니다.</span>
				<div id="main_pw_input">
					<p>
						<label>신라리워즈 아이디</label>
						<input type="text" id="pw_id" class="pw_input_import" style="ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');">
					</p>
					<p>
						<label>성명</label>
						<input type="text" id="pw_en1" class="pw_input_import" placeholder="FIRST NAMBE(이름)" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');">
						<input type="text" id="pw_en2" class="pw_input_import" placeholder="LAST NAMBE(성)" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');">
					</p>					
					<p>
						<label>이메일</label>
						<input type="text" id="pw_email" class="pw_input_import" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9@.]/g,'');">
					</p>	
				</div>
				<div id="pw_btn">
					<a href="#" id="send_email_btn"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnSubmit.gif"></a>
					<a href="#" class="close_pop_pw"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnCancel.gif"></a>
				</div>
				<div id="pw_btn_other">
					<div id="pw_btn_01">
						<p class="other_info">로그인을 하시려면?</p>
						<a href="login.do" id="other_login"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnLogin.gif"></a>
					</div>
						
					<div id="pw_btn_02">
						<p class="other_info">신라리워즈 아이디를 찾으시려면?</p>
						<a href="#" id="other_search"><button>아이디 찾기</button></a>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	<div id="success_pw">
		<div id="success_title">
			<h1>임시비밀번호 발급 완료</h1>
			<a href="#" id="success_close"><img src="${pageContext.request.contextPath}/img/join/popLayerBtnClose.gif"></a>
		</div>
		<div id="success_form">
			<p>회원님의 이메일 <span id="success_email"></span>로 임시 비밀번호를 발송해드렸습니다.</p>
			<p>발급받은 임시 비밀번호로 로그인 해주시기 바랍니다.</p>
		</div>
		<div id="success_btn">
			<a href="#" id="success_ok"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnSubmit.gif"></a>
		</div>
	</div>
	
	<div id="search_r_num">
		<div id="search_r_num_title">
			<h1>예약번호 찾기</h1>
			<a href="#" id="r_num_close"><img src="${pageContext.request.contextPath}/img/join/popLayerBtnClose.gif"></a>
		</div>
		<div id="r_input">
			<p>
				<label>성명</label>
				<input type="text" id="ren1" placeholder="FIRST NAME(이름)" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');" class="r_id_input">
				<input type="text" id="ren2" placeholder="LAST NAME(성)" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');" class="r_id_input">
			</p>
			<p>
				<label>이메일</label>
				<input type="text" id="remail" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9@.]/g,'');" class="r_id_input">
			</p>
		</div>
		<div id="choice_btn">
			<a href="#" id="ok_choice"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnSubmit.gif"></a>
			<a href="#" id="close_choice"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnCancel.gif"></a>
		</div>
	</div>
	
	<div id="reservation_pop">
		<div id="r_pop_title">
			<h1>예약번호 재발송</h1>
			<a href="#" id="r_close"><img src="${pageContext.request.contextPath}/img/join/popLayerBtnClose.gif"></a>
		</div>
		<div id="r_form">
			<p>회원님의 이메일 <span id="r_email"></span>로 예약번호를 발송해드렸습니다.</p>
		</div>
		<div id="r_btn">
			<a href="#" id="r_ok"><img src="${pageContext.request.contextPath}/img/login/popFindIdBtnSubmit.gif"></a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>