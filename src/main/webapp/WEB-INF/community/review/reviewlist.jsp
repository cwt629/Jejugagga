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
   }

   body {
    margin: 0;
    padding: 0;
    font-family: "Hind", sans-serif;
    background: #fff;
    color: #4d5974;
    display: flex;
    min-height: 100vh;
   }
  
</style>
</head>
<body>
   <div class="review-container">
    <ul id="location">
     <li><a href="startPage.jsp">Home</a></li>
     <li><a href="community_main.jsp">커뮤니티</a></li>
    </ul>
   </div>
</body>
</html>