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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Insert title here</title>
<style>
#bg {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	background-color: rgba(0, 0, 0, .7);
	display: none;
}

#loginBox {
	width: 400px;
	height: 400px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -150px 0 0 -200px;
	background: #fff;
}

.title {
	text-align: center;
	color: #03A9F4;
}

#loginBox dt {
	text-indent: 10px;
	margin: 5px;
	font-size: 21px;
	color: #29B6F6;
}

#loginBox dd {
	text-indent: 10px;
	margin: 5px;
}

#myCarousel {
	margin: 60px 0;
}

.lBtn {
	width: 250px;
	cursor: pointer;
}

.port-image {
	width: 100%;
}

.gallery_product {
	margin-bottom: 30px;
}

.top_list {
	margin: 30px auto;
	width: 65%;
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
	<div class ="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapsed"
					data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.do" >Trip_GazuaAA</a>
			 </div>
			 <div class="colapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
			 		<ul class="nav navbar-nav">
			 			<li class="active"><a href="chat.do">채팅방<span class="sr-only"></span></a></li>
			 			<!--userID,nickName-->
			 			
			 			<li class="active"><a href="http://vpa.danbee.Ai/#/chats?chatbotId=054d0e31-3af2-4e4e-a930-8fa4462da027">서비스 센터<span class="sr-only"></span></a></li>
			 			<!--userID,nickName-->
			 			<li class="active"><a href="contentList.do">컨텐츠 리스트<span class="sr-only"></span></a></li>
			 			<li class="active"><a href="tripBoard.do">게시판<span class="sr-only"></span></a></li>
			 			
			 				<!--로그인 시에만 보이게 처리(userID,nickName)-->
			 			</ul>
			 			
			 		<ul class="nav navbar-nav navbar-right">	
						<c:if test="${ㄵㄴ == null}">
						<li class="active"><a href="#" class="login">로그인<span class="sr-only"></span></a></li>
							<!--javascript써서 로그인폼 띄우기-->
						<li class="active"><a href="createUserForm.do">회원가입<span class="sr-only"></span></a></li>
						</c:if>
						<c:if test="${user != null }">
						<li class="active"><a href="myPage.do">마이페이지<span class="sr-only"></span></a></li>
						<li class="active"><a href="logout.do">로그아웃<span class="sr-only"></span></a></li>
							${user.userID }, 
							${user.nickname }, 
							${user.regDate }
						</c:if>
			 		</ul>	
			 </div>
		</div>
	</div>
	
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
			<img src="http://tong.visitkorea.or.kr/cms/resource/00/2522700_image2_1.jpeg" style="width:100%; height:600px;" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 1</h1>
					<p>텍스트 1</p>
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="http://tong.visitkorea.or.kr/cms/resource/10/2531710_image2_1.jpg" style="width:100%; height:600px;" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 2</h1>
					<p>텍스트 2</p>
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="http://tong.visitkorea.or.kr/cms/resource/29/2530329_image2_1.jpg" style="width:100%; height:600px;" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div>
		<!--슬라이드3-->
		
		<!--슬라이드4-->
		<div class="item"> 
			<img src="http://tong.visitkorea.or.kr/cms/resource/52/2535452_image2_1.JPG" style="width:100%; height:600px;" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div>
		<!--슬라이드4-->
		
		
		
		<!--슬라이드5-->
		<div class="item"> 
			<img src="http://tong.visitkorea.or.kr/cms/resource/47/2516847_image2_1.jpg" style="width:100%; height:600px;"  data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
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
                <img src="${topListFestival.firstimage }" class="img-responsive">
            </div>
         </c:forEach>
	</div>
	
	
	<!-- 잠깐오류 -->
	<%-- <div class="top_list container">
		<center><h2 style="margin-bottom: 30px">숙박 Top 6</h2></center>
		<c:forEach var="topListCountry" items="${topListCountry }" >
			<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter">
                <img src="${topListCountry.firstimage }" class="img-responsive">
            </div>
         </c:forEach>
	</div>
	
	<div class="top_list container">
		<center><h2 style="margin-bottom: 30px">음식점 Top 6</h2></center>
		<c:forEach var="topListRestaurant" items="${topListRestaurant }" >
			<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter">
                <img src="${topListRestaurant.firstimage }" class="img-responsive">
            </div>
         </c:forEach>
	</div> --%>
	
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

<!-- 201802021 임현준 스타트 -->
	
	
	<!--<a href="logout.do">로그아웃</a> 로그인시 태그 생성하게 처리-->

	<form action="login.do">
		<div id="bg">
			<div id="loginBox">
				<h2 class="title">Trip GazuaAA</h2>
				<dl>

					<dd>
						<input type="text" name="userID" placeholder="아이디" />
					</dd>
					<dd>
						<input type="password" name="password" placeholder="비밀번호" />
					</dd>
					<dd>
						<button>로그인</button>
					</dd>
					<dd>
						<img class="lBtn" alt="네이버이미지" src="/trip_GazuaAA/img/네이버 아이디로 로그인_완성형_Green.PNG" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=rXNTEaBc1MiIpkex1vR5&state=STATE_STRING&redirect_uri=http://localhost:8080/trip_GazuaAA/naverLogin.do'"/>
					</dd>
					<dd>
						<div style="width: 250px; height: 54px;" class="lBtn g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
					</dd>
					<dd>
						<div scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button" data-width="250" data-height="54" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
					</dd>
				</dl>
			</div>
		</div>
	</form>
	<%if(session.getAttribute("msg") != null) {%>
		<script>
			alert('${msg}');
		</script>
	<%session.removeAttribute("msg");}%>
	
	<footer style ="background-color: #000000; color: #ffffff">
		<div class="container">
			<div class="row">
				<div class="col-sm-12" style ="text-align: center;"><h5>Copyright &copy; 2018</h5> <h5>강병영 임현준 정민섭 최유강 이한울</h5>
				</div>
			</div>
		</div>
	</footer>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
<script>
	$(".login").on("click", function(){
		$("#bg").css("display", "block");
	});
	
    $("#loginBox").on("click",function (e) {                                                              //상세정보를 보여주는 박스 클릭이벤트
	        e.stopPropagation();                                                                        //부모로의 이벤트 전파를 중지시킴 (이걸 하지 않을시 박스를 클릭했는데 뒷배경의 이벤트까지
	    });//click end                                                                                  //함께 발생하는일이 일어나게됨.
	    $("#bg").on("click",function () {                                                                    //뒷배경 박스 클릭이벤트
	        $("#bg").css("display","none");                                                                  //상세정보 창을 안보이게 변경
	    });//click end

</script>
</body>
</html>