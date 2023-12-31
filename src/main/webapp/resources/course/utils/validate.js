// 목록 검색창 - 한글, 영어, 숫자와 띄어쓰기로만 이루어진 문자인지 판단하는 함수
export function isValidSearchInput(input){
	let regex = new RegExp('^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9 ]*$');
	return regex.test(input);
}

// 예상 소요 시간 입력 검증 함수
export function isValidTimeInput(input){
	// 0 이상인 정수
	return isValidIntegerInput(input) && parseInt(input) >= 0;
}

// 이동거리 검증 함수
export function isValidDistanceInput(input){
	// 소수여야 한다
	return isValidDoubleInput(input);
}

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
