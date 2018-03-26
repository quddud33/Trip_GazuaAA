<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	  <nav class="navbar navbar-inverse navv">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="main.do">TripGazuAA</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="li"><a id="chatRoom" href="chat.do">채팅방</a></li>
                    <li class="li"><a href="http://vpa.danbee.Ai/#/chats?chatbotId=054d0e31-3af2-4e4e-a930-8fa4462da027" target="_blank">서비스 센터</a></li>
                    <li class="li"><a href="contentList.do">컨텐츠 리스트</a></li>
                    <li class="li"><a href="tripBoard.do">게시판</a></li>
                    <li class="li"><a href="festivalMap.do">축제 지도</a></li>
                    <li class="li"><a href="weatherMap.do">날씨 지도</a></li>
                </ul>
	
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${user == null}">
						<li class="li"><a href="#" class="login"><i class="fa fa-user"></i> 로그인하세요</a></li>
						<!--javascript써서 로그인폼 띄우기-->
						<li class="li"><a href="createUserForm.do">회원가입</a></li>
					</c:if>
					<c:if test="${user != null }">
						<li class="li"><a href="myPage.do"><i class="fa fa-user"></i>${user.nickname }님</a></li>
						<li class="li"><a href="logout.do">로그아웃</a></li>
	
					</c:if>
				</ul>
			</div>
		</div>
	</nav>



<script>
	$("#chatRoom").click(function(e){
		<%if(session.getAttribute("user") == null) {%>
			e.preventDefault();
			alert("로그인 후 입장해주세요.");
		<%}%>
	});
</script>