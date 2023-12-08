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
			<!-- dummy data -->
			
			<div class="course_content">
				<!-- dummy slide -->
				<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto1.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto2.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto3.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto4.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto5.jpg"></swiper-slide>
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
		  		<div class="course_brief">
대충 무슨 설명입니다.<br>
알아서 돌아보세요.<br>
아아아아아아아<br>
피방 ㄱ?	
		  		</div>
		  		<hr>
		  		<div class="course_summary">
		  			<figure>
		  				<img src="../res/photo/Icon_MapMarker.png">
		  				<figcaption>5개</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Journey.png">
		  				<figcaption>24km</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Timesheet.png">
		  				<figcaption>4시간</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/noimage.png">
		  				<figcaption>김동현</figcaption>
		  			</figure>
		  		</div>
			</div>
			
			<div class="course_content">
				<!-- dummy slide -->
				<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto4.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto5.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto2.jpg"></swiper-slide>
		  		</swiper-container>
		  		
		  		<!-- 좋아요 버튼 -->
		  		<div class="course_like_button">
		  			<i class="bi bi-heart"></i>
		  			<!-- <i class="bi bi-heart-fill"></i> -->
		  		</div>
		  		
		  		<!-- 조회수와 좋아요 개수 -->
		  		<div class="course_guest_info">
		  			<i class="bi bi-eye">&nbsp;612</i><br>
		  			<i class="bi bi-heart-fill">&nbsp;8</i>
		  		</div>
		  		
		  		<h4 style="text-align: center;">살며, 사랑하며, 배워서 남주냐?</h4>
		  		<div class="course_brief">
대충 무슨 설명입니다. 으아아	
		  		</div>
		  		<hr>
		  		<div class="course_summary">
		  			<figure>
		  				<img src="../res/photo/Icon_MapMarker.png">
		  				<figcaption>3개</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Journey.png">
		  				<figcaption>15km</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Timesheet.png">
		  				<figcaption>2시간</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/noimage.png">
		  				<figcaption>장원태</figcaption>
		  			</figure>
		  		</div>
			</div>
			
			<div class="course_content">
				<!-- dummy slide -->
				<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto3.jpg"></swiper-slide>
		  		</swiper-container>
		  		
		  		<!-- 좋아요 버튼 -->
		  		<div class="course_like_button">
		  			<i class="bi bi-heart"></i>
		  			<!-- <i class="bi bi-heart-fill"></i> -->
		  		</div>
		  		
		  		<!-- 조회수와 좋아요 개수 -->
		  		<div class="course_guest_info">
		  			<i class="bi bi-eye">&nbsp;85</i><br>
		  			<i class="bi bi-heart-fill">&nbsp;3</i>
		  		</div>
		  		
		  		<h4 style="text-align: center;">나를 묶고 가둔다면 뱃길따라 이백리</h4>
		  		<div class="course_brief">
버터플 야도란 새들의 고향	
		  		</div>
		  		<hr>
		  		<div class="course_summary">
		  			<figure>
		  				<img src="../res/photo/Icon_MapMarker.png">
		  				<figcaption>1개</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Journey.png">
		  				<figcaption>0km</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Timesheet.png">
		  				<figcaption>30분</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/noimage.png">
		  				<figcaption>루시퍼</figcaption>
		  			</figure>
		  		</div>
			</div>
			
			<div class="course_content">
				<!-- dummy slide -->
				<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto2.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto3.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto5.jpg"></swiper-slide>
				    <swiper-slide><img src="../res/photo/course_dummy/dummy_tourphoto4.jpg"></swiper-slide>
		  		</swiper-container>
		  		
		  		<!-- 좋아요 버튼 -->
		  		<div class="course_like_button">
		  			<i class="bi bi-heart"></i>
		  			<!-- <i class="bi bi-heart-fill"></i> -->
		  		</div>
		  		
		  		<!-- 조회수와 좋아요 개수 -->
		  		<div class="course_guest_info">
		  			<i class="bi bi-eye">&nbsp;1423</i><br>
		  			<i class="bi bi-heart-fill">&nbsp;128</i>
		  		</div>
		  		
		  		<h4 style="text-align: center;">익숙함 속 반짝임을 만나면 뭐하냐</h4>
		  		<div class="course_brief">
반짝이더라도 어느순간 빛을 잃는 것이 인생이거늘...이리도 덧없는 인생...아아아아아아아아아아아아 나는 개똥벌레 친구가 없네
		  		</div>
		  		<hr>
		  		<div class="course_summary">
		  			<figure>
		  				<img src="../res/photo/Icon_MapMarker.png">
		  				<figcaption>4개</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Journey.png">
		  				<figcaption>23km</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/Icon_Timesheet.png">
		  				<figcaption>2일</figcaption>
		  			</figure>
		  			<figure>
		  				<img src="../res/photo/noimage.png">
		  				<figcaption>설석현</figcaption>
		  			</figure>
		  		</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
</body>
</html>