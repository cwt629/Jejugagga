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

.grid-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-wrap: wrap; /* 줄 바꿈을 허용하여 다음 행으로 넘어갈 수 있도록 설정 */
}

.grid-list li {
  flex: 0 0 calc(22% - 3%); /* flex-grow, flex-shrink, flex-basis 순서로 지정 */
  margin-right: 3%;
  margin-bottom: 10px;
  box-sizing: border-box; /* 너비와 여백을 합친 크기로 설정 */
}

.item-images {
  width: 100%;
  height: 100%;
}


.item-images img {
  width: 100%;
  height: 100%; /* 이미지의 세로 비율 유지 */
  border-radius: 10px;
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
	<div id="historyContext">
		<div class="historybox" style="text-align: left;">
			<div>
				<i class="bi bi-heart"></i>
				여행지 좋아요 목록
				<span style="float: right;" onclick="location.href='${root}/tour/list';">전체보기 ></span>
			</div>
			<hr>
			<!-- 좋아요 표시 여행지 정렬 코드 작성 필요 -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th width="350">여행지</th>
						<th width="250">사진</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tourLikes" items="${tourLikesList}">
					<tr>
						<!-- 여행지 -->
						<td>${tourLikes.title }</td>
		   			
		   			<!-- 작성일 -->
		   			<td>
		   				<img src="${tourLikes.firstimage != ''? tourLikes.firstimage : '../res/photo/noimage.png'}" style="width: 100%; height: 50%;">
		   			</td>
		  	 	</tr>		
				</c:forEach>
				</tbody>
			</table>
		</div>
		<br><br><br>
		<div class="historybox" style="text-align: left; margin-bottom: 5%;">
			<div>
				<i class="bi bi-list-check"></i>
				여행 코스 좋아요 목록
				<span style="float: right;" onclick="location.href='${root}/course/list';">전체보기 ></span>
			</div>
			<hr>
			<!-- 내 여행 코스 저장 코드 작성 필요 -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th width="350">여행 코스</th>
						<th width="250">사진</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="courseLikes" items="${courseLikesList}">
					<tr>
						<!-- 여행지 -->
						<td>${courseLikes.name }</td>
		   			
		   			<!-- 작성일 -->
						<td>
							<img src="${courseLikes.firstimage != ''? courseLikes.firstimage : '../res/photo/noimage.png'}" style="width: 100%;">
						</td>
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