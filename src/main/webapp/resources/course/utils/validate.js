// 목록 검색창 - 한글, 영어, 숫자와 띄어쓰기로만 이루어진 문자인지 판단하는 함수
export function isValidSearchInput(input){
	let regex = new RegExp('^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9 ]*$');
	return regex.test(input);
}