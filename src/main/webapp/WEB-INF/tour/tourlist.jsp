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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
       word-break: keep-all;
    }
   
   .item-title a{
   		color: inherit;
		background-color: transparent;
		-webkit-text-decoration-skip: objects;
		text-decoration: none;
		
   }
   .item-title a:hover {
   color: #EEB182;
}
   .container button{
   	    padding: 0;
	    border: 0;
	    background-color: transparent;
	    cursor: pointer;
   }
   
   @import url(http://weloveiconfonts.com/api/?family=entypo);

	// Import Roboto font
	@import url(https://fonts.googleapis.com/css?family=Roboto:300);
	
	.pagination-container {
		margin-top: 1em;
		padding-top: 2em;
		border-top: 1px solid #d7dadb;
		text-align: center;
	}
	
	.pagination-item {
		list-style-type: none;
		display: inline-block;
		border-right: 1px solid #d7dadb;
	
		transform: scale(1) rotate(19deg) translateX(0px) translateY(0px) skewX(-10deg) skewY(-20deg);
	}
	
	.pagination-item:hover,
	.pagination-item.is-active {
		background-color: #EEB182;
		border-right: 1px solid #fff;

		.pagination-link {
			color: #fff;
		}

	}
	
	.pagination-item.first-number {
	  border-left: 1px solid #d7dadb;
	}
	
	.pagination-link {
		padding: 1.1em 1.6em;
		display: inline-block;
		text-decoration: none;
		color: #8b969c;
	
		transform: scale(1) rotate(0deg) translateX(0px) translateY(0px) skewX(20deg) skewY(0deg);
	}
	
	.pagination-item--wide {
		//@extend .pagination-item;
		list-style-type: none;
		display: inline-block;
	}
	
	.pagination-item--wide.first {
		margin: 0 1em 0 0;
	}
	
	.pagination-item--wide.last {
		margin: 0 0 0 1em;
	}
	
	.pagination-link--wide {
		text-decoration: none;
		color: #8b969c;
		padding: 1.1em 1.6em;
	}
	
	.pagination-link--wide:hover {
		color: #EEB182;
	}
	
	.pagination-link--wide.first:before,
	.pagination-link--wide.last:after {
	  font-family: 'entypo';
	  speak: none;
	  font-style: normal;
	  font-weight: normal;
	  font-variant: normal;
	  text-transform: none;
	  line-height: 1;
	
	  // Better Font Rendering
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	}
	
</style>	
<script>
	const urlParams = new URL(location.href).searchParams;
	let word = urlParams.get('word');
	let currentPage = urlParams.get('currentPage');
	
	$(function() {
		list();
	
		//console.log(${totalCount});
		//console.log(${totalCount});
		
		//검색버튼 클릭 이벤트
		$("#btnsearch").click(function() {
			word=$("#word").val();
			currentPage = 1;
			urlParams.set('currentPage', currentPage);
			list();
		});
		
		//페이지 클릭 이벤트
		$(document).on("click", ".pagination-link", function(){
			console.log($(this).attr('data'));
			let currentPage = parseInt($(this).attr('data'));
			
			let link = word != null ? 
					`./list?currentPage=\${currentPage}&word=` + word :
					`./list?currentPage=\${currentPage}`;
			
			location.href = link;
		});
		
		
		

		
		//좋아요 이벤트
		$(document).on("click", ".tourlikes", function(){
			
		});
		
	});
	
	function list() {
		$('#word').val(word);
		
		$.ajax({
			type : "get",
			dataType : "json",
			url:"./view",
			data: {"word":word, "currentPage":currentPage, 
				"currentPage":currentPage, "currentPage":currentPage},
			success:function(res){
				let datas = res.data;
				let pages = res.pageInfo;
				
				let s=
					`
					<ul class="grid-list">
					
					`;
				$.each(datas, function(idx,item) {
					s+=`
						 <li>
							<div class="item-image">
								<a href="./content?tourcode=\${item.tourcode}"> 		
						`;
					//이미지없을때 제주가까 넣어주기		
					var firstimage = item.firstimage;
					var imagePath=`<%= request.getContextPath() %>/res/photo/jejuhome.png`;
					if(firstimage=="") s+= `<img src="\${imagePath}"></a>`;
					else s+= `<img src="\${item.firstimage}"></a>`;
					//관광타입 텍스트로 바꿔주기
					var contentType = item.contenttype;
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
					s+=	`
						</div>
							</div>
							<div class="item-contents">
								<div class="item-title">
									<a href="./content?tourcode=\${item.tourcode}"><b>\${item.title}</b></a>
								</div><br>
								<div class="item-address" style="font-size:15px;">
									<i class="bi bi-geo-alt-fill"></i>\${item.addr1}</div>
								<div class="item-meta">
									<div class="meta-wrap">
										<input type="checkbox" id="scrap0" class="chk-scrap"> 
										<div class="chk-scrap-lbl"> 
											<i class="bi-heart tourlikes"></i> 27
										</div>
									</div>
								</div>
							</div>
						</li>
						`;
				});
				s+=`</ul>`;
				
				$(".tourlist").html(s);
				
				var startPage = pages.startPage;
	            var currentPage = pages.currentPage;
	            var endPage = pages.endPage;
	            var totalPage = pages.totalPage;
				
			
				let t =`<ul class="pagination" style="justify-content: center;">`;
	            // 이전
	            if (startPage > 1) 
	            {
	                t += `<li class="pagination-item"><a class="pagination-link" data="\${startPage - 1}">Previous</a></li>`;
	            }
	            // 페이징
	            for (let pno = startPage; pno <= endPage; pno++) 
	            {
	                if (pno == currentPage) 
	                {
	                    t += `<li class="pagination-item is-active"><a class="pagination-link" data="\${pno}">\${pno}</a></li>`;
	                } else 
	                {
	                    t += `<li class="pagination-item"><a class="pagination-link" data="\${pno}">\${pno}</a></li>`;
	                }
	            }
	            // 다음
	            if (endPage < totalPage) 
	            {
	                t += `<li class="pagination-item"><a class="pagination-link" data="\${endPage + 1}">Next</a></li>`;
	            }
	            
	            t += `</ul>`;
				
				
				$(".tourpaginglist").html(t);
			}
		});
		
	}

</script>
</head>
<body>

	<div class="tour-main">
		<div class="container">
			<div class="contents-head">
				<b class="contents-title" style="font-size: 50px;">여행지</b>
				<div class="head-option">
					<div class="page-search">
						<div class="search-wrap">
							<input placeholder="여행지명으로 찾아보세요" class="txt" id="word">
							<button type="button" class="btn-search" id="btnsearch">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
					<div class="option-wrap">
						<button type="button" class="btn btn-primary btn-filter" 
						data-bs-toggle="modal" data-bs-target="#myModal">
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
		
	</div>
	<div class="pagination-container wow zoomIn mar-b-1x" data-wow-duration="0.5s" style="text-align: center; margin-top: 50px;">
		
		<div class="tourpaginglist">
			페이징
		</div>
		
	</div>
	
		<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">필터 선택</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="modalfilter">
		        	<table class="modalfilterquery">
		        		<tr><td>지역</td></tr>
		        		<tr>	
		        			<td>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="3">제주시</button>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="4">서귀포시</button>
		        			</td>
		        		</tr>
		        		
		        		<tr><td>카테고리</td></tr>
		        		<tr>	
		        			<td>
		        				<button type="button" infocode="12">관광지</button>
		        				<button type="button" infocode="14">문화시설</button>
		        				<button type="button" infocode="15">축제행사</button>
		        				<button type="button" infocode="39">음식점</button>
		        			</td>
		        		</tr>
		        		
		        		
		        	</table>
		        </div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">필터 적용</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	
</body>
</html>