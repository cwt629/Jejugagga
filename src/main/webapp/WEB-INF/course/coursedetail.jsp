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
<link rel="stylesheet" href="../res/course/style/coursedetail.css">
<script>
	const CURRENT_COURSE_CODE = "${dto.coursecode}";
	let loggedIn = ${sessionScope.loginok != null};
	const CURRENT_USER_CODE = "${sessionScope.usercode}";
</script>
</head>
<body>
	<div class="coursedetail_app">
		<div class="coursedetail_header">
			<div class="coursedetail_headerbtns">
				<button type="button" class="coursedetail_prevbtn coursedetail_generalbtn"
				onclick="location.href = './list'">목록으로</button>
				<c:if test="${sessionScope.loginok != null}">
					<c:if test="${sessionScope.usercode == dto.usercode || sessionScope.loginok == 'admin' }">
						<button type="button" class="coursedetail_revisebtn coursedetail_generalbtn">코스수정</button>
						<button type="button" class="coursedetail_deletebtn coursedetail_generalbtn">코스삭제</button>
					</c:if>
				</c:if>
			</div>
			<h2>${dto.name}</h2>
			<div class="coursedetail_guest_info">
				<div>
					<i class="bi bi-eye" title="조회수">&nbsp;${dto.readcount}</i>
					<c:if test="${sessionScope.loginok != null && dto.likedByCurrentUser}">
						<i class="bi bi-heart-fill coursedetail_heart" title="클릭시 좋아요 취소">&nbsp;${dto.totalLikes}</i>
					</c:if>
					<c:if test="${sessionScope.loginok == null || !dto.likedByCurrentUser}">
						<i class="bi bi-heart coursedetail_heart" title="클릭시 좋아요">&nbsp;${dto.totalLikes}</i>
					</c:if>
			  	</div>
			</div>
			<div class="coursedetail_briefcontent">
				${dto.briefcontent}
			</div>
		</div>
		
		<hr>
		
		<div class="coursedetail_summary">
			<div>
				<div>
					<img src="../res/photo/course_icons/Icon_MapMarker.png">
					&nbsp;${dto.totalSpots}개
				</div>
			</div>
			<div>
				<div>
					<img src="../res/photo/course_icons/Icon_Journey.png">
					&nbsp;${dto.distance}km
				</div>
			</div>
			<div>
				<div>
					<img src="../res/photo/course_icons/Icon_Timesheet.png">
					&nbsp;${dto.spendingtime}${dto.timestandard}
				</div>
			</div>
			<div>
				<div>
					<img class="coursedetail_profilephoto" src="${dto.writersPhoto != null? dto.writersPhoto : '../res/photo/noimage.png' }">
					&nbsp;${dto.writersNickname}
				</div>
			</div>
		</div>
		
		<div class="coursedetail_mapdiv">
			<!-- 지도가 나올 부분 -->
		</div>
		<hr>
		
		<div class="coursedetail_routeinfo">
			<h4 style="text-align: center;">코스 구성</h4>
			<br>
			<h6 style="text-align: center;">Map 버튼을 클릭하면 지도 상 위치를 확인할 수 있습니다.</h6>
			
			<div class="coursedetail_routes">
				<c:set var="spotindex" value="0"/> <!-- 각 여행지의 인덱스 -->
				<c:forEach var="tourdto" items="${dto.tourInfos}">
					<!-- 2번째 여행지부터는 앞에 화살표를 붙여준다 -->
					<c:if test="${spotindex > 0}">
						<img class="coursedetail_arrow" src="../res/photo/course_icons/next_enabled.png">
					</c:if>
					<!-- 여행지 정보 -->
					<div class="coursedetail_routeplace" data-mapx="${tourdto.mapx}" data-mapy="${tourdto.mapy}"
					data-title="${tourdto.title}" data-tourcode="${tourdto.tourcode}">
						<!-- 여행지 정보로 이동하는 버튼 -->
						<div class="coursedetail_mapsend">
							<button type="button" class="coursedetail_generalbtn coursedetail_mapsender">
								<i class="bi bi-send">Map</i>
							</button>
						</div>
						<div class="coursedetail_card" title="클릭 시 여행지 정보로 이동">
							<div class="coursedetail_routephoto">
								<img src="${tourdto.firstimage != ''? tourdto.firstimage : '../res/photo/noimage.png'}">
							</div>
							<h5>${tourdto.title}</h5>
							<div class="coursedetail_tag" contenttype="${tourdto.contenttype}">
								<!-- script에서 태그 색깔과 카테고리명을 지정해 넣어준다 -->
							</div>
						</div>
					</div>
					
					<!-- 인덱스 1 증가 -->
					<c:set var="spotindex" value="${spotindex + 1}"/>
				</c:forEach>
			</div>
		</div>
		
		<hr>
		<div class="coursedetail_explain">
			<h4 style="text-align: center;">코스 설명</h4>
			<br><br>
			<div class="coursedetail_longdetail">
				${dto.longdetail}
			</div>
		</div>
		<hr>
		<div class="coursedetail_footer">
			<button type="button" class="coursedetail_prevbtn coursedetail_generalbtn"
				onclick="location.href = './list'">목록으로</button>
			<c:if test="${sessionScope.loginok != null}">
				<c:if test="${sessionScope.usercode == dto.usercode || sessionScope.loginok == 'admin' }">
					<button type="button" class="coursedetail_revisebtn coursedetail_generalbtn">코스수정</button>
					<button type="button" class="coursedetail_deletebtn coursedetail_generalbtn">코스삭제</button>
				</c:if>
			</c:if>
		</div>
	</div>
	
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=59skrsifwh"></script>
	<script src="../res/course/script/coursedetail/coursedetail.js" type="module"></script>
	<script src="../res/course/api/map.js"></script>
</body>
</html>