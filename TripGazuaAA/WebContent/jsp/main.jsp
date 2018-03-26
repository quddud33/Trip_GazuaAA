<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-signin-client_id"
	content="346120053180-l6r9r2hq1sknebtp2ukd6mtoea688dhl.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/loginBox.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/map.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/wheatherMap.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.7.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d78e61bdb96cf13e612f9908e948d0&libraries=clusterer"></script>

<title>Insert title here</title>
<style>
.top_list {
	margin: 30px auto;
	width: 65%;
}

.top_list figcaption {
	height: 40px;
	overflow: hidden;
	text-overflow: ellipsis;
}
.weather{
	display: block;
	width: 250px; 
	margin: auto;
}

#remocon {
	position: fixed;
	top: 80%;
	right: 2%;
	width: 30px;
}

#scrollUp {
	display: none;
}


</style>
<!-- script>
"undefined" == typeof CODE_LIVE && (!function(e) {
		var t = {
				nonSecure : "8080",
				secure : "8080"
			},
			c = {
				nonSecure : "http://",
				secure : "https://"
			},
			r = {
				nonSecure : "127.0.0.1",
				secure : "gapdebug.local.genuitec.com"
			},
			n = "https:" === window.location.protocol ? "secure" : "nonSecure";
		script = e.createElement("script"), script.type = "text/javascript", script.async = !0, script.src = c[n] + r[n] + ":" + t[n] + "/codelive-assets/bundle.js", e.getElementsByTagName("head")[0].appendChild(script)
	}(document), CODE_LIVE = !0);
</script-->
</head>
<body>
	
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>

	
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
		<li data-target="#myCarousel" data-slide-to="4"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<a href="contentView.do?name=가평펜션축제%202018&contentid=2531711&contenttypeid=15&price="><img src="http://tong.visitkorea.or.kr/cms/resource/10/2531710_image2_1.jpg" style="width:100%; height:600px;" alt="First slide"></a>
			<div class="container">
				<div class="carousel-caption">
					<h1>가평펜션축제</h1>
					<p>경기도 가평군 가평읍 북한강변로 360-69</p>
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<a href="contentView.do?name=강릉%20하트불꽃크루즈%202018&contentid=2494459&contenttypeid=15&price="><img src="http://tong.visitkorea.or.kr/cms/resource/29/2530329_image2_1.jpg" style="width:100%; height:600px;" data-src="" alt="Second slide"></a>
			<div class="container">
				<div class="carousel-caption">
					<h1>강릉 하트불꽃크루즈 2018</h1>
					<p>강원도 강릉시 주문진읍 해안로 1730</p>
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<a href="contentView.do?name=강원국제비엔날레%202018&contentid=2516849&contenttypeid=15&price="><img src="http://tong.visitkorea.or.kr/cms/resource/20/2536120_image2_1.jpg" style="width:100%; height:600px;" data-src="" alt="Third slide"></a>
			<div class="container">
				<div class="carousel-caption">
					<h1>강원국제비엔날레 2018</h1>
					<p>강원도 강릉시 난설헌로 131</p>
				</div>
			</div>
		</div>
		<!--슬라이드3-->
		
		<!--슬라이드4-->
		<div class="item"> 
			<a href="contentView.do?name=강화도%20빙어%20송어%20축제%202018&contentid=1964700&contenttypeid=15&price="><img src="http://tong.visitkorea.or.kr/cms/resource/91/2513891_image2_1.JPG" style="width:100%; height:600px;" data-src="" alt="Third slide"></a>
			<div class="container">
				<div class="carousel-caption">
					<h1>강화도 송어 빙어 축제 2018</h1>
					<p>인천광역시 강화군 양도면 중앙로787번길 8-2</p>
				</div>
			</div>
		</div>
		<!--슬라이드4-->  
		
		
		
		<!--슬라이드5-->
		<div class="item"> 
			<a href="contentView.do?name=경주%20프리마켓%20봉황장터%202018&contentid=2505702&content  typeid=15&price="><img src="http://tong.visitkorea.or.kr/cms/resource/94/2505694_image2_1.jpg" style="width:100%; height:600px;"  data-src="" alt="Third slide"></a>
			<div class="container">
				<div class="carousel-caption">
					<h1>경주 프리마켓 봉황장터 2018</h1>
					<p>경상북도 경주시 노동동</p>
				</div>
			</div>
		</div>
		<!--슬라이드5-->
	</div>  
	
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
	</div>
	<!-- 이미지슬라이드 끝~ -->
	
		<!-- 날씨시작 -->
