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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/loginBox.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
</style>
</head>
<body>
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>
	


	<form action="contentList.do" onsubmit="showSearchTest()">
		<select name="contentTypeId">
			<option value="32">숙박</option>
			<option value="12">관광지</option>
			<option value="15">행사/축제</option>
			<option value="39">맛집</option>
			<option value="28">레포츠</option>
		</select> <select name="areaCode">
			<option value="">전체</option>
			<option value="1">서울</option>
			<option value="2">인천</option>
			<option value="3">대전</option>
			<option value="4">대구</option>
			<option value="5">광주</option>
			<option value="7">부산</option>
			<option value="8">울산</option>
		</select> <input type="text" name="search" /> <input type="submit" value="검색" />
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
	<select name="areaCodeVal">
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
	<div id="page"></div>	
	<div class="container">
	<table border="1">
		<tr>
			<th>바로가기</th>
			<th>이름</th>
			<th>주소</th>
			<th>가격</th>
		</tr>

		<c:forEach var="searchTest" items="${contentList }">
			<c:if test="${searchTest.totalCount eq null }">
				<tr id="searchTest">
					<td><a
						href="contentView.do?contentid=${searchTest.contentid }&contenttypeid=${searchTest.contenttypeid}&price=${searchTest.price }">바로가기</a></td>
					<td>${searchTest.title}</td>
					<td>${searchTest.addr1 }</td>
					<td><c:if test="${searchTest.price ne null }">${searchTest.price }</c:if></td>
					<c:if test="${searchTest.contenttypeid eq '39' }">
						<td><button
								onclick="location.href='restaurantWish.do?userID=${user.userID}&contentID=${searchTest.contentid }&contentTypeID=${searchTest.contenttypeid }'">찜하기</button></td>
					</c:if>
<!-- das -->
				</tr>
			</c:if>
			<c:if test="${searchTest.totalCount ne null }">
				<c:set var="totalCount" value="${searchTest.totalCount }" />
			</c:if>
		</c:forEach>

	<script id="touristTable" type="text/template">
		<\%$.each(touristInfo.items, function() {%>
			<tr>
				<th scope="row"><a href="contentView.do?contentid=<\%=this.no%>&contenttypeid=<\%=this.contenttypeid%>&price"><\%=this.no%></a></th>
				<td><\%=this.title%></td>
				<td><\%=this.addr%></td>
				<td><\%if(this.contenttypeid == 39) {%><button onclick="location.href='restaurantWish.do?userID=${user.userID}&contentID=<\%=this.no%>&contentTypeID=<\%=this.contenttypeid%>'">찜하기</button><\%}%></td>
				<td><\%if(this.price != 0) {%><\%=this.price%><\%}%></td>
				<td><\%if(this.img != undefined) {%><img width="160" src="<\%=this.img%>"><\%}%></td>
			</tr>
		<\%})%>
	</script>
	${paginate} 
	</table>	
	
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
					$('tbody').html(touristTable({
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
		
		$('#page').on('click', '.page', function() {
			page = $(this).val();
			$.ajax('ajax/touristInfo.do', {
				async : false,
				data : {
					contentTypeId :contentTypeId,
					areaCode : areaCode,
					page : page
				},
				success : function(json) {
					$('tbody').html(touristTable({
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