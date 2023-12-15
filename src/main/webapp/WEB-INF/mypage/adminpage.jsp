<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
   body * {
       font-family: 'Orbit';
   }
   .container{
	   	display: grid;
	   	grid-template-columns : 1fr 1fr;
	   	padding: 30px;
	   	gap : 20px;
	   	grid-auto-rows : minmax(250px, auto);
	   	grid-auto-columns : minmax(150px);
   }
   
   .color1{
	   	width: 100%;
	   	height: 100%:
   }
   
   .item {
   		display: flex;
   		justify-content: center;
   		align-content: center;
   		border: 1px solid; #181818;
   		border-radius: 5%;
   }
  
</style>
</head>
<body>
<div class="container">
	<div class="item color1">회원관리<br>
	   <table class="admin_board_wrap table-border" id="user-admin">
	          <thead class="admin_boardList">
	            <th class="admin_board_head">이름</th>
	            <th class="admin_board_head">아이디</th>
	            <th class="admin_board_head">닉네임</th>
	            <th class="admin_board_head">가입일</th>
	          </thead>
	          <tbody>
	          <c:forEach var="member" items="${memberlist }">
	          <tr>
	          	<td>${member.name }</td>
	          	<td>${member.id }</td>
	          	<td>${member.nickname }</td>
	          	<td>${member.registereddate }</td>
	          </tr>
	          </c:forEach>
	          </tbody>
	    </table>
	</div>
	<div class="item color2">여행지 관리
	</div>
	<div class="item color3">코스 관리</div>
	<div class="item color4">자유게시판 관리</div>
	<div class="item color5">후기 게시판</div>
	<div class="item color1">1:1 문의</div>

</div>
</body>
</html>