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
       width: 100%;
       margin: 15px;
       display: flex;
       flex-wrap: wrap;
   }
   
   div.course_list_contents div.course_content {
       width: 570px;
       height: 450px;
       border: 2px solid #ccc;
       border-radius: 10px;
       position: relative;
       margin: 15px;
   }
   
   /* slide show 관련 */
   div.course_content swiper-container {
      width: 570px;
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
   
   div.course_list_contents div.course_content>div.course_brief {
       width: 100%;
       height: 64px;
       overflow: auto;
   }
   
   div.course_list_contents div.course_summary {
       display: flex;
       justify-content: space-around;
       align-items: center;
   }
   
   div.course_list_contents div.course_summary>figure {
       width: 20%;
       text-align: center;
   }
   
   div.course_list_contents div.course_summary>figure>img {
       width: 68px;
       height: 68px;
   }
   
   div.course_list_contents div.course_summary>figure>figcaption {
       font-size: 20px;
       color: #dd6969;
       font-weight: bold;
   }
   
</style>
<script>
	
</script>
</head>
<body>
	<div class="course_list_app">
		<div class="course_innerheader">
			<span class="course_title">추천코스</span>
			<c:if test="${sessionScope.loginok != null}">
				<button type="button" class="course_addbtn"
				onclick="location.href = './add'">코스추가</button>
			</c:if>
			<div class="course_search">
				<div class="course_search_input">
					<input type="text" placeholder="코스명으로 찾아보세요">
					<i class="bi bi-search coursesearch"></i>
				</div>
				<i class="bi bi-sliders coursefilter"></i>
			</div>
		</div>
		
		<div class="course_list_contents">
			<c:forEach var="dto" items="${courses}">
				<div class="course_content">
				<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
				    <c:forEach var="photo" items="${dto.routePhotos}">
				    	<swiper-slide>
				    		<img src="${photo == ''? '../res/photo/noimage.png' : photo}">
				    	</swiper-slide>
				    </c:forEach>
		  		</swiper-container>
		  		
		  		<!-- 좋아요 버튼 -->
		  		<c:if test="${sessionScope.loginok != null}">
			  		<div class="course_like_button">
			  			<c:if test="${dto.likedByCurrentUser}">
			  				<i class="bi bi-heart-fill"></i>
			  			</c:if>
			  			<c:if test="${!dto.likedByCurrentUser}">
			  				<i class="bi bi-heart"></i>
			  			</c:if>
			  		</div>
		  		</c:if>
		  		
		  		<!-- 조회수와 좋아요 개수 -->
		  		<div class="course_guest_info">
		  			<i class="bi bi-eye">&nbsp;${dto.readcount}</i><br>
		  			<i class="bi bi-heart-fill">&nbsp;${dto.totalLikes}</i>
		  		</div>
		  		
		  		<h4 style="text-align: center;">${dto.name}</h4>
		  		<div class="course_brief">
		  			${dto.briefcontent}
		  		</div>
		  		<hr>
		  		<div class="course_summary">
		  			<figure>
		  				<img src="../res/photo/course_icons/Icon_MapMarker.png">
		  				<figcaption>${dto.totalSpots }개</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/course_icons/Icon_Journey.png">
		  				<figcaption>${dto.distance}km</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/course_icons/Icon_Timesheet.png">
		  				<figcaption>${dto.spendingtime}${dto.timestandard}</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="${dto.writersPhoto == null? '../res/photo/noimage.png' : dto.writersPhoto }">
		  				<figcaption>${dto.writersNickname}</figcaption>
		  			</figure>
		  		</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
</body>
</html>