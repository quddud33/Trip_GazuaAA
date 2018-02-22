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

<title>Insert title here</title>
</head>
<body>
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>



<!--<a href="logout.do">로그아웃</a> 로그인시 태그 생성하게 처리-->
<h2>숙박업소</h2>
<table border="1">
	<c:forEach var="res" items="${reservation }">
		<tr>
			<td>유저 ID : ${res.userID }</td>
			<td>컨텐츠 ID : ${res.contentID }</td>
			<td>컨텐츠 타입 ID : ${res.contentTypeID }</td>
			<td>예약한 날짜 : ${res.reserveDate }</td>
			<td>어른 : ${res.adult }</td>
			<td>아이 : ${res.kid }</td>
			<td>가격 : ${res.price }</td>
			<td>체크인 : ${res.startDate }</td>
			<td>체크아웃 : ${res.endDate }</td>
			<td>방이름 : ${res.roomName }</td>
		</tr>
	</c:forEach>
</table>
<h2>축제</h2>
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
<h2>음식점</h2>
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
<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
</body>
</html>