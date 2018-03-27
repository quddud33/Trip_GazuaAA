<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="google-signin-client_id"
	content="346120053180-l6r9r2hq1sknebtp2ukd6mtoea688dhl.apps.googleusercontent.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="/trip_GazuaAA/css/loginBox.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://underscorejs.org/underscore-min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src= "/trip_GazuaAA/js/login.js"></script>
<script src="/trip_GazuaAA/js/googleLogin.js"></script>
<script src="/trip_GazuaAA/js/FBLogin.js"></script>
<script src="/trip_GazuaAA/js/paginate.js"></script>
<title>검색</title>
<style>
    table, #map {
        float: left;
    }

    .mapCursor {
        cursor: pointer;
    }

    li {
        list-style: none;
        display: inline;
    }

    .contentList{
        padding: 1% 0 0 1%;
        min-width: 300px;
        max-width:750px;
        height:100px;
        background-color: #E0E0E0;
        margin: 0 auto 2% auto;
        position: relative;
    }

    .contentTitle{
        font-size: 1.05em;
        position: absolute;
        top: 2px;
        left: 2%;
        font-weight: bold;
    }

    .contentTitle > p {
        white-space: nowrap;
        height: 40px;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .contentImg {
        float: left;
    }

    .textBox {
        position: relative;
        float: left;
        width: 80%;
        height: 95%;
    }

    .price {
        font-size: 1.5em;
        position: absolute;
        right: 90px;
        bottom: 40px;
    }

    .addr {
        position: absolute;
        bottom: 12%;
        left: 2%;
        font-size: 1em;
    }

    .view {
        background-color: #BCAAA4;
        float: left;
        width: 200px;
        height: 30px;
        border: 1px solid #424242;
        line-height: 30px;
        text-align: center;
        position: absolute;
        right: 20px;
        bottom: 8%;
        cursor: pointer;
        border-radius: 5px;
        transition: .2s ease;
    }

    .view:hover {
        color: #EEE;
    }

    #content {
        position: relative;
        margin: 1% auto 3% auto;
    }

    #page {
        text-align: center;
        float: right;
        position: relative;
        left: -50%;
    }

    #page button {
        background-color: #FFF;
        display: inline-block;
        float: left;
        position: relative;
        left: 50%;
        width: 33px;
        height: 33px;
        border: 1px solid #AAA;
        border-left: none;
    }

    #page button:nth-child(1) {
        border-left: 1px solid #AAA;
    }

    #page button:hover {
        background-color: #CCC;
    }

    #searchForm {
        max-width: 720px;
        margin: auto auto 15px auto;
        text-align: center;
    }

    #textSearchForm {
        display: inline-block;
        width: 100%;
    }

    #textSearchForm .form-control {
        width: 90%;
    }

    #areaSearchForm {
        position: relative;
        margin-top: -5px;
    }

    #areaCodeForm {
        position: absolute;
        right: 0;
    }

    .noData {
        margin: auto;
        width: 720px;
        text-align: center;
    }

    .noData img {
        width: 718px;
        border: 1px solid #DDD;
    }

    b {
        text-decoration: underline;
    }

