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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
   body * {
       font-family: 'Orbit';
   }
   
   div.courseadd_app {
       margin: 15px;
   }
   
   div.courseadd_innerheader span.courseadd_title {
       font-size: 30px;
   }
   
   div.courseadd_innerheader button.courseadd_prevbtn {
       background-color: #ccc;
       color: white;
       padding: 5px;
       border: none;
       float: right;
       margin-right: 30px;
   }
   
   div.courseadd_formdiv {
       /*
       display: flex;
       justify-content: center;
       */
   }
   
   div.courseadd_formdiv form.courseadd_form table.courseadd_table {
       margin: 35px 0px;
       width: 1800px;
   }
   
   table.courseadd_table td {
       padding: 10px;
   }
   
   input.courseadd_textinput, form.courseadd_form textarea {
       border: none;
       background-color: #d9d9d9;
   }
   
   div.courseadd_routes {
       display: flex;
       align-items: center;
   }
   
   div.courseadd_routes div.courseadd_routeplace {
       height: 200px;
       position: relative;
       top: 22px;
   }
   
   div.courseadd_routes div.courseadd_routeplace div.courseadd_routephoto {
       width: 150px;
       height: 150px;
       background-color: #d9d9d9;
       border-radius: 5px;
       
   }
   
   div.courseadd_routes div.courseadd_routeplace>h5 {
       text-align: center;
   }
   
   div.courseadd_routes div.courseadd_routeplace div.courseadd_tag {
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
   
   
   
   div.courseadd_app button.courseadd_general_brownbtn {
       border: none;
       background-color: #bf5b4b;
       color: white;
       width: 240px;
       height: 40px;
       border-radius: 40px;
       font-size: 20px;
       margin: 15px 0px;
   }
   
   div.courseadd_app button.courseadd_selectablebtn {
       border: 2px solid #d9d9d9;
       background-color: transparent;
       padding: 5px 25px;
       border-radius: 30px;
       font-weight: bold;
   }
   
   div.courseadd_app button.courseadd_selectablebtn.courseadd_selected {
       border: 2px solid #d7897e;
   }
   
   table.courseadd_table button.courseadd_distcalbtn {
       border: 2px solid #ca8462;
       background-color: transparent;
       width: 120px;
       height: 30px;
       border-radius: 30px;
       font-weight: bold;
       margin: 0px 24px;
   }
   
   table.courseadd_searchquery td {
       padding: 15px;
   }
   
   table.courseadd_searchquery {
       width: 800px;
   }
   
   div.courseadd_search div.courseadd_searchdiv {
       display: flex;
       justify-content: center;
   }
   
   div.courseadd_searchresultdiv {
       height: 485px;
       display: flex;
       flex-wrap: wrap;
       overflow-y: auto;
   }
   
   div.courseadd_searchresultdiv>figure {
       margin: 15px;
       padding: 10px;
       width: 180px;
       cursor: pointer;
   }
   
   div.courseadd_searchresultdiv>figure:hover {
       background-color: #d9d9d9;
   }
   
   div.courseadd_searchresultdiv>figure>img {
       width: 100%;
       height: 150px;
       border-radius: 5px;
   }
   
   div.courseadd_searchresultdiv>figure>figcaption>h6 {
       color: #888;
   }
   
   div.courseadd_searchresultdiv div.courseadd_searchmessage {
       font-size: 22px;
       text-align: center;
       width: 100%;
   }
   
</style>
</head>
<script>
	
	$(function(){
		// 여행지 추가 모달 - 카테고리 버튼 클릭 이벤트
		$(".courseadd_searchcategory").click(function(){
			$(this).toggleClass("courseadd_selected");
		});
		
		// 소요 시간 단위 클릭 이벤트
		$(".courseadd_timebtn").click(function(){
			$(this).siblings(".courseadd_timebtn").removeClass("courseadd_selected");
			$(this).addClass("courseadd_selected");
			// input에도 그 단위를 넣어준다
			$("#courseadd_timestd").val($(this).text());
		});
		
		// 여행지 검색 버튼 클릭 이벤트
		$("#courseadd_searchbtn").click(function(){
			let searchingName = $("#courseadd_searchname").val();
			let categories = []; // 선택된 카테고리 번호 배열
			
			// 선택된 카테고리를 담아준다.
			$("button.courseadd_searchcategory").each(function(idx, item){
				if ($(this).hasClass("courseadd_selected"))
					categories.push($(this).attr("infocode"));
			})
			
			// [예외처리] 카테고리가 아무것도 안담겨있다면, 돌아가게 한다
			if (categories.length === 0){
				alert("카테고리를 최소 1개 선택해야 합니다.");
				return;
			}
			
			displaySearchedTour(searchingName, categories);
		})
	})
	
	// 특정 contenttype에 대한 카테고리명을 출력하는 함수
	function getCategory(contenttype) {
		return (contenttype == 12)? "관광지": (contenttype == 14)? "문화시설"
				: (contenttype == 15)? "축제행사": (contenttype == 39)? "음식점" : "기타";
	}
	
	// 검색된 여행지 목록을 출력하는 함수
	function displaySearchedTour(name = "", categories = []){
		// 로딩 멘트
		const LOADING_DISPLAY = "<div class='courseadd_searchmessage'>데이터 로딩중입니다...</div>";
		$("div.courseadd_searchresultdiv").html(LOADING_DISPLAY);
		
		/*
		[Trouble-Shooting]
		배열을 넘겨주려면, traditional: true 를 넘겨줘야 한다.
		그리고 Controller에서는 List 형태로 받아오면 된다.
		*/
		$.ajax({
			type: "get",
			dataType: "json",
			url: "./searchtour",
			data: {"name": name, "categories": categories},
			traditional: true,
			success: function(res){
				//console.log(res);
				let results = "";
				
				$.each(res, function(idx, item){
					results += 
						`
						<figure tourcode="\${item.tourcode}" contenttype="\${item.contenttype}">
			        		<img src=\${(item.firstimage)? item.firstimage : '../res/photo/noimage.png'}>
			        		<figcaption>
			        			<h5>\${item.title}</h5>
			        			<h6>\${getCategory(item.contenttype)}</h6>
			        		</figcaption>
			        	</figure>
						`;
				})
				
				if (results.length === 0){
					results = "<div class='courseadd_searchmessage'>검색된 결과가 없습니다.</div>";
				}
				
				// 문서 반영
				$("div.courseadd_searchresultdiv").html(results);
			}
		});
	}
</script>
<body>
	<div class="courseadd_app">
		<div class="courseadd_innerheader">
			<span class="courseadd_title">나의 추천코스 추가</span>
			<button type="button" class="courseadd_prevbtn"
			onclick="history.back()">이전으로</button>
		</div>
		
		<div class="courseadd_formdiv">
			<form method="post" action="./addcourse" class="courseadd_form">
				<table class="courseadd_table">
					<tr>
						<td width="160"><b>코스 이름 *</b></td>
						<td>
							<input type="text" name="name" class="courseadd_textinput" placeholder="코스 이름을 입력하세요" 
							style="width: 800px;" required>
						</td>
					</tr>
					<tr>
						<td><b>여행지 *</b></td>
						<td>
							<div class="courseadd_routes">
								<!-- 1~5번 여행지 -->
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
									<div class="courseadd_tag">
										여행지
									</div>
								</div>
								<img src="../res/photo/course_icons/next_enabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
									<div class="courseadd_tag">
										문화시설
									</div>
								</div>
								<img src="../res/photo/course_icons/next_enabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
									<h5>대충 제목</h5>
									<div class="courseadd_tag">
										축제행사
									</div>
								</div>
								<img src="../res/photo/course_icons/next_disabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
								</div>
								<img src="../res/photo/course_icons/next_disabled.png">
								<div class="courseadd_routeplace">
									<div class="courseadd_routephoto">
									</div>
								</div>
							</div>
							<button type="button" class="courseadd_general_brownbtn" data-bs-toggle="modal" data-bs-target="#courseAddModal">+ 여행지 추가</button>
						</td>
					</tr>
					<tr>
						<td><b>예상 소요 시간 *</b></td>
						<td>
							<input type="text" name="spendingtime" class="courseadd_textinput" placeholder="소요 시간" 
							style="width: 100px;" required>
							<!-- 소요 시간의 단위를 넘겨받을 input -->
							<input type="hidden" name="timestandard" value="시간" id="courseadd_timestd"> 
							<button type="button" class="courseadd_timebtn courseadd_selectablebtn">일</button>
							<button type="button" class="courseadd_timebtn courseadd_selectablebtn courseadd_selected">시간</button>
							<button type="button" class="courseadd_timebtn courseadd_selectablebtn">분</button>
						</td>
					</tr>
					<tr>
						<td><b>이동 거리 *</b></td>
						<td>
							<input type="text" name="distance" class="courseadd_textinput" placeholder="이동 거리" 
							style="width: 100px;" required>
							km
							<button type="button" class="courseadd_distcalbtn">자동 계산</button>
							<span class="courseadd_distmessage">이동 거리를 직접 입력할 수 있습니다.</span>
						</td>
					</tr>
					<tr>
						<td><b>짧은 소개</b></td>
						<td>
							<textarea style="width: 80%; height: 60px;" name="briefcontent"></textarea>
						</td>
					</tr>
					<tr>
						<td><b>상세 설명</b></td>
						<td>
							<textarea style="width: 80%; height: 200px;" name="longdetail"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit" class="courseadd_general_brownbtn">코스 등록하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<!-- The Modal -->
		<div class="modal fade" id="courseAddModal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">여행지 추가</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <!-- 검색창 -->
		        <div class="courseadd_search">
		        	<table class="courseadd_searchquery">
		        		<tr>
		        			<td width="100">이름</td>
		        			<td>
		        				<input type="text" id="courseadd_searchname" class="courseadd_textinput"
		        				style="width: 500px;">
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>카테고리</td>
		        			<td>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="12">관광지</button>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="14">문화시설</button>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="15">축제행사</button>
		        				<button type="button" class="courseadd_searchcategory courseadd_selectablebtn" infocode="39">음식점</button>
		        			</td>
		        		</tr>
		        	</table>
		        	<div class="courseadd_searchdiv">
		        		<button type="button" class="courseadd_general_brownbtn" id="courseadd_searchbtn">여행지 검색</button>
		        	</div>
		        </div>
		        <hr>
		        <!-- 검색 결과 출력 -->
		        <div class="courseadd_searchresultdiv">
		        	<div class="courseadd_searchmessage">이 곳에 검색 결과가 출력됩니다.</div>
		        	<!-- dummy data -->
		        	<!-- 
		        	<figure>
		        		<img src="../res/photo/course_dummy/dummy_tourphoto1.jpg">
		        		<figcaption>
		        			<h5>대충 제목</h5>
		        			<h6>카테고리</h6>
		        		</figcaption>
		        	</figure>
		        	 -->
		        </div>
		      </div>
		      	
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<!-- TODO: 데이터 추가 이후, 모달창 닫히게 트리거 줘야함 -->
		        <button type="button" class="btn btn-danger">추가</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
	</div>
	
	
</body>
</html>