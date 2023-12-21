function initMap(){
    // 지도가 들어갈 div 찾아오기
    let mapDiv = document.querySelector("div.coursedetail_mapdiv");
    let map = new naver.maps.Map(mapDiv);
    
    // 제일 처음 있는 여행지를 센터로 찍는다
    let firstPlace = document.querySelector("div.coursedetail_routeplace");
    let centerLatitude = parseFloat(firstPlace.dataset.mapy),
    	centerLongitude = parseFloat(firstPlace.dataset.mapx);
    
    let center = new naver.maps.LatLng(centerLatitude, centerLongitude);
    map.setCenter(center);
    map.setZoom(13, false);
    
    let coords = []; // 위도, 경도를 순서대로 저장하는 2차원 배열
    
    // 각 여행지의 위도, 경도를 가져와 핀을 찍는다
    document.querySelectorAll("div.coursedetail_routeplace").forEach(function(item, idx){
    	let latitude = parseFloat(item.dataset.mapy), longitude = parseFloat(item.dataset.mapx);
    	// 위도, 경도를 각각 저장해준다
    	coords.push([latitude, longitude]);
    	
    	// 핀 찍기
    	let pos = new naver.maps.LatLng(latitude, longitude);
    	let marker = new naver.maps.Marker({
    		position: pos,
    		map: map,
    		title: item.dataset.title,
    		animation: naver.maps.Animation.BOUNCE
    	});
    	    	
    	// 각 여행지 요소에 클릭 시 이벤트를 부여한다
	    item.addEventListener("click", function(){
	    	let latitude = parseFloat(this.dataset.mapy), longitude = parseFloat(this.dataset.mapx);
	    	center = new naver.maps.LatLng(latitude, longitude);
	    	map.setCenter(center);
	    	map.setZoom(16, false); // 특정 여행지 클릭 시 그 여행지에 줌인
	    	
	    	// 클릭 시 지도 쪽으로 자동 스크롤
	    	document.querySelector("div.coursedetail_mapdiv").scrollIntoView({behavior: 'smooth'});
    	});
    });
    
    // 지도상에 루트 그리기
    renderRoute(map, coords);
}

// 시작점에서 끝점까지의 경로를 지도상에 그리는 함수
function renderRoute(map, coords){
	// 쿼리들을 담은 딕셔너리
	let queries = getRouteQueries(coords);
	
	// 만들어두었던 url로 요청
	$.ajax({
		type: "get",
		dataType: "json",
		url: "./api/route",
		data: queries,
		success: function(res){
			// 네이버 polyline 경로
			let polylines = [];
			
			res.forEach(([mapx, mapy]) => {
				polylines.push(new naver.maps.LatLng(mapy, mapx));
			});
			
			// polyline 그리기
			let renderedPolyLine = new naver.maps.Polyline({
				path: polylines,
				strokeColor: '#4cb9e7',
				strokeOpacity: 0.8,
				strokeWeight: 6,
				map: map
			});
		},
		error: function(request, status, error){
			alert("지도 경로 렌더링에 실패하였습니다.\n" + status + "\n" + error);
		}
	});
}

// Direction 5 API 적용을 위한 start, goal, waypoints 쿼리문을 만드는 함수
function getRouteQueries(coords){
	let result = {};
	// 1. start: mapx,mapy 형태(경도,위도)
	result["start"] = coords[0][1] + "," + coords[0][0];
	// 2. goal: mapx,mapy 형태(경도,위도)
	result["goal"] = coords[coords.length - 1][1] + "," + coords[coords.length - 1][0];
	
	// 3. waypoints: mapx,mapy|mapx,mapy...형태
	let tempQueries = [];
	for (let i = 1; i < coords.length - 1; i++){
		tempQueries.push(coords[i][1] + "," + coords[i][0]);
	}
	result["waypoints"] = tempQueries.join("|");
	
	return result;
}

// 만들어진 딕셔너리를 바탕으로 get 방식의 파라미터를 만드는 함수
function generateGetURL(dict){
	let result = "";
	result += "?start=" + dict.start;
	result += "&goal=" + dict.goal;
	if (dict.waypoints.length > 0) result += "&waypoints=" + dict.waypoints;
	
	return result;
}

initMap();