<div class="weather">
	<div id="m-booked-weather-bl250-23368" >
		<div class="booked-wzs-250-175 weather-customize"
			style="background-color: #2b91ff; width: 250px;" id="width1">
			<div class="booked-wzs-250-175_in">
				<div class="booked-wzs-250-175-data">
					<div class="booked-wzs-250-175-left-img wrz-22">
						<a target="_blank" href="http://www.booked.net/"> <img
							src="//s.bookcdn.com/images/letter/logo.gif"
							alt="http://www.booked.net/" />
						</a>
					</div>
					<div class="booked-wzs-250-175-right">
						<div class="booked-wzs-day-deck">
							<div class="booked-wzs-day-val">
								<div class="booked-wzs-day-number">
									<span class="plus">+</span>8
								</div>
								<div class="booked-wzs-day-dergee">
									<div class="booked-wzs-day-dergee-val">&deg;</div>
									<div class="booked-wzs-day-dergee-name">C</div>
								</div>
							</div>
							<div class="booked-wzs-day">
								<div class="booked-wzs-day-d">
									H: <span class="plus">+</span>8&deg;
								</div>
								<div class="booked-wzs-day-n">
									L: <span class="plus">+</span>1&deg;
								</div>
							</div>
						</div>
						<div class="booked-wzs-250-175-info">
							<div class="booked-wzs-250-175-city">서울특별시</div>
							<div class="booked-wzs-250-175-date">수요일, 07 3월</div>
							<div class="booked-wzs-left">
								<span class="booked-wzs-bottom-l">7일 예보 보기</span>
							</div>
						</div>
					</div>
				</div>
				<a target="_blank" href="http://booked.kr/weather/seoul-18406">
					<table cellpadding="0" cellspacing="0" class="booked-wzs-table-250">
						<tr>
							<td>목</td>
							<td>금</td>
							<td>토</td>
							<td>일</td>
							<td>월</td>
							<td>화</td>
						</tr>
						<tr>
							<td class="week-day-ico"><div class="wrz-sml wrzs-22"></div></td>
							<td class="week-day-ico"><div class="wrz-sml wrzs-01"></div></td>
							<td class="week-day-ico"><div class="wrz-sml wrzs-01"></div></td>
							<td class="week-day-ico"><div class="wrz-sml wrzs-22"></div></td>
							<td class="week-day-ico"><div class="wrz-sml wrzs-22"></div></td>
							<td class="week-day-ico"><div class="wrz-sml wrzs-18"></div></td>
						</tr>
						<tr>
							<td class="week-day-val"><span class="plus">+</span>8&deg;</td>
							<td class="week-day-val"><span class="plus">+</span>7&deg;</td>
							<td class="week-day-val"><span class="plus">+</span>8&deg;</td>
							<td class="week-day-val"><span class="plus">+</span>7&deg;</td>
							<td class="week-day-val"><span class="plus">+</span>10&deg;</td>
							<td class="week-day-val"><span class="plus">+</span>15&deg;</td>
						</tr>
						<tr>
							<td class="week-day-val">-3&deg;</td>
							<td class="week-day-val">-8&deg;</td>
							<td class="week-day-val">-9&deg;</td>
							<td class="week-day-val">-5&deg;</td>
							<td class="week-day-val"><span class="plus">+</span>1&deg;</td>
							<td class="week-day-val">0&deg;</td>
						</tr>
					</table>
				</a>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript"> var css_file=document.createElement("link"); css_file.setAttribute("rel","stylesheet"); css_file.setAttribute("type","text/css"); css_file.setAttribute("href",'https://s.bookcdn.com/css/w/booked-wzs-widget-275.css?v=0.0.1'); document.getElementsByTagName("head")[0].appendChild(css_file); function setWidgetData(data) { if(typeof(data) != 'undefined' && data.results.length > 0) { for(var i = 0; i < data.results.length; ++i) { var objMainBlock = document.getElementById('m-booked-weather-bl250-23368'); if(objMainBlock !== null) { var copyBlock = document.getElementById('m-bookew-weather-copy-'+data.results[i].widget_type); objMainBlock.innerHTML = data.results[i].html_code; if(copyBlock !== null) objMainBlock.appendChild(copyBlock); } } } else { alert('data=undefined||data.results is empty'); } } </script>
	<script type="text/javascript" charset="UTF-8"
		src="https://widgets.booked.net/weather/info?action=get_weather_info&ver=6&cityID=18406&type=3&scode=124&ltid=3457&domid=593&anc_id=41253&cmetric=1&wlangID=24&color=2b91ff&wwidth=250&header_color=ffffff&text_color=333333&link_color=08488D&border_form=1&footer_color=ffffff&footer_text_color=333333&transparent=0"></script>
	<!-- 날씨끝 -->
	
	<!-- 검색기능 시작 -->
	<div id="textSearchForm" style="width:60%;height :70px; margin: auto; margin-top: 10px;background-color: #F5F5F5; border-radius:9px;">
		<form action="contentList.do" onsubmit="showSearchTest()" class="form-inline md-form form-sm" style="text-align: center;
    line-height: 70px;">
			<select name="contentTypeId" class="form-control" title="종류">
				<option value="32">숙박 </option>
				<option value="12">관광지</option>
				<option value="15">행사/축제</option>
				<option value="39">맛집</option>
				<option value="28">레포츠</option>
			</select>
			<select name="areaCode" class="form-control" title="지역">
				<option value="">전체</option>
				<option value="1">서울</option>
				<option value="2">인천</option>
				<option value="3">대전</option>
				<option value="4">대구</option>
				<option value="5">광주</option>
				<option value="7">부산</option>
				<option value="8">울산</option>
			</select>
			<input type="text" class="form-control form-control-sm mr-3 w-75" name="search" placeholder="Search" aria-label="Search" title="검색"/>
			<button class="btn btn-default btn-sm my-0" title="검색">검색</button>
		</form>
		</div>
	<!-- 검색기능 끝 -->

	<div class="top_list container">
		<center><h2 style="margin-bottom: 30px">축제 Top 6</h2></center><!-- 12, 14, 15, 28 -->
		<c:forEach var="topListFestival" items="${topListFestival }" >
			<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter">
			<figure>
                <c:if test="${topListFestival.firstimage ne null}">
                	                	<a href="contentView.do?name=${topListFestival.title }&contentid=${topListFestival.contentid}&contenttypeid=${topListFestival.contenttypeid }&price="><img src="${topListFestival.firstimage }" class="img-responsive" style="width: 250px; height: 200px;"></a>
                </c:if>
                <c:if test="${topListFestival.firstimage eq null}">
                	<img src="/trip_GazuaAA/img/no.png" class="img-responsive" style="width: 250px; height: 200px;">
                </c:if>
                <figcaption>${topListFestival.overview }</figcaption>
                </figure>
                ${topListFestival }
                </div>
         </c:forEach>
	</div>
	
	
	<div class="top_list container">
		<center><h2 style="margin-bottom: 30px">숙박 Top 6</h2></center>
	
		<c:forEach var="topListCountry" items="${topListCountry }" >
		
		<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter">
			<figure>
                <c:if test="${topListCountry.firstimage ne null}">
                	<a href="contentView.do?name=${topListCountry.title }&contentid=${topListCountry.contentid}&contenttypeid=${topListCountry.contenttypeid }&price=${topListCountry.price}"><img src="${topListCountry.firstimage }" class="img-responsive" style="width: 250px; height: 200px;"></a>
           
                </c:if>
                <c:if test="${topListCountry.firstimage eq null}">
                	<img src="/trip_GazuaAA/img/no.png" class="img-responsive" style="width: 250px; height: 200px;">
                </c:if>
                <figcaption> ${topListCountry.overview }</figcaption>
           </figure>
      	 </div>
         </c:forEach>
	</div> 
	
	<div class="top_list container">
		<center><h2 style="margin-bottom: 30px">음식점 Top 6</h2></center>
		<c:forEach var="topListRestaurant" items="${topListRestaurant }" >
			<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter">
				<figure>
                <c:if test="${topListRestaurant.firstimage ne null}">
                	<a href="contentView.do?name=${topListRestaurant.title }&contentid=${topListRestaurant.contentid}&contenttypeid=${topListRestaurant.contenttypeid }&price="><img src="${topListRestaurant.firstimage }" class="img-responsive" style="width: 250px; height: 200px;"></a>
                </c:if>
                <c:if test="${topListRestaurant.firstimage eq null}">
                	<img src="/trip_GazuaAA/img/no.png" class="img-responsive" style="width: 250px; height: 200px;">
                </c:if>
                <figcaption>${topListRestaurant.contentid }</figcaption>
                </figure>
            </div>
         </c:forEach>
	</div>
	
	
	<%-- <table border="1">
		<c:forEach var="topListFestival" items="${topListFestival }"><!-- 12, 14, 15, 28 -->
			<tr>
				<th>${topListFestival.contentid}</th>
				<th>${topListFestival.contenttypeid}</th>
				<th>${topListFestival.title }</th>
				<th>${topListFestival.addr1 }</th>
				<th><img src="${topListFestival.firstimage }" style="width: 300px; height: 250px"></th>
			</tr>
		</c:forEach>
			<c:forEach var="topListCountry" items="${topListCountry }"><!-- 숙박 32-->
			<tr>
				<th>${topListCountry.contentid}</th>
				<th>${topListCountry.contenttypeid}</th>
				<th>${topListCountry.title }</th>
				<th>${topListCountry.addr1 }</th>
				<th><img src="${topListCountry.firstimage }" style="width: 300px; height: 250px"></th>
			</tr>
		</c:forEach>
			<c:forEach var="topListRestaurant" items="${topListRestaurant }"><!-- 39 음식점 -->
			<tr>
				<th>${topListRestaurant.contentid}</th>
				<th>${topListRestaurant.contenttypeid}</th>
				<th>${topListRestaurant.title}</th>
				<th>${topListRestaurant.addr1}</th>
				<th><img src="${topListRestaurant.firstimage }" style="width: 300px; height: 250px"></th>
			</tr>
		</c:forEach>
	</table>  --%>
	<div id="modalBg">
		<div id="modalPanel">
			<div id="mapList">
				<span>금색: <input id="festivalSearchBox"></span>
				<ol></ol>
			</div>
			<div id="map"></div>
		</div>
	</div>
	<script>$(function(){$('#mapScroll').trigger('click')})</script>
<div id="remocon">
	<table>
		<tr>
			<td><button id="scrollUp" class="btn btn-primary"><i class="fa fa-angle-up"></i></button></td>
		</tr>
		<tr>
			<td><button id="mapScroll" class="btn btn-primary"><i class="fa fa-map-marker"></i></button></td>
		</tr>
	</table>
</div>

<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
	
	
	<!--<a href="logout.do">로그아웃</a> 로그인시 태그 생성하게 처리-->

	<%if(session.getAttribute("msg") != null) {%>
		<script>
			alert('${msg}');
		</script>
	<%session.removeAttribute("msg");}%>
	

	<script src="http://underscorejs.org/underscore-min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
	<script src="/trip_GazuaAA/js/map.js"></script>
	<script src="/trip_GazuaAA/js/wheatherMap.js"></script>
	<script type="text/javascript">
		$("#scrollUp").click(function () {
	        $('html, body').animate({scrollTop : 0});
		});
		$(window).scroll(function () {
			var height = $(document).scrollTop();
			
			if(height >= $('html').height()){
				$('#scrollUp').css('display', 'block');
			} else { 
				$('#scrollUp').css('display', 'none'); 
			}
		});
	</script>
</body>
</html>