<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                   <li class="active"><a id="chatRoom" href="chat.do">채팅방<span class="sr-only"></span></a></li>
                   <!--userID,nickName-->
                   
                   <li class="active"><a href="http://vpa.danbee.Ai/#/chats?chatbotId=054d0e31-3af2-4e4e-a930-8fa4462da027">서비스 센터<span class="sr-only"></span></a></li>
                   <!--userID,nickName-->
                   <li class="active"><a href="contentList.do">컨텐츠 리스트<span class="sr-only"></span></a></li>
                   <li class="active"><a href="tripBoard.do">게시판<span class="sr-only"></span></a></li>     
                   <li class="active"><a href="festivalMap.do">축제 지도</a><span class="sr-only"></span></li>
                   <li class="active"><a href="weatherMap.do">날씨 지도</a><span class="sr-only"></span></li>
                      <!--로그인 시에만 보이게 처리(userID,nickName)-->
                   </ul>
                   
                <ul class="nav navbar-nav navbar-right">   
                  <c:if test="${user == null}">
                  <li class="active"><a href="#" class="login">로그인<span class="sr-only"></span></a></li>
                     <!--javascript써서 로그인폼 띄우기-->
                  <li class="active"><a href="createUserForm.do">회원가입<span class="sr-only"></span></a></li>
                  </c:if>
                  <c:if test="${user != null }">
                  <li class="active"><a href="myPage.do">마이페이지<span class="sr-only"></span></a></li>
                  <li class="active"><a href="logout.do">로그아웃<span class="sr-only"></span></a></li>
                     <%-- ${user.userID }, 
                     ${user.nickname }, 
                     ${user.regDate } --%>
                  </c:if>
                </ul>   
          </div>
      </div>
</div>




<script>
	$("#chatRoom").click(function(e){
		<%if(session.getAttribute("user") == null) {%>
			e.preventDefault();
			alert("로그인 후 입장해주세요.");
		<%}%>
	});
</script>