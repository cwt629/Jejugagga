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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="${root}/res/board_free/board_free.css">
    <link rel="stylesheet" type="text/css" href="${root}/res/board_page/board_page.css">
</head>
<body>

<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>자유게시판</h3>
        </div>
    </div>
    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">자유게시판 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="board_free_btn board_free_btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="All-board-table board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-date">수정일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <th>
                        <a href="${root}">자유게시판1</a>
                        <p></p>
                    </th>
                    <td>2023.12.07</td>
                </tr>
                <tr>
                    <td>2</td>
                    <th><a href="${root}">자유글 2</a></th>
                    <td>2023.12.07</td>
                </tr>

                <tr>
                    <td>3</td>
                    <th><a href="${root}">자유게시판3</a></th>
                    <td>2023.12.07</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="pagination-container wow zoomIn mar-b-1x" data-wow-duration="0.5s">
        <div class="pagination-container wow zoomIn mar-b-1x" data-wow-duration="0.5s">
            <ul class="pagination">
                <li class="pagination-item--wide first"> <a class="pagination-link--wide first" href="#">Previous</a> </li>
                <li class="pagination-item">  <a class="pagination-link" href="#">1</a> </li>
                <li class="pagination-item"> <a class="pagination-link" href="#">2</a> </li>
                <li class="pagination-item is-active"> <a class="pagination-link" href="#">3</a> </li>
                <li class="pagination-item"> <a class="pagination-link" href="#">4</a> </li>
                <li class="pagination-item"> <a class="pagination-link" href="#">5</a> </li>
                <li class="pagination-item--wide last"> <a class="pagination-link--wide last" href="#">Next</a> </li>
            </ul>

    </div>
</section>

</body>
</html>