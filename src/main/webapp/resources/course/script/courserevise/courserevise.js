const MAX_SPOTS_IN_COURSE = 5; // 하나의 코스에 들어갈 수 있는 여행지 최대 개수

let selectedCode = -1; // 현재 검색창에서 선택된 여행지 코드
	
// 각 input의 최대 길이
const INPUT_MAX_LENGTH = {
		"name": 100,
		"briefcontent": 500,
		"longdetail": 2000
};

// contenttype별 클래스명
const CONTENT_TYPE_CLASS = {
	"12": "course_tourspot",
	"14": "course_culture",
	"15": "course_festival",
	"39": "course_cafeteria"
};

// 페이지 로드 시 이벤트
$(function(){
	init();
});

// 특정 contenttype에 대한 카테고리명을 출력하는 함수
function getCategory(contenttype) {
	return (contenttype == 12)? "관광지": (contenttype == 14)? "문화시설"
			: (contenttype == 15)? "축제행사": (contenttype == 39)? "음식점" : "기타";
}

// 검색된 여행지 목록을 출력하는 함수
function displaySearchedTour(name = "", categories = []){
	// 로딩 멘트
	const LOADING_DISPLAY = "<div class='courserevise_searchmessage'>데이터 로딩중입니다...</div>";
	$("div.courserevise_searchresultdiv").html(LOADING_DISPLAY);
	
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
					<figure tourcode="${item.tourcode}" contenttype="${item.contenttype}"
					${(item.tourcode == selectedCode)? 'class="courserevise_selected"' : ''}
					data-mapx="${item.mapx}" data-mapy="${item.mapy}">
		        		<img src=${(item.firstimage)? item.firstimage : '../res/photo/noimage.png'}>
		        		<figcaption>
		        			<h5>${item.title}</h5>
		        			<h6>${getCategory(item.contenttype)}</h6>
		        		</figcaption>
		        	</figure>
						`;
			})
			
			if (results.length === 0){
				results = "<div class='courserevise_searchmessage'>검색된 결과가 없습니다.</div>";
			}
			
			// 문서 반영
			$("div.courserevise_searchresultdiv").html(results);
		}
	});
};

// 현재 추가된 여행지 리스트를 출력하는 함수
function displayCurrentRoute(){
	let result = ``;
	const ARROW_ENABLED = `<img class="courserevise_arrow" src="../res/photo/course_icons/next_enabled.png">`;
	const ARROW_DISABLED = `<img class="courserevise_arrow" src="../res/photo/course_icons/next_disabled.png">`;
	
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
				<div class="courserevise_routeplace courserevise_enabled" index=${i}>
					<img class="courserevise_remove" src="../res/photo/course_icons/Icon_remove.png">
					<div class="courserevise_routephoto">
						<img src="${routes[i].getImage()}">
					</div>
					<h5>${routes[i].getTitle()}</h5>
					<div class="courserevise_tag ${CONTENT_TYPE_CLASS[routes[i].getContenttype()]}">
						${getCategory(routes[i].getContenttype())}
					</div>
				</div>
				`;
		}
		// 여행지가 없으면 빈칸 표시
		else {
			result += 
				`
				<div class="courserevise_routeplace">
					<div class="courserevise_routephoto">
					</div>
				</div>
				`;
		}
	}
	
	$("table.courserevise_table div.courserevise_routes").html(result);
}

// 여행지 추가 모달 - 카테고리 버튼 클릭 이벤트
$(".courserevise_searchcategory").click(function(){
	$(this).toggleClass("courserevise_selected");
});

// 소요 시간 단위 클릭 이벤트
$(".courserevise_timebtn").click(function(){
	$(this).siblings(".courserevise_timebtn").removeClass("courserevise_selected");
	$(this).addClass("courserevise_selected");
	// input에도 그 단위를 넣어준다
	$("#courserevise_timestd").val($(this).text());
});

