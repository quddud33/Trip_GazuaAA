<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<%-- 	<form action="tripBoardWrite.do">
		<table>
			<tr>
				<th>제 목</th>
				<td><input name="title" placeholder="제목을 입력하여주세요" /></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="userID" value="${user.userID }"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input name="nickname" value="${user.nickname}"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea name="content" cols="70" rows="20"
						placeholder="내용을 입력해주세요" /></textarea></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="image" /></td>
			</tr>
		</table>
		<br>
		<button>글쓰기</button>
		<button type="button" onclick="location.href='tripBoard.do'">뒤로가기</button>
	</form> --%>
	<form action="tripBoardWrite.do" id="frm">
		<table width="100%">
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title" /></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input name="userID" value="${user.userID }"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input name="nickname" value="${user.nickname}"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" id="ir1" name="content"
						style="width: 766px; height: 412px;"></textarea></td>
			</tr>
			<tr>
				<td><input type="hidden" name="image" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="save" value="저장" /> 
		<button type="button" onclick="location.href='tripBoard.do'">뒤로가기</button>
			</tr>
		</table>
		<!-- footer 시작 -->
	<%@ include file="../template/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/trip_GazuaAA/js/googleLogin.js"></script>
	<script src="/trip_GazuaAA/js/FBLogin.js"></script>
	<script src="/trip_GazuaAA/js/login.js"></script>
	</form>
	
	
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
	
	</script>
</body>
</html>