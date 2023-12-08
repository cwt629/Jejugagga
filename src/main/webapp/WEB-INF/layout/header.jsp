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
            <li class="li-menu-bar"><a href="${root}/main" class="main-menu-item">홈</a></li>
            <li class="li-menu-bar"><a href="${root}/tour/list" class="main-menu-item">여행지 정보</a></li>
            <li class="li-menu-bar"><a href="${root}/course/list" class="main-menu-item">추천코스</a></li>
            <li class="li-menu-bar">
                <a href="${root}/community/nav" class="main-menu-item">커뮤니티</a>
            </li>
            <li class="li-menu-bar"><a href="${root}/mypage/user" class="signupbtn">마이페이지</a></li>
              <c:if test="${sessionScope.loginok==null }">
               <li class="li-menu-bar"><a href="${root}/member/login" class="main-menu-item">로그인</a></li>
            </c:if>
            <c:if test="${sessionScope.loginok!=null }"> <!-- header menu가 안밀리고 00님 환영합니다! 라고 나오게 해주세요 -->
              <li class="li-menu-bar"><a href="${root}/member/logout" class="main-menu-item">로그아웃</a></li>
              <li class="li-menu-bar"><a href="${root}/mypage/user" class="main-menu-item">${sessionScope.nickname}환영합니다!</a></li>
            </c:if>
        </ul>
    </nav>
</header>

</body>
</html>