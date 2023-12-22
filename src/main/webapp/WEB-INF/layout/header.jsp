<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap"
      rel="stylesheet">
<c:set var="root" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>menubar</title>
    <link rel="stylesheet" type="text/css" href="${root}/res/header_styles/header_menu_style.css">
    <style>
        html {

            box-sizing: border-box;
            --bgColorMenu: white;
            --duration: .7s;
        }

        html *,
        html *::before,
        html *::after {

            box-sizing: inherit;

        }

        .menu {
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            /* Works well with 100% width  */
            width: 32.05em;
            font-size: 1.5em;
            padding: 0 2.85em;
            position: relative;
            align-items: center;
            justify-content: center;
            -webkit-tap-highlight-color: transparent;
            transition: background-color var(--duration);
            border-radius: 20px;
            background-color: var(--bgColorMenu);
            height: 50px;
        }

        .text-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 15px;
            font-family: Orbit;
            font-size: 23px;
        }

        .menu__item {
            all: unset;
            flex-grow: 1;
            z-index: 100;
            display: flex;
            cursor: pointer;
            position: relative;
            border-radius: 50%;
            align-items: center;
            will-change: transform;
            justify-content: center;
            padding: 0.55em 0 0.85em;
            transition: transform var(--timeOut, var(--duration));
            white-space: nowrap;
        }

        .menu__item::before {
            content: "";
            z-index: -1;
            width: 4.2em;
            height: 4.2em;
            border-radius: 50%;
            position: absolute;
            transform: scale(0);
            transition: background-color var(--duration), transform var(--duration);

        }


        .menu__item.active {

            transform: translate3d(0, -.8em, 0);

        }

        .menu__item.active::before {

            transform: scale(1);
            background-color: var(--bgColorItem);

        }

        .icon {

            width: 0.6em;
            height: 2.6em;
            stroke: white;
            fill: transparent;
            stroke-width: 1pt;
            stroke-miterlimit: 10;
            stroke-linecap: round;
            stroke-linejoin: round;
            stroke-dasharray: 400;

        }

        .menu__item.active .icon {

            animation: strok 1.5s reverse;

        }

        @keyframes strok {

            100% {

                stroke-dashoffset: 400;

            }

        }

        .menu__border {
            left: 0;
            bottom: 99%;
            width: 10.9em;
            height: 2.4em;
            position: absolute;
            clip-path: url(#menu);
            will-change: transform;
            background-color: var(--bgColorMenu);
            transition: transform var(--timeOut, var(--duration));
        }

        .svg-container {

            width: 0;
            height: 0;
        }


        @media screen and (max-width: 50em) {
            .menu {
                font-size: .8em;
            }
        }
    </style>
</head>
<body>

<header>
    <nav class="header-menu-bar">
        <a href="${root}/main">
            <img src="${root}/res/photo/jejuhome.png" class="mainPage-img" alt="메인 페이지">
        </a>
        <ul class="ul-menu-bar" style="margin-top: 0;">
            <menu class="menu">

                <button class="menu__item" style="--bgColorItem: #FFC47E;"
                onclick="location.href = '${root}/tour/list'">
                    <div class="text-container">
                        <span style="color: black; text-decoration: none;">여행정보</span>
                    </div>
                    <svg class="icon" viewBox="0 0 24 24">

                    </svg>
                </button>

                <button class="menu__item" style="--bgColorItem: #F6D6D6;"
                onclick="location.href = '${root}/course/list'">
                    <div class="text-container">
                        <span style="color: black; text-decoration: none;">추천코스</span>
                    </div>
                    <svg class="icon" viewBox="0 0 24 24">

                    </svg>
                </button>

                <button class="menu__item" style="--bgColorItem: #7BD3EA;"
                onclick="location.href = '${root}/community/nav'">
                    <div class="text-container">
                        <span style="color: black; text-decoration: none;">커뮤니티</span>
                    </div>
                    <svg class="icon" viewBox="0 0 24 24">
                </button>
                
                <c:if test="${sessionScope.loginok==null }">
                	<button class="menu__item" style="--bgColorItem:#DF826C;"
                	onclick="location.href = '${root}/member/login'">
                    	<div class="text-container">
                    		<li class="li-menu-bar"><span style="color: black; text-decoration: none;">비회원</span></li>
                        </div>
	                    <svg class="icon" viewBox="0 0 24 24">
	                    </svg>
                    </button>
                </c:if>
                <c:if test="${sessionScope.loginok!=null}">
                	<c:choose>
                		<c:when test="${sessionScope.loginok == 'admin' }">
	                		<button class="menu__item" style="--bgColorItem:#DF826C;"
	                	onclick="location.href = '${root}/admin/adminpage'">
		                    	<div class="text-container">
		                    		<li class="li-menu-bar"><span style="color: black; text-decoration: none;">관리자</span></li>
		                        </div>
			                    <svg class="icon" viewBox="0 0 24 24">
			                    </svg>
	                    	</button>
                		</c:when>
                		<c:otherwise>
                			<button class="menu__item" style="--bgColorItem:#DF826C;"
	                	onclick="location.href = '${root}/mypage/user'">
		                    	<div class="text-container">
		                    		<li class="li-menu-bar"><span style="color: black; text-decoration: none;">${sessionScope.nickname}</span></li>
		                        </div>
			                    <svg class="icon" viewBox="0 0 24 24">
			                    </svg>
	                    	</button>
                		</c:otherwise>
                	</c:choose>
                </c:if>
 				
 				<c:if test="${sessionScope.loginok==null }">
 					<button class="menu__item" style="--bgColorItem: #F5CCA0;"
 					onclick="location.href = '${root}/member/login'">
                    	<div class="text-container">
                    		<li class="li-menu-bar"><span style="color: black; text-decoration: none;">로그인</span></li>
                        </div>
                    	<svg class="icon" viewBox="0 0 24 24">
                	</button>
 				</c:if>
 				<c:if test="${sessionScope.loginok!=null }">
 					<button class="menu__item" style="--bgColorItem: #F5CCA0;"
 					onclick="location.href = '${root}/member/logout'">
                    	<div class="text-container">
                    		<li class="li-menu-bar"><span style="color: black; text-decoration: none;">로그아웃</span></li>
                        </div>
                    	<svg class="icon" viewBox="0 0 24 24">
                	</button>
 				</c:if>

                <div class="menu__border"></div>

            </menu>

            <div class="svg-container">
                <svg viewBox="0 0 202.9 45.5">
                    <clipPath id="menu" clipPathUnits="objectBoundingBox"
                              transform="scale(0.0049285362247413 0.021978021978022)">
                        <path d="M6.7,45.5c5.7,0.1,14.1-0.4,23.3-4c5.7-2.3,9.9-5,18.1-10.5c10.7-7.1,11.8-9.2,20.6-14.3c5-2.9,9.2-5.2,15.2-7
          c7.1-2.1,13.3-2.3,17.6-2.1c4.2-0.2,10.5,0.1,17.6,2.1c6.1,1.8,10.2,4.1,15.2,7c8.8,5,9.9,7.1,20.6,14.3c8.3,5.5,12.4,8.2,18.1,10.5
          c9.2,3.6,17.6,4.2,23.3,4H6.7z"/>
                    </clipPath>
                </svg>
            </div>
        </ul>
    </nav>
</header>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="${root}/res/header_styles/header.js"></script>
</body>
</html>