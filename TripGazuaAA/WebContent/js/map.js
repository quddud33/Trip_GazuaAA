$("#mapScroll").on("click", function(){
		$("#mapbg").css("display", "block");
});

$("#map").on("click",function (e) {                                                              //상세정보를 보여주는 박스 클릭이벤트
    e.stopPropagation();                                                                        //부모로의 이벤트 전파를 중지시킴 (이걸 하지 않을시 박스를 클릭했는데 뒷배경의 이벤트까지
});//click end    
$("#mapbg").on("click",function () {                                                                    //뒷배경 박스 클릭이벤트
	   $("#mapbg").css("display","none");                                                        //상세정보 창을 안보이게 변경
});

                                                          
var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center: new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
    level: 12 // 지도의 확대 레벨
});

// 마커 클러스터러를 생성합니다
var clusterer = new daum.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
    minLevel: 10 // 클러스터 할 최소 지도 레벨
});

var locations = [],
    cok = [],
    infoWindows = [];


// 데이터를 가져오기 위해 jQuery 를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
$.get("ajax/tour.json", function (data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    markers = $(data.positions).map(function (i, position) {
        return new daum.maps.Marker({
            position: new daum.maps.LatLng(position.lat, position.lng)
        });
    });
    clusterer.addMarkers(markers);

});

$.get("ajax/tour.json", function (data) {
    $.each(data, function (i, v) {
        for (var i = 0; i < v.length; i++) {
            locations.push(new daum.maps.LatLng(v[i].lat,v[i].lng ));
            cok.push(markers[i]);

            infoWindows.push(new daum.maps.InfoWindow({
                content: '<div style="padding:5px;"><h4>'+ v[i].title + '</h4><br/> <img src="'+v[i].img +'" onerror="this.src=\'img/no.png\'" width="350px" height="200px"></p></div>',
                position: locations[i],
                removable: true
            }));

            daum.maps.event.addListener(markers[i], 'mousedown', makeOverListener(map, markers[i], infoWindows[i]));

        }
    });
});

daum.maps.event.addListener(clusterer, 'clusterclick', function (cluster) {

    // 현재 지도 레벨에서 1레벨 확대한 레벨
    var level = map.getLevel() - 1;

    // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
    map.setLevel(level, {anchor: cluster.getCenter()});
});

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
function makeOverListener(map, marker, infowindow) {
    return function() {
        $.each(infoWindows, function (i, v) { v.close(); });
        infowindow.open(map, marker);
    };
}