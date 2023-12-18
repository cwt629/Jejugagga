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
		let navmenu = localStorage.navmenu;
		if(navmenu == null || navmenu == 'one')
			  $(".navmenu_list>a").eq(0).css("color","red");
		else if(navmenu == 'two')
			  $(".navmenu_list").eq(1).css("color","red");
		else if(navmenu == 'three')
			  $(".navmenu_list").eq(2).css("color","red");
		
		// 프로필 수정 아이콘 클릭 시 파일 업로드 버튼 실행
		$(".changephoto").click(function(){
			$("#profileUpdate").trigger("click");
		});
		
		// 사진 업로드
		$("#profileUpdate").change(function(){		
			let formData = new FormData();
			formData.append("upload",$("#profileUpdate")[0].files[0]);
			
			$.ajax({
				type: "post",
				dataType: "json",
				url: "${root}/mypage/photochange",
				data: formData,
				processData: false,
				contentType: false,
				success: function(res) {
				   $("#profilePhoto").attr("src", `\${res.path}`);
				   location.reload();
			    }
			});		
		});
		
		$(".user_withdraw").click(function() {
			if (confirm("정말 탈퇴하시겠습니까?") == true) {
				
				//true는 확인버튼을 눌렀을 때 코드 작성
				console.log("완료되었습니다.");
				} else {
					alert("취소되었습니다");
					location.reload();
					}
			});
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
		<div style="position: relative;">
			<c:if test="${sessionScope.myphoto != 'no' || sessionScope.myphoto != null}">
				<img src="${sessionScope.profile_photo }"
					id="profilePhoto" onerror="this.src='${root}/res/photo/noimage.png'">
				<input type="file" id="profileUpdate" style="display: none;">
				<i class="bi bi-pencil-square changephoto"
					style="font-size: 1.5em; cursor: pointer; position: absolute; bottom: 20%; right: 20%;"></i>
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
	<div id="mypageContext">
		<div class="profilebox" style="text-align: left;">
			<div>
				<h4>기본정보</h4>
					<c:if test="${sessionScope.myphoto != 'no' || sessionScope.myphoto != null}">
						<img src="${sessionScope.profile_photo}"
							onerror="this.src='${root}/res/photo/noimage.png'"
							style="margin-right: 30px; width: 50px; height: 50px; border: 2px solid black; float: left;">
					</c:if>
				<div class="profile_text">
					<span>${sessionScope.nickname }</span>
					<span>${sessionScope.myemail }</span>
				</div>
			</div>
			<hr>
			<div>
			<i class="bi bi-phone"></i>
			핸드폰
			<br>
			<span>${sessionScope.phone }</span>
			</div>
			<hr>
			<div>
			<i class="bi bi-envelope"></i>
			이메일
			<br>
			<span>${sessionScope.myemail }</span>
			</div>		
		</div>
		<br><br><br>
		<div class="profilebox">
			<h4>부가 정보 관리</h4>
				<div>
				<i class="bi bi-gear"></i>
				<form action="../member/changepass" method="post" enctype="multipart/form-data" style="display: inline-block;">
					<input type="hidden" value="${sessionScope.id }" name="id">
					<br>
					<button type="submit" style="border: none; background-color: #EEB182; border-radius: 10px;">기본 정보 변경</button>
				</form>
				</div>
				<hr>
				<div>
				<i class="bi bi-key"></i>
				<form action="../member/changepass" method="post" enctype="multipart/form-data" style="display: inline-block;">
					<input type="hidden" value="${sessionScope.id }" name="id">
					<br>
					<button type="submit" style="border: none; background-color: #EEB182; border-radius: 10px;">비밀번호 변경</button>
				</form>
				</div>
		</div>
		<br><br><br><br>
		<button type="button" class="btn btn-warning user_withdraw">회원탈퇴</button>
	</div>
</div>
</c:if>
</body>
</html>