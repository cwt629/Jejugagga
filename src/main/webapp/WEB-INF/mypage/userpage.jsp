<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
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
	
	#mypageBox {
		position: relative;
		height: 2000px;
	}
	
	#mypageContext {
		position: absolute;
		width: 85%;
		top: 20px;
		right: 0;
		text-align: center;
		display: flex;
		flex-direction: column;
	}
	
	#sideNav {
		text-align: center;
		position: fixed;
		top: 80px;
		width: 15%;
		height: 92%;
		background-color: #F0D0C1;
		align-items: start;
		border-top-right-radius: 50px;
		border-bottom-right-radius: 50px;
	}

	#profilePhoto {
		width: 70%;
		margin-top: 80px;
		border-radius: 60px;
	}
	
	.navmenu_line {
		border-top: 5px double darkgoldenrod;
		position: absolute;
		bottom: 120px;
		width: 80%;
	}
	
	.navmenu {
		width: 100%;
		position: absolute;
		bottom: 200px;
		left: 50%;
		transform: translate(-50%);
	}
	
	.navmenu2 {
		width: 100%;
		position: absolute;
		bottom: 40px;
		left: 10px;
		text-align: left;
	}
	
	.profilebox {
		border: 1px solid black;
		
	}
</style>
</head>
<body>
<div id="mypageBox">
	<nav class="navbar navbar-expand-lg" id="sideNav">
		<div>
			<img src="../res/photo/noimage.png" id="profilePhoto">
			<br>
			<span>${sessionScope.nickname }</span>
			<br>
			<span>${sessionScope.email }</span>
			
		</div>
		<div class="navmenu">
			<span class="navmenu_list" id="myProfile">내 프로필</span>
			<br>
			<span class="navmenu_list" id="userHistory">활동 기록</span>
			<br>
			<span class="navmenu_list" id="myCourse">나의 여행 코스</span>
		</div>
		<div class="navmenu_line"></div>
		<div class="navmenu2">
			<h5>도움말</h5>
			<h5>로그아웃</h5>
		</div>
	</nav>
	<div id="mypageContext">
		<div class="profilebox">1</div>
		<br>
		<div class="profilebox">2</div>
		<br>
		<div class="profilebox">3</div>
	</div>
</div>
</body>
</html>