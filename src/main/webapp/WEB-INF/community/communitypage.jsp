<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/res/community/community.css">
    <style>
        #location {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 8px;
            font-size: 16px;
        }

        #location li::after {
            content: '>';
            color: grey;
            margin-left: 8px;
        }

        #location li:last-child::after {
            content: '';
        }

        #location a {
            text-decoration: none;
            color: black;
        }

        #location li a {
            color: #999;
        }

        #location a:hover {
            text-decoration: underline;
        }

        .community-container {
            width: 90%;
            max-width: 1100px;
            box-sizing: border-box;
            margin: auto;
            font-family: "Hind", sans-serif;
            background: #fff;
            color: #4d5974;
            min-height: 100vh;
            padding: 0;
            background: #fff;
            color: #4d5974;
            font-family: "Noto Sans KR", "Malgun Gothic", sans-serif;
            font-weight: 400;
            font-size: 14px;
            color: #555;
            letter-spacing: -.5px;
            line-height: 22px;
            -webkit-text-size-adjust: 100%;
        }

        .inner:after {
            display: block;
            content: "";
            clear: both;
        }

        .customer-main .border-box-btn {
            margin-top: 0;
        }

        .border-box-btn .cs1 {
            position: relative;
            width: calc((100% - 48px) / 4);
            height: 238px;
            box-sizing: border-box;
            transition: all .2s ease;
        }

        .border-box-btn li .bbx-a {
            position: relative;
            display: block;
            padding: 30px;
            height: 100%;
            border: 1px solid #d8d8d8;
            border-radius: 15px;
        }

        .cs1 a, .cs2 a, .cs3 a, .cs4 a {
            text-decoration: none !important;
            color: inherit;
        }

        .border-box-btn .cs1 .tit {
            display: block;
            font-size: 16px;
            line-height: 24px;
            color: #222;
            font-weight: 500;
        }

        .icon-new {
            display: inline-block;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background-color: #75444A;
        }

        .border-box-btn li .txt {
            display: block;
            margin-top: 20px;
            font-size: 14px;
            line-height: 20px;
            color: #999;
            font-weight: 400;
        }

        #content.no-pd-bm {
            padding-bottom: 0;
        }

        #content {
            position: relative;
            padding-top:110px;
            width: 100%;
        }

        #service {
            position: absolute;
            width: 55px;
            height: 55px;
            left: 165px;
            top: 160px;
            opacity: 0.8;
        }

        #qna {
            position: absolute;
            width: 55px;
            height: 55px;
            left: 165px;
            top: 160px;
            opacity: 0.9;
        }

        #review {
            position: absolute;
            width: 55px;
            height: 55px;
            left: 165px;
            top: 160px;
            opacity: 0.9;
        }

        #notice {
            position: absolute;
            width: 55px;
            height: 55px;
            left: 165px;
            top: 160px;
            opacity: 0.9;
        }

        .com-ul {
            list-style: none;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="community-container" style="margin-top: -60px;" >
    <div class="no-pd-bm" id="content">
        <ul id="location">
            <li><a href="${root}/main">Home</a></li>
            <li><a href="${root}/community/nav">커뮤니티</a></li>
        </ul>
    </div>

    <div class="inner customer-main" style="margin-top: 15px">
        <div class="border-box-btn">
            <ul style="display: flex; gap: 7px;" class="com-ul">
                <li class="cs1">
                    <a href="${root}/community/inquiry/list" style="cursor: pointer" class="bbx-a">
                        <span class="tit">
                            1대1 문의
                            <span class="icon-new">
                                <img src="../res/photo/servicecenter.png" alt="New Icon" id="service">
                            </span>
                        </span>
                        <span class="txt">
                             1대1 고객지원 서비스를<br>제공합니다.
                        </span>
                    </a>
                </li>
                <li class="cs1">
                    <a href="${root}/community/faq/list;" class="bbx-a">
                        <span class="tit">
                            자주하는 질문
                            <span class="icon-new">
                                 <img src="../res/photo/qnaboard.png" alt="New Icon" id="qna">
                            </span>
                        </span>
                        <span class="txt">
                             이용에 궁금한 사항이 있다면<br> 자주하는 질문에서 <br> 확인해 보세요.
                        </span>
                    </a>
                </li>
                <li class="cs1">
                    <a href="${root}/community/review/list;" class="bbx-a">
                        <span class="tit">
                            후기게시판
                            <span class="icon-new">
                               <img src="../res/photo/reviewboard.png" alt="New Icon" id="review">
                            </span>
                        </span>
                        <span class="txt">
                             다른 사람들의 후기가 궁금하다면 후기게시판에서 <br> 내용을 확인해 보세요.
                        </span>
                    </a>
                </li>
                <li class="cs1">
                    <a href="${root}/community/free/list;" class="bbx-a">
                        <span class="tit">
                            자유게시판
                            <span class="icon-new">
                                  <img src="../res/photo/noticeboard.png" alt="New Icon" id="notice">
                            </span>
                        </span>
                        <span class="txt">
                             다양한 정보를 쉽고 빠르게<br> 공유하고 받을수있도록 <br> 자유게시판을 이용해 보세요.
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <h2 style="font-size: 35px; padding-top: 50px">자주하는 질문 TOP 5</h2>

    <div class="tab-content" style="margin-top: 20px">
        <div class="accordion">
            <div class="accordion-item">
                <button id="accordion-button-18" aria-expanded="false">
                    <img src="../res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">여행 정보는 광고인가요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p> ○ 지자체와 협업하는 어떠한 행사들도 돈을 받고 하는 광고가 명시해드립니다. </p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-19" aria-expanded="false">
                    <img src="../res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">요금 규정이 어떻게 되나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 제주가까의 요금은 오픈기념 무료로 진행되고 있습니다.<br>
                        하지만 커플일경우 추가요금 25만원을 지불하셔야 합니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-20" aria-expanded="false">
                    <img src="../res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">회원 탈퇴는 어떻게 하나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>회원탈퇴 유의사항을 꼭 확인하신 다음에 직접 탈퇴할 수 있습니다.<br>
                        ○ 로그인 → MY PAGE → 회원탈퇴를 통해 탈퇴 가능합니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-21" aria-expanded="false">
                    <img src="../res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">비밀번호 변경은 어떻게 하나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>회원 로그인 이후 또는 비밀번호 찾기 경로를 통해 변경할 수 있습니다.
                        단, 비밀번호를 변경할 경우 자동로그인을 이용 중이라면 로그인이 해제됩니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-22" aria-expanded="false">
                    <img src="../res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">회원정보 수정은 어떻게 하나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 로그인 → MY PAGE → 프로필 수정을 통해 변경할수 있습니다.</p>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/res/community/communityjs.js"></script>
</html>