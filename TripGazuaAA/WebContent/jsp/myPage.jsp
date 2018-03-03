<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<style>
.contentList{
   padding: 0 0 0 20px;
    width:750px;
    height:175px;
    background-color: #CFD8DC;
    border-radius: 20px;
    margin: 0 0 20px 0;
    position: relative;
}

.contentTitle{
    font-size: 30px;
    padding-left: 20px;
}

.contentTitle > p {
    white-space: nowrap; 
   height: 40px;
   overflow: hidden;
   text-overflow: ellipsis;
}

.contentImg {
   float: left;
}

.textBox {
   position: relative;
   padding: 0 0 0 10px;
   float: left;
   width: 75%;
}

.price {
   font-size: 32px;
   font-weight: 900;
   text-align: right;
}

.addr {
   position: absolute;
   top: 15px;
   left: 10px;
   font-size: 18px;
}

.view {
   background-color: skyblue;
   float: left;
   width: 150px;
   height: 40px;
   border: 1px solid #424242;
   line-height: 40px;
   text-align: center;
   position: absolute;
   right: 20px;
   bottom: 20px;
   cursor: pointer;
}

.view:hover {
   color: #AAA;
}

#content{
   margin-top: 25px;
   margin-bottom: 25px;
}

</style>
<title>Insert title here</title>
</head>
<body>
   <!-- 네비게이션 -->
   <%@ include file="../template/nav.jsp" %>
   
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">숙박업소</a></li>
    <li><a data-toggle="tab" href="#menu1">축제</a></li>
    <li><a data-toggle="tab" href="#menu2">음식점</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div id="content" class="container">   
      <c:forEach var="res" items="${reservation }">
           <div class="contentList">
               <div class="contentTitle">
                   <p><i class="fa fa-search"></i>${res.roomName }</p>
               </div>
                <img class="contentImg"
            <c:if test="${searchTest.firstimage ne null }">
            src = "${searchTest.firstimage }"
            </c:if>
            <c:if test="${searchTest.firstimage eq null }">
            src = "/trip_GazuaAA/img/no.png"
            </c:if>
            style="width:160px;height:100px;">
                
            <div class="textBox">
               <c:if test="${res.price } ne null}">
                  <div class="price">
                     ${res.price }원
                  </div>
               </c:if>
               <div class="addr">
                     ${res.startDate } "~"  ${res.endDate }
               </div>
            </div>
               <div class="view" onclick="location.href='contentView.do?contentid=${res.contentID }&contenttypeid=${res.contentTypeID }&price=${res.price }'">예약한 방 정보 보기</div>
           </div>
      </c:forEach>
</div>
    </div>
    <div id="menu1" class="tab-pane fade">
     <div id="content" class="container">   
      <c:forEach var="fes" items="${festval }">
           <div class="contentList">
               <div class="contentTitle">
                   <p><i class="fa fa-search"></i>${fes.ContentID }</p>
               </div>
            <div class="textBox">
               <div class="addr">
                     찜 한 시간 : ${fes.reserveDate }
               </div>
            </div>
               <div class="view" onclick="location.href='contentView.do?contentid=${res.contentID }&contenttypeid=${res.contentTypeID }&price=${res.price }'">예약한 방 정보 보기</div>
           </div>
      </c:forEach>
</div>
    </div>
    <div id="menu2" class="tab-pane fade">
     <div id="content" class="container">   
      <c:forEach var="rest" items="${restaurant }">
           <div class="contentList">
               <div class="contentTitle">
                   <p><i class="fa fa-search"></i>음식점 이름</p>
               </div>
                <img class="contentImg"
            <c:if test="${searchTest.firstimage ne null }">
            src = "${searchTest.firstimage }"
            </c:if>
            <c:if test="${searchTest.firstimage eq null }">
            src = "/trip_GazuaAA/img/no.png"
            </c:if>
            style="width:160px;height:100px;">
           
            <div class="textBox">
               <div class="addr">
                     ${rest.reserveDate } 찜한 날짜
               </div>
            </div>
               <div class="view" onclick="location.href='contentView.do?contentid=${res.contentID }&contenttypeid=${res.contentTypeID }&price=${res.price }'">예약한 방 정보 보기</div>
           </div>
      </c:forEach>
</div>
    </div>
  </div>
</div>


<!--<a href="logout.do">로그아웃</a> 로그인시 태그 생성하게 처리-->

<!-- 
<table border="1">
   <c:forEach var="fes" items="${festval }">
      <tr>
         <td>유저 ID : ${fes.userID }</td>
         <td>컨텐츠 ID : ${fes.contentID }</td>
         <td>컨텐츠 타입 ID : ${fes.contentTypeID }</td>
         <td>예약일 : ${fes.reserveDate }</td>
      </tr>
   </c:forEach>
</table> 


<table border="1">
   <c:forEach var="rest" items="${restaurant }">
      <tr>
         <td>유저 ID : ${rest.userID }</td>
         <td>컨텐츠 ID : ${rest.contentID }</td>
         <td>컨텐츠 타입 ID : ${rest.contentTypeID }</td>
         <td>예약일 : ${rest.reserveDate }</td>
      </tr>
   </c:forEach>
</table>

-->
<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>


   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script src="/trip_GazuaAA/js/googleLogin.js"></script>
   <script src="/trip_GazuaAA/js/FBLogin.js"></script>
   <script src="/trip_GazuaAA/js/login.js"></script>
</body>
</html>