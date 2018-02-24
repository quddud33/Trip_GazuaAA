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
   
   int total = (int)request.getAttribute("total");
   
   //페이징 마크업(문자열)
   String paginate =  
   PaginateUtil.getPaginate(nowPage, total, numPage, numBlock, url, param);
%>
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
   <!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
</body>
</html>