<%@page import="java.util.Enumeration"%>
<%@page import="util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//page 파라미터 받음
	String pageStr = 
	request.getParameter("page");
	// 기본값은 1
	int nowPage = 1;
	//만약 page파라미터가 있다면 
	//int형으로 변환
	if(pageStr!=null && pageStr.length()!=0){
		nowPage = Integer.parseInt(pageStr); 
	}//if end
	
	//한 페이지당 보여질 방명록 갯수
	int numPage = 7;
	
	//페이징의 블록갯수
	int numBlock = 5;
	//해당 페이지의 주소
	String url = "tripBoard.do";
	String param = "page=";
	
	Enumeration params = request.getParameterNames();
	String strParam = "";
	
	while(params.hasMoreElements()) {
		String name = (String)params.nextElement();
		if(!name.equals("page")){
			String value = request.getParameter(name);
			strParam += name + "=" + value + "&";
		}
	}
	
	param = strParam + param;
	
	int total = (int)request.getAttribute("total");
	
	//페이징 마크업(문자열)
	String paginate =  
	PaginateUtil.getPaginate(nowPage, total, numPage, numBlock, url, param);
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	
	<form id="sortForm" action="tripBoard.do">
		<label>
			<input type="radio" name="sort" value="new" class="select">
			최신순
		</label>
		<label>
			<input type="radio" name="sort" value="like" class="select">
			인기순
		</label>
		<label>
			<input type="radio" name="sort" value="views" class="select">
			조회순
		</label>
	</form>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>등록일</th>
				<th>좋아요</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${board }">
				<tr>
					<th>${board.num }</th>
					<td><a href="tripBoardView.do?num=${board.num}&page=${page}">${board.title }</a></td>
					<td>${board.nickname }</td>
					<td>${board.wDate }</td>
					<td>${board.likeCount }</td>
					<td>${board.views }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%=paginate%>
	
	<a href="tripBoard.do">전체글보기</a>
	
	<form id="searchForm" action="tripBoardSearch.do">
		<select name="board">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="TC">제목/내용</option>
			<option value="nickname">작성자</option>
		</select> 
		<input type="text" name="search" id="search"/> 
		<input type="submit" value="검색" id="searchSubmit" />
		<input type="hidden" name="page" value="1">
	</form>
	
	<input type="button" 
		onclick="location.href='tripBoardWriteForm.do'" value="글쓰기"/>
		
	<input type="button"
		onclick="location.href='main.do'" value="메인으로"/>
		
	<c:if test="${msg ne null }">
		<script>
			alert('${msg}');
		</script>
		<%session.invalidate(); %>
	</c:if>
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	
	$('.select').change(function () {
		$('#sortForm').submit();
	});
	
	$('#searchSubmit').click(function (e) {
		e.preventDefault();
		if($('#search').val().length <= 0){
			alert('검색어를 입력해주세요');
		} else
		$('#searchForm').submit();
	});
	
</script>
</body>
</html>