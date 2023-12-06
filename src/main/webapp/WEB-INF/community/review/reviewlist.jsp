<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="../res/review/reviewlist.css">
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
            color: gray;
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
            font-family: 'Orbit';
        }

        #content.no-pd-bm {
            padding-bottom: 0;
        }

        #content {
            position: relative;
            padding-top: 110px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="review-container" style="margin-top:25px;">
        <div class="no-pd-bm" id="content">
            <ul id="location">
                <li><a href="startPage.jsp">Home</a></li>
                <li><a href="community_main.jsp">커뮤니티</a></li>
                <li><a href="community_main.jsp">후기게시판</a></li>
            </ul>
        </div>

        <h2 style="font-size: 45px;">
            고객후기
        </h2>

        <div class="page-search">
            <form id="search-form" name="searchForm" method="post">
                <input type="hidden" name="app" value="10217">
                <input type="hidden" name="spacSeqValueSearchOr" class="search-field">
                <div class="search-wrap">
                    <input type="search" placeholder="공간명으로 찾아보세요" name="searchText" required="required" class="txt">
                    <button type="submit" class="btn-search">
                        <i class="fas fa-search"></i>
                        <span class="blind">검색</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>