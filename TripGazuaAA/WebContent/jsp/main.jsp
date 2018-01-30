<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

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
<body>
	<a href="chat.do">채팅방</a>
	<!--userID,nickName-->
	<a href="serviceCenter.do">서비스 센터</a>
	<!--userID,nickName-->
	<a href="locationView.do">지도/컨텐츠 리스트</a>
	<a href="myPage.do">마이페이지</a>
	<!--로그인 시에만 보이게 처리(userID,nickName)-->
	<a href="#" class="login">로그인</a>
	<!--javascript써서 로그인폼 뛰우기-->
	<a href="createUserForm.do">회원가입</a>
<%=session.getAttribute("userID") %>
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