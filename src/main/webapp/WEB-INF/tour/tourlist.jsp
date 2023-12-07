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
<style>
   body * {
       font-family: 'Orbit';
   }
</style>	
<script>
	$(function() {
		list();
	});
	
	function list() {
		$.ajax({
			type : "get",
			dataType : "json",
			url:"./view",
			success:function(res){
				let s=
					`
					<ul class="grid-list">
					
					`;
				$.each(res, function(idx,item) {
					let contentType = item.contenttype;
					
					s+=
						`
						 <li>
							<div class="item-image">
								<a href="./content?tourcode=\${item.tourcode}"> 
									<img src="\${item.firstimage}" alt="">
								</a>
								
								`;
								
								switch(contentType) {
									case 12:
										s+= `<div class="space-badge badge-1">관광지`;
										break;
									case 14:
										s+= `<div class="space-badge badge-2">문화시설`;
										break;
									case 15:
										s+= `<div class="space-badge badge-3">행사`;
										break;
									case 39:
										s+= `<div class="space-badge badge-4">음식점`;
										break;
								}
								
					s+=		`
						</div>
						
							</div>
							<div class="item-contents">
								<div class="item-title">
									<a href="./content?tourcode=\${item.tourcode}"><b>\${item.title}</b></a>
								</div><br>
								<div class="item-address" style="font-size:15px;">\${item.addr1}</div>
								<div class="item-meta">
									<div class="meta-wrap">
										<input type="checkbox" id="scrap0" class="chk-scrap"> 
										<label for="scrap0" class="chk-scrap-lbl"> 
											<i class="bi-heart-fill"></i> 
											<span class="number">237</span>
										</label>
									</div>
									
								</div>
							</div>
						</li>
						`;
				});
				s+=`</ul>`;
				
				$(".tourlist").html(s);
			}
		});
		
	}

</script>
</head>
<body>

	<div class="tour-main">
		<div class="container">
			<div class="contents-head">
				<b><h2 class="contents-title">여행지</h2></b>
				<div class="head-option">
					<div class="page-search">
						<div class="search-wrap">
							<input placeholder="여행지명으로 찾아보세요" class="txt">
							<button type="button" class="btn-search">
								<i class="bi bi-search"></i>
								<span class="blind">검색</span>
							</button>
						</div>
					</div>
					<div class="option-wrap">
						<button type="button" class="btn-filter">
							<i class="bi bi-sliders"></i>
						</button>
						
					</div>
				</div>
			</div>
			
			<div class="loader" style="display: none;"></div>
			
			<div class="contents-body aos-init aos-animate" data-aos="fade-up" data-aos-duration="380">
				<div class="tourlist">
				 리스트
				</div>
			</div>
		</div>
		<div style="text-align: center;">
			<!-- 이전 -->
			<c:if test="${startPage>1 }">
				<a href="./list?currentPage=${startPage-1 }">이전</a>
			</c:if>
			&nbsp;
			<c:forEach var="pno" begin="${startPage }" end="${endPage }">
				<a href="./list?currentPage=${pno }" style="cursor: pointer;">
					<c:if test="${pno==currentPage }">
						<span style="color: tomato;">${pno }</span>
					</c:if>
					<c:if test="${pno!=currentPage }">
						<span style="color: gray;">${pno }</span>
					</c:if>
				</a>
				&nbsp;	
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
				<a href="./list?currentPage=${endPage+1 }">다음</a>
			</c:if>
		</div>
	</div>
	
	
</body>
</html>