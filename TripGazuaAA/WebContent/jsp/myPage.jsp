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
table, #map {
	float: left;
}

.mapCursor {
	cursor: pointer;
}

li {
	list-style: none;
	display: inline;
}

.contentList{
	padding: 0 0 0 2%;
	min-width: 300px;
    max-width:750px;
    height:175px;
    background-color: #CFD8DC;
    border-radius: 20px;
    margin: 0 auto 2% auto;
    position: relative;
}

.contentTitle{
    font-size: 2em;
    padding-left: 20px;
}

.contentTitle > p {
	width: 92%;
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
	float: left;
	width: 70%;
}

.price {
	font-size: 2em;
	font-weight: 900;
	text-align: right;
	margin-top: 10.5%;
	margin-right: 2%;
}

.date {
	position: absolute;
	top: 0;
	left: 2%;
	font-size: 1.25em;
	font-weight: 700;
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

.humans {
	position: absolute;
	right: 2%;
	top: 30%;
	text-align: right;
	font-size: 16px;
}

#content {
	position: relative;
	margin: 1% auto 3% auto;
}

#page {
	margin: auto;
	width: 245px;
}

#page ul {
	padding: 0;
}

#searchForm {
	max-width: 720px;
	margin: auto;
	text-align: center;
}

#textSearchForm {
	display: inline-block;
	margin-bottom: 20px;
}

#listForm {
	width: 720px;
	margin: auto;
}

#areaCodeForm {
	position: absolute;
	right: 0;
} 

.form-control {
	width: 120px;
}
.imgBox{
	width:718px;
	height:598px;
	position: relative;
	border:1px solid #424242;
	margin: auto;
	
}
.noData{
   width:718px;
   height: 598px;
   position: absolute;
   margin: auto;
}


</style>
<title>Insert title here</title>
</head>
<body>
   <!-- 네비게이션 -->
   <%@ include file="../template/nav.jsp" %>
   
<div class="container">
  <div id="listForm">
	  <ul class="nav nav-tabs">
	    <li class="active"><a category="32" data-toggle="tab" href="#home">숙박업소</a></li>
	    <li><a data-toggle="tab" category="15" href="#menu1">축제</a></li>
	    <li><a data-toggle="tab" category="39" href="#menu2">음식점</a></li>
	    <li><a data-toggle="tab" href="#menu3">마이 게시글</a></li>
	    <li><a data-toggle="tab" href="#menu4">마이 리뷰</a></li>
	  </ul>
  </div>

  <div class="tab-content">
    <div id="home" category="32" class="tab-pane fade in active">
      <div id="content" class="container">
      <c:if test="${empty reservation}">
      <div class="imgBox"><img class="noData" src="img/no_data.png" alt="no_data"/></div>
      </c:if>
      <c:forEach var="res" items="${reservation }">
           <div class="contentList">
               <div class="contentTitle">
                   <p>${res.name }</p><button onclick="location.href='reservationDelete.do?userID=${res.userID}&contentID=${res.contentID }&reserveDate=${res.reserveDate }'" class="btn" style="position: absolute; right: 0; top: 0;">삭제</button>
               </div>
                <img class="contentImg"
            <c:if test="${res.img ne null }">
            src = "${res.img }"
            </c:if>
            <c:if test="${res.img eq null }">
            src = "/trip_GazuaAA/img/no.png"
            </c:if>
            style="width:160px;height:100px;">
                
            <div class="textBox">
               <c:if test="${res.price ne null}">
                  <div class="price">
                     ${res.price }원
                  </div>
                  <div class="humans">
                  	아이 ${res.kid }명
                  	어른 ${res.adult }명
                  </div>
               </c:if>
               <div class="date">
                     ${res.startDate } ~  ${res.endDate }
               </div>
            </div>
           </div>
      </c:forEach>
</div>
    </div>
    <div id="menu1" category="15" class="tab-pane fade">
     <div id="content" class="container">
      <c:if test="${empty festval}">
      <div class="imgBox"><img class="noData" src="img/no_data.png" alt="no_data"/></div>
      </c:if>   
      <c:forEach var="fes" items="${festval }">
           <div class="contentList">
               <div class="contentTitle">
                   <p><i class="fa fa-search"></i>${fes.name }<button onclick="location.href='festvalDelete.do?userID=${fes.userID}&contentID=${fes.contentID }&reserveDate=${fes.reserveDate }'" class="btn" style="float: right;">삭제</button></p>
               </div>
                <img class="contentImg"
            	<c:if test="${fes.img ne null }">
	            src = "${fes.img }"
	            </c:if>
	            <c:if test="${fes.img eq null }">
	            src = "/trip_GazuaAA/img/no.png"
	            </c:if>
            	style="width:160px;height:100px;">
            <div class="textBox">
               <div class="date">
                     찜 한 날짜 : ${fes.reserveDate }
               </div>
            </div>
           </div>
      </c:forEach>
