// 주어진 dictionary를 바탕으로 url 뒤에 붙는 쿼리문을 작성해주는 함수
export function generateGetURLQuery(dict){
	let queries = []; // 각 쿼리를 저장한 배열
	for (let key in dict){
		let query = key + "=" + dict[key];
		queries.push(query);
	}
	
	let result = queries.join("&"); // 쿼리들을 &로 이어붙여준다
	// 하나라도 쿼리문이 있으면 "?"를 앞에 붙여준다
	if (result.length > 0) result = "?" + result;
	
	return result;
}