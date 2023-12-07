<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>menubar</title>
    <link rel="stylesheet" type="text/css" href="${root}/res/header_styles/header_menu_style.css">
</head>
<body>

<header>
    <nav class="header-menu-bar">
        <ul class="ul-menu-bar">
            <li><a href="${root}/main" class="main-menu-item">홈</a></li>
            <li><a href="${root}/tour/list" class="main-menu-item">여행지 정보</a></li>
            <li><a href="${root}/course/list" class="main-menu-item">추천코스</a></li>
            <li class="toggle-button">
                <a href="${root}/community/nav" class="main-menu-item">커뮤니티</a>
                <div class="dropdown">
                    <p><a href="${root}/community/inquiry/list" class="dropdown-item">1:1문의</a></p>
                    <p><a href="${root}/community/faq/list" class="dropdown-item">FAQ</a></p>
                    <p><a href="${root}/community/review/list" class="dropdown-item">후기게시판</a></p>
                    <p><a href="${root}/community/free/list" class="dropdown-item">자유게시판</a></p>
                </div>
            </li>
            <li><a href="${root}/member/login" class="main-menu-item">로그인</a></li>
            <li><a href="${root}/member/signup" class="signupbtn">Sign up</a></li>
        </ul>
    </nav>
</header>

<div style="width: 200px; position: fixed; right: -45px; top: 30px;">
	<c:if test="${sessionScope.loginok==null }">
		<button type="button" class="btn btn-success"
		style="width: 100px;" onclick="location.href='${root}/member/login'">로그인</button>
	</c:if>
	
	<c:if test="${sessionScope.loginok!=null }">
			<h5>${sessionScope.nickname}님</h5>&nbsp;&nbsp;
			<button type="button" class="btn btn-success"
			style="width: 100px;" id="btnlogout" onclick="location.href='${root}/member/logout'">로그아웃</button>
	</c:if>
</div>


</body>
</html>