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
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
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
            height: 50px;
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
            justify-content: space-between;
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

        /* 모달 스타일링 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 1000px;
            height: 800px;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: 0;
            padding: 20px;
            border: 1px solid #888;
            width: 100%;
            height: 100%;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #modalImg {
            width: 550px;
            height: 550px;
            object-fit: cover;
        }

        .nickname-container {
            position: absolute;
            top: 30px; /* 혹은 원하는 위치 */
            left: 30px; /* 혹은 원하는 위치 */
            display: flex;
            align-items: center;
        }

        .nickname-overlay {
            margin-left: 5px; /* 아이콘과의 간격 */
        }

        .modalTitle-container {
            position: relative;
            display: flex;
            align-items: center;
        }

        #reviewModal {
            font-size: 24px;
        }

        #modalTitle {
            position: relative;
            margin-top: 25px;
        }

        .bi-person-circle {
            font-size: 30px;
        }

        #modalbibi {
            margin-top: 25px;
        }

        #modalTitle {
            margin-left: 10px;
        }

        .delete-btn {
            position: absolute;
            top: 0;
            left: 0;
            color: rgba(128, 128, 128, 0.8);
            padding: 5px;
            cursor: pointer;
            font-size: 25px;
        }
    </style>
</head>
<body>
<div class="review-container" style="margin-top:-30px; font-family: Orbit">
    <div class="no-pd-bm" id="content">
        <ul id="location">
            <li><a href="${root}/main">Home</a></li>
            <li><a href="${root}/community/nav">커뮤니티</a></li>
            <li><a href="${root}/community/review/list">후기게시판</a></li>
        </ul>
    </div>

    <div class="contents-head">
        <h2 style="font-size: 45px; color: #402F21; font-family: Orbit;">
            고객후기
        </h2>

        <div class="container-write" style="position: absolute; margin-top: -53px; margin-left: 200px"
             data-logged-in="${sessionScope.loginok == 'yes'}">
            <button class="learn-more" id="reviewButton">
        <span class="circle" aria-hidden="true">
            <span class="icon arrow"></span>
        </span>
                <span class="button-text">write a review</span>
            </button>
        </div>


        <div class="search-container" style="top: -50px; left: 680px; font-family: 'orbit';">
            <input type="text" class="search-input" placeholder="공간명으로 찾아보세요">
            <i class="fas fa-search search-icon"></i>
        </div>

        <div id="reviewModal" class="modal" style="font-family: Orbit">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="modalImage-container">
                    <img id="modalImg" src="" alt="리뷰 이미지" style="width:100%">
                    <div class="nickname-container">
                        <i class="bi bi-person-circle"></i>
                        <div id="modalNickname" class="nickname-overlay"></div>
                    </div>
                </div>
                <div class="modalTitle-container">
                    <i class="bi bi-geo-alt-fill" id="modalbibi"></i>
                    <div id="modalTitle"></div>
                </div>
                <p id="modalContent"></p>
                <div id="modalDate"></div>
            </div>
        </div>

        <div class="reviews-container" style="font-family: Orbit; ">
            <c:forEach var="review" items="${reviews}">
                <div class="review-item" onclick="openModal(this)">
                    <div class="image-container" style="width: 100%">
                        <img src="${photos[review.reviewcode]}" alt="리뷰 사진" class="reviewInputImg">
                        <c:if test="${isRootUser}">
                            <div class="delete-btn" onclick="deleteReview(${review.reviewcode}); event.stopPropagation();">X</div>
                        </c:if>
                        <div class="icon-and-nickname">
                            <i class="bi bi-person-circle"></i>
                            <h4 class="review-nickname">${nicknames[review.usercode]}</h4>
                        </div>
                    </div>
                    <div class="review-content">
                        <div class="title-container">
                            <i class="bi bi-geo-alt-fill"></i>
                            <h4 style="margin-left: 5px;">${review.title}</h4>
                        </div>
                        <p>${review.content}</p>
                        <span class="review-date">${review.registereddate}</span>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="pagination-container">
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li class="pagination-item--wide first">
                        <a href="${root}/community/review/list?page=${currentPage - 1}">Previous</a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="pagination-item ${i == currentPage ? 'is-active' : ''}">
                        <a href="${root}/community/review/list?page=${i}">${i}</a>
                    </li>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <li class="pagination-item--wide last">
                        <a href="${root}/community/review/list?page=${currentPage + 1}">Next</a>
                    </li>
                </c:if>
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

    function openModal(element) {
        var modal = document.getElementById("reviewModal");
        var modalImg = document.getElementById("modalImg");
        var modalNickname = document.getElementById("modalNickname");
        var modalTitle = document.getElementById("modalTitle");
        var modalContent = document.getElementById("modalContent");
        var modalDate = document.getElementById("modalDate");

        modalImg.src = element.querySelector(".reviewInputImg").src;
        modalNickname.innerHTML = element.querySelector(".review-nickname").innerHTML;
        modalTitle.innerHTML = element.querySelector(".title-container h4").innerHTML;
        modalContent.innerHTML = element.querySelector(".review-content p").innerHTML;
        modalDate.innerHTML = element.querySelector(".review-date").innerHTML;

        modal.style.display = "block";
        var span = document.getElementsByClassName("close")[0];
        span.onclick = function () {
            modal.style.display = "none";
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        var searchInput = document.querySelector('.search-input');

        searchInput.addEventListener('input', function() {
            filterReviews(searchInput.value);
        });
    });

    function filterReviews(query) {
        var reviews = document.querySelectorAll('.review-item');
        var paginationContainer = document.querySelector('.pagination-container');

        reviews.forEach(function(review) {
            var title = review.querySelector('.title-container h4').innerText;
            if (query === '' || title.toLowerCase().includes(query.toLowerCase())) {
                review.style.display = '';
            } else {
                review.style.display = 'none';
            }
        });

        // 검색어가 있을 때 페이징을 숨깁니다.
        if (query !== '') {
            paginationContainer.style.display = 'none';
        } else {
            // 검색어가 빈칸일 때 페이징을 다시 보여줍니다.
            paginationContainer.style.display = 'flex';
        }
    }



</script>

<c:if test="${isRootUser}">
    <script>
        function deleteReview(reviewId) {
            $.ajax({
                url: '/community/review/delete',
                type: 'POST',
                data: { reviewId: reviewId },
                success: function(response) {
                    // 삭제 성공 후 페이지 새로고침 또는 해당 리뷰 항목 제거
                    location.reload();
                },
                error: function() {
                    alert('Error deleting review.');
                }
            });
        }

        function goToPage(pageNumber) {
            window.location.href = '${root}/reviews?page=' + pageNumber;
        }
    </script>
</c:if>

</html>