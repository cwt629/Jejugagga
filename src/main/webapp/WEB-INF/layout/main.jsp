<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
	body * {
       font-family: 'Orbit';
   }

    swiper-container {
      width: 100%;
      height: 400px;
    }

    swiper-slide {
      background-position: center;
      background-size: cover;
    }

    swiper-slide img {
      display: block;
      width: 100%;
    }
    
    .section-story {
   		color: #fff;
    	text-shadow: 1px 1px 0px rgba(24, 29, 37, 1);
    	letter-spacing: -0.04em;
    	z-index: 1;
    	position: absolute;
    	top: 150px;
    	left: 10%;
    	`
   }
  </style>
</head>
<body>
<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" space-between="30" effect="fade"
    navigation="true" style="--swiper-theme-color: honeydew;">
    <swiper-slide>
      <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201902/25/88fc5813-4fc1-4174-91cf-faa26ffdcd67.jpg" />
    </swiper-slide>
    <swiper-slide>
      <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201902/25/353cd9bb-c909-428a-8918-a2f28140daaf.jpg" />
    </swiper-slide>
    <swiper-slide>
      <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201902/25/19d45c3e-e8ee-4728-a65a-8c38f73e73f6.jpg" />
    </swiper-slide>
    <swiper-slide>
      <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201902/25/be214cf8-5a9f-44c9-833f-9d3bc7a03cde.jpg" />
    </swiper-slide>
  </swiper-container>

	<div class="section-story">
		<strong style="font-size: 30px;">당신과 함께 한 아름다운 제주를 공유해주세요!<br><br></strong>
		<span style="font-size: 20px;">
			제주가까는<br> 
			여러분과 함께 만들어가는 <br>
			여행 코스 플랫폼입니다.<br></span>

	</div>

  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

</body>
</html>