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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="../res/course/style/courselist.css">
<link rel="stylesheet" href="../res/course/style/paging.css">
<link rel="stylesheet" href="../res/course/style/writebutton.css">

<script>
	let clickingHeart = false; // 하트를 클릭하고 처리중인지 여부(하트를 연타하는 경우에 대비)
	const FULL_HEART_BUTTON = `<i class="bi bi-heart-fill course_heart"></i>`;
	const EMPTY_HEART_BUTTON = `<i class="bi bi-heart course_heart"></i>`;
	
	const MINIMUM_COUNTER = 1;
	const MAXIMUM_COUNTER = 5;
	
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
		
		// 검색 버튼 클릭 시
		$("div.course_search_input>i.coursesearch").click(function(){
			let query = $(this).prev().val(); // 입력칸의 value
			// 유효하지 않은 검색어인 경우
			if (!isValidSearchInput(query)){
				alert("검색어는 한글, 영어, 숫자로만 입력 가능합니다.");
				return;
			}
			
			// 쿼리를 담은 딕셔너리(함수에 적용 위함)
			let dict = {};
			if (query.length > 0) dict["query"] = query;
			
			// 쿼리문
			let urlQuery = generateGetURLQuery(dict);
			location.href = "./list" + urlQuery;
		});
		
		// 화살표 버튼을 클릭하고 있는 동안에 대한 이벤트
		$("i.course_counter_down").on("mousedown", function(){
			$(this).removeClass("bi-caret-down-square");
			$(this).addClass("bi-caret-down-square-fill");
		}).on("mouseup", function(){
			$(this).removeClass("bi-caret-down-square-fill");
			$(this).addClass("bi-caret-down-square");
			// 마우스가 올라갈 때 1 감소시키기
			decrementCounter("div.course_counter_num", MINIMUM_COUNTER);
		});
		
		$("i.course_counter_up").on("mousedown", function(){
			$(this).removeClass("bi-caret-up-square");
			$(this).addClass("bi-caret-up-square-fill");
		}).on("mouseup", function(){
			$(this).removeClass("bi-caret-up-square-fill");
			$(this).addClass("bi-caret-up-square");
			// 마우스가 올라갈 때 1 증가시키기
			incrementCounter("div.course_counter_num", MAXIMUM_COUNTER);
		});
		
		// 버튼들에 대한 클릭 이벤트
		$("#course_filterModal button.course_general_graybtn").click(function(){
			// 다른 sibling들의 selected 클래스를 지워준다
			$(this).siblings("button.course_general_graybtn").removeClass("course_selected");
			// 이 버튼에 selected 클래스를 toggle시킨다(필터링 취소 대비)
			$(this).toggleClass("course_selected");
		});
		
		// 필터에서 검색 기준 적용 버튼 클릭 이벤트
		$("#course_filterModal button.course_filter_submit").click(function(){
			let dict = {};
			// 검색어가 있었다면, 그 검색어를 기준으로 같이 검색한다
			let searchQuery = "${query}";
			if (searchQuery.length > 0) dict["query"] = searchQuery;
			// 카운터 정보
			let count = $("div.course_counter_num").text();
			let numStd = $("button.course_numstd.course_selected").text();
			if (numStd.length > 0){
				// 카운터 검색 기준(이상/이하)이 있으면 카운터도 같이 넘겨준다
				dict["count"] = count;
				dict["numstd"] = numStd;
			}
			// 정렬 기준
			let sortStd = $("button.course_sortstd.course_selected").text();
			if (sortStd.length > 0) dict["sortstd"] = sortStd;
			
			// 쿼리문 작성
			let urlQuery = generateGetURLQuery(dict);
			
			// 검색 컨트롤러 이동
			location.href = "./list" + urlQuery;
		});
		
		// 필터에서 "전체 출력" 버튼 클릭 이벤트
		$("button.course_filter_reset").click(function(){
			location.href = "./list"; // 모든 쿼리를 초기화함
		});
		
		// 검색창에서 엔터를 누를 때의 이벤트
		$("div.course_search_input>input[type='text']").on("keydown", function(e){
			// 엔터키의 keyCode는 13
			if (e.keyCode == 13){
				// 엔터 누르면, 검색 처리해준다
				$("i.coursesearch").trigger("click");
			}
		});
		
	}); // end of $(function())
	
	// 한글, 영어, 숫자와 띄어쓰기로만 이루어진 문자인지 판단하는 함수
	function isValidSearchInput(input){
		let regex = new RegExp('^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9 ]*$');
		return regex.test(input);
	}
	
	// 특정 선택자의 카운터값을 1 증가시키는 함수
	function incrementCounter(selector, maxNumber){
		let currentCount = parseInt($(selector).text()); // 현재 카운트
		// 이미 최대치에 도달한 경우
		if (currentCount >= maxNumber) return;
		
		// 1 증가시킨 카운터를 넘겨준다
		$(selector).text(currentCount + 1);
	}
	
	// 특정 선택자의 카운터값을 1 감소시키는 함수
	function decrementCounter(selector, minNumber){
		let currentCount = parseInt($(selector).text()); // 현재 카운트
		// 이미 최소치에 도달한 경우
		if (currentCount <= minNumber) return;
		
		// 1 감소시킨 카운터를 넘겨준다
		$(selector).text(currentCount - 1);
	}
	
	// 주어진 dictionary를 바탕으로 url 뒤에 붙는 쿼리문을 작성해주는 함수
	function generateGetURLQuery(dict){
		let queries = []; // 각 쿼리를 저장한 배열
		for (let key in dict){
			let query = key + "=" + dict[key];
			queries.push(query);
		}
		
		let result = queries.join("&"); // 쿼리들을 &로 이어붙여준다
		// 하나라도 쿼리문이 있으면 "?"를 앞에 붙여준다
		if (result.length > 0) result = "?" + result;
		
		return result;
	}
	
