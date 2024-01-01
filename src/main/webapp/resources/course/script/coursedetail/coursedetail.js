import {CONTENT_TYPE_CLASS, getCategory} from "../../utils/category.js";

let clickingHeart = false; // 하트를 클릭하고 처리중인지 여부(하트를 연타하는 경우에 대비)

// 각 여행지에 카테고리 넣어주기
$("div.coursedetail_tag").each(function(idx, item){
	let contenttype = $(this).attr("contenttype");
	// 카테고리명
	let category = getCategory(parseInt(contenttype));
	$(this).addClass(CONTENT_TYPE_CLASS[contenttype]);
	$(this).text(category);
})

// 하트 아이콘 클릭 시
$("div.coursedetail_guest_info i.coursedetail_heart").click(function(){
	// 로그인되어 있지 않은 경우
	if (!loggedIn){
		alert("좋아요를 추가하시려면 로그인해주세요.");
		location.href = "../member/login";
		return;
	}
	
	// 이미 앞서 좋아요 처리중인 경우
	if (clickingHeart) {
		alert("좋아요 기능 처리중입니다. 잠시 후 시도해주세요.");
		return;
	}
	
	clickingHeart = true;
	let heartIconTag = $(this); // 이 하트 아이콘 태그
	let heartFilled = $(this).hasClass("bi-heart-fill");
	let coursecode = CURRENT_COURSE_CODE;
	
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
				// 꽉찬 하트를 빈 하트로 변경
				heartIconTag.removeClass("bi-heart-fill");
				heartIconTag.addClass("bi-heart");
				// 이 코스에 대한 좋아요 수 갱신
				heartIconTag.html(`&nbsp;${res.totalLikes}`);
				heartIconTag.attr("title", "클릭시 좋아요"); // title 갱신
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
				// 빈 하트를 꽉찬 하트로 변경
				heartIconTag.removeClass("bi-heart");
				heartIconTag.addClass("bi-heart-fill");
				// 이 코스에 대한 좋아요 수 갱신
				heartIconTag.html(`&nbsp;${res.totalLikes}`);
				heartIconTag.attr("title", "클릭시 좋아요 취소"); // title 갱신
				// 플래그 원상 복구
				clickingHeart = false;
			}
		});
	}
})

// 코스 삭제 버튼
$("button.coursedetail_deletebtn").click(function(){
	if (!confirm("정말로 해당 코스를 삭제하시겠습니까?\n삭제된 코스는 복구할 수 없습니다.")){
		return;
	}
	
	// 삭제 진행
	location.href = "./delete?coursecode=" + CURRENT_COURSE_CODE;
})

// 코스 수정 버튼
$("button.coursedetail_revisebtn").click(function(){
	location.href = "./revise?coursecode=" + CURRENT_COURSE_CODE;
});

// 여행지 클릭 이벤트
$("div.coursedetail_card").click(function(){
	// 이동해야 하는 여행지코드 받아오기
	let tourcode = $(this).parent().attr("data-tourcode");
	location.href = "../tour/content?tourcode=" + tourcode;
})