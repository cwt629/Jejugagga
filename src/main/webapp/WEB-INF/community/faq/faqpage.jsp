<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${root}/res/faq/faq.css">


    <style>
        .accordion-button-img {
            height: auto;
            width: 50px;
            object-fit: cover;
            object-position: center;
            vertical-align: middle;
            margin-top: -3px;
        }

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

        .tab-masonry {
            border: 1px solid #d8d8d8;
            border-radius: 1px;
            overflow: hidden;
        }

        .mt20 {
            margin-top: 20px;
        }

        .tab-masonry ul {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -1px -1px 0;
        }

        .tab-masonry ul li {
            width: 20%;
            box-sizing: border-box;
        }

        .tab-masonry .btn-active {
            font-weight: 700;
            color: #75444A;
            background-color: #f6f6f6;
        }

        .tab-masonry .btn-ta ,#all {
            display: block;
            padding: 14px 0;
            font-size: 14px;

            text-align: center;
            border-right: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }

        a:-webkit-any-link {
            cursor: pointer;
        }

        .faq-lo-1, .faq-lo-2, .faq-lo-3 {
            padding: 0;
        }

        .faq-container {
            width: 90%;
            max-width: 1000px;
            margin: 0 auto;
            box-sizing: border-box;
            font-family: "Noto Sans KR", "Malgun Gothic", sans-serif;
            font-weight: 400;
            font-size: 14px;
            color: #555;
            letter-spacing: -.5px;
            font-family: "Hind", sans-serif;
            background: #fff;
            color: #4d5974;
        }

        #all, #A01, #A02, #A03, #A04 {
            text-decoration: none;
            color: #555;
        }

        .faq-ta-1 {
            padding: 0;
            list-style: none;
        }
    </style>
</head>

<body>
<div class="faq-container" style="margin-top: 70px">

    <ul id="location">
        <li><a href="${root}/main" class="faq-lo-1">Home</a></li>
        <li><a href="${root}/community/nav" class="faq-lo-2">커뮤니티</a></li>
        <li><a href="${root}/community/faq/list" class="faq-lo-3">자주하는 질문</a></li>
    </ul>

    <div class="tab-masonry mt20" style="margin-top: 25px">
        <ul class="faq-ta-1">
            <li>
                <a class="btn-active" id="all" href="javascript:void(0)">전체</a>
            </li>
            <li>
                <a class="btn-ta" id="A01" href="javascript:void(0)">BEST</a>
            </li>
            <li>
                <a class="btn-ta" id="A02" href="javascript:void(0)">회원/가입-수정</a>
            </li>
            <li>
                <a class="btn-ta" id="A03" href="javascript:void(0)">규정</a>
            </li>
            <li>
                <a class="btn-ta" id="A04" href="javascript:void(0)">여행</a>
            </li>
        </ul>
    </div>

    <h2 style="font-size: 45px;">FAQ</h2>
    <div class="tab-content">
        <div class="accordion">
            <div class="accordion-item">
                <button id="accordion-button-18" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">아이디를 분실했습니다.</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p> ○ 로그인 → 아이디찾기를 통해 확인이 가능합니다. </p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-19" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">비밀번호를 분실했습니다</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 로그인 → 비밀번호 찾기를 통해 확인이 가능합니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-20" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
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
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
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
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">회원정보 수정은 어떻게 하나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 로그인 → MY PAGE → 프로필 수정을 통해 변경할수 있습니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-23" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">커뮤니티 이용 규정</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p> ○ 회원가입후 24시간 이후 사용 가능합니다 <br>
                        커뮤니티에서의 심한 욕설 비방등의 표현은 제제 사유가 될수있습니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-24" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">아이디 중복 사용이 가능한가요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 하나의 계정은 여러 사람의 사용이 불가능합니다.
                        <br>위반시 제 47조 제주가까 헌법에 위반하여 과태료 3000천만원이 부과 됩니다.</p>
                </div>
            </div>

            <div class="accordion-item">
                <button id="accordion-button-25" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">요금 규정이 어떻게 되나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 제주가까의 요금은 오픈기념 무료로 진행되고 있습니다.<br>
                        하지만 커플일경우 추가요금 25만원을 지불하셔야 합니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-26" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">저작권 규정</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 저희 업체에서 제공하는 모든 정보와 이미지들은 저작권 허가를 받은 상품들입니다 마음놓고 이용하셔도 무관합니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-27" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">여행 정보는 광고인가요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p> ○ 지자체와 협업하는 어떠한 행사들도 돈을 받고 하는 광고가 명시해드립니다</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-28" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">여행 정보 추가 건의는 어디서 하나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 여행 정보 검색란에 여행 정보 추가 건의 게시판으로 이동 가능합니다.</p>
                </div>
            </div>

            <div class="accordion-item">
                <button id="accordion-button-29" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">후기 게시판 사진에 대해서</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 여행 후기에 관한 사진의 규격은 작성 홈페이지에 명시되어있습니다. <br>
                        사진은 여러장 등록가능하며 저작권에 위배되지 않습니다.</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-30" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">내가 등록한 코스정보는 어디서 확인하나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 로그인 > MyPage > 나의 코스사용내역에서 확인가능합니다</p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-31" aria-expanded="false">
                    <img src="${root}/res/photo/qnaQ4.png" alt="아이콘" class="accordion-button-img">
                    <span class="accordion-title" style="margin-left: 0px;">목적지에 가고있는 사람의 수 정보는 알수없나요?</span>
                    <span class="icon" aria-hidden="true"></span>
                </button>
                <div class="accordion-content">
                    <p>○ 현재 그러한 기능은 존재하지 않습니다. 빠른 시간내에 기능추가건의 게시판을 만들어 고객님들의 추가 요청사항을 받도록 하겠습니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    // 서버사이드의 루트 경로를 JavaScript 변수로 설정
    var rootPath = '<c:url value="/" />';
</script>

<script src="${root}/res/faq/faqjs.js"></script>
<!-- gpt code -->

</html>