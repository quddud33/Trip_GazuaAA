<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../Bootstrap/css/nav.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		.jumbotron{
				text-shadow: black 0.2em 0.2em 0.2em;
				background-image:  url('imgs/mainjumbotron.jpg');
				background-size: cover;
				color: white;
				
			}
		
        #bg {
            width:100%;
            height:100%;
            position:fixed;
            left:0;
            top:0;
            background-color: rgba(0,0,0,.7);
            display: none;
        }

        #loginBox {
            width:400px;
            height:300px;
            position:absolute;
            left:50%;
            top:50%;
            margin:-150px 0 0 -200px;
            background: #fff;
        }
        .title {
            text-align: center;
            color:#03A9F4;
        }
        #loginBox dt {
            text-indent: 10px;
            margin:5px;
            font-size:21px;
            color:#29B6F6;
        }
        #loginBox dd {
            text-indent: 10px;
            margin:5px;
        }

</style>
</head>

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
			 			<li class="active"><a href="myPage.do">마이페이지<span class="sr-only"></span></a></li>
			 				<!--로그인 시에만 보이게 처리(userID,nickName)-->
						<c:if test="${user == null}">
						<li class="active"><a href="#" class="login">로그인<span class="sr-only"></span></a></li>
							<!--javascript써서 로그인폼 띄우기-->
						<li class="active"><a href="createUserForm.do">회원가입<span class="sr-only"></span></a></li>
						</c:if>
						<c:if test="${user != null }">
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
	
	<table border="1">
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
	</table> 

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

				</dl>
			</div>
		</div>
	</form>
	<%if(session.getAttribute("msg") != null) {%>
		<script>
			alert('${msg}');
		</script>
	<%session.removeAttribute("msg");}%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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