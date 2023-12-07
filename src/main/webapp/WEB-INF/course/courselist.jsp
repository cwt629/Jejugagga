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
   
   div.course_innerheader {
       box-sizing: border-box;
       margin: 15px 0 0 15px;
       height: 50px;
       display: flex;
       align-items: center;
   }
   
   div.course_innerheader span.course_title {
       font-size: 30px;
       display: flex;
       justify-content: center;
       align-items: center;
   }
   
   div.course_innerheader button.course_addbtn {
       margin: 0 15px;
       color: white;
       background-color: #ab6749;
       border: none;
       padding: 5px;
   }
   
   div.course_innerheader div.course_search {
       margin-left: auto;
       margin-right: 30px;
       display: flex;
       align-items: center;
   }
   
   div.course_innerheader div.course_search div.course_search_input {
       border: 3px solid #cfa38f;
       width: 300px;
       height: 36px;
       border-radius: 30px;
   }
   
   div.course_innerheader div.course_search div.course_search_input>input[type="text"] {
       border: none;
       width: 230px;
       height: 30px;
       font-size: 18px;
       margin-left: 15px;
   }  
   
   div.course_innerheader div.course_search div.course_search_input>input[type="text"]:focus {
       outline: none;
   }
   
   div.course_innerheader div.course_search div.course_search_input>i.coursesearch {
       cursor: pointer;
       color: #cfa38f;
       margin: 5px;
       font-size: 20px;
   }
   
   div.course_innerheader div.course_search i.coursefilter {
       font-size: 30px;
       color: #cfa38f;
       margin: 0 20px;
       position: relative;
       bottom: 2px;
       cursor: pointer;
   }
   
</style>
</head>
<body>
	<div class="course_innerheader">
		<span class="course_title">추천코스</span>
		<button type="button" class="course_addbtn">코스추가</button>
		<div class="course_search">
			<div class="course_search_input">
				<input type="text" placeholder="코스명으로 찾아보세요">
				<i class="bi bi-search coursesearch"></i>
			</div>
			<i class="bi bi-sliders coursefilter"></i>
		</div>
	</div>
	<div class="course_list_contents">
		
	</div>
</body>
</html>