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
       margin: 15px;
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
   
   div.course_list_contents {
       margin: 15px;
       display: flex;
   }
   
   div.course_list_contents div.course_content {
       width: 500px;
       height: 400px;
       border: 2px solid #ccc;
       border-radius: 10px;
       position: relative;
   }
   
   /* slide show 관련 */
   div.course_content swiper-container {
      width: 500px;
      height: 200px;
      position: relative;
      left: -2px;
      top: -2.5px;
   }

   div.course_content swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

   div.course_content swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
   }
   
   div.course_list_contents div.course_content div.course_like_button {
       width: 30px;
       height: 30px;
       display: flex;
       justify-content: center;
       align-items: center;
       cursor: pointer;
       background-color: #d9d9d9;
       opacity: 0.8;
       position: absolute;
       left: 5px;
       top: 5px;
       z-index: 1;
       border-radius: 5px;
   }
   
   div.course_list_contents div.course_content div.course_like_button i {
       font-size: 22px;
   }
   
   div.course_list_contents div.course_content div.course_like_button i.bi-heart {
       color: hotpink;
   }
   
   div.course_list_contents div.course_content div.course_guest_info {
       height: 60px;
       width: auto;
       box-sizing: border-box;
       padding: 5px 7px;
       background-color: #d9d9d9;
       border-radius: 17px;
       opacity: 0.8;
       position: absolute;
       right: 5px;
       top: 133px;
       z-index: 1;
   }
   
   div.course_list_app i.bi-heart-fill {
       color: hotpink;
   }
   
   div.course_list_contents div.course_content>pre {
       height: 64px;
       overflow: auto;
   }
   
   div.course_list_contents div.course_summary {
       display: flex;
       justify-content: center;
       align-items: center;
   }
   
</style>
</head>
<body>
	<div class="course_list_app">
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
			<div class="course_content">
				<!-- dummy slide -->
				<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
				    <swiper-slide><img src="../res/photo/dummy_tourphoto1.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/dummy_tourphoto2.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/dummy_tourphoto3.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/dummy_tourphoto4.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/dummy_tourphoto5.jpg"></swiper-slide>
		  		</swiper-container>
		  		
		  		<!-- 좋아요 버튼 -->
		  		<div class="course_like_button">
		  			<i class="bi bi-heart"></i>
		  			<!-- <i class="bi bi-heart-fill"></i> -->
		  		</div>
		  		
		  		<!-- 조회수와 좋아요 개수 -->
		  		<div class="course_guest_info">
		  			<i class="bi bi-eye">&nbsp;932</i><br>
		  			<i class="bi bi-heart-fill">&nbsp;15</i>
		  		</div>
		  		
		  		<h4 style="text-align: center;">예술감성으로 여행갔다가 피방 ㄱ?</h4>
		  		<pre>
대충 무슨 설명입니다.
알아서 돌아보세요.
아아아아아아아
피방 ㄱ?	
		  		</pre>
		  		<hr>
		  		<div class="course_summary">
		  			<div>여행지 개수</div>
		  			<div>총 거리</div>
		  			<div>총 소요시간</div>
		  			<div>작성자</div>
		  		</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
</body>
</html>