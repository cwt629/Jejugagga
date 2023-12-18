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
<link rel="stylesheet" href="../res/course/style/paging.css">
<style>
   body * {
       font-family: 'Orbit';
   }
   
   div.course_list_app {
       padding: 30px 150px;
   }
   
   div.course_innerheader {
       box-sizing: border-box;
       margin: 15px;
       height: 50px;
       display: flex;
       align-items: center;
       width: 73.5%;
   }
   
   div.course_innerheader span.course_title {
       font-size: 42px;
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
       position: relative;
       top: 4px;
       left: 2px;
   }
   
   div.course_innerheader div.course_search {
       margin-left: auto;
       display: flex;
       align-items: center;
       margin-top: 20px;
   }
   
   
   div.course_innerheader div.course_search div.course_search_input {
       /*border: 3px solid #cfa38f;
       width: 300px;
       height: 36px;
       border-radius: 30px;*/
       display: flex;
	   justify-content: center;
	   align-items: center;
	   background: white;
	   border-radius: 25px;
	   /* Simulate an outset border with box-shadow */
	   box-shadow:
	           0 0 0 2px #fff, /* Inner white border */
	           0 0 0 4px #ff8d73; /* Second gradient color */
	   max-width: 250px;
	   position: relative;
	   right: 0px;
   }
   
   
   div.course_innerheader div.course_search div.course_search_input>input[type="text"] {
       /*
       border: none;
       width: 230px;
       height: 30px;
       font-size: 18px;
       margin-left: 15px;
       */
       border: none;
	   outline: none;
	   font-size: 16px;
	   width: 100%;
	   padding: 8px 16px;
	   background: transparent;
   }  
   
   div.course_innerheader div.course_search div.course_search_input>input[type="text"]:focus {
       outline: none;
   }
   
   div.course_innerheader div.course_search div.course_search_input>i.coursesearch {
       cursor: pointer;
       color: #eeb182;
       margin: 5px;
       font-size: 20px;
   }
   
   div.course_innerheader div.course_search i.coursefilter {
       font-size: 32px;
       color: #eeb182;
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
      box-sizing: border-box;
      border: 2px solid #ccc;
      border-radius: 10px 10px 0 0;
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
   
   div.course_list_contents div.course_summary>figure>img.course_profilephoto {
       border-radius: 68px;
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
   
   div.course_spotnum_filter {
       display: flex;
       align-items: center;
       position: relative;
       top: -9px;
       left: -8px;
   }
   
   div.course_counter {
       width: 120px;
       display: flex;
       justify-content: center;
       align-items: center;
       position: relative;
       top: -1px;
   }
   
   div.course_counter>i {
       font-size: 30px;
       color: #d7897e;
       cursor: pointer;
   }
   
   div.course_counter>div.course_counter_num {
       width: 40px;
       height: 30px;
       box-sizing: border-box;
       border: 2px solid #d7897e;
       border-left: none;
       border-right: none;
       display: flex;
       justify-content: center;
       align-items: center;
       font-size: 22px;
       position: relative;
       top: 1px;
       margin: 0 -3px;
   }
   
   button.course_general_graybtn {
       border: 2px solid #d9d9d9;
       background-color: transparent;
       padding: 0px 20px;
       border-radius: 30px;
       font-weight: bold;
       height: 30px;
       box-sizing: border-box;
       margin: 0 5px;
   }
   
   button.course_general_graybtn.course_selected {
       border: 2px solid #d7897e;
   }
   
   button.course_general_brownbtn {
       border: none;
       background-color: #bf5b4b;
       color: white;
       width: 240px;
       height: 40px;
       border-radius: 40px;
       font-size: 20px;
       margin: 15px 0px;
   }
   
   button.course_filter_reset {
       border: 2px solid #bf5b4b;
       background-color: transparent;
       padding: 0px 20px;
       border-radius: 30px;
       font-weight: bold;
       height: 30px;
       box-sizing: border-box;
       margin: 0 5px;
       position: relative;
       left: 30px;
       top: 2px;
   }
   
</style>
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
					<button type="button" class="course_addbtn"
					onclick="location.href = './add'">코스추가</button>
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
					<swiper-container class="mySwiper course_swiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
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