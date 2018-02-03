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

	${view.nickname }<br>
	${view.title }<br>
	${view.content }<br>
	${view.wDate }<br>
	
	<a href="tripBoard.do">뒤로가기</a>

	<c:if test="${user.userID eq view.userID}">
		<a href="tripBoardUpdateForm.do?num=${view.num }">수정하기</a>
		<a href="tripBoardDelete.do?num=${view.num }">삭제하기</a><!-- boardNum,userID -->
	</c:if>
	<a href="tripBoardLike.do">좋아요</a><!-- boardNum -->
	
	<c:if test="${msg ne null }">
		<script>
			confirm('${msg}')
		</script>
		<%session.invalidate(); %>
	</c:if>
</body>
</html>