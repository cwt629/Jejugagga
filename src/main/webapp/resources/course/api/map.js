function initMap(){
    // 지도가 들어갈 div 찾아오기
    let mapDiv = document.querySelector("div.coursedetail_mapdiv");
    let map = new naver.maps.Map(mapDiv);
}

initMap();