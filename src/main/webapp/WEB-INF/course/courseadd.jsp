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
<link rel="stylesheet" href="../res/course/style/courseadd.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
				<!-- usercode는 hidden으로 받는다 -->
				<input type="hidden" name="usercode" value="${sessionScope.usercode}">
				<table class="courseadd_table" style="width: 1360px;">
					<tr>
						<td width="160"><b>코스 이름 *</b></td>
						<td width="1200">
							<input type="text" name="name" class="courseadd_textinput courseadd_explain" placeholder="코스 이름을 입력하세요" 
							style="width: 800px;" maxlength="100" required>
							<span>(0 / 100자)</span>
						</td>
					</tr>
					<tr>
						<td><b>여행지 *</b></td>
						<td>
							<div class="courseadd_routeinputs">
								<input type="hidden" name="route1" value="">
								<input type="hidden" name="route2" value="">
								<input type="hidden" name="route3" value="">
								<input type="hidden" name="route4" value="">
								<input type="hidden" name="route5" value="">
							</div>
							<div class="courseadd_routes">
								<!-- 여행지 코스 출력 부분 -->
							</div>
							<button type="button" class="courseadd_general_brownbtn" data-bs-toggle="modal" data-bs-target="#courseAddModal">+ 여행지 추가</button>
						</td>
					</tr>
					<tr>
						<td><b>예상 소요 시간 *</b></td>
						<td>
							<input type="text" name="spendingtime" class="courseadd_textinput courseadd_timeinput" placeholder="소요 시간" 
							style="width: 100px;" maxlength="9" required>
							<!-- 소요 시간의 단위를 넘겨받을 input -->
							<input type="hidden" name="timestandard" value="시간" id="courseadd_timestd"> 
							<button type="button" class="courseadd_timebtn courseadd_selectablebtn">일</button>
							<button type="button" class="courseadd_timebtn courseadd_selectablebtn courseadd_selected">시간</button>
							<button type="button" class="courseadd_timebtn courseadd_selectablebtn">분</button>
							<span class="courseadd_timemessage">시간은 숫자로 입력해주세요.</span>
						</td>
					</tr>
					<tr>
						<td><b>이동 거리 *</b></td>
						<td>
							<input type="text" name="distance" class="courseadd_textinput courseadd_distanceinput" placeholder="이동 거리" 
							style="width: 100px;" maxlength="9" required>
							km
							<button type="button" class="courseadd_distcalbtn">자동 계산</button>
							<span class="courseadd_distmessage">이동 거리를 직접 입력할 수 있습니다.</span>
						</td>
					</tr>
					<tr>
						<td><b>짧은 소개</b></td>
						<td>
							<textarea style="width: 80%; height: 60px;" class="courseadd_explain" maxlength="500" name="briefcontent"></textarea>
							<span>(0 / 500자)</span>
						</td>
					</tr>
					<tr>
						<td><b>상세 설명</b></td>
						<td>
							<textarea style="width: 80%; height: 200px;" class="courseadd_explain" maxlength="2000" name="longdetail"></textarea>
							<span>(0 / 2000자)</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit" class="courseadd_general_brownbtn">코스 등록하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<!-- The Modal -->
		<div class="modal fade" id="courseAddModal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">여행지 추가</h4>
		        <button type="button" class="btn-close courseadd_modalclose" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <!-- 검색창 -->
		        <div class="courseadd_search">
		        	<table class="courseadd_searchquery">
		        		<tr>
		        			<td width="100">이름</td>
		        			<td>
		        				<input type="text" id="courseadd_searchname" class="courseadd_textinput"
		        				style="width: 500px;">
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>카테고리</td>
		        			<td>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="12">관광지</button>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="14">문화시설</button>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="15">축제행사</button>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="39">음식점</button>
		        			</td>
		        		</tr>
		        	</table>
		        	<div class="courseadd_searchdiv">
		        		<button type="button" class="courseadd_general_brownbtn" id="courseadd_searchbtn">여행지 검색</button>
		        	</div>
		        </div>
		        <hr>
		        <!-- 검색 결과 출력 -->
		        <div class="courseadd_searchresultdiv">
		        	<div class="courseadd_searchmessage">이 곳에 검색 결과가 출력됩니다.</div>
		        </div>
		      </div>
		      	
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<div class="courseadd_selectedspot">
		      		선택된 여행지: 없음
		      	</div>
		        <button type="button" class="courseadd_general_brownbtn courseadd_addroute">추가</button>
		      </div>
		
		    </div>
		  </div>
		</div>
	</div>
	
	<script src="../res/course/script/courseadd/courseadd.js" type="module"></script>
</body>
</html>