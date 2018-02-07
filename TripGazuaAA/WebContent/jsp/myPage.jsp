<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="chat.jsp">채팅방</a><!--userID,nickName-->
<a href="serviceCenter.jsp">서비스 센터</a><!--userID,nickName-->
<a href="locationView.jsp">지도/컨텐츠 리스트</a>
<a href="myPage.jsp">마이페이지</a><!--로그인 시에만 보이게 처리(userID,nickName)-->
<a href="#">로그인</a><!--javascript써서 로그인폼 뛰우기-->
<a href="createUserForm.jsp">회원가입</a>

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
</body>
</html>