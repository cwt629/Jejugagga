<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${root}/res/board_inquiry_write/board_inquiry_write.css/">
</head>
<body>
<div class="board_wrap">
    <div class="board_title">
        <strong>문의내용</strong>
        <p></p>
        <div class="board_write">
            <form action="${root}/community/inquiry/write" method="post" enctype="multipart/form-data">
                <div class="board_write">
                    <div class="title">
                        <dl>
                            <dt>제목</dt>
                            <dd><input type="text" name="title" placeholder="제목 입력"/></dd>
                        </dl>
                    </div>
                    <div class="cont">
                    <textarea name="content" placeholder="내용 입력"></textarea>
                    </div>
                </div>
                <div class="bt_wrap">
                    <input type="submit" value="등록" class="on"/>
                    <a href="${root}/community/inquiry/list">취소</a>
                </div>
                <input type="hidden" name="usercode" value="${sessionScope.usercode}"/>
            </form>
        </div>
    </div>
</body>
</html>