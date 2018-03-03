<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<style>
        .container {
            /*background: #00AAB4;*/
        }
        #ir1 {
            margin-top: 15px;
            margin-bottom: 15px;
        }
        #contentForm {
        	margin: 15px 0 15px 0;
        }
    </style>
</head>
<body>
	<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>
    <div class="container">
        <div class="jumbotron">
            <div class="text-center">
                <form action="tripBoardWrite.do" id="frm">
					<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요.." value="${update.title}"/>
					<input type="hidden" name="userID" value="${user.userID }" readonly="readonly" />
                    <input type="hidden" name="nickname" value="${user.nickname}" readonly="readonly" />
					<input name="num" type="hidden" value="${update.num }">
					<input type="hidden" name="page" value="${page }">
                    <div id="contentForm">
						<textarea id="ir1" name="content" class="form-control col-sm-5" rows="25" placeholder="내용을 입력해주세요...">${update.content}</textarea>
					</div>
					<input type="hidden" name="image" />
					<input type="button" id="save" value="작성완료"  class="btn btn-primary"/>
                    <input type="button" onclick="location.href='tripBoardView.do?num=${update.num}&page=${page }'" class="btn btn-primary" value="뒤로가기" id="backBtn"/>
                </form>
            </div>
        </div>
    </div>
<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
		<script type="text/javascript"
		src="/trip_GazuaAA/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript"
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script type="text/javascript">
	var oEditors = []; 
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1", 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI: "/trip_GazuaAA/se2/SmartEditor2Skin.html",
			htParams : { 
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function(){ 
					
				}
			}, 
			fOnAppLoad : function(){
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
				oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
			},
			fCreator: "createSEditor2"
			});
		});
	$("#save").click(function(){
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
	});
	
	$('#backBtn').click(function(){
		alert('게시글이 지워질수도 있습니다');	
	});
	
	</script>
</body>
</html>