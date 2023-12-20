<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:set var="root" value="<%=request.getContextPath()%>"/>

 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_common.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_css.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_plugin.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_style.css">
<link rel="stylesheet" type="text/css" href="${root}/res/styles/tour_fontawesome.min.css">

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tpq2iczfgo"></script>

<style>
	body * {
       font-family: 'Orbit';
       word-break: keep-all;
   }
   
   .container a{
   		color: inherit;
		background-color: transparent;
		-webkit-text-decoration-skip: objects;
		text-decoration: none;
		
   }
   
   .container button{
   	    padding: 0;
	    border: 0;
	    background-color: transparent;
	    cursor: pointer;
   }
   
   button.tour_back {
       color: white;
	    background-color: #b7a89f;
	    border: none;
	    padding: 10px;
	    border-radius: 2px;
	    box-shadow: 3px 3px 3px;
	    position: absolute;
    	top: 30px;
    	left : 40px;
    	z-index: 1;
   }
   
</style>


</head>
<script>
	$(function() {
		
		//개요만 남기기
		$('.section-story2').hide();
		$('.section-story3').hide();
		$('.section-story4').hide();
	    
		//미니 메뉴 클릭시 화면바꾸기
		$('.tab-item').click(function() {
			$('.tab-item.active').removeClass('active');
			$(this).addClass('active');
			var tabId = $(this).attr('val'); // val 속성 값 가져오기
			$('.section-story1').hide();
			$('.section-story2').hide();
			$('.section-story3').hide();
			$('.section-story4').hide();
			
	        $('.section-story' + tabId).show();
		});
		
	});
