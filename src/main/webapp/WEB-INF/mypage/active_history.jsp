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

<link rel="stylesheet" type="text/css" href="${root}/res/styles/mypage_style.css">

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

<style>
	body * {
		font-family: 'Orbit';
	}
</style>

<script type="text/javascript">
	$(function(){
		let navmenu=localStorage.navmenu;
		if(navmenu==null || navmenu=='one')
			  $(".navmenu_list>a").eq(0).css("color","red");
		else if(navmenu=='two')
			  $(".navmenu_list>a").eq(1).css("color","red");
		else if(navmenu=='three')
			  $(".navmenu_list>a").eq(2).css("color","red");
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
				if (id=='myProfile')
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
	<div id="historyContext">
		<div class="historybox" style="text-align: left;">
			<div>
				<i class="bi bi-chat-left-text"></i>
				내가 쓴 자유게시판 글
				<span style="float: right;">전체보기 ></span>
			</div>
			<hr>
			<!-- 내부 글 목록 코드 작성 필요 -->
			<div class="history_innerbox" style="text-align: left;">
				<div>
				글 제목
				<span style="float: right;">작성일</span>
				</div>		
			</div>
			<!-- 내부 글 목록 코드 작성 필요 -->
		</div>
		<br><br><br>
		<div class="historybox" style="text-align: left;">
			<div>
				<i class="bi bi-hand-thumbs-up"></i>
				내가 쓴 후기
				<span style="float: right;">전체보기 ></span>
			</div>
			<hr>
			<!-- 내부 글 목록 코드 작성 필요 -->
			<div class="history_innerbox" style="text-align: left;">
				<div>
				글 제목
				<span style="float: right;">작성일</span>
				</div>		
			</div>
			<!-- 내부 글 목록 코드 작성 필요 -->
		</div>
		<br><br><br>
		<div class="historybox" style="text-align: left;">
			<div>
				<i class="bi bi-question-circle"></i>
				1:1 문의
				<span style="float: right;">전체보기 ></span>
			</div>
			<hr>
			<!-- 내부 글 목록 코드 작성 필요 -->
			<div class="history_innerbox" style="text-align: left;">
				<div>
				글 제목
				<span style="float: right;">작성일</span>
				</div>		
			</div>
			<!-- 내부 글 목록 코드 작성 필요 -->
		</div>
	</div>
</div>
</body>
</html>