</script>
</head>
<body>
	<div class="course_list_app">
		
		<div class="course_list_contents">
			<div class="course_innerheader">
				<span class="course_title">추천코스(${totalCount})</span>
				<c:if test="${sessionScope.loginok != null}">
					<div class="container-write">
					<button type="button" class="course_addbtn learn-more"
					onclick="location.href = './add'">
						<span class="circle" aria-hidden="true">
            				<span class="icon arrow"></span>
        				</span>
                		<span class="button-text" style="font-family: 'Mukta', sans-serif;">add course</span>
					</button>
					</div>
				</c:if>
				<div class="course_search">
					<div class="course_search_input">
						<input type="text" placeholder="코스명으로 찾아보세요" value="${query}">
						<i class="bi bi-search coursesearch"></i>
					</div>
					<i class="bi bi-sliders coursefilter" data-bs-toggle="modal" data-bs-target="#course_filterModal"></i>
				</div>
			</div>
		
			<c:if test="${totalCount == 0}">
				<h2 style="text-align: center; width: 100%;"><br><br>검색된 코스가 없습니다.</h2>
			</c:if>
			<c:forEach var="dto" items="${courses}">
				<c:set var="photoFlag" value="0"/> <!-- 해당 코스에서 하나라도 사진이 있는지 여부 -->
				<div class="course_content" coursecode="${dto.coursecode}">
					<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true"
					style="--swiper-theme-color: honeydew;">
					    <c:forEach var="photo" items="${dto.routePhotos}">
					    	<c:if test="${photo != ''}">
					    		<c:set var="photoFlag" value="1"/> <!-- 해당 코스에서 하나라도 사진이 있음 표시 -->
					    		<swiper-slide>
					    			<img src="${photo}">
					    		</swiper-slide>
					    	</c:if>
					    </c:forEach>
					    <!-- 사진이 하나도 없었다면, 제주가까 로고를 넣어준다 -->
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
			  				<img class="course_profilephoto" src="${dto.writersPhoto == null? '../res/photo/noimage.png' : dto.writersPhoto }">
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
							<a class="pagination-link" href="./list?currentPage=${pageNum}${urlParams}">
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
	
	<!-- 필터 모달 -->
	<div class="modal fade" id="course_filterModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">
	        <b>검색 기준 선택</b>
	        </h4>
	        <c:if test="${urlParams != ''}">
	        	<button type="button" class="course_filter_reset">전체 검색</button>
	        </c:if>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <table class="table table-borderless course_filtertable">
	        	<tr>
	        		<td width="120" class="course_categoryrow"><b>여행지 개수</b></td>
	        		<td>
	        			<div class="course_spotnum_filter">
		        			<div class="course_counter">
		        				<i class="bi bi-caret-down-square course_counter_down"></i>
		        				<div class="course_counter_num">${count > 0? count : 3}</div>
		        				<i class="bi bi-caret-up-square course_counter_up"></i>
		        			</div>
		        			<button type="button" class="course_general_graybtn course_numstd
		        			${numstd == '이상'? 'course_selected' : ''}">이상</button>
		        			<button type="button" class="course_general_graybtn course_numstd
		        			${numstd == '이하'? 'course_selected' : ''}">이하</button>
		        		</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="course_categoryrow"><b>정렬 기준</b></td>
	        		<td>
	           			<button type="button" class="course_general_graybtn course_sortstd
	           			${sortstd == '조회수'? 'course_selected' : '' }">조회수</button>
	           			<button type="button" class="course_general_graybtn course_sortstd
	           			${sortstd == '좋아요'? 'course_selected' : '' }">좋아요</button>
	        		</td>
	        	</tr>
	        </table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="course_general_brownbtn course_filter_submit">검색 기준 적용</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
</body>
</html>