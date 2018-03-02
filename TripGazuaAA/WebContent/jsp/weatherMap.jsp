<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Daum 지도 시작하기</title>
    <link rel="stylesheet"
          href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
          <meta name="google-signin-client_id"
	content="346120053180-l6r9r2hq1sknebtp2ukd6mtoea688dhl.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/loginBox.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>
<p>조회기간:
    <input type="text" id="datepicker1">
</p>
<div id="map" style="width: 1000px; height: 1200px;"></div>
<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d78e61bdb96cf13e612f9908e948d0"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d78e61bdb96cf13e612f9908e948d0&libraries=LIBRARY"></script>
<script
        src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
    //최소 날짜를 오늘 부터 선택가능하게 말한다.
    var minDate = new Date;


    function calDateRange(val1, val2)
    {
        var FORMAT = "-";

        // FORMAT을 포함한 길이 체크

        if (val1.length != 10 || val2.length != 10)
            return null;

        // FORMAT이 있는지 체크
        if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
            return null;


        // 년도, 월, 일로 분리
        var start_dt = val1.split(FORMAT);
        var end_dt = val2.split(FORMAT);

        // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
        // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
        start_dt[1] = (Number(start_dt[1]) - 1) + "";
        end_dt[1] = (Number(end_dt[1]) - 1) + "";



        var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
        var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);



        return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
    }



    var date =$.datepicker.formatDate('yy-mm-dd', new Date());


    var gap = 3;

    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        minDate : minDate,
        maxDate : "+10d",

        onSelect: function(dateText) {
            weaherJson();
          gap =calDateRange(date,$(this).val());


        }

    });

    $(function() {
        $("#datepicker1").datepicker();
    });

</script>
<script>

    //locations는 daum.maps.LatLng객체들이 담길 배열
    //markers는 locations를 기준으로 생성된 daum.maps.Marker객체들의 배열
    //LatLng는 lat와 lng를 담고있는 배열
    var locations = [],
        markers = [],
        LatLngs = [[37.56667, 127.6358], [37.487935, 126.857758], [37.757687, 128.873749], [37.348326 , 127.928925], [35.194012, 128.101959],
            [37.885693, 127.733917], [36.820279, 127.10495], [36.650793, 127.478485], [35.860118 , 128.563385], [33.33, 126.712189 ]],
        weather;
    //[{"taMax3":"2","taMin3":"-7","wf3Am":"구름조금","wf3Pm":"구름조금"},{"taMax3":"3","taMin3":"-4","wf3Am":"구름조금","wf3Pm":"구름조금"},{"taMax3":"3","taMin3":"-9","wf3Am":"구름조금","wf3Pm":"구름조금"},{"taMax3":"3","taMin3":"-5","wf3Am":"구름조금","wf3Pm":"구름조금"},{"taMax3":"4","taMin3":"-5","wf3Am":"구름조금","wf3Pm":"구름조금"},{"taMax3":"6","taMin3":"-4","wf3Am":"구름많음","wf3Pm":"구름많음"},{"taMax3":"4","taMin3":"-5","wf3Am":"구름많음","wf3Pm":"구름많음"},{"taMax3":"6","taMin3":"-4","wf3Am":"구름많음","wf3Pm":"구름많음"},{"taMax3":"8","taMin3":"-2","wf3Am":"구름많음","wf3Pm":"구름많음"},{"taMax3":"6","taMin3":"2","wf3Am":"구름많고 비/눈","wf3Pm":"구름많음"}];



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

    weaherJson();
    function weaherJson() {
        $.ajax('../ajax/weather'+gap+'.json' ,{
            success: function (json) {
                weather = json;
                console.log(weather);
                showInfoWindow();
            },
            error: function (err) {
                console.log(err);
            }

        });
    }

    daum.maps.event.addListener(map, 'zoom_changed', showInfoWindow);

    //daum.maps.InfoWindow객체들이 담길 배열
    var infoWindows = [];

    function showInfoWindow() {

        // 지도의 현재 레벨을 얻어옵니다
        if(map.getLevel() == 10){
            // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            //locations는 daum.maps.LatLng객체들이 담길 배열


            $.each(locations, function(i, v) {
                //infoWindow를 설정
                //content는 구조
                //position은 위치(daum.maps.LatLng)
                //removable은 닫기 버튼의 존재여부

                if(gap >6){
                    var infoWindow = new daum.maps.InfoWindow({
                        content : '<div style="padding:5px;"><p style="font-size:3px;">날씨 : '+weather[i].wf+' 최저 기온 :'+weather[i].taMin+' <br> 최고 기온 : '+weather[i].taMax+'</p></div>',
                        position : v,
                        removable : true
                    });
                }
                else{
                    var infoWindow = new daum.maps.InfoWindow({
                        content : '<div style="padding:5px;"><p style="font-size:3px;">오전 : '+weather[i].wfAm+' 최저 기온 :'+weather[i].taMin+' <br>오후 : '+weather[i].wfPm+' 최고 기온 : '+weather[i].taMax+'</p></div>',
                        position : v,
                        removable : true
                    });
                }


                //map의 markersi] 마커에 infoWindow를 띄우기
                infoWindow.open(map, markers[i]);

                //맵을 축소시 infoWindow를 닫기 위해 infoWindows에 담아둠
                infoWindows.push(infoWindow);

            });

        }else if(infoWindows.length > 0) {

            //infoWindows를 전부 닫기
            $.each(infoWindows, function(i, v) { v.close(); })

        } //else if() end
    }

</script>

</body>
</html>