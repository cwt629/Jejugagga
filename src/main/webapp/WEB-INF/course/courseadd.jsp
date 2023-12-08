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
       /*
       display: flex;
       justify-content: center;
       */
   }
   
   div.courseadd_formdiv form.courseadd_form table.courseadd_table {
       margin: 35px 0px;
       width: 1800px;
   }
   
   table.courseadd_table td {
       padding: 10px;
   }
   
   form.courseadd_form input.courseadd_textinput, form.courseadd_form textarea {
       border: none;
       background-color: #d9d9d9;
   }
   
   div.courseadd_routes {
       display: flex;
       align-items: center;
   }
   
   div.courseadd_routes div.courseadd_routeplace {
       height: 200px;
       position: relative;
       top: 22px;
   }
   
   div.courseadd_routes div.courseadd_routeplace div.courseadd_routephoto {
       width: 150px;
       height: 150px;
       background-color: #d9d9d9;
       border-radius: 5px;
       
   }
   
   div.courseadd_routes div.courseadd_routeplace>h5 {
       text-align: center;
   }
   
   div.courseadd_routes div.courseadd_routeplace div.courseadd_tag {
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
   
   table.courseadd_table button.courseadd_addbtn {
       border: none;
       background-color: #bf5b4b;
       color: white;
       width: 200px;
       height: 40px;
       border-radius: 40px;
       font-size: 20px;
       margin: 15px 0px;
   }
   
   table.courseadd_table button.courseadd_timebtn {
       border: 2px solid #d9d9d9;
       background-color: transparent;
       width: 80px;
       height: 30px;
       border-radius: 30px;
   }
   
   table.courseadd_table button.courseadd_timebtn.selectedstd {
       border: 2px solid #d7897e;
   }
   
   table.courseadd_table button.courseadd_distcalbtn {
       border: 2px solid #ca8462;
       background-color: transparent;
       width: 120px;
       height: 30px;
       border-radius: 30px;
       font-weight: bold;
       margin: 0px 24px;
   }
   
   table.courseadd_table button.courseadd_submitbtn {
       border: none;
       background-color: #bf5b4b;
       color: white;
       width: 240px;
       height: 40px;
       border-radius: 40px;
       font-size: 20px;
       margin: 15px 0px;
   }
   
</style>
</head>
<script>
	$(function(){
		// 소요 시간 단위 클릭 이벤트
		$(".courseadd_timebtn").click(function(){
			$(this).siblings(".courseadd_timebtn").removeClass("selectedstd");
			$(this).addClass("selectedstd");
			// input에도 그 단위를 넣어준다
			$("#courseadd_timestd").val($(this).text());
		});
	})
</script>
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
							<input type="text" name="name" class="courseadd_textinput" placeholder="코스 이름을 입력하세요" 
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
									<div class="courseadd_tag">
										여행지
									</div>
								</div>
								<img src="../res/photo/course_icons/next_enabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
									<div class="courseadd_tag">
										문화시설
									</div>
								</div>
								<img src="../res/photo/course_icons/next_enabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
									<div class="courseadd_tag">
										축제행사
									</div>
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
							<button type="button" class="courseadd_addbtn">+ 여행지 추가</button>
						</td>
					</tr>
					<tr>
						<td><b>예상 소요 시간 *</b></td>
						<td>
							<input type="text" name="spendingtime" class="courseadd_textinput" placeholder="소요 시간" 
							style="width: 100px;" required>
							<!-- 소요 시간의 단위를 넘겨받을 input -->
							<input type="hidden" name="timestandard" value="시간" id="courseadd_timestd"> 
							<button type="button" class="courseadd_timebtn">일</button>
							<button type="button" class="courseadd_timebtn selectedstd">시간</button>
							<button type="button" class="courseadd_timebtn">분</button>
						</td>
					</tr>
					<tr>
						<td><b>이동 거리 *</b></td>
						<td>
							<input type="text" name="distance" class="courseadd_textinput" placeholder="이동 거리" 
							style="width: 100px;" required>
							km
							<button type="button" class="courseadd_distcalbtn">자동 계산</button>
							<span class="courseadd_distmessage">이동 거리를 직접 입력할 수 있습니다.</span>
						</td>
					</tr>
					<tr>
						<td><b>짧은 소개</b></td>
						<td>
							<textarea style="width: 80%; height: 60px;" name="briefcontent"></textarea>
						</td>
					</tr>
					<tr>
						<td><b>상세 설명</b></td>
						<td>
							<textarea style="width: 80%; height: 200px;" name="longdetail"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit" class="courseadd_submitbtn">코스 등록하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>