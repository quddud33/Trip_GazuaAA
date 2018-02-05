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
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="comment" items="${comment }">
			<tr>
				<td>${comment.nickname }</td>
				<td>${comment.content }</td>
				<td>${comment.wDate }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form action="tripCommentInsert.do">
			<input type="hidden" name="userID" value="${user.userID}"/>
			<input type="hidden" name="num" value="${view.num }">
			<input type="hidden" name="nickname" value="${user.nickname }">
			<textarea rows="5" cols="100" name="content"
				style="resize: none; overflow: hidden;" placeholder="댓글을 입력해주세요"></textarea>
			<button>등록</button>
	</form>
	<br>
	
	<a href="tripBoard.do">뒤로가기</a>

	<c:if test="${user.userID eq view.userID}">
		<a href="tripBoardUpdateForm.do?num=${view.num }">수정하기</a>
		<a id="del" href="#">삭제하기</a><!-- boardNum,userID -->
	</c:if>
	<a href="tripBoardLike.do">좋아요</a><!-- boardNum -->
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>
		$('#del').click(function(e) {
			if(confirm("정말로 삭제하시겠습니까?"))
				location.href = "tripBoardDelete.do?num=${view.num }";
			else
				e.preventDefault();
		});
	</script>
</body>
</html>