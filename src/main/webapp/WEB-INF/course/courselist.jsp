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
</head>
<script>
	const CURRENT_USER_CODE = "${sessionScope.usercode}";
	const SEARCH_QUERY = "${query}";
</script>
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
	<script src="../res/course/script/courselist/courselist.js" type="module"></script>
</body>
</html>