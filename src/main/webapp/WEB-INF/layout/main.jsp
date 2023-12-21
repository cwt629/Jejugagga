<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:set var="root" value="<%=request.getContextPath()%>"/>
 <!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>fefeafesdsfsfs</title>

<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_common.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_css.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_plugin.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_style.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_fontawesome.min.css">


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
    
    .main-story {
   		color: #fff;
    	text-shadow: 1px 1px 0px rgba(24, 29, 37, 1);
    	letter-spacing: -0.04em;
    	z-index: 1;
    	position: absolute;
    	top: 150px;
    	left: 10%;
   }
   
   .swiper-container2 {
      width: 100%;
      
      padding-bottom: 50px;
    }

    .swiper-slide2 {
      background-position: center;
      background-size: cover;
      width: 300px;
      height: 300px;
    }

    .swiper-slide2 img {
      display: block;
      height: 100%;
    }
    
    .slide-title {
   	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    color: #fff;
	    font-size: 30px;
    	text-shadow: 1px 1px 0px rgba(24, 29, 37, 1);
    }
    
    .search-div {
    	
    	text-align: -webkit-center;
    }
    
    .bi-search::before {
	    font-size: 30px;
	    margin-right: 10px;
	    color: coral;
    }
    
    .search-input-size {
        font-size: 30px;
    }
    
        
  </style>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	
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

	<div class="main-story">
		<strong style="font-size: 30px;">당신과 함께 한 아름다운 제주를 공유해주세요!<br><br></strong>
		<span style="font-size: 20px;">
			제주가까는<br> 
			여러분과 함께 만들어가는 <br>
			여행 코스 플랫폼입니다.<br></span>
	</div>

<div>
	<h2 style="
    margin-top: 50px;
    margin-bottom: 20px;
    text-align-last: center;
    color: #fd7e14;
"># 어디로 여행을 떠나시나요?</h2>
</div>
	<div class="search-div">
		<div class="page-search" style="max-width: 590px;">
			<div class="search-wrap">
				<input placeholder="여행지명을 검색해보세요" class="txt search-input-size" id="word">
				<button id="search" style="border: 0px; background-color: #fff;">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</div>
	</div>
<div>
	<h2 style="
    margin-top: 50px;
    margin-bottom: 20px;
    text-align-last: center;
    color: #fd7e14;
"># 이달의 행사</h2>
</div>
 <swiper-container class="mySwiper swiper-container2" pagination="true" effect="coverflow" grab-cursor="true" centered-slides="true"
    slides-per-view="auto" coverflow-effect-rotate="50" coverflow-effect-stretch="0" coverflow-effect-depth="100"
    coverflow-effect-modifier="1" coverflow-effect-slide-shadows="true"
    style="--swiper-theme-color: #fd7e14;">
    
	<c:forEach var="dto" items="${tourDto}">    
	    <swiper-slide class="swiper-slide2">
		    <a href="/jeju/tour/content?tourcode=${dto.tourcode}">
		      <p class="slide-title">${dto.title}</p>
		      <img src="${dto.firstimage}" />
		     </a>
	    </swiper-slide>
    </c:forEach>
  </swiper-container>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>



<script>
	var swiper = document.querySelector('.swiper-container2').swiper
	
	let dtoLen = ($('.swiper-slide2').length / 2) - 1;
	
	console.log($('.swiper-slide2').length);
	console.log(dtoLen)
	
	for(var i=0; i<dtoLen; i++) {
		swiper.slideNext();
	}
	
	$(function() {
		$('#search').on('click', function() {
			location.href = '/jeju/tour/list?word=' + $('#word').val();
		});
	});
	
</script>

</body>
</html>