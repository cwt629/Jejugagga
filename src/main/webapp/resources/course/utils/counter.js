export const MINIMUM_COUNTER = 1;
export const MAXIMUM_COUNTER = 5;

// 특정 선택자의 카운터값을 1 증가시키는 함수
export function incrementCounter(selector, maxNumber){
	let currentCount = parseInt($(selector).text()); // 현재 카운트
	// 이미 최대치에 도달한 경우
	if (currentCount >= maxNumber) return;
	
	// 1 증가시킨 카운터를 넘겨준다
	$(selector).text(currentCount + 1);
}

// 특정 선택자의 카운터값을 1 감소시키는 함수
export function decrementCounter(selector, minNumber){
	let currentCount = parseInt($(selector).text()); // 현재 카운트
	// 이미 최소치에 도달한 경우
	if (currentCount <= minNumber) return;
	
	// 1 감소시킨 카운터를 넘겨준다
	$(selector).text(currentCount - 1);
}