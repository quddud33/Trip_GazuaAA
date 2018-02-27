<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="google-signin-client_id"
	content="346120053180-l6r9r2hq1sknebtp2ukd6mtoea688dhl.apps.googleusercontent.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/loginBox.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<title>검색</title>
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
	margin-top: 4.5%;
	margin-right: 2%;
}

.addr {
	position: absolute;
	top: 0;
	left: 2%;
	font-size: 1.25em;
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
}

.form-control {
	width: 120px;
}

</style>
</head>
<body>
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>
	<div id="searchForm"><form action="contentList.do" onsubmit="showSearchTest()">
		<select name="contentTypeId" class="form-control">
			<option value="32">숙박</option>
			<option value="12">관광지</option>
			<option value="15">행사/축제</option>
			<option value="39">맛집</option>
			<option value="28">레포츠</option>
		</select>
		<select name="areaCode" class="form-control">
			<option value="">전체</option>
			<option value="1">서울</option>
			<option value="2">인천</option>
			<option value="3">대전</option>
			<option value="4">대구</option>
			<option value="5">광주</option>
			<option value="7">부산</option>
			<option value="8">울산</option>
		</select> <input type="text" class="search_pro" name="search" /> <input type="submit" value="검색" />
	</form>
	<label> <input type="radio" name="contentTypeIdVal" value="32"
		checked> <span>숙박</span>
	</label>
	<label> <input type="radio" name="contentTypeIdVal" value="15">
		<span>축제</span>
	</label>
	<label> <input type="radio" name="contentTypeIdVal" value="12">
		<span>관광지</span>
	</label>
	<label> <input type="radio" name="contentTypeIdVal" value="39">
		<span>맛집</span>
	</label>
	<select name="areaCodeVal" class="form-control">
		<option value="">전체</option>
		<option value="1">서울</option>
		<option value="2">인천</option>
		<option value="3">대전</option>
		<option value="4">대구</option>
		<option value="5">광주</option>
		<option value="6">부산</option>
		<option value="7">울산</option>
	</select>
	<br />
	</div>
	
	<div id="content" class="container">
		<c:forEach var="searchTest" items="${contentList}">
			<c:if test="${searchTest.totalCount eq null }">
	        <div class="contentList">
	            <div class="contentTitle">
	                <p><i class="fa fa-search"></i>${searchTest.title }</p>
	            </div>
				<img class="contentImg"
				<c:if test="${searchTest.firstimage ne null }">
				src = "${searchTest.firstimage }"
				</c:if>
				<c:if test="${searchTest.firstimage eq null }">
				src = "/trip_GazuaAA/img/no.png"
				</c:if>
				style="width: 30%;min-width: 80px;min-height:50px;max-width:160px;max-height:100px;">
				<div class="textBox">
					<c:if test="${searchTest.price ne null}">
						<div class="price">
							${searchTest.price }원
						</div>
					</c:if>
					<div class="addr">
	            		${searchTest.addr1 }
					</div>
				</div>
				<c:if test="${searchTest.contenttypeid eq 39 }">
					<div class="view" onclick="location.href='restaurantWish.do?userID=${user.userID}&contentID=<\%=this.no%>&contentTypeID=<\%=this.contenttypeid%>'">찜하기</div>
				</c:if>
				<c:if test="${searchTest.contenttypeid ne 39 }">
					<div class="view" onclick="location.href='contentView.do?contentid=${searchTest.contentid }&contenttypeid=${searchTest.contenttypeid }&price=${searchTest.price }'">자세히보기</div>
				</c:if>
	        </div>
			</c:if>
		</c:forEach>
	<script id="touristTable" type="text/template">
		<\%$.each(touristInfo.items, function() {%>
        <div class="contentList">
            <div class="contentTitle">
                <p><i class="fa fa-search"></i> <\%=this.title%></p>
            </div>
			<img class="contentImg" src="<\%if(this.img != undefined) {%><\%=this.img%><\%} else {%>/trip_GazuaAA/img/no.png<\%}%>" style="width: 30%;min-width: 80px;min-height:50px;max-width:160px;max-height:100px;">
			<div class="textBox">
				<div class="price">
					<\%if(this.price != null) {%><\%=this.price%>원<\%}%>
				</div>
				<div class="addr">
            		<\%=this.addr%>
				</div>
			</div>
			<\%if(this.contenttypeid == 39) {%>
				<div class="view" onclick="location.href='restaurantWish.do?userID=${user.userID}&contentID=<\%=this.no%>&contentTypeID=<\%=this.contenttypeid%>'">찜하기</div>
			<\%} else {%>
				<div class="view" onclick="location.href='contentView.do?contentid=<\%=this.no%>&contenttypeid=<\%=this.contenttypeid%>&price=<\%=this.price%>'">자세히보기</div>
			<\%}%>
        </div>
		<\%})%>
			<div id="page"></div>
	</script>
		<div id="page">${paginate}</div>
	</div>
	<%@ include file="../template/footer.jsp" %>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://underscorejs.org/underscore-min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src= "/trip_GazuaAA/js/login.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/paginate.js"></script>
	<script>
		var touristTable = _.template($('#touristTable').html()), $areaCode = $('[name=areaCodeVal]')
		var $searchTest = $("#searchTest");
		var contentTypeId, areaCode, total;
		var page = 1;

		// 		var page = new PaginateUtil();
		function showSearchTest() {
			$searchTest.show();
			console.log("쇼 성공");
		}
		$('[name=contentTypeIdVal], [name=areaCodeVal]').change(function() {
			contentTypeId = $('[name=contentTypeIdVal]:checked').val();
			areaCode = $areaCode.val();
			page = 1;
			$.ajax('ajax/touristInfo.do', {
				async : false,
				data : {
					contentTypeId :contentTypeId,
					areaCode : areaCode,
					page : page
				},
				success : function(json) {
					$('#content').html(touristTable({
						touristInfo : json
					}));
					total = json.total;
					console.log(total);
					$('#page').html(paginate(page, (total / 10), '?no='));
					
					$searchTest.hide();
				},
				error : function(err) {
				}
			})

		});
		
		$('#content').on('click', '.page', function() {
			page = $(this).val();
			$.ajax('ajax/touristInfo.do', {
				async : false,
				data : {
					contentTypeId :contentTypeId,
					areaCode : areaCode,
					page : page
				},
				success : function(json) {
					$('#content').html(touristTable({
						touristInfo : json
					}));
					$('#page').html(paginate(page, (total / 10), '?no='));
					$searchTest.hide();
				},
				error : function(err) {
				}
			})

		});
	</script>
</body>
</html>