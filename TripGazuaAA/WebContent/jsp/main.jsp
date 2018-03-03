
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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

</style>
<script>
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
</script>
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
			<img src="http://tong.visitkorea.or.kr/cms/resource/10/2531710_image2_1.jpg" style="width:100%; height:600px;" alt="First slide">
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
			<img src="http://tong.visitkorea.or.kr/cms/resource/29/2530329_image2_1.jpg" style="width:100%; height:600px;" data-src="" alt="Second slide">
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
			<img src="http://tong.visitkorea.or.kr/cms/resource/20/2536120_image2_1.jpg" style="width:100%; height:600px;" data-src="" alt="Third slide">
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
			<img src="http://tong.visitkorea.or.kr/cms/resource/91/2513891_image2_1.JPG" style="width:100%; height:600px;" data-src="" alt="Third slide">
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
			<img src="http://tong.visitkorea.or.kr/cms/resource/94/2505694_image2_1.jpg" style="width:100%; height:600px;"  data-src="" alt="Third slide">
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
	<div class="top_list container">
		<center><h2 style="margin-bottom: 30px">축제 Top 6</h2></center><!-- 12, 14, 15, 28 -->
		<c:forEach var="topListFestival" items="${topListFestival }" >
			<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter">
			<figure>
                <c:if test="${topListFestival.firstimage ne null}">
                	<img src="${topListFestival.firstimage }" class="img-responsive" style="width: 250px; height: 200px;">
                </c:if>
                <c:if test="${topListFestival.firstimage eq null}">
                	<img src="/trip_GazuaAA/img/no.png" class="img-responsive" style="width: 250px; height: 200px;">
                </c:if>
                <figcaption>${topListFestival.overview }</figcaption>
                </figure>
                </div>
         </c:forEach>
	</div>
	
	
	<div class="top_list container">
		<center><h2 style="margin-bottom: 30px">숙박 Top 6</h2></center>
		<c:forEach var="topListCountry" items="${topListCountry }" >
		<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter">
			<figure>
                <c:if test="${topListCountry.firstimage ne null}">
                	<img src="${topListCountry.firstimage }" class="img-responsive" style="width: 250px; height: 200px;">
                </c:if>
                <c:if test="${topListCountry.firstimage eq null}">
                	<img src="/trip_GazuaAA/img/no.png" class="img-responsive" style="width: 250px; height: 200px;">
                </c:if>
                <figcaption>${topListCountry.overview }</figcaption>
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
                	<img src="${topListRestaurant.firstimage }" class="img-responsive" style="width: 250px; height: 200px;">
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



<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
	
	
	<!--<a href="logout.do">로그아웃</a> 로그인시 태그 생성하게 처리-->

	<%if(session.getAttribute("msg") != null) {%>
		<script>
			alert('${msg}');
		</script>
	<%session.removeAttribute("msg");}%>
	

	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
</body>
</html>