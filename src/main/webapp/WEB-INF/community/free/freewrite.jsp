<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자유게시판 글쓰기</title>
</head>
<body>
<h1>자유게시판 글쓰기</h1>
<form action="${root}/community/free/save" method="post" enctype="multipart/form-data">
    <input type="hidden" name="usercode" value="${sessionScope.usercode}">
    <input type="text" name="title" placeholder="제목">
    <textarea name="content" placeholder="내용"></textarea>
    <input type="File" name="uploadFile" placeholder="사진" >
    <input type="submit" value="글쓰기">
</form>
</body>
</html>