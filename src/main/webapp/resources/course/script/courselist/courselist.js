import {isValidSearchInput} from "../../utils/validate.js";
import {MINIMUM_COUNTER, MAXIMUM_COUNTER, incrementCounter, decrementCounter} from "../../utils/counter.js";
import {generateGetURLQuery} from "../../utils/urlquery.js";

let clickingHeart = false; // 하트를 클릭하고 처리중인지 여부(하트를 연타하는 경우에 대비)
const FULL_HEART_BUTTON = `<i class="bi bi-heart-fill course_heart"></i>`;
const EMPTY_HEART_BUTTON = `<i class="bi bi-heart course_heart"></i>`;


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
				"usercode": CURRENT_USER_CODE
			},
			success: function(res){
				currentButton.html(EMPTY_HEART_BUTTON);
				// 이 코스에 대한 좋아요 수 갱신
				likesInfoToUpdate.html(`&nbsp;${res.totalLikes}`);
				
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
				"usercode": CURRENT_USER_CODE
			},
			success: function(res){
				currentButton.html(FULL_HEART_BUTTON);
				// 이 코스에 대한 좋아요 수 갱신
				likesInfoToUpdate.html(`&nbsp;${res.totalLikes}`);
				
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
	if (SEARCH_QUERY.length > 0) dict["query"] = SEARCH_QUERY;
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







	