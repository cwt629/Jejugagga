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
       /* word-break: keep-all; */
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
   
</style>


</head>
<body>

	<div id="container">
		<div id="sub_visual"
			style="background-image: linear-gradient(rgba(0, 0, 0, 0.7),
        		rgba(255, 255, 255, 0.7)), url(${tourDto.firstimage});">
			<div class="container">
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
						<i class="bi-heart"></i> <span class="number">155</span>
					</button>
				</div>
			</div>
		</div>
		<div id="contents">
			<div class="sub-content">
				<div class="container">
					<ul class="sub-tab">
						<li class="tab-item"><a class="text-small" href="../tour/content?tourcode=${param.tourcode}">이야기</a></li>
						<li class="tab-item"><a class="text-small" href="../tour/photo?tourcode=${param.tourcode}">갤러리</a></li>
						<li class="tab-item active"><a class="text-small">오시는길</a></li>
						<li class="tab-item"><a class="text-small" href="../tour/review?tourcode=${param.tourcode}">후기</a></li>
					</ul>
					<div class="section-story">
						<strong>
							<span style="font-size: 18px;"></span>
						</strong>
						<div style="padding-left : 30px">
							<div id="map" style="width:500px; height:400px;">
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
							<div id="tableContainer" class="tableContainer" style="width:500px; font-size : 20px;">
								<table border="1" cellpadding="1" cellspacing="1" class="table table-bordered">
								<thead class="fixedHeader">
								</thead>
								<tbody class="scrollContent">
								  <tr>
								    <td width="30%" style="text-align: center;">주소</td>
								    <td>${tourDto.addr1}</td>
								  </tr>
								  <tr>
								    <td width="30%" style="text-align: center;">홈페이지</td>
								    <td>${tourDto.homepage}</td>
								  </tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>