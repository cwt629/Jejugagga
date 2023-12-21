<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
   body * {
       font-family: 'Orbit';
   }
   	.signupdiv {
		width: 600px;
		height: 100vh;
		padding-top: 40px;
		margin: 0 auto;
	}
	
	.signupdiv > .signup_logo_photo{
		width: 150px;
		height: 150px;
		margin-left: 40%;
	}
	
	#signupForm {
		width: 600px;
		text-align: center;
	}
	
	#signupForm > input {
		width: 200px;
		height: 48px;
		padding: 0 10px;
		margin-bottom: 16px;
		border-radius: 6px;
		background-color: #F8F8F8;
	}
	
	#signupForm > button {
		width: 200px;
		height: 48px;
		border-radius: 6px;
		color: black;
		font-size: 16px;
		margin-bottom: 16px;
		
	}
	
	#signupForm > input[type="submit"] {
		color: #fff;
		font-size: 16px;
		background-color: #EEB182;
		margin-top: 20px;
	}
	
	p {
		font-size: 20px;
		text-align: center;
		color: #EEB182;
	}
	
	.inforow {
		padding-left: 18%;
	}
	
	.col-sm-10 > input {
		text-align: center;
	}
	
	hr {
		color: brown;
	}
	
	label {
		--bs-gutter-x: none;
	}
	
	#nickname, #email {
		width: 280px;
		height: 30px;
		border-radius: 6px;
		background-color: #F8F8F8;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<div class="signupdiv">
		<img alt="logo" src="${root }/res/photo/jejuhome.png" class="signup_logo_photo">
			<p><b>기본 정보</b></p>
			<form id="signupForm" action="${root }/member/changeinfo/change" method="post">
				<hr>
			  <div class="mb-3 row inforow">
				<label for="staticId" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticId" value="${sessionScope.id }">
					</div>
				</div>
				<hr>
			  <div class="mb-3 row inforow">
				<label for="staticPasswd" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticPasswd" value="************">
					</div>
				</div>
				<hr>
			  <div class="mb-3 row inforow">
				<label for="staticNickname" class="col-sm-2 col-form-label">닉네임</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticNickname" value="${sessionScope.nickname }">
						<input type="text" name="nickname" id="nickname" required placeholder="변경할 닉네임 입력">
					</div>
				</div>
				<hr>
			  <div class="mb-3 row inforow">
				<label for="staticName" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticName" value="${memberList.name }">
					</div>
				</div>
				<hr>
			  <div class="mb-3 row inforow">
				<label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${sessionScope.myemail }">
						<input type="email" name="email" id="email" required placeholder="변경할 이메일 입력">
					</div>
				</div>
				<hr>
			  <div class="mb-3 row inforow">
				<label for="staticBirth" class="col-sm-2 col-form-label">생년월일</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticBirth" value="${memberList.birth }">
					</div>
				</div>
				<hr>
			  <div class="mb-3 row inforow">
				<label for="staticPhone" class="col-sm-2 col-form-label">휴대폰 번호</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext" id="staticPhone" value="${sessionScope.phone }">
					</div>
				</div>
				<hr>
			  <input type="hidden" value="${memberList.usercode}" name="usercode">
			  <input type="submit" value="회원정보 변경">
			  <button type="button">취소</button>
			</form>
	</div>
</body>
</html>
