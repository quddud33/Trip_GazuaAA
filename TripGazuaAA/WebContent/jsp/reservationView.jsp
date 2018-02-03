<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
</head>
<body>
	<form action="reservation.do">
		<input type="hidden" name="userID" value="${user.userID }"/>
		<input type="hidden" name="contentID" value="<%=request.getParameter("contentID") %>" />
		<input type="hidden" name="contentTypeID" value="<%=request.getParameter("contentTypeID") %>" />
		<p>체크인 : <input type="text" id="datepicker1" name="startDate"></p>
		<p>체크아웃 : <input type="text" id="datepicker2" name="endDate"></p>
		<select name="roomName" id="roomName">
			<c:forEach var="detail" items="${detail}" >
				<option>${detail.roomtitle }</option> 
			</c:forEach>
		</select>
			어른 : <select id="adult" name="adult">
			<%for(int i = 0; i < 10; i++) {%>
				<option value="<%=i%>"><%=i %>명</option>
			<%} %>
			</select> 
			아이 : <select id="kid" name="kid">
			<%for(int i = 0; i < 10; i++) {%>
			<option value="<%=i%>"><%=i %>명</option>
			<%} %>
			</select>
		<h3>가격 : <input type="text" id="price" name="price" value="0" readonly/></h3>
		<p><button>예약하기</button></p>
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