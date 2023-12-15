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
   
   div.coursedetail_app {
       padding: 0 150px;
       margin-top: 30px;
   }
   
   div.coursedetail_app div.coursedetail_header {
       position: relative;
       text-align: center;
   }
   
   div.coursedetail_header div.coursedetail_briefcontent {
       margin: 20px 0;
   }
   
   button.coursedetail_generalbtn {
       color: white;
       padding: 5px;
       border: none;
   }
   
   div.coursedetail_header button.coursedetail_prevbtn {
       background-color: #ccc;
   }
   
   div.coursedetail_header div.coursedetail_headerbtns {
       position: absolute;
       top: 5px;
       left: 5px;
   }
   
   div.coursedetail_header button.coursedetail_revisebtn {
       background-color: #c8957e;
   }
   
   div.coursedetail_header button.coursedetail_deletebtn {
       background-color: #bf5b4b;
   }
   
   div.coursedetail_summary {
       display: flex;
       justify-content: space-around;
   }
   
   div.coursedetail_summary img {
       width: 68px;
       height: 68px;
   }
   
   div.coursedetail_summary>div {
       width: 20%;
       font-size: 20px;
       color: #dd6969;
       font-weight: bold;
       display: flex;
       justify-content: center;
       align-items: center;
   }
   
   div.coursedetail_map {
       border: 3px solid #cc9e89;
       width: 100%;
       height: 400px;
       margin: 30px 0;
   }
   
   div.coursedetail_routeinfo {
       /*padding: 30px;*/
   }
   
   div.coursedetail_routes {
       display: flex;
       align-items: center;
       justify-content: center;
   }
   
   div.coursedetail_routes div.coursedetail_routeplace {
       width: 150px;
       height: 250px;
       position: relative;
       top: 22px;
   }
   
   div.coursedetail_routes div.coursedetail_routeplace img {
       width: 150px;
       height: 150px;
       border-radius: 5px;
   }
   
   div.coursedetail_routes>img.coursedetail_arrow {
       position: relative;
       top: -25px;
   }
   
   div.coursedetail_routes div.coursedetail_routeplace div.coursedetail_tag {
       color: white;
       background-color: skyblue; /* 임시 */
       height: 30px;
       padding: 5px;
       display: flex;
       align-items: center;
       border-radius: 30px;
       text-align: center;
       position: absolute;
       top: 5px;
       left: 5px;
   }
   
</style>
</head>
<body>
	<div class="coursedetail_app">
		<div class="coursedetail_header">
			<div class="coursedetail_headerbtns">
				<button type="button" class="coursedetail_prevbtn coursedetail_generalbtn"
				onclick="history.back()">이전으로</button>
				<button type="button" class="coursedetail_revisebtn coursedetail_generalbtn">코스수정</button>
				<button type="button" class="coursedetail_deletebtn coursedetail_generalbtn">코스삭제</button>
			</div>
			<h2>대충 제목입니다</h2>
			<div class="coursedetail_briefcontent">
				이것은 짧은 설명입니다 짧습니다 짧아요<br>
				피방 ㄱ?
			</div>
		</div>
		
		<hr>
		
		<div class="coursedetail_summary">
			<div>
				<div>
					<img src="../res/photo/course_icons/Icon_MapMarker.png">
					&nbsp;4개
				</div>
			</div>
			<div>
				<div>
					<img src="../res/photo/course_icons/Icon_Journey.png">
					&nbsp;19km
				</div>
			</div>
			<div>
				<div>
					<img src="../res/photo/course_icons/Icon_Timesheet.png">
					&nbsp;2시간
				</div>
			</div>
			<div>
				<div>
					<img src="../res/photo/noimage.png">
					&nbsp;김동현
				</div>
			</div>
		</div>
		
		<div class="coursedetail_map">
			<h3>대충 지도 나오는 부분</h3>
		</div>
		
		<div class="coursedetail_routeinfo">
			<h4 style="text-align: center;">코스 구성</h4>
			<div class="coursedetail_routes">
				<!-- forEach로 돌려야 하는 부분 start -->
				<div class="coursedetail_routeplace">
					<div class="coursedetail_routephoto">
						<img src="../res/photo/course_dummy/dummy_tourphoto1.jpg">
					</div>
					<h5>피시방</h5>
					<div class="coursedetail_tag">
						카테고리
					</div>
				</div>
				<img class="coursedetail_arrow" src="../res/photo/course_icons/next_enabled.png">
				<div class="coursedetail_routeplace">
					<div class="coursedetail_routephoto">
						<img src="../res/photo/course_dummy/dummy_tourphoto2.jpg">
					</div>
					<h5>피시방</h5>
					<div class="coursedetail_tag">
						카테고리
					</div>
				</div>
				<!-- forEach로 돌려야 하는 부분 end -->
			</div>
		</div>
		
		<hr>
		<div class="coursedetail_explain">
			<h4 style="text-align: center;">코스 설명</h4>
			<br><br>
			<div class="coursedetail_longdetail">
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
				대충 긴 설명<br>
			</div>
		</div>
	</div>
</body>
</html>