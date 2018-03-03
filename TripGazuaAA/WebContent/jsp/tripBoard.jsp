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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
<style>
	    .container {
            /*background: #00AAB4;*/
        }
        .title {
            text-align: center;
            color: #424242;
            font-size: 14px;
            font-weight: 600;
        }
</style>
</head>
<body>
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>
    <div class="container">
        <div class="jumbotron">
            <div class="text-right">
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
            </div>
            <table class="table table-board">
                <colgroup>
                    <col width="10%">
                    <col width="*">
                    <col width="15%">
                    <col width="15%">
                    <col width="10%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th class="title">번호</th>
                        <th class="title">제목</th>
                        <th class="title">날짜</th>
                        <th class="title">작성자</th>
                        <th class="title">좋아요</th>
                        <th class="title">조회수</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="board" items="${board }">
						<tr>
							<th class="title">${board.num }</th>
							<td><a href="tripBoardView.do?num=${board.num}&page=${page}">${board.title }</a></td>
							<td class="title">${board.wDate }</td>
							<td class="title">${board.nickname }(${board.userID })</td>
							<td class="title">${board.likeCount }</td>
							<td class="title">${board.views }</td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
            <div class="text-center">
				<%=paginate%>
            </div>
            <div class="text-center">
                <form id="searchForm" action="tripBoardSearch.do">
					<select name="board">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="TC">제목/내용</option>
						<option value="nickname">작성자</option>
					</select> 
					<input type="search" placeholder="Search..." name="search" id="search" />
					<input type="submit" value="검색" id="searchSubmit" />
					<input type="hidden" name="page" value="1">
				</form>
            </div>
            <div class="text-right">
                <a class="btn btn-primary" href="tripBoardWriteForm.do">글쓰기</a>
            </div>
        </div>
    </div>
		
	<c:if test="${msg ne null }">
		<script>
			alert('${msg}');
		</script>
		<%session.invalidate(); %>
	</c:if>
	
<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
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