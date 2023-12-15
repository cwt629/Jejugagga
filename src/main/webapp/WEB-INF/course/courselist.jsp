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
<link rel="stylesheet" href="../res/course/style/paging.css">
<style>
   body * {
       font-family: 'Orbit';
   }
   
   div.course_list_app {
       padding: 0 150px;
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
       font-weight: bold;
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
       display: flex;
       flex-wrap: wrap;
       place-content: center;
   }
   
   div.course_list_contents div.course_content {
       width: 570px;
       height: 570px;
       border: 2px solid #ccc;
       border-radius: 10px;
       position: relative;
       margin: 20px;
       box-sizing: border-box;
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
   
   div.course_content div.course_name {
       height: 99px;
       overflow-y: auto;
       display: flex;
       justify-content: center;
       align-items: center;
   }
   
   div.course_name>h4 {
       text-align: center;
       font-weight: bold;
   }
   
   div.course_name>h4>a {
       text-decoration: none;
       color: black;
   }
   
   div.course_name>h4>a:hover {
       color: #EEB182;
   }
   
   div.course_list_contents div.course_content>div.course_brief {
       width: 100%;
       height: 120px;
       overflow: auto;
       padding: 0 30px;
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
   
   div.course_pagination {
       margin: 30px 0;
       display: flex;
       justify-content: center;
   }
</style>
<script>
	let clickingHeart = false; // 하트를 클릭하고 처리중인지 여부(하트를 연타하는 경우에 대비)
	const FULL_HEART_BUTTON = `<i class="bi bi-heart-fill course_heart"></i>`;
	const EMPTY_HEART_BUTTON = `<i class="bi bi-heart course_heart"></i>`;
	
	$(function(){
		// 하트 아이콘 클릭 시
		$(document).on("click", "div.course_content div.course_like_button", function(){
			// 이미 다른 좋아요 처리중인 경우
			if (clickingHeart) {
				alert("다른 좋아요 기능 처리중입니다. 잠시 후 시도해주세요.");
				return;
			}
			
			// 하트가 되어있는지 확인
			let heartFilled = $(this).children("i.course_heart").hasClass("bi-heart-fill");
			
			clickingHeart = true;
			let coursecode = $(this).parents("div.course_content").attr("coursecode"); // 클릭한 코스의 아이디
			let currentButton = $(this); // 현재 버튼 요소
			let likesInfoToUpdate = $(this).siblings("div.course_guest_info").children("i.course_totalLikes"); // 클릭한 코스의 총 좋아요 수 부분
			
			// 1. 하트가 이미 되어있는 경우: 좋아요 취소
			if (heartFilled) {
				$.ajax({
					type: "post",
					dataType: "json",
					url: "./like/remove",
					data: {
						"coursecode": coursecode,
						"usercode": "${sessionScope.usercode}"
					},
					success: function(res){
						currentButton.html(EMPTY_HEART_BUTTON);
						// 이 코스에 대한 좋아요 수 갱신
						likesInfoToUpdate.html(`&nbsp;\${res.totalLikes}`);
						
						// 플래그 원상 복구
						clickingHeart = false;
					}
				});
			}
			// 2. 하트가 되어있지 않은 경우: 좋아요 추가
			else {
				$.ajax({
					type: "post",
					dataType: "json",
					url: "./like/grant",
					data: {
						"coursecode": coursecode,
						"usercode": "${sessionScope.usercode}"
					},
					success: function(res){
						currentButton.html(FULL_HEART_BUTTON);
						// 이 코스에 대한 좋아요 수 갱신
						likesInfoToUpdate.html(`&nbsp;\${res.totalLikes}`);
						
						// 플래그 원상 복구
						clickingHeart = false;
					}
				});
			}
		});
	}); // end of $(function())
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
				<c:set var="photoFlag" value="0"/> <!-- 해당 코스에서 하나라도 사진이 있는지 여부 -->
				<div class="course_content" coursecode="${dto.coursecode}">
					<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
					    <c:forEach var="photo" items="${dto.routePhotos}">
					    	<c:if test="${photo != ''}">
					    		<c:set var="photoFlag" value="1"/> <!-- 해당 코스에서 하나라도 사진이 있음 표시 -->
					    		<swiper-slide>
					    			<img src="${photo}">
					    		</swiper-slide>
					    	</c:if>
					    </c:forEach>
					    <!-- 사진이 하나도 없었다면, noimage를 넣어준다 -->
					    <c:if test="${photoFlag == 0}">
					    	<swiper-slide>
					    		<img src="../res/photo/course_image/homeicon_incourse.png">
					    	</swiper-slide>
					    </c:if>
			  		</swiper-container>
			  		
			  		<!-- 좋아요 버튼 -->
			  		<c:if test="${sessionScope.loginok != null}">
				  		<div class="course_like_button" title="좋아요 버튼">
				  			<c:if test="${dto.likedByCurrentUser}">
				  				<i class="bi bi-heart-fill course_heart"></i>
				  			</c:if>
				  			<c:if test="${!dto.likedByCurrentUser}">
				  				<i class="bi bi-heart course_heart"></i>
				  			</c:if>
				  		</div>
			  		</c:if>
			  		
			  		<!-- 조회수와 좋아요 개수 -->
			  		<div class="course_guest_info">
			  			<i class="bi bi-eye" title="조회수">&nbsp;${dto.readcount}</i><br>
			  			<i class="bi bi-heart-fill course_totalLikes" title="좋아요">&nbsp;${dto.totalLikes}</i>
			  		</div>
			  		<div class="course_name">
			  			<h4>
			  				<a href="./detail?coursecode=${dto.coursecode}">${dto.name}</a>
			  			</h4>
			  		</div>
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
			  				<figcaption>
			  					<!-- 거리는 최대 소수점 첫째자리까지만 출력 -->
			  					<fmt:formatNumber value="${dto.distance}" maxFractionDigits="1"/>
			  					km
			  				</figcaption>
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
		
		<!-- pagination -->
		<div class="pagination-container wow zoomIn mar-b-1x course_pagination" data-wow-duration="0.5s">

			<ul class="pagination">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${startPage > 1}">
					<li class="pagination-item first"> <a class="pagination-link first" href="./list?currentPage=${startPage - 1}">Previous</a> </li>
				</c:if>
				
				<!-- 페이지 번호 목록 -->
				<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
					<!-- 현재 페이지와 같은 번호 -->
					<c:if test="${pageNum == currentPage}">
						<li class="pagination-item is-active"> 
							<a class="pagination-link" href="#">
								${pageNum}
							</a> 
						</li>
					</c:if>
					<!-- 그 외 번호 -->
					<c:if test="${pageNum != currentPage}">
						<li class="pagination-item">
							<a class="pagination-link" href="./list?currentPage=${pageNum}">
								${pageNum}
							</a>
						</li>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지 버튼 -->
				<c:if test="${endPage < totalPages}">
					<li class="pagination-item last"> <a class="pagination-link last" href="./list?currentPage=${endPage + 1}">Next</a> </li>
				</c:if>
			</ul>
		
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
</body>
</html>