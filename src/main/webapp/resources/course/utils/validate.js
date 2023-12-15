/*
courseadd.jsp 파일에서 링크를 했으나
함수들을 인식하지 못하고 있어
이후에 리팩토링할 때 연결해주어야 할 듯 합니다.
*/

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