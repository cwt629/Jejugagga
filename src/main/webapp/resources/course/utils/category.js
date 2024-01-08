// 특정 contenttype에 대한 카테고리명을 출력하는 함수
export function getCategory(contenttype) {
	return (contenttype == 12)? "관광지": (contenttype == 14)? "문화시설"
			: (contenttype == 15)? "축제행사": (contenttype == 39)? "음식점" : "기타";
}

// contenttype별 클래스명
export const CONTENT_TYPE_CLASS = {
	"12": "course_tourspot",
	"14": "course_culture",
	"15": "course_festival",
	"39": "course_cafeteria"
};