// 여행지 검색 버튼 클릭 이벤트
$("#courserevise_searchbtn").click(function(){
	let searchingName = $("#courserevise_searchname").val();
	let categories = []; // 선택된 카테고리 번호 배열
	
	// 선택된 카테고리를 담아준다.
	$("button.courserevise_searchcategory").each(function(idx, item){
		if ($(this).hasClass("courserevise_selected"))
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
$(document).on("click", "div.courserevise_searchresultdiv>figure", function(){
	$(this).siblings().removeClass("courserevise_selected");
	$(this).addClass("courserevise_selected");
	$("div.courserevise_selectedspot").text("선택된 여행지: " + $(this).children("figcaption").children("h5").text());
	selectedCode = $(this).attr("tourcode");
})

// 여행지 추가 버튼 클릭 이벤트
$("button.courserevise_addroute").click(function(){
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
	
	let tourcode = $("div.courserevise_searchresultdiv>figure.courserevise_selected").attr("tourcode");
	let title = $("div.courserevise_searchresultdiv>figure.courserevise_selected").children("figcaption").children("h5").text();
	let contenttype = $("div.courserevise_searchresultdiv>figure.courserevise_selected").attr("contenttype");
	let image = $("div.courserevise_searchresultdiv>figure.courserevise_selected>img").attr("src");
	let mapx = $("div.courserevise_searchresultdiv>figure.courserevise_selected").attr("data-mapx");
	let mapy = $("div.courserevise_searchresultdiv>figure.courserevise_selected").attr("data-mapy");
	
	// 여행지 추가해주기
	routes.push(new CourseSpot(tourcode, title, contenttype, image, mapx, mapy));
	
	// 실제 루트 렌더링
	displayCurrentRoute();
	
	// 마무리
	selectedCode = -1;
	$("button.courserevise_modalclose").trigger("click"); // 모달창 닫기
})

// 코스 내 여행지 마우스 오버&아웃 이벤트
$(document).on("mouseover", "div.courserevise_routeplace.courserevise_enabled", function(){
	$(this).children("img.courserevise_remove").css("display", "block");
}).on("mouseout", "div.courserevise_routeplace.courserevise_enabled", function(){
	$(this).children("img.courserevise_remove").css("display", "none");
});

// 코스 내 여행지 클릭 이벤트(삭제)
$(document).on("click", "div.courserevise_routeplace.courserevise_enabled", function(){
	let title = $(this).children("h5").text();
	// 삭제 여부 확인
	if (!confirm(`정말로 해당 여행지를 코스에서 삭제하시겠습니까?\n삭제 여행지: ${title}`)){
		return;
	}
	
	let index = parseInt($(this).attr("index"));
	
	// 현재 코스에서 삭제
	routes.splice(index, 1);
	
	// 코스 다시 그리기
	displayCurrentRoute();
})

// 코스 이름, 짧은 소개, 상세 설명에 대해 입력 시 글자수를 출력하는 이벤트
$(".courserevise_explain").on("input", function(){
	let inputType = $(this).attr("name"); // input 종류
	let currentLength = $(this).val().length; // 현재 길이
	let maxLength = INPUT_MAX_LENGTH[inputType]; // 현 input의 최대 길이
	
	// 글자 수 출력하기
	$(this).next().text(`(${currentLength} / ${maxLength}자)`);
})

// 이동 시간에 대해 입력이 올바른지 출력하는 함수
$("input.courserevise_timeinput").on("input", function(){
	let messageBlock = $(this).siblings("span.courserevise_timemessage");
	
	// 아무것도 입력하지 않은 경우
	if ($(this).val().length === 0){
		messageBlock.css("color", "black").text("예상 소요 시간을 입력해주세요.");
		return;
	}
	
	// 올바른 입력
	if (validateTimeInput($(this).val())){
		messageBlock.css("color", "blue").text("올바른 입력입니다.");
		return;
	}
	
	// 올바르지 않은 입력
	messageBlock.css("color", "red").text("입력은 0 이상 정수여야 합니다.");
});

// 이동 거리에 대해 입력이 올바른지 출력하는 함수
$("input.courserevise_distanceinput").on("input", function(){
	let messageBlock = $(this).siblings("span.courserevise_distmessage");
	
	// 아무것도 입력하지 않은 경우
	if ($(this).val().length === 0){
		messageBlock.css("color", "black").text("이동 거리를 직접 입력할 수 있습니다.");
		return;
	}
	
	// 올바른 입력
	if (validateDistanceInput($(this).val())){
		messageBlock.css("color", "blue").text("올바른 입력입니다.");
		return;
	}
	
	// 올바르지 않은 입력
	messageBlock.css("color", "red").text("입력은 0 이상 숫자여야 합니다.");
});

// 자동 계산 버튼 클릭 이벤트
$("button.courserevise_distcalbtn").click(function(){
	let distanceInput = $("input.courserevise_distanceinput"); // 거리 입력창
	let distanceMsg = $("span.courserevise_distmessage"); // 거리 관련 메세지창
	
	// 여행지가 없는 경우
	if (routes.length === 0){
		alert("코스에 여행지를 1개 이상 추가해주세요.");
		return;
	}
	
	// 여행지가 1개인 경우
	if (routes.length === 1){
		distanceInput.val("0"); // 1개인 경우는 이동하지 않으므로, 자동으로 0 넣어주기
		distanceMsg.text("여행지가 1개이므로 이동 거리가 없습니다.").css("color", "black");
		return;
	}
	
	if (!confirm("만들어진 코스를 바탕으로 거리를 자동 계산합니다.\n계산에는 시간이 수 초 정도 소요될 수 있습니다."))
		return;
	
	distanceMsg.text("거리 자동 계산 중입니다...").css("color", "black"); // 로딩 표시
	
	// 시작점 쿼리: "mapx,mapy" 형태
	let startQuery = routes[0].getMapx() + "," + routes[0].getMapy();
	// 도착점 쿼리: "mapx,mapy" 형태
	let goalQuery = routes[routes.length - 1].getMapx() + "," + routes[routes.length - 1].getMapy();

	// 경유지 쿼리: "mapx,mapy|mapx,mapy|mapx,mapy" 형태
	let waypointElements = [];
	for (let i = 1; i < routes.length - 1; i++){
		// 앞에서 두번째 여행지부터, 뒤에서 두번째 여행지까지를 경유한다
		waypointElements.push(routes[i].getMapx() + "," + routes[i].getMapy());
	}
	let waypointsQuery = waypointElements.join("|"); // | 캐릭터로 이어준다
	
	// 서버에 보낼 데이터 형태
	let sendingData = {
		start: startQuery,
		goal: goalQuery,
		waypoints: waypointsQuery
	};
	
	$.ajax({
		type: "get",
		dataType: "text",
		url: "./api/distance",
		data: sendingData,
		success: function(res){
			alert("이동거리 자동 계산을 완료했습니다!");
			distanceInput.val(res); // 계산된 거리를 입력창에 넣어준다
			distanceMsg.text("거리 계산이 완료되었습니다!").css("color", "#ca8462");
		},
		error: function(request, status, error){
			alert("다음 이유로 실패하였습니다.\n" + status + "\n" + error);
			distanceMsg.text("거리 계산에 실패했습니다.").css("color", "red");
		}
	});
});

// form submit 컨트롤 함수
$("form.courserevise_form").on("submit", function(event){
	if (!handleCourseFormSubmit()){
		event.preventDefault();
	}
});

// int 입력을 체크하는 함수
function isValidIntegerInput(input){
	let intRegex = new RegExp('^[0-9]*$');
	
	// 완전한 정수 형태인지 확인
	return intRegex.test(input);
}

// double 입력을 체크하는 함수
function isValidDoubleInput(input){
	// 정수 형태인 경우
	if (isValidIntegerInput(input)) return true;
	
	// 소수 형태인 경우에 대한 정규표현식
	let doubleRegex = new RegExp('^[0-9]+\.?[0-9]+$');
	
	// 올바른 소수 형태인지 확인
	return doubleRegex.test(input);
}

// 예상 소요 시간 입력 검증 함수
function validateTimeInput(input){
	// 0 이상인 정수
	return isValidIntegerInput(input) && parseInt(input) >= 0;
}

// 이동거리 검증 함수
function validateDistanceInput(input){
	// 소수여야 한다
	return isValidDoubleInput(input);
}

// 수정 폼으로 처음 들어왔을 때 불리는 함수
function init(){
	// 여러 text input들의 글자 수 세기를 위해, input event를 촉발시킨다
	$(".courserevise_explain").trigger("input");
	$("input.courserevise_timeinput").trigger("input");
	$("input.courserevise_distanceinput").trigger("input");
	
	displayCurrentRoute(); // 여행지 루트 렌더링
}

// 폼 제출 시 호출할 함수
function handleCourseFormSubmit(){
	// 여행지를 하나도 선택하지 않은 경우
	if (routes.length === 0){
		alert("여행지를 하나 이상 선택해주세요.");
		return false;
	}
	
	// 소요 시간 입력이 올바르지 않은 경우
	if (!validateTimeInput($("input.courserevise_timeinput").val())){
		alert("예상 소요 시간을 올바르게 입력해주세요.");
		$("input.courserevise_timeinput").focus(); // 자동 포커스
		return false;
	}
	
	// 이동 거리 입력이 올바르지 않은 경우
	if (!validateDistanceInput($("input.courserevise_distanceinput").val())){
		alert("이동 거리를 올바르게 입력해주세요.");
		$("input.courserevise_distanceinput").focus(); // 자동 포커스
		return false;
	}
	
	// 각 여행지의 코드를 input에 넣어준다
	$("div.courserevise_routeinputs input").each(function(idx){
		if (idx < routes.length)
			$(this).val(routes[idx].getTourcode());
		else
			$(this).val("");
	});
	
	return true;
}