</style>
</head>
<body>
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>
	
	<div id="searchForm">
	<div id="areaSearchForm">
		<ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" category="32" onclick="searchAjax(32, $('.areaCodeVal').val(), 1)">숙박</a></li>
		    <li><a data-toggle="tab" href="#menu1" category="15" onclick="searchAjax(15, $('.areaCodeVal').val(), 1)">축제</a></li>
		    <li><a data-toggle="tab" href="#menu2" category="12" onclick="searchAjax(12, $('.areaCodeVal').val(), 1)">관광지</a></li>
		    <li><a data-toggle="tab" href="#menu3" category="39" onclick="searchAjax(39, $('.areaCodeVal').val(), 1)">맛집</a></li>
		    <li id="areaCodeForm">
				<select name="areaCodeVal" class="form-control areaCodeVal">
					<option value="">지역(전체)</option>
					<option value="1">서울</option>
					<option value="2">인천</option>
					<option value="3">대전</option>
					<option value="4">대구</option>
					<option value="5">광주</option>
					<option value="6">부산</option>
					<option value="7">울산</option>
				</select>
			</li>
		</ul>
	</div>
	<br />
	<form action="contentList.do" onsubmit="showSearchTest()" class="form-inline md-form form-sm" method="get">
			<div id="textSearchForm">
				<input type="hidden" name="contentTypeId" id="contentTypeId" value="32"/>
				<input type="hidden" name="areaCode" id="areaCode"/>
				<input type="text" id="searchBox" class="form-control" name="search" placeholder="Search" aria-label="Search" 
				<%if(request.getParameter("search") != null) {%>
					value="<%=request.getParameter("search")%>"
				<%} %>
				/>
				<button class="btn">검색</button>
			</div>
	</form>
	</div>
	
	<div id="content" class="container">
		<c:if test="${!empty contentList }">
			<c:forEach var="searchTest" items="${contentList}">
				<c:if test="${searchTest.totalCount eq null }">
		        <div class="contentList">
					<img class="contentImg"
					<c:if test="${searchTest.firstimage ne null }">
					src = "${searchTest.firstimage }"
					</c:if>
					<c:if test="${searchTest.firstimage eq null }">
					src = "/trip_GazuaAA/img/no.png"
					</c:if>
					style="width: 15%;min-width: 80px;max-width:160px;height: 93%;">
					<div class="textBox">
		            <div class="contentTitle">
		                <p>${searchTest.title }</p>
		            </div>
						<c:if test="${searchTest.price ne null}">
							<div class="price">
								${searchTest.price }원
							</div>
						</c:if>
						<div class="addr">
		            		${searchTest.addr1 }
						</div>
					</div>
					<c:if test="${searchTest.contenttypeid eq 39 }">
						<div class="view wish" onclick="location.href='restaurantWish.do?name=${searchTest.title }&userID=${user.userID}&contentID=${searchTest.contentid }&contentTypeID=${searchTest.contenttypeid }'">찜하기</div>
					</c:if>
					<c:if test="${searchTest.contenttypeid ne 39 && searchTest.contenttypeid ne 12 }">
						<div class="view" onclick="location.href='contentView.do?contentid=${searchTest.contentid }&contenttypeid=${searchTest.contenttypeid }&price=${searchTest.price }'">자세히보기</div>
					</c:if>
		        </div>
				</c:if>
				<c:if test="${searchTest.totalCount eq '0'}">
					<div class="noData">
						<img alt="no_data" src="img/no_data.png"/>
					</div>
				</c:if>
		</c:forEach>
		</c:if>
	<script id="touristTable" type="text/template">
		<\%$.each(touristInfo.items, function() {%>
        <div class="contentList">
			<img class="contentImg" src="<\%if(this.img != undefined) {%><\%=this.img%><\%} else {%>/trip_GazuaAA/img/no.png<\%}%>" style="width: 15%;min-width: 80px;max-width:160px;height: 93%;">
			<div class="textBox">
            <div class="contentTitle">
                <p><\%=this.title%></p>
            </div>
				<div class="price">
					<\%if(this.price != null) {%><\%=this.price%>원<\%}%>
				</div>
				<div class="addr">
            		<\%=this.addr%>
				</div>
			</div>
			<\%if(this.contenttypeid == 39) {%>
				<div class="view wish" onclick="location.href='restaurantWish.do?name=<\%=this.title%>&userID=${user.userID}&contentID=<\%=this.no%>&contentTypeID=<\%=this.contenttypeid%>'">찜하기</div>
			<\%} else if(this.contenttypeid == 12) {} else {%>
				<div class="view" onclick="location.href='contentView.do?contentid=<\%=this.no%>&contenttypeid=<\%=this.contenttypeid%>&price=<\%=this.price%>'">자세히보기</div>
			<\%}%>
        </div>
		<\%})%>
			<div id="page"></div>
	</script>
		<div id="page">${paginate}</div>
	</div>
	<%@ include file="../template/footer.jsp" %>
	
	<c:if test="${login ne null }">
		<%session.invalidate(); %>
		<script>
			$("#bg").css("display", "block");
		</script>
	</c:if>
	
	<script src="/trip_GazuaAA/js/login.js"></script>
	<script>
		var touristTable = _.template($('#touristTable').html()), $areaCode = $('[name=areaCodeVal]')
		var $searchTest = $("#searchTest");
		var areaCode, total;
		var contentTypeId = <%if(request.getParameter("contenttypeid") != null) {%>
								<%=request.getParameter("contenttypeid") %>
							<%} else if (request.getParameter("contentTypeId") != null) {%>
								<%=request.getParameter("contentTypeId")%>
							<%} else {%>32<%}%>;
		var page = 1;
		

		
		$(window).on('popstate', function(event) {
			  var data = event.originalEvent.state;
				searchAjax(data.contentTypeId, data.areaCode, data.page);
		});

		// 		var page = new PaginateUtil();
		function showSearchTest() {
			$searchTest.show();
			console.log("쇼 성공");
		}
		
		$('[name=areaCodeVal]').change(function() {
			areaCode = $areaCode.val();
			page = 1;

			searchAjax(contentTypeId, areaCode, page);
		});
		
		$('#content').on('click', '.page', function() {
			searchAjax(contentTypeId, areaCode, $(this).val());
		});
		
		function searchAjax(contentTypeIdVal, areaCodeVal, pageVal) {
			
			$('#searchBox').val('');
			
			contentTypeId = contentTypeIdVal;
			areaCode = areaCodeVal;
			page = pageVal;
			$('#contentTypeId').val(contentTypeIdVal);
			$('#areaCode').val(areaCodeVal);
			$.ajax('ajax/touristInfo.do', {
				data : {
					contentTypeId :contentTypeId,
					areaCode : areaCode,
					page : page
				},
				success : function(json) {
					console.log('!!!');
					$('#content').html(touristTable({
						touristInfo : json
					}));
					total = json.total;
					console.log(total);
					$('#page').html(paginate(page, (total / 10), '?no='));
					history.pushState({}, 'page ' + page,'/trip_GazuaAA/contentList.do?contenttypeid=' + contentTypeId + '&areacode=' + $('#areaCode').val() + '&page=' + page);
					$searchTest.hide();
				},
				error : function(err) {
				}
			})
		}
				
		<%if(request.getParameter("contentTypeId") != null || request.getParameter("contenttypeid") != null) {%>
			$(window).on('pageshow', function() {
				$('#areaSearchForm li').removeClass('active');
				
				$('#areaSearchForm li > a').each(function () {
						if($(this).attr('category') == contentTypeId) {
							$(this).parent().addClass('active');
						}
				});
			});
		<%}%>
		
		$('.wish').click(function (e){
			e.preventDefault();
		});
		
	</script>
</body>
</html>