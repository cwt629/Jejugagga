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
		font-size: 14px;
	}
	
	.checkdiv {
		width: 400px;
		height: 350px;
		padding: 40px;
		position: absolute;
	        margin: 0 auto;
	        left: 0;
	        right: 0px;
	        TOP: 13%;
	}
	
	.checkdiv > .login_logo_photo{
		width: 200px;
		height: 200px;
	}
	
	
	#findform > input {
		width: 300px;
		height: 48px;
		padding: 0 10px;
		margin-bottom: 16px;
		border-radius: 6px;
		background-color: #F8F8F8;
	}
	
	#findform > input[type="submit"] {
		color: #fff;
		font-size: 16px;
		background-color: #EEB182;
		margin-top: 20px;
	}
	
	#findform > input[type="checkbox"] {
		display: none;
	}
	
	#findform > label {
		color: #999999;
	}
	
	#findform input[type="checkbox"]+label {
		cursor: pointer;
		padding-left: 26px;
		background-image: url("checkbox.png");
		background-repeat: no-repeat;
		background-size: contain;
	}
	
	#findform input[type="checkbox"]:checked+label {
		background-image: url("checkbox-active.png");
		background-repeat: no-repeat;
		background-size: contain;
	}
	
	.findtext{
		text-align: center;
		color: 	#EEB182;	
		}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<div class="checkdiv">
		<img alt="logo" src="${root }/res/photo/jejuhome.png" style="margin-left: 55px" class="login_logo_photo">
		<div class="findtext" style="text-align: center;"><b>찾으시려는 계정의 회원정보를 입력해주세요</b></div>
		<form action="${root }/member/login/findpass/check" method="post" id="findform">
			<br>아이디<br>
	        <input type="text" name="id" placeholder="ID" class="findname" autofocus="autofocus">
			이름<br>
			<input type="text" name="name" placeholder="이름" autofocus="autofocus">
			생년월일<br>
			<input type="date" name="birth" required><br>			
			<input type="submit" value="회원정보 확인"> 
		</form>
	</div>
<script type="text/javascript">

</script>
	
</body>
</html>