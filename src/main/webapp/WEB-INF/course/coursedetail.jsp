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
   
   div.coursedetail_header div.coursedetail_guest_info {
       display: flex;
       justify-content: center;
       align-items: center;
   }
   
   div.coursedetail_header div.coursedetail_guest_info>div {
       width: 500px;
       height: 60px;
       border-radius: 60px;
       margin: 20px 0;
       font-size: 32px;
       background-color: #eee;
       opacity: 0.9;
       display: flex;
       justify-content: space-around;
       align-items: center;
   }
   
   div.coursedetail_header div.coursedetail_guest_info>div i.coursedetail_heart {
       color: hotpink;
       cursor: pointer;
   }
   
   div.coursedetail_header div.coursedetail_briefcontent {
       margin: 20px 0;
   }
   
   button.coursedetail_generalbtn {
       color: white;
       padding: 5px;
       margin: 0 10px;
       border: none;
   }
   
   div.coursedetail_header div.coursedetail_headerbtns {
       position: absolute;
       top: 5px;
       left: 5px;
       display: flex;
       justify-content: center;
       align-items: center;
   }
   
   button.coursedetail_prevbtn {
       background-color: #ccc;
   }
   
   button.coursedetail_revisebtn {
       background-color: #c8957e;
   }
   
   button.coursedetail_deletebtn {
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
   
   div.coursedetail_summary img.coursedetail_profilephoto {
       border-radius: 68px;
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
   
   div.coursedetail_mapdiv {
       width: 100%;
       height: 60vh;
       margin: 30px 0;
   }
   
   div.coursedetail_routeinfo {
       /*padding: 30px;*/
   }
   
   div.coursedetail_routes {
       height: 300px;
       display: flex;
       align-items: center;
       justify-content: center;
   }
   
   div.coursedetail_routes div.coursedetail_routeplace {
       width: 150px;
       height: 250px;
       position: relative;
       top: 22px;
       cursor: pointer;
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
   
   div.coursedetail_explain {
       margin: 30px 0;
   }
   
   div.coursedetail_footer {
       margin: 50px 0;
       display: flex;
       justify-content: center;
       align-items: center;
   }
</style>
<script>
	let clickingHeart = false; // 하트를 클릭하고 처리중인지 여부(하트를 연타하는 경우에 대비)
	
	$(function(){
		// 각 여행지에 카테고리 넣어주기
		$("div.coursedetail_tag").each(function(idx, item){
			// 카테고리명
			let category = getCategory(parseInt($(this).attr("contenttype")));
			$(this).css("background-color", "skyblue").text(category);
		})
		
		// 하트 아이콘 클릭 시
		$("div.coursedetail_guest_info i.coursedetail_heart").click(function(){
			// 이미 앞서 좋아요 처리중인 경우
			if (clickingHeart) {
				alert("좋아요 기능 처리중입니다. 잠시 후 시도해주세요.");
				return;
			}
			
			clickingHeart = true;
			let heartIconTag = $(this); // 이 하트 아이콘 태그
			let heartFilled = $(this).hasClass("bi-heart-fill");
			let coursecode = "${dto.coursecode}";
			
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
						// 꽉찬 하트를 빈 하트로 변경
						heartIconTag.removeClass("bi-heart-fill");
						heartIconTag.addClass("bi-heart");
						// 이 코스에 대한 좋아요 수 갱신
						heartIconTag.html(`&nbsp;\${res.totalLikes}`);
						heartIconTag.attr("title", "클릭시 좋아요"); // title 갱신
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
						// 빈 하트를 꽉찬 하트로 변경
						heartIconTag.removeClass("bi-heart");
						heartIconTag.addClass("bi-heart-fill");
						// 이 코스에 대한 좋아요 수 갱신
						heartIconTag.html(`&nbsp;\${res.totalLikes}`);
						heartIconTag.attr("title", "클릭시 좋아요 취소"); // title 갱신
						// 플래그 원상 복구
						clickingHeart = false;
					}
				});
			}
		})
		
		// 코스 삭제 버튼
		$("button.coursedetail_deletebtn").click(function(){
			if (!confirm("정말로 해당 코스를 삭제하시겠습니까?\n삭제된 코스는 복구할 수 없습니다.")){
				return;
			}
			
			// 삭제 진행
			location.href = "./delete?coursecode=${dto.coursecode}";
		})
		
		// 코스 수정 버튼
		$("button.coursedetail_revisebtn").click(function(){
			location.href = "./revise?coursecode=${dto.coursecode}";
		});
		
	}); // end of $(function())
	
	// contenttype을 카테고리명으로 치환하는 함수
	function getCategory(contenttype){
		return (contenttype === 12)? '관광지' :
				(contenttype === 14)? '문화시설' :
				(contenttype === 15)? '축제행사' :
				(contenttype === 39)? '음식점' : '기타';
	}
</script>
</head>
<body>
	<div class="coursedetail_app">
		<div class="coursedetail_header">
			<div class="coursedetail_headerbtns">
				<button type="button" class="coursedetail_prevbtn coursedetail_generalbtn"
				onclick="history.back()">이전으로</button>
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
					<c:if test="${dto.likedByCurrentUser}">
						<i class="bi bi-heart-fill coursedetail_heart" title="클릭시 좋아요 취소">&nbsp;${dto.totalLikes}</i>
					</c:if>
					<c:if test="${!dto.likedByCurrentUser}">
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
		
		<div class="coursedetail_routeinfo">
			<h4 style="text-align: center;">코스 구성</h4>
			<div class="coursedetail_routes">
				<c:set var="spotindex" value="0"/> <!-- 각 여행지의 인덱스 -->
				<c:forEach var="tourdto" items="${dto.tourInfos}">
					<!-- 2번째 여행지부터는 앞에 화살표를 붙여준다 -->
					<c:if test="${spotindex > 0}">
						<img class="coursedetail_arrow" src="../res/photo/course_icons/next_enabled.png">
					</c:if>
					<!-- 여행지 정보 -->
					<div class="coursedetail_routeplace" data-mapx="${tourdto.mapx}" data-mapy="${tourdto.mapy}"
					data-title="${tourdto.title}">
						<div class="coursedetail_routephoto">
							<img src="${tourdto.firstimage != ''? tourdto.firstimage : '../res/photo/noimage.png'}">
						</div>
						<h5>${tourdto.title}</h5>
						<div class="coursedetail_tag" contenttype="${tourdto.contenttype}">
							<!-- script에서 태그 색깔과 카테고리명을 지정해 넣어준다 -->
						</div>
					</div>
					<!-- 인덱스 1 증가 -->
					<c:set var="spotindex" value="${spotindex + 1}"/>
				</c:forEach>
			</div>
			<h6 style="text-align: center;">각 여행지를 클릭하면 지도 상으로 위치를 확인할 수 있습니다.</h6>
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
				onclick="history.back()">이전으로</button>
			<c:if test="${sessionScope.loginok != null}">
				<c:if test="${sessionScope.usercode == dto.usercode || sessionScope.loginok == 'admin' }">
					<button type="button" class="coursedetail_revisebtn coursedetail_generalbtn">코스수정</button>
					<button type="button" class="coursedetail_deletebtn coursedetail_generalbtn">코스삭제</button>
				</c:if>
			</c:if>
		</div>
	</div>
	
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=59skrsifwh"></script>
	<script src="../res/course/api/map.js"></script>
</body>
</html>