</div>
    </div>
    <div id="menu2" category="39" class="tab-pane fade">
     <div id="content" class="container">
      <c:if test="${empty restaurant}">
      <div class="imgBox"><img class="noData" src="img/no_data.png" alt="no_data"/></div>
      </c:if>   
      <c:forEach var="rest" items="${restaurant }">
      
           <div class="contentList">
               <div class="contentTitle">
                   <p><i class="fa fa-search"></i>${rest.name }<button onclick="location.href='restaurantDelete.do?userID=${rest.userID}&contentID=${rest.contentID }&reserveDate=${rest.reserveDate }'" class="btn" style="float: right;">삭제</button></p>
               </div>
                <img class="contentImg"
            <c:if test="${rest.img ne null }">
            src = "${rest.img }"
            </c:if>
            <c:if test="${rest.img eq null }">
            src = "/trip_GazuaAA/img/no.png"
            </c:if>
            style="width:160px;height:100px;">
           
            <div class="textBox">
               <div class="date">
                     찜 한 날짜 : ${rest.reserveDate }
               		</div>
            	</div>
          	</div>
          	
     	 </c:forEach>
		</div>
    </div>
    
    
        <div id="menu3" category="board" class="tab-pane fade">
     <div id="content" class="container">
      <c:if test="${empty boardSelect}">
      <div class="imgBox"><img class="noData" src="img/no_data.png" alt="no_data"/></div>
      </c:if>   
      <c:forEach var="myBoard" items="${boardSelect}">
           <div class="contentList">
               <div class="contentTitle">
                   <p><i class="fa fa-search"></i><a href="tripBoardView.do?num=${myBoard.num}&page=1">${myBoard.title}</a><button onclick="location.href='myPageBoardDelete.do?num=${myBoard.num}'" class="btn" style="float: right;">삭제</button></p>
               </div>
                <img class="contentImg"
      			src = "/trip_GazuaAA/img/no.png"
            	style="width:160px;height:100px;">
            <div class="textBox">
               <div class="date">
                     	글 쓴 날 짜 : ${myBoard.wDate}
               		</div>
            	</div>
          	</div>
     	 </c:forEach>
		</div>
    </div>
    
            <div id="menu4" category="review" class="tab-pane fade">
     <div id="content" class="container">
      <c:if test="${empty myPageReviewSelect}">
      <div class="imgBox"><img class="noData" src="img/no_data.png" alt="no_data"/></div>
      </c:if>   
      <c:forEach var="myPageReviewSelect" items="${myPageReviewSelect}">
           <div class="contentList">
               <div class="contentTitle">
                   <p><i class="fa fa-search"></i>${myPageReviewSelect.nickname}<button onclick="location.href='myPageReviewDelete.do?num=${myPageReviewSelect.num}'" class="btn" style="float: right;">삭제</button></p>
               </div>
                <img class="contentImg"
      			src = "/trip_GazuaAA/img/no.png"
            	style="width:160px;height:100px;">
            <div class="textBox">
               <div class="date">
                     	리뷰 내용 : ${myPageReviewSelect.content}
               		</div>
            	</div>
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
   <script>
	var contentTypeId = '<%if(request.getParameter("contenttypeid") != null) {%><%=request.getParameter("contenttypeid") %><%} else if (request.getParameter("contentTypeId") != null) {%><%=request.getParameter("contentTypeId")%><%} else {%>32<%}%>';
	
	<%if(request.getParameter("contentTypeId") != null || request.getParameter("contenttypeid") != null) {%>
		$(window).on('pageshow', function() {
			$('#listForm li').removeClass('active');
			$('.tab-content div').removeClass('active in');
			
			$('#listForm li > a').each(function () {
					if($(this).attr('category') == contentTypeId) {
						$(this).parent().addClass('active');
					}
			});
			
			
			$('.tab-content div').each(function (){
				if($(this).attr('category') == contentTypeId) {
					$(this).addClass('active in');
				}
			});
		});
	<%}%>
   </script>
</body>
</html>