<%@page import="constant.Key"%>
<%@page import="api.TempaeratureAPI"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="api.WeatherAPI"%>
<%@page import="constant.Constant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
   String key = "70d78e61bdb96cf13e612f9908e948d0";
   WeatherAPI weatherAPI = new WeatherAPI();
   TempaeratureAPI tempAPI = new TempaeratureAPI();
   List<HashMap<String, String>> tempList = tempAPI.getTemperature();
   List<HashMap<String, String>> weatherList = weatherAPI.getWeather();
   String tempMin[] ={
         tempList.get(0).get("taMin3"),
         tempList.get(1).get("taMin3"),
         tempList.get(2).get("taMin3"),
         tempList.get(3).get("taMin3"),
         tempList.get(4).get("taMin3"),
         tempList.get(5).get("taMin3"),
         tempList.get(6).get("taMin3"),
         tempList.get(7).get("taMin3"),
         tempList.get(8).get("taMin3"),
         tempList.get(9).get("taMin3")
   };
   

   
   String tempMax[] = {
         tempList.get(0).get("taMax3"),
         tempList.get(1).get("taMax3"),
         tempList.get(2).get("taMax3"),
         tempList.get(3).get("taMax3"),
         tempList.get(4).get("taMax3"),
         tempList.get(5).get("taMax3"),
         tempList.get(6).get("taMax3"),
         tempList.get(7).get("taMax3"),
         tempList.get(8).get("taMax3"),
         tempList.get(9).get("taMax3"),
   };

   
   String amWeather[] = {
         weatherList.get(0).get("wf3Am"),
         weatherList.get(1).get("wf3Am"),
         weatherList.get(2).get("wf3Am"),
         weatherList.get(3).get("wf3Am"),
         weatherList.get(4).get("wf3Am"),
         weatherList.get(5).get("wf3Am"),
         weatherList.get(6).get("wf3Am"),
         weatherList.get(7).get("wf3Am"),
         weatherList.get(8).get("wf3Am")
   };
   
   String pmWeather[] = {
         weatherList.get(0).get("wf3Pm"),
         weatherList.get(1).get("wf3Pm"),
         weatherList.get(2).get("wf3Pm"),
         weatherList.get(3).get("wf3Pm"),
         weatherList.get(4).get("wf3Pm"),
         weatherList.get(5).get("wf3Pm"),
         weatherList.get(6).get("wf3Pm"),
         weatherList.get(7).get("wf3Pm"),
         weatherList.get(8).get("wf3Pm")
   };
   
   

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Daum 지도 시작하기</title>
</head>
<body>
   
   <div id="map" style="width: 1000px; height: 1200px;"></div>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=key%>"></script>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=key%>&libraries=LIBRARY"></script>
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script>

       //locations는 daum.maps.LatLng객체들이 담길 배열
       //markers는 locations를 기준으로 생성된 daum.maps.Marker객체들의 배열
       //LatLng는 lat와 lng를 담고있는 배열
       var locations = [],
           markers = [],
           LatLngs = [[37.56667, 127.6358], [37.487935, 126.857758], [37.757687, 128.873749], [37.348326 , 127.928925], [35.194012, 128.101959],
               [37.885693, 127.733917], [36.820279, 127.10495], [36.650793, 127.478485], [35.860118 , 128.563385], [33.33, 126.712189 ]],            
           weather = [<%for(int i = 0; i < 9; i++) { if(i != 0) {%>, <%}%>['<%=amWeather[i]%>', '<%=pmWeather[i]%>']<%}%>, [null, null]],
           Tempaerature = [<%for(int i = 0; i < 10; i++) { if(i != 0) {%>, <%}%>['<%=tempMin[i]%>', '<%=tempMax[i]%>']<%}%>,];
       
   
       //[[lat, lng], [lat, lng]] 좌표배열([lat, lng])을 담고있는 배열들을
       //daum.maps.LatLng객체로 변환후 locations에 추가
       //$.each 는 jquery foreach문
       //$.each(array, function) array를 function에 맞게 처리
       //function(i, v) 에서 i는 index v는 value
       $.each(LatLngs, function(i, v) {
           locations.push(new daum.maps.LatLng(v[0], v[1]))
       });
   
       //daum.maps.Map(맵을 추가할 div, 맵의 상세설정)
       //$('#map')의 0번 순수 자바스크립트 객체 가져오기
       //markers[0] = new daum.maps.LatLng(36.2683, 127.6358)
       var map = new daum.maps.Map($('#map')[0], {
           center : locations[0], // 지도의 중심좌표
           level : 13
           // 지도의 확대 레벨
       });
   
       //locations를 이용해서 daum.maps.Marker객체들을 만들어서 markers에 담기
       $.each(locations, function(i, v) {
           markers.push(new daum.maps.Marker({
               position : v
           }));
       });
   
       //markers에있는 daum.maps.Marker객체들의 daum.maps.Map을 설정
       //마커가 있을 지도를 설정
       $.each(markers, function(i, v) { v.setMap(map) });
   
       //daum.maps.InfoWindow객체들이 담길 배열
       var infoWindows = [];
       daum.maps.event.addListener(map, 'zoom_changed', function() {
   
           // 지도의 현재 레벨을 얻어옵니다
           if(this.getLevel() == 10) {
   
               // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
   
               //locations는 daum.maps.LatLng객체들이 담길 배열
               $.each(locations, function(i, v) {
   
                   //infoWindow를 설정
                   //content는 구조
                   //position은 위치(daum.maps.LatLng)
                   //removable은 닫기 버튼의 존재여부
                   console.log(i);

                   var infoWindow = new daum.maps.InfoWindow({
                       content : '<div style="padding:5px;"><p style="font-size:3px;">오전 : '+weather[i][0]+' 최저 기온 :'+Tempaerature[i][0]+' <br>오후 : '+weather[i][1]+' 최고 기온 : '+Tempaerature[i][1]+'</p></div>',
                       position : v,
                       removable : true
                   });
                   
                   //map의 markers[i] 마커에 infoWindow를 띄우기
                   infoWindow.open(map, markers[i]);
   
                   //맵을 축소시 infoWindow를 닫기 위해 infoWindows에 담아둠
                   infoWindows.push(infoWindow);
   
               });
   
           }else if(infoWindows.length > 0) {
   
               //infoWindows를 전부 닫기
               $.each(infoWindows, function(i, v) { v.close(); })
   
           } //else if() end
   
       }); //daum.maps.event.addListener() end

</script>
</body>
</html>