</script>
<body>
	<div id="container" style="padding:0 250px;">
		<div id="sub_visual"
			style="background-image: linear-gradient(rgba(0, 0, 0, 0.7),
        		rgba(255, 255, 255, 0.1)), url(${tourDto.firstimage});">
			<div class="container">
				<button onclick="history.back()" class="tour_back">Back</button>
				<div class="sub-title-box">
					<h2 class="title aos-init aos-animate" data-aos="fade-up"
						data-aos-duration="180" data-aos-delay="100">${tourDto.title}</h2>
					<div class="place aos-init aos-animate" data-aos="fade-up"
						data-aos-duration="180" data-aos-delay="300">
						<c:if test="${tourDto.contenttype==12}">
							<span>관광지</span>
						</c:if>
						<c:if test="${tourDto.contenttype==14}">
							<span>문화시설</span>
						</c:if>
						<c:if test="${tourDto.contenttype==15}">
							<span>행사</span>
						</c:if>
						<c:if test="${tourDto.contenttype==39}">
							<span>음식점</span>
						</c:if>
						
					</div>
					<ul class="tag-box aos-init aos-animate" data-aos="fade-up"
						data-aos-duration="180" data-aos-delay="400">
						<c:if test="${tourDto.sigungucode==3}">
							<li><span>#서귀포시</span></li>
						</c:if>
						<c:if test="${tourDto.sigungucode==4}">
							<li><span>#제주시</span></li>
						</c:if>
					</ul>
				</div>
				
				<div class="sub-sharing">
					<button type="button" class="heart-btn">
						<!-- <i class="bi-heart"></i> <span class="number">0</span> -->
					</button>
				</div>
			</div>
		</div>
		
		<div id="contents">
			<div class="sub-content">
				<div class="container">
					<!-- 미니메뉴 -->
					<ul class="sub-tab"  style="cursor: pointer;">
						<li class="tab-item active" val="1"><a class="text-small">이야기</a></li>
						<li class="tab-item" val="2"><a class="text-small">갤러리</a></li>
						<li class="tab-item" val="3"><a class="text-small">오시는길</a></li>
						<li class="tab-item" val="4"><a class="text-small">후기</a></li>
					</ul>
					
					<!-- 개요 -->
					<div class="section-story1">
						<strong>
							<span style="font-size: 18px;">${tourDto.overview}</span>
						</strong>
					</div>
					
					<!-- 갤러리 -->
					<div class="section-story2" style="text-align: -webkit-center;">
						<strong>
							<img src="${tourDto.firstimage}" alt="등록된 사진이 없습니다.">
							
						</strong>
					</div>
					
					<!-- 오시는길 -->
					<div class="section-story3" style="text-align: -webkit-center;">
						<div style="padding-left : 30px">
							<!-- 지도 -->
							<div id="map" style="width:700px; height:400px; border:1px;">
								<script>							
								var mapOptions = {
										center : new naver.maps.LatLng(${tourDto.mapy}, ${tourDto.mapx}),
										zoom:20
								};
								var map= new naver.maps.Map('map', mapOptions);
								
								var markerOptions = {
										position : new naver.maps.LatLng(${tourDto.mapy}, ${tourDto.mapx}),
										map : map
								};
								
								var market= new naver.maps.Marker(markerOptions);
								</script>
							</div>
							
							<!-- 정보 -->
							<div id="tableContainer" class="tableContainer" style="width:700px; font-size : 20px;">
								<table border="1" cellpadding="1" cellspacing="1" class="table table-bordered">
								<thead class="fixedHeader">
								</thead>
								<tbody class="scrollContent">
								
								<!-- 공통정보 -->
								<c:if test="${tourDto.zipcode!='0'}">
									  <tr>
									    <td width="30%" style="text-align: center;">우편번호</td>
									    <td>${tourDto.zipcode}</td>
									  </tr>
								</c:if>
									  <tr>
									    <td width="30%" style="text-align: center;">주소</td>
									    <td>${tourDto.addr1}</td>
									  </tr>
							  	<c:if test="${tourDto.homepage!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">홈페이지</td>
								    	<td style="color : blue;">${tourDto.homepage}</td>
									  </tr>
								</c:if>
								
								<!-- 관광지 -->
								<c:if test="${tourDto.contenttype==12}">
									<c:if test="${tourDto.infocenter!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">문의</td>
								    	<td>${tourDto.infocenter}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.expguide!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">체험안내</td>
								    	<td>${tourDto.expguide}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.usetime!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">이용시간</td>
								    	<td>${tourDto.usetime}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.restdate!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">쉬는날</td>
								    	<td>${tourDto.restdate}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.parking!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">주차시설</td>
								    	<td>${tourDto.parking}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.chkbabycarriage!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">유모차대여</td>
								    	<td>${tourDto.chkbabycarriage}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.chkpet!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">애완동물동반</td>
								    	<td>${tourDto.chkpet}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.chkcreditcard!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">신용카드</td>
								    	<td>${tourDto.chkcreditcard}</td>
									  </tr>
									</c:if>
								</c:if>
								
								<!-- 문화시설 -->
								<c:if test="${tourDto.contenttype==14}">
								  <c:if test="${tourDto.infocenterculture!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">문의</td>
								    	<td>${tourDto.infocenterculture}</td>
									  </tr>
									</c:if><c:if test="${tourDto.usefee!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">이용요금</td>
								    	<td>${tourDto.usefee}</td>
									  </tr>
									</c:if><c:if test="${tourDto.usetimeculture!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">이용시간</td>
								    	<td>${tourDto.usetimeculture}</td>
									  </tr>
									</c:if><c:if test="${tourDto.restdateculture!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">쉬는날</td>
								    	<td>${tourDto.restdateculture}</td>
									  </tr>
									</c:if><c:if test="${tourDto.parkingculture!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">주차시설</td>
								    	<td>${tourDto.parkingculture}</td>
									  </tr>
									</c:if><c:if test="${tourDto.parkingfee!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">주차비</td>
								    	<td>${tourDto.parkingfee}</td>
									  </tr>
									</c:if><c:if test="${tourDto.chkbabycarriageculture!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">유모차대여</td>
								    	<td>${tourDto.chkbabycarriageculture}</td>
									  </tr>
									</c:if><c:if test="${tourDto.chkpetculture!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">애완동물동반</td>
								    	<td>${tourDto.chkpetculture}</td>
									  </tr>
									</c:if><c:if test="${tourDto.chkcreditcardculture!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">신용카드</td>
								    	<td>${tourDto.chkcreditcardculture}</td>
									  </tr>
									</c:if>
								</c:if>
								
								<!-- 행사 -->
								<c:if test="${tourDto.contenttype==15}">
								  <c:if test="${tourDto.eventhomepage!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">이벤트 홈페이지</td>
								    	<td>${tourDto.eventhomepage}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.sponsor1!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">주최자</td>
								    	<td>${tourDto.sponsor1}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.sponsor1tel!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">주최자 번호</td>
								    	<td>${tourDto.sponsor1tel}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.eventstartdate!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">행사 시작일</td>
								    	<td>${tourDto.eventstartdate}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.eventenddate!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">행사 종료일</td>
								    	<td>${tourDto.eventenddate}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.eventplace!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">행사장소</td>
								    	<td>${tourDto.eventplace}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.spendtimefestival!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">행사시간</td>
								    	<td>${tourDto.spendtimefestival}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.usetimefestival!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">이용요금</td>
								    	<td>${tourDto.usetimefestival}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.playtime!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">공연시간</td>
								    	<td>${tourDto.playtime}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.agelimit!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">관람가능 연령</td>
								    	<td>${tourDto.agelimit}</td>
									  </tr>
									</c:if>
								</c:if>
								
								<!-- 음식점 -->
								<c:if test="${tourDto.contenttype==39}">
								  <c:if test="${tourDto.infocenterfood!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">문의</td>
								    	<td>${tourDto.infocenterfood}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.opentimefood!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">영업시간</td>
								    	<td>${tourDto.opentimefood}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.restdatefood!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">쉬는날</td>
								    	<td>${tourDto.restdatefood}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.firstmenu!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">대표메뉴</td>
								    	<td>${tourDto.firstmenu}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.treatmenu!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">취급메뉴</td>
								    	<td>${tourDto.treatmenu}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.reservationfood!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">예약안내</td>
								    	<td>${tourDto.reservationfood}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.packing!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">포장여부</td>
								    	<td>${tourDto.packing}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.parkingfood!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">주차시설</td>
								    	<td>${tourDto.parkingfood}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.smoking!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">흡연여부</td>
								    	<td>${tourDto.smoking}</td>
									  </tr>
									</c:if>
									<c:if test="${tourDto.chkcreditcardfood!=''}">
									  <tr>
								    	<td width="30%" style="text-align: center;">신용카드</td>
								    	<td>${tourDto.chkcreditcardfood}</td>
									  </tr>
									</c:if>
								</c:if>
								  
								  
								</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<!-- 리뷰 -->
					<div class="section-story4">
						<strong>
							<span style="font-size: 18px;">후기</span>
						</strong>
					</div>
					
				</div>
			</div>
		</div>
	</div>


</body>
</html>