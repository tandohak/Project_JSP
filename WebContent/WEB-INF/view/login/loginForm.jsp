<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 신라호텔</title>
<link rel="stylesheet" type="text/css" href="css/common/reset.css">
<link rel="stylesheet" type="text/css" href="css/common/common.css">
<link rel="stylesheet" type="text/css" href="css/login/loginForm.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script src="js/common/common.js"></script>
<script src="js/login/loginForm.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp"/>
	<section>
		<div id="loginForm_wrap">
		<div id="loginForm_title">
			<h2 >로그인</h2>
		</div>
		<div id="info">
			<h2>신라호텔에 오신 것을 환영합니다.</h2>
			<h3>아이디와 비밀번호를 입력해주시기 바랍니다.</h3>
			<h4>※신라호텔의 회원이되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다.</h4>
		</div>
		
		
		<fieldset>
		
			<form action="login.do" method="post">
				<c:if test="${noMember ==null && admin==null}">
					<input type="radio" name="clientGrade" value="MEMBER" id="mem" checked="checked">회원
				<input type="radio" name="clientGrade" value="NONMEMBER" id="no">비회원(예약번호)
				<input type="radio" name="clientGrade" value="ADMIN" id="admin">관리자
				</c:if>
				<c:if test="${noMember !=null }">
					<input type="radio" name="clientGrade" value="MEMBER" id="mem" >회원
				<input type="radio" name="clientGrade" value="NONMEMBER" id="no" checked="checked">비회원(예약번호)
				<input type="radio" name="clientGrade" value="ADMIN" id="admin">관리자
				</c:if>
				<c:if test="${admin !=null }">
				<input type="radio" name="clientGrade" value="MEMBER" id="mem" >회원
				<input type="radio" name="clientGrade" value="NONMEMBER" id="no">비회원(예약번호)
				<input type="radio" name="clientGrade" value="ADMIN" id="admin"  checked="checked">관리자
				</c:if>
				<br><br>
			
				<div id="member">
						<div class="login">
							<p>
								<label>아이디 </label>
								<input type="text" placeholder="아이디 " name="id">
							</p>
							<p>	
								<label>비밀번호</label>
								<input type="password" placeholder="비밀번호" name="pw">
								<c:if test="${error3 !=null }">
								<br><span class="error1">${error3 }</span>	
							</c:if>
							</p>
								<input type="submit" value="로그인">
							</div>	
							<c:if test="${error1 !=null }">
								<span class="error">${error1 }</span><br>
							</c:if>
							
						<br>
						
							<input type="hidden" name="clientGrade" value="MEMBER">
							<a href="join.do"><button type="button" id="join">회원가입</button></a>
							<a href=""><button type="button" id="searchId">아이디 찾기</button></a>
							<a href=""><button type="button" id="searchPw">비밀번호 찾기</button></a>
					</div>
					 
			</form>
				
			<form action="login.do" method="post">
				<div id="no_member">
							<div class="login">
								<p>
									<label>예약번호</label>
									<input type="text" placeholder="예약번호" name="id">
								</p>
								<p>	
									<label>성명</label>
									<input type="text" placeholder="FIRST NAME(이름)" name="name2" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');">
									<input type="text" placeholder="LAST NAME(성)" name="name1" style="text-transform:uppercase; ime-mode:disabled;" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');">
									<c:if test="${error4 !=null }">
										<br><span class="error1">${error4 }</span>
									</c:if>
								</p>
									<input type="hidden" value="NONMEMBER" name="clientGrade">
									<input type="submit" value="로그인">
							</div>	
							<c:if test="${error2 !=null }">
								<span class="error">${error2 }</span>	
							</c:if>
					</div> 
			</form>
			
			<form action="login.do" method="post">
				<div id="admin">
					<div class="login">
						<p>
							<label>관리자아이디</label>
							<input type="text" placeholder="관리자 아이디" name="id">
						</p>
						<p>
							<label>비밀번호</label>
							<input type="password" placeholder="관리자 비밀번호" name="pw">
						</p>
						<input type="submit" value="관리자">
					</div>
				</div>
			</form>
		</fieldset>
		<div id="info2">
			이메일, 연락처 등의 정보가 변경되면 웹 사이트(마이페이지)에서 회원정보를 수정해주시기 바랍니다.
		</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/common/footer.jsp"/>
</body>
</html>