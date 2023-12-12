<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>" />
<c:set var="current" value="<%=request.getServletPath() %>" />
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<style>
	body * {
		font-family: 'Orbit';
	}
	
	#mypageBox {
		position: relative;
		height: 100%;
		width: 100%;
	}
	
	#mypageContext {
		position: absolute;
		width: 85%;
		top: 150px;
		left: 22%;
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
		left: 42%;
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
		width: 80%;
		border-radius: 30px;
		box-shadow: 5px 5px 10px;
		padding: 30px 30px 30px 30px;
	}
	
	.navmenu_list {
		list-style: none;
	}
	
	ul.navmenu li a {
		text-decoration : none;
		color: black;
	}
	
	.navmenu_list:hover {
		cursor: pointer;
	}
	
	.profile_text {
		margin-left: 10px;
		display: flex;
		flex-direction: column;
	}
	
	.profilebox {
		text-align: left;
	}
	
	hr {
		width: 100%;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		let navmenu=localStorage.navmenu;
		if(navmenu==null || navmenu=='one')
			  $(".navmenu_list>a").eq(0).css("color","red");
		else if(navmenu=='two')
			  $(".navmenu_list").eq(1).css("color","red");
		else if(navmenu=='three')
			  $(".navmenu_list").eq(2).css("color","red");
	});
</script>
</head>
<body>
<div id="mypageBox">
	<nav class="navbar navbar-expand-lg" id="sideNav">
		<div>
			<img src="../res/photo/noimage.png" id="profilePhoto">
			<br>
			<span>${sessionScope.nickname }</span>
			<br>
			<span>${sessionScope.myemail }</span>
			
		</div>
		<ul class="navmenu">
			<li class="navmenu_list" id="myProfile"><a href="${root}/mypage/user">내 프로필</a></li>
			<li class="navmenu_list" id="userHistory"><a href="${root}/mypage/history">활동 기록</a></li>
			<li class="navmenu_list" id="myCourse"><a href="${root}/mypage/mycourse">나의 여행 코스</a></li>
		</ul>
		<script type="text/javascript">
			$(".navmenu_list>a").click(function(){
				let id=$(this).parent().attr("id");
				if(id=='myProfile')
					 localStorage.navmenu="one";
				else if(id=='userHistory')
					 localStorage.navmenu="two";
				else if(id=='myCourse')
					 localStorage.navmenu="three";
				
			});
		</script>
		<div class="navmenu_line"></div>
		<div class="navmenu2">
			<h6><a href="${root}/community/faq/list" style="color: brown;">도움말</a></h6>
			<h6><a href="${root}/member/logout" style="color: brown;">로그아웃</a></h6>
		</div>
	</nav>
	<div id="mypageContext">
		<div class="profilebox" style="text-align: left;">
			<div>
				<h4>기본정보</h4>
				<img src="../res/photo/noimage.png" style="width: 50px; height: 50px; border: 2px solid black; float: left;">
				<div class="profile_text">
					<span>${sessionScope.nickname }</span>
					<span>${sessionScope.myemail }</span>
				</div>
				<button type="button" style="float: right;  transform: translate(-100%, -50%);">수정</button>
			</div>
			<hr>
			<div>
			<i class="bi bi-phone"></i>
			핸드폰
			</div>
			<hr>
			<div>
			<i class="bi bi-envelope"></i>
			이메일
			</div>		
		</div>
		<br><br><br>
		<div class="profilebox">
			<h4>부가 정보 관리</h4>
				<div>
				<i class="bi bi-building-add"></i>
				주소
				<button type="button" style="float: right;  transform: translate(-100%, -50%);">수정</button>
				</div>
				<hr>
				<div>
				<i class="bi bi-key"></i>
				비밀번호 변경
				</div>
		</div>
		<br><br><br><br>
		<button type="button" class="btn btn-warning user_withdraw" style="width: 10%;">회원탈퇴</button>
	</div>
</div>
</body>
</html>