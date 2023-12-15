<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=G-DVMBJVCWZ8"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="${root}/res/review/reviewlist.css">
    <link rel="stylesheet" href="${root}/res/review/reviewpaging.css">
    <link rel="stylesheet" href="${root}/res/review/reviewwritebutton.css">
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

        .review-container {
            width: 90%;
            max-width: 1000px;
            box-sizing: border-box;
            margin: auto;
            font-family: "Hind", sans-serif;
            background: #fff;
            color: #4d5974;
            min-height: 70vh;
        }

        #content.no-pd-bm {
            padding-bottom: 0;
        }

        #content {
            position: relative;
            padding-top: 110px;
            width: 100%;
        }

        .reviews-container {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            justify-content: start;
        }

        .title-container {
            display: flex;
            align-items: center;
        }

        .review-item {
            flex: 0 0 22%; /* flex-grow: 0, flex-shrink: 0, flex-basis: 22% */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            border-radius: 5px;
            overflow: hidden;
        }

        .review-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .review-content {
            padding: 0.5rem;
        }

        .review-content h4 {
            margin-top: 0.5rem;
            font-size: 1rem;
        }

        .review-content p {
            font-size: 0.9rem;
        }

        .review-date {
            display: block;
            font-size: 0.8rem;
            color: #777;
        }

        .reviewInputImg {
            width: 100%;
        }

    </style>
</head>
<body>
<div class="review-container" style="margin-top:-30px;">
    <div class="no-pd-bm" id="content">
        <ul id="location">
            <li><a href="${root}/main">Home</a></li>
            <li><a href="${root}/community/nav">커뮤니티</a></li>
            <li><a href="${root}/community/review/list">후기게시판</a></li>
        </ul>
    </div>

    <div class="contents-head">
        <h2 style="font-size: 45px; font-family: Orbit">
            고객후기
        </h2>

        <div class="container-write" style="position: absolute; margin-top: -53px; margin-left: 530px"
             data-logged-in="${sessionScope.loginok == 'yes'}">
            <button class="learn-more" id="reviewButton">
        <span class="circle" aria-hidden="true">
            <span class="icon arrow"></span>
        </span>
                <span class="button-text">write a review</span>
            </button>
        </div>


        <div class="search-container" style="top: -50px; left: 750px; font-family: 'orbit';">
            <input type="text" class="search-input" placeholder="공간명으로 찾아보세요">
            <i class="fas fa-search search-icon"></i>
        </div>

        <div class="reviews-container" style="font-family: Orbit; ">
            <c:forEach var="review" items="${reviews}">
                <div class="review-item">
                    <div class="image-container" style="width: 100%">
                        <img src="${photos[review.reviewcode]}" alt="리뷰 사진" class="reviewInputImg">
                        <div class="icon-and-nickname">
                            <i class="bi bi-person-circle"></i>
                            <h4 class="review-nickname">${nicknames[review.usercode]}</h4>
                        </div>
                    </div>
                    <div class="review-content">
                        <div class="title-container">
                            <i class="bi bi-geo-alt-fill"></i>
                            <h4>${review.title}</h4>
                        </div>
                        <p>${review.content}</p>
                        <span class="review-date">${review.registereddate}</span>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="pagination-container wow zoomIn mar-b-1x" data-wow-duration="0.5s"
             style="margin-bottom: 20px">
            <ul class="pagination">
                <li class="pagination-item--wide first"><a class="pagination-link--wide first"
                                                           href="#">Previous</a>
                </li>
                <li class="pagination-item is-active"><a class="pagination-link" href="#">1</a></li>
                <li class="pagination-item"><a class="pagination-link" href="#">2</a></li>
                <li class="pagination-item"><a class="pagination-link" href="#">3</a></li>
                <li class="pagination-item"><a class="pagination-link" href="#">4</a></li>
                <li class="pagination-item"><a class="pagination-link" href="#">5</a></li>
                <li class="pagination-item--wide last"><a class="pagination-link--wide last" href="#">Next</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var reviewButton = document.getElementById('reviewButton');
        var containerWrite = document.querySelector('.container-write');

        var isLoggedIn = containerWrite.getAttribute('data-logged-in') === 'true';

        if (isLoggedIn) {
            reviewButton.addEventListener('click', function () {
                window.location.href = '${root}/community/review/write';
            });
        } else {
            reviewButton.addEventListener('click', function () {
                alert('Please log in to write a review.');
                window.location.href = '${root}/member/login';
            });
        }
    });
</script>


</html>