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
    map.setZoom(16, false);
    
    // 각 여행지의 위도, 경도를 가져와 핀을 찍는다
    document.querySelectorAll("div.coursedetail_routeplace").forEach(function(item){
    	let latitude = parseFloat(item.dataset.mapy), longitude = parseFloat(item.dataset.mapx);
    	
    	// 핀 찍기
    	let pos = new naver.maps.LatLng(latitude, longitude);
    	let marker = new naver.maps.Marker({
    		position: pos,
    		map: map
    	});
    	marker.setTitle(item.dataset.title); // 마우스 갖다대면 이름 출력
    });
    
    
}

initMap();