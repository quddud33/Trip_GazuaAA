<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${board }">
				<tr>
					<th>${board.num }</th>
					<td><a href="tripBoardView.do?num=${board.num}">${board.title }</a></td>
					<td>${board.nickname }</td>
					<td>${board.wDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<input type="button" 
		onclick="location.href='tripBoardWriteForm.do'" value="글쓰기"/>
</body>
</html>