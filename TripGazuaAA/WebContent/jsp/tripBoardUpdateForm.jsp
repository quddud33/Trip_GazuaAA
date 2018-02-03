<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="tripBoardUpdate.do">
		<table>
			<tr>
				<th>제 목</th>
				<td><input name="title" placeholder="제목을 입력하여주세요" value="${update.title }"/></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input name="userID" value="${update.userID }" readonly="readonly" />
					<input name="num" type="hidden" value="${update.num }">
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input name="nickname" value="${update.nickname}" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea name="content" cols="70" rows="20"
						placeholder="내용을 입력해주세요" />${update.content }</textarea></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="image" /></td>
			</tr>
		</table>
		<br>
		<button>수정</button>
		<button type="button" onclick="location.href='tripBoardView.do?num=${update.num}'">뒤로가기</button>
	</form>
</body>
</html>