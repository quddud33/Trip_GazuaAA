<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id"
	content="346120053180-l6r9r2hq1sknebtp2ukd6mtoea688dhl.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/loginBox.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<style>
table{
   margin-top: 10px; 
}
.table-bordered{
   width: 88%;
   height: 50%;
}
.table-bordered th{
   text-align: center;
}
.table-bordered td{ 
 padding: 20px; 
 }
 
</style>
</head>
<body>
   <!-- 네비게이션 -->
   <%@ include file="../template/nav.jsp" %>
   <div class="container">
      <form action="reservation.do">
      <input type="hidden" name="userID" value="${user.userID }"/>
      <input type="hidden" name="contentID" value="<%=request.getParameter("contentID") %>" />
      <input type="hidden" name="contentTypeID" value="<%=request.getParameter("contentTypeID") %>" />
   <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 80%; margin: auto;"> 
      
   <!--페이지-->
   <div class="carousel-inner">
      <div class="item active">
         <img src="https://pbs.twimg.com/media/DR-TdFPUIAEYnKd.jpg" style="width:100%; height:400px;"alt="First slide">
         <div class="container">
            <div class="carousel-caption">
            </div>
         </div>
      </div>
   <c:forEach  var="detail" items="${detail}">
      <div class="item"> 
         <img src="${detail.roomimg1 }" style="width:100%; height:400px;" data-src="" alt="Second slide">
         <div class="container">
            <div class="carousel-caption">
               <h1>${detail.roomtitle }</h1>
               <p>${detail.roomimg1alt }</p>
            </div>
         </div>
      </div>
      </c:forEach>
   </div>

   <!--이전, 다음 버튼-->
   <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
   <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
   </div>
   <table border="1" class="table-bordered" style="width: 80%; margin: auto;">
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
      <tfoot>
         <tr>
         <td colspan="5" style="text-align: right">
      <button class="btn btn-info btn-lg">예약하기</button>
         </td>
         </tr>
      </tfoot>
   </table>
   </form>
   </div>

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
      <!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
</body>
</html>
<!-- contentID,roomName,adult,kid,startDate,day,sumPrice -->