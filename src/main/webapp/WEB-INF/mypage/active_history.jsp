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
<c:if test="${sessionScope.loginok == null}">
	<h3>로그인을 한후 글을 써주세요</h3>
</c:if>
<c:if test="${sessionScope.loginok != null}">
<div id="mypageBox">
	<nav class="navbar navbar-expand-lg" id="sideNav">
		<div>
			<c:if test="${sessionScope.myphoto != 'no' || sessionScope.myphoto != null}">
				<img src="${sessionScope.profile_photo }"
					id="profilePhoto" onerror="this.src='${root}/res/photo/noimage.png'">
			</c:if>
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
		<div class="historybox">
			<div>
				<i class="bi bi-chat-left-text"></i>
				내가 쓴 자유게시판 글
				<span style="float: right;">전체보기 ></span>
			</div>
			<hr>
			<!-- 내부 글 목록 코드 작성 필요 -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th width="350">제목</th>
						<th width="80">작성일</th>
						<th width="100">수정일</th>
						<th width="60">조회</th>				
					</tr>
				</thead>
				<tbody>
				<c:forEach var="freeBoard" items="${freeBoardlist}">
					<tr>
						<!-- 제목 -->
						<td>${freeBoard.title }
						<c:if test="${freeBoard.photo != null}">
							<i class="bi bi-image" style="color:gray;"></i>
						</c:if>
						<c:if test="${freeBoard.photo == null}">
							&nbsp;
						</c:if>
		   			</td>
		   			
		   			<!-- 작성일 -->
		   			<td>
		   				<fmt:formatDate value="${freeBoard.registereddate}" pattern="yyyy.MM.dd."/>
		   			</td>
		   			
		   			<!-- 수정일 -->
		   			<td>
		   				<fmt:formatDate value="${freeBoard.modifieddate}" pattern="yyyy.MM.dd."/>
		   			</td>
		   			<!-- 조회수 -->
		   			<td>${freeBoard.viewcount }</td>
		  	 	</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>
		<br><br><br>
		<div class="historybox">
			<div>
				<i class="bi bi-hand-thumbs-up"></i>
				내가 쓴 후기
				<span style="float: right;">전체보기 ></span>
			</div>
			<hr>
			<!-- 내부 글 목록 코드 작성 필요 -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th width="300">제목</th>
						<th width="80">작성일</th>
						<th width="100">tourcode</th>
						<th width="100">조회</th>				
					</tr>
				</thead>
				<tbody>
				<c:forEach var="reviewBoard" items="${reviewBoardlist}">
					<tr>
						<!-- 제목 -->
						<td>${reviewBoard.title }</td>
		   			
		   			<!-- 작성일 -->
		   			<td>
		   				<fmt:formatDate value="${reviewBoard.registereddate}" pattern="yyyy.MM.dd."/>
		   			</td>
		   			
		   			<!-- tourcode -->
		   			<td>tourcode</td>
		   			
		   			<!-- 조회수 -->
		   			<td>컬럼 없음..</td>
		  	 	</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>
		<br><br><br>
		<div class="historybox" style="margin-bottom: 5%;">
			<div>
				<i class="bi bi-question-circle"></i>
				1:1 문의
				<span style="float: right;">전체보기 ></span>
			</div>
			<hr>
			<!-- 내부 글 목록 코드 작성 필요 -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th width="350">제목</th>
						<th width="100">작성일</th>
						<th width="150">답변완료/답변대기</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="inquiryBoard" items="${inquiryBoardlist}">
					<tr>
						<!-- 제목 -->
						<td>${inquiryBoard.title }</td>
		   			
		   			<!-- 작성일 -->
		   			<td>
		   				<fmt:formatDate value="${inquiryBoard.registereddate}" pattern="yyyy.MM.dd."/>
		   			</td>
		   			
		   			<!-- 답변 여부 -->
		   			<td>답변여부</td>
						
		  	 	</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</c:if>
</body>
</html>