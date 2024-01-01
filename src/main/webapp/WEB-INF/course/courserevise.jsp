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
<link rel="stylesheet" href="../res/course/style/courserevise.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../res/course/utils/validate.js" type="module"></script>

</head>
<script>
	class CourseSpot {
		constructor(tourcode, title, contenttype, image, mapx, mapy){
			this.tourcode = tourcode;
			this.title = title;
			this.contenttype = contenttype;
			this.image = image;
			this.mapx = mapx;
			this.mapy = mapy;
		}
		
		getTourcode(){
			return this.tourcode;
		}
		
		getTitle(){
			return this.title;
		}
		
		getContenttype(){
			return this.contenttype;
		}
		
		getImage(){
			return this.image;
		}
		
		getMapx(){
			return this.mapx;
		}
		
		getMapy(){
			return this.mapy;
		}
	}
</script>
<script>
	let routes = []; // 루트에 포함되는 여행지 정보
	
	// 초기에 여행지를 넣어주기 위한 변수들
	let originalTourcode, originalTitle, originalContentType, originalImage, originalMapx, originalMapy;
</script>
<body>
	<div class="courserevise_app">
		<div class="courserevise_innerheader">
			<span class="courserevise_title">나의 추천코스 수정</span>
			<button type="button" class="courserevise_prevbtn"
			onclick="history.back()">이전으로</button>
		</div>
		
		<div class="courserevise_formdiv">
			<form method="post" action="./revisecourse" class="courserevise_form">
				<!-- coursecode와 usercode는 hidden으로 받는다 -->
				<input type="hidden" name="usercode" value="${sessionScope.usercode}">
				<input type="hidden" name="coursecode" value="${dto.coursecode}">
				<table class="courserevise_table" style="width: 1360px;">
					<tr>
						<td width="160"><b>코스 이름 *</b></td>
						<td width="1200">
							<input type="text" name="name" class="courserevise_textinput courserevise_explain" placeholder="코스 이름을 입력하세요" 
							style="width: 800px;" maxlength="100" value="${dto.name}" required>
							<span>(0 / 100자)</span>
						</td>
					</tr>
					<tr>
						<td><b>여행지 *</b></td>
						<td>
							<div class="courserevise_routeinputs">
								<input type="hidden" name="route1" value="">
								<input type="hidden" name="route2" value="">
								<input type="hidden" name="route3" value="">
								<input type="hidden" name="route4" value="">
								<input type="hidden" name="route5" value="">
							</div>
							<div class="courserevise_routes">
								<!-- 여행지 코스 출력 부분 -->
								<c:forEach var="tdto" items="${dto.tourInfos}">
									<script>
										originalTourcode = "${tdto.tourcode}";	
										originalTitle = "${tdto.title}";	
										originalContenttype = "${tdto.contenttype}";	
										originalImage = "${tdto.firstimage != ''? tdto.firstimage : '../res/photo/noimage.png'}";
										originalMapx = "${tdto.mapx}";
										originalMapy = "${tdto.mapy}";
									
										routes.push(new CourseSpot(originalTourcode, originalTitle, originalContenttype, originalImage, originalMapx, originalMapy));
									</script>
								</c:forEach>
							</div>
							<button type="button" class="courserevise_general_brownbtn" data-bs-toggle="modal" data-bs-target="#coursereviseModal">+ 여행지 추가</button>
						</td>
					</tr>
					<tr>
						<td><b>예상 소요 시간 *</b></td>
						<td>
							<input type="text" name="spendingtime" class="courserevise_textinput courserevise_timeinput" placeholder="소요 시간" 
							style="width: 100px;" maxlength="9" value="${dto.spendingtime}" required>
							<!-- 소요 시간의 단위를 넘겨받을 input -->
							<input type="hidden" name="timestandard" value="${dto.timestandard}" id="courserevise_timestd"> 
							<button type="button" class="courserevise_timebtn courserevise_selectablebtn ${dto.timestandard == '일'? 'courserevise_selected' : ''}">일</button>
							<button type="button" class="courserevise_timebtn courserevise_selectablebtn ${dto.timestandard == '시간'? 'courserevise_selected' : ''}">시간</button>
							<button type="button" class="courserevise_timebtn courserevise_selectablebtn ${dto.timestandard == '분'? 'courserevise_selected' : ''}">분</button>
							<span class="courserevise_timemessage">시간은 숫자로 입력해주세요.</span>
						</td>
					</tr>
					<tr>
						<td><b>이동 거리 *</b></td>
						<td>
							<input type="text" name="distance" class="courserevise_textinput courserevise_distanceinput" placeholder="이동 거리" 
							style="width: 100px;" maxlength="9" value="${dto.distance}" required>
							km
							<button type="button" class="courserevise_distcalbtn">자동 계산</button>
							<span class="courserevise_distmessage">이동 거리를 직접 입력할 수 있습니다.</span>
						</td>
					</tr>
					<tr>
						<td><b>짧은 소개</b></td>
						<td>
							<textarea style="width: 80%; height: 60px;" class="courserevise_explain" maxlength="500" name="briefcontent">${dto.briefcontent}</textarea>
							<span>(0 / 500자)</span>
						</td>
					</tr>
					<tr>
						<td><b>상세 설명</b></td>
						<td>
							<textarea style="width: 80%; height: 200px;" class="courserevise_explain" maxlength="2000" name="longdetail">${dto.longdetail}</textarea>
							<span>(0 / 2000자)</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit" class="courserevise_general_brownbtn">코스 수정하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<!-- The Modal -->
		<div class="modal fade" id="coursereviseModal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">여행지 추가</h4>
		        <button type="button" class="btn-close courserevise_modalclose" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <!-- 검색창 -->
		        <div class="courserevise_search">
		        	<table class="courserevise_searchquery">
		        		<tr>
		        			<td width="100">이름</td>
		        			<td>
		        				<input type="text" id="courserevise_searchname" class="courserevise_textinput"
		        				style="width: 500px;">
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>카테고리</td>
		        			<td>
		        				<button type="button" class="courserevise_searchcategory courserevise_selectablebtn" infocode="12">관광지</button>
		        				<button type="button" class="courserevise_searchcategory courserevise_selectablebtn" infocode="14">문화시설</button>
		        				<button type="button" class="courserevise_searchcategory courserevise_selectablebtn" infocode="15">축제행사</button>
		        				<button type="button" class="courserevise_searchcategory courserevise_selectablebtn" infocode="39">음식점</button>
		        			</td>
		        		</tr>
		        	</table>
		        	<div class="courserevise_searchdiv">
		        		<button type="button" class="courserevise_general_brownbtn" id="courserevise_searchbtn">여행지 검색</button>
		        	</div>
		        </div>
		        <hr>
		        <!-- 검색 결과 출력 -->
		        <div class="courserevise_searchresultdiv">
		        	<div class="courserevise_searchmessage">이 곳에 검색 결과가 출력됩니다.</div>
		        </div>
		      </div>
		      	
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<div class="courserevise_selectedspot">
		      		선택된 여행지: 없음
		      	</div>
		        <button type="button" class="courserevise_general_brownbtn courserevise_addroute">추가</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
	</div>
	
	<script src="../res/course/script/courserevise/courserevise.js" type="module"></script>
</body>
</html>