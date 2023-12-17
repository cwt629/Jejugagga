<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<h1>상세페이지</h1>
<div>
    <th>${boardFreeDto.title}</th>
    <th>${boardFreeDto.content}</th>
    <th><img src="${boardFreeDto.photo}"></th>
</div>
</body>
</html>