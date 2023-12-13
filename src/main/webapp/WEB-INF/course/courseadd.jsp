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
       margin: 30px 0px;
   }
   
   div.courseadd_routes div.courseadd_routeplace {
       width: 160px;
       height: 250px;
       position: relative;
       top: 22px;
   }
   
   div.courseadd_routes div.courseadd_routeplace.courseadd_enabled {
       cursor: pointer;
   }
   
   div.courseadd_routes div.courseadd_routeplace div.courseadd_routephoto {
       width: 150px;
       height: 150px;
       background-color: #d9d9d9;
       border-radius: 5px;
   }
   
   div.courseadd_routes div.courseadd_routeplace div.courseadd_routephoto>img {
       width: 100%;
       height: 100%;
       border-radius: 5px;
       object-fit: cover;
   }
   
   div.courseadd_routes div.courseadd_routeplace>h5 {
       text-align: center;
   }
   
   div.courseadd_routes div.courseadd_routeplace.courseadd_enabled>img.courseadd_remove {
       width: 150px;
       height: 150px;
       border-radius: 5px;
       opacity: 0.5;
       position: absolute;
       display: none;

   }
   
   div.courseadd_routes>img.courseadd_arrow {
       position: relative;
       top: -25px;
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
   
   div.courseadd_searchresultdiv>figure.courseadd_selected {
       background-color: #cc9e89;
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
   
   div.courseadd_selectedspot {
       margin: 20px;
   }
   
</style>
</head>
<script>
	class CourseSpot {
		constructor(tourcode, title, contenttype, image){
			this.tourcode = tourcode;
			this.title = title;
			this.contenttype = contenttype;
			this.image = image;
		}
		
		getTourcode(){
			return this.tourcode;
		}
		
		getTitle(){
			return this.title;
		}
		
		getContenttype(){
			return this.contenttype;
		}
		
		getImage(){
			return this.image;
		}
	}
</script>
<script>
	let routes = []; // 루트에 포함되는 여행지 정보
	let selectedCode = -1; // 현재 검색창에서 선택된 여행지 코드
	
	const MAX_SPOTS_IN_COURSE = 5; // 하나의 코스에 들어갈 수 있는 여행지 최대 개수
	
	// 각 input의 최대 길이
	const INPUT_MAX_LENGTH = {
			"name": 100,
			"briefcontent": 500,
			"longdetail": 2000
	};
	
	
	$(function(){
		displayCurrentRoute(); // 여행지 루트 렌더링
		
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
		
		// 검색된 여행지 클릭 이벤트
		$(document).on("click", "div.courseadd_searchresultdiv>figure", function(){
			$(this).siblings().removeClass("courseadd_selected");
			$(this).addClass("courseadd_selected");
			$("div.courseadd_selectedspot").text("선택된 여행지: " + $(this).children("figcaption").children("h5").text());
			selectedCode = $(this).attr("tourcode");
		})
		
		// 여행지 추가 버튼 클릭 이벤트
		$("button.courseadd_addroute").click(function(){
			// 추가한 여행지가 없는 경우
			if (selectedCode === -1) {
				alert("선택한 여행지가 없습니다.");
				return;
			}
			
			// 이미 여행지 최대치를 넘은 경우
			if (routes.length >= MAX_SPOTS_IN_COURSE) {
				alert("더 이상 여행지를 추가할 수 없습니다.");
				return;
			}
			
			let tourcode = $("div.courseadd_searchresultdiv>figure.courseadd_selected").attr("tourcode");
			let title = $("div.courseadd_searchresultdiv>figure.courseadd_selected").children("figcaption").children("h5").text();
			let contenttype = $("div.courseadd_searchresultdiv>figure.courseadd_selected").attr("contenttype");
			let image = $("div.courseadd_searchresultdiv>figure.courseadd_selected>img").attr("src");
			
			// 여행지 추가해주기
			routes.push(new CourseSpot(tourcode, title, contenttype, image));
			
			// 실제 루트 렌더링
			displayCurrentRoute();
			
			// 마무리
			selectedCode = -1;
			$("button.courseadd_modalclose").trigger("click"); // 모달창 닫기
		})
		
		// 코스 내 여행지 마우스 오버&아웃 이벤트
		$(document).on("mouseover", "div.courseadd_routeplace.courseadd_enabled", function(){
			$(this).children("img.courseadd_remove").css("display", "block");
		}).on("mouseout", "div.courseadd_routeplace.courseadd_enabled", function(){
			$(this).children("img.courseadd_remove").css("display", "none");
		});
		
		// 코스 내 여행지 클릭 이벤트(삭제)
		$(document).on("click", "div.courseadd_routeplace.courseadd_enabled", function(){
			let title = $(this).children("h5").text();
			// 삭제 여부 확인
			if (!confirm(`정말로 해당 여행지를 코스에서 삭제하시겠습니까?\n삭제 여행지: \${title}`)){
				return;
			}
			
			let index = parseInt($(this).attr("index"));
			
			// 현재 코스에서 삭제
			routes.splice(index, 1);
			
			// 코스 다시 그리기
			displayCurrentRoute();
		})
		
		// 코스 이름, 짧은 소개, 상세 설명에 대해 입력 시 글자수를 출력하는 이벤트
		$(".courseadd_explain").on("input", function(){
			let inputType = $(this).attr("name"); // input 종류
			let currentLength = $(this).val().length; // 현재 길이
			let maxLength = INPUT_MAX_LENGTH[inputType]; // 현 input의 최대 길이
			
			// 글자 수 출력하기
			$(this).next().text(`(\${currentLength} / \${maxLength}자)`);
		})
		
	}); // end of $(function())
	
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
						<figure tourcode="\${item.tourcode}" contenttype="\${item.contenttype}"
						\${(item.tourcode == selectedCode)? 'class="courseadd_selected"' : ''}>
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
	};
	
	// 현재 추가된 여행지 리스트를 출력하는 함수
	function displayCurrentRoute(){
		let result = ``;
		const ARROW_ENABLED = `<img class="courseadd_arrow" src="../res/photo/course_icons/next_enabled.png">`;
		const ARROW_DISABLED = `<img class="courseadd_arrow" src="../res/photo/course_icons/next_disabled.png">`;
		
		for (let i = 0; i < MAX_SPOTS_IN_COURSE; i++){
			// 첫 시작을 제외하고는 화살표부터 그려준다
			if (i > 0) {
				// 해당 번째에 여행지가 있으면 화살표가 활성화되고, 그렇지 않으면 비활성화
				let currentArrow = (i < routes.length)? ARROW_ENABLED : ARROW_DISABLED;
				result += currentArrow;
			}
			
			// 여행지가 있으면 표시해준다
			if (i < routes.length) {
				result += 
					`
					<div class="courseadd_routeplace courseadd_enabled" index=\${i}>
						<img class="courseadd_remove" src="../res/photo/course_icons/Icon_remove.png">
						<div class="courseadd_routephoto">
							<img src="\${routes[i].getImage()}">
						</div>
						<h5>\${routes[i].getTitle()}</h5>
						<div class="courseadd_tag">
							\${getCategory(routes[i].getContenttype())}
						</div>
					</div>
					`;
			}
			// 여행지가 없으면 빈칸 표시
			else {
				result += 
					`
					<div class="courseadd_routeplace">
						<div class="courseadd_routephoto">
						</div>
					</div>
					`;
			}
		}
		
		$("table.courseadd_table div.courseadd_routes").html(result);
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
			<form method="post" action="./addcourse" class="courseadd_form"
			onsubmit="return handleCourseFormSubmit()">
				<!-- usercode는 hidden으로 받는다 -->
				<input type="hidden" name="usercode" value="${sessionScope.usercode}">
				<table class="courseadd_table">
					<tr>
						<td width="160"><b>코스 이름 *</b></td>
						<td>
							<input type="text" name="name" class="courseadd_textinput courseadd_explain" placeholder="코스 이름을 입력하세요" 
							style="width: 800px;" maxlength="100" required>
							<span>(0 / 100자)</span>
						</td>
					</tr>
					<tr>
						<td><b>여행지 *</b></td>
						<td>
							<div class="courseadd_routeinputs">
								<input type="hidden" name="route1" value="">
								<input type="hidden" name="route2" value="">
								<input type="hidden" name="route3" value="">
								<input type="hidden" name="route4" value="">
								<input type="hidden" name="route5" value="">
							</div>
							<div class="courseadd_routes">
								<!-- 여행지 코스 출력 부분 -->
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
							<textarea style="width: 80%; height: 60px;" class="courseadd_explain" maxlength="500" name="briefcontent"></textarea>
							<span>(0 / 500자)</span>
						</td>
					</tr>
					<tr>
						<td><b>상세 설명</b></td>
						<td>
							<textarea style="width: 80%; height: 200px;" class="courseadd_explain" maxlength="2000" name="longdetail"></textarea>
							<span>(0 / 2000자)</span>
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
		        <button type="button" class="btn-close courseadd_modalclose" data-bs-dismiss="modal"></button>
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
		        </div>
		      </div>
		      	
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<div class="courseadd_selectedspot">
		      		선택된 여행지: 없음
		      	</div>
		        <button type="button" class="courseadd_general_brownbtn courseadd_addroute">추가</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
	</div>
	
	<script>
		// 폼 제출 시 호출할 함수
		function handleCourseFormSubmit(){
			// 여행지를 하나도 선택하지 않은 경우
			if (routes.length === 0){
				alert("여행지를 하나 이상 선택해주세요.");
				return false;
			}
			
			// 각 여행지의 코드를 input에 넣어준다
			$("div.courseadd_routeinputs input").each(function(idx){
				if (idx < routes.length)
					$(this).val(routes[idx].getTourcode());
				else
					$(this).val("");
			});
			
			return true;
		}
	</script>
</body>
</html>