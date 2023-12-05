<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <title>menubar</title>
    <link rel="stylesheet" type="text/css" href="${root}/res/styles/style.css">
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="#" class="main-menu-item">홈</a></li>
            <li><a href="#" class="main-menu-item">정보</a></li>
            <li><a href="#" class="main-menu-item">추천코스</a></li>
            <li class="toggle-button">
                <a href="#" class="main-menu-item">커뮤니티</a>
                <div>
                    <p><a href="#" class="dropdown-item">1:1문의</a></p>
                    <p><a href="#" class="dropdown-item">QnA</a></p>
                    <p><a href="#" class="dropdown-item">후기게시판</a></p>
                    <p><a href="#" class="dropdown-item">자유게시판</a></p>
                </div>
            </li>
            <li><a href="#" class="main-menu-item">로그인</a></li>
            <li><a href="#" class="btn">Sign up</a></li>
        </ul>
    </nav>
</header>
</body>
</html>