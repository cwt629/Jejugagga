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
   
   div.courseadd_app {
       margin: 15px;
   }
   
   div.courseadd_innerheader span.courseadd_title {
       font-size: 30px;
   }
   
   div.courseadd_innerheader button.courseadd_prevbtn {
       background-color: #ccc;
       color: white;
       padding: 5px;
       border: none;
       float: right;
       margin-right: 30px;
   }
   
   div.courseadd_formdiv {
       display: flex;
       justify-content: center;
   }
   
   div.courseadd_formdiv form.courseadd_form table.courseadd_table {
       margin: 35px 0px;
       width: 1800px;
   }
   
   table.courseadd_table td {
       padding: 10px;
   }
   
   div.courseadd_formdiv form.courseadd_form input.courseadd_textinput {
       border: none;
       background-color: #eee;
   }
   
   div.courseadd_routes {
       display: flex;
       align-items: center;
   }
   
   div.courseadd_routes div.courseadd_routeplace {
       height: 200px;
   }
   
   div.courseadd_routes div.courseadd_routeplace div.courseadd_routephoto {
       width: 150px;
       height: 150px;
       background-color: #d9d9d9;
       border-radius: 5px;
   }
   
</style>
</head>
<body>
	<div class="courseadd_app">
		<div class="courseadd_innerheader">
			<span class="courseadd_title">나의 추천코스 추가</span>
			<button type="button" class="courseadd_prevbtn"
			onclick="history.back()">이전으로</button>
		</div>
		
		<div class="courseadd_formdiv">
			<form method="post" action="./addcourse" class="courseadd_form">
				<table class="courseadd_table">
					<tr>
						<td width="160"><b>코스 이름 *</b></td>
						<td>
							<input type="text" name="title" class="courseadd_textinput" placeholder="코스 이름을 입력하세요" 
							style="width: 800px;" required>
						</td>
					</tr>
					<tr>
						<td><b>여행지 *</b></td>
						<td>
							<div class="courseadd_routes">
								<!-- 1~5번 여행지 -->
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
								</div>
								<img src="../res/photo/course_icons/next_enabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
								</div>
								<img src="../res/photo/course_icons/next_enabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
								</div>
								<img src="../res/photo/course_icons/next_disabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
								</div>
								<img src="../res/photo/course_icons/next_disabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td><b>예상 소요 시간 *</b></td>
						<td>
						
						</td>
					</tr>
					<tr>
						<td><b>이동 거리 *</b></td>
						<td>
						
						</td>
					</tr>
					<tr>
						<td><b>짧은 소개</b></td>
						<td>
						
						</td>
					</tr>
					<tr>
						<td><b>상세 설명</b></td>
						<td>
						
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>