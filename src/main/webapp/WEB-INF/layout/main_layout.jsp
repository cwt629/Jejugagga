<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="${root}/res/photo/main_icons/tangerine.ico" rel="shortcut icon" type="image/x-icon">
<!-- 아이콘 출처: https://www.flaticon.com/kr/free-icons/ -->
<title>제주가까</title>
<style>
	/*
	div.main_container div.header {
		width: 100%;
		height: 100px;
	}
	
	div.main_container div.home {
		width: 100%;
		height: auto;
	}
	*/
</style>
</head>
<body>
<div class="main_container">
	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="home">
		<tiles:insertAttribute name="home"/>
	</div>
</div>
</body>
</html>