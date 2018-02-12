<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<style>
table{
	margin-top: 10px; 
}
.table-bordered{
	width: 1000px;
	height: 600px;
}
.table-bordered th{
	text-align: center;
}
.table-bordered td{
padding: 20px;
}
.roomimg th{
	text-align: center;
}
.btn{
	position: absolute;
	margin-left: 70%; 
	margin-top: 10px;
}
#nickname{
    text-align: right;
    position:relative;
    clear: both;
    display: inline;
    margin-left: 1000px;
    margin-top: -50px;
}
}

</style>
</head>
<body>
<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapsed" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="http://vpa.danbee.Ai/#/chats?chatbotId=054d0e31-3af2-4e4e-a930-8fa4462da027">고객센터</a>
				<a class="navbar-brand" href="chat.do">채팅방</a>
				<a class="navbar-brand" href="contentList.do">지도/컨텐츠 리스트</a>
				<a class="navbar-brand" href="tripBoard.do">게시판</a>
				<a class="navbar-brand" href="myPage.do">마이페이지</a>
				<a id="nickname" class="navbar-brand" href=""><small>님 환영합니다.</small></a>
			</div>
		</div>
	</nav>
		<form action="reservation.do">
		<input type="hidden" name="userID" value="${user.userID }"/>
		<input type="hidden" name="contentID" value="<%=request.getParameter("contentID") %>" />
		<input type="hidden" name="contentTypeID" value="<%=request.getParameter("contentTypeID") %>" />
<table border="1" class="roomimg">
			<tr>
			<c:forEach var="detail" items="${detail}" >
				<th>${detail.roomtitle }</th>
			</c:forEach>
			</tr>
			<tr>
			<c:forEach var="detail" items="${detail}" >
				<td><img src="${detail.roomimg1}"/ width="300" height="250"></td>
			</c:forEach>	
			</tr>	
</table>
	<table border="1" class="table-bordered">
		<thead>
			<tr>
				<th>객실명</th>
				<th>성인</th>
				<th>아동</th>
				<th>숙박기간</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<select name="roomName" id="roomName" class="form-control">
					
			<c:forEach var="detail" items="${detail}" >
				<option>${detail.roomtitle }</option> 
			</c:forEach>
					
				</select>
				</td>
				<td>
				<select id="adult" name="adult" class="form-control">
					
			<%for(int i = 0; i < 10; i++) {%>
				<option value="<%=i%>"><%=i %>명</option>
			<%} %>
					
				</select>
				</td>
				<td>
				<select id="kid" name="kid" class="form-control">
					
						<%for(int i = 0; i < 10; i++) {%>
			<option value="<%=i%>"><%=i %>명</option>
			<%} %>
					
			</select>
			</td>
				<td>
					체크인 :<input class="form-control input-xs" type="text" id="datepicker1" name="startDate">
					체크아웃 :<input class="form-control input-xs" type="text" id="datepicker2" name="endDate">
				</td>
				<td>
					<input class="form-control" type="text" id="price" name="price" value="0" readonly/>
				</td>
			</tr>
		</tbody>
	</table>
		<p><button class="btn btn-info btn-lg" >예약하기</button></p>
	</form>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script>
	
    var minDate = new Date;
    var lodDate;
    var adult = 0;
    var kid = 0;
    
    function calDateRange(val1, val2)
    {
        var FORMAT = "-";
        // FORMAT을 포함한 길이 체크

        if (val1.length != 10 || val2.length != 10)
            return null;

        // FORMAT이 있는지 체크
        if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
            return null;

        // 년도, 월, 일로 분리
        var start_dt = val1.split(FORMAT);
        var end_dt = val2.split(FORMAT);

        // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
        // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
        start_dt[1] = (Number(start_dt[1]) - 1) + "";
        end_dt[1] = (Number(end_dt[1]) - 1) + "";

        var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
        var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);

        return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
    }


    $("#datepicker1").datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        minDate : minDate,
        onClose: function(selectedDate) {
            $("#datepicker2").datepicker( "option", "minDate", selectedDate );
        	lodDate = calDateRange($("#datepicker1").val(), $("#datepicker2").val());
$("#price").val(((<%=request.getParameter("price")%> * adult) + <%=request.getParameter("price")%> * kid * 0.5) * lodDate);
        }
    });
    
    $("#datepicker2").datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        onClose: function(selectedDate) {
            $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
        	lodDate = calDateRange($("#datepicker1").val(), $("#datepicker2").val());
        	$("#price").val(((<%=request.getParameter("price")%> * adult) + <%=request.getParameter("price")%> * kid * 0.5) * lodDate);
        }
    });
    
    $("select").change(function(){
    	adult = $("#adult").val();
    	kid = $("#kid").val();
    	lodDate = calDateRange($("#datepicker1").val(), $("#datepicker2").val());
    	
$("#price").val(((<%=request.getParameter("price")%> * adult) + <%=request.getParameter("price")%> * kid * 0.5) * lodDate);
    });
	
	</script>
</body>
</html>
<!-- contentID,roomName,adult,kid,startDate,day,sumPrice -->