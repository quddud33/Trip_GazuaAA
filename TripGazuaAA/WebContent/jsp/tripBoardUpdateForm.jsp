<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="tripBoardUpdate.do" id="frm">
		<table width="100%">
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title" value="${update.title }"/></td>
			</tr>
			<tr>
				<th>아이디</th>
					<td><input name="userID" value="${update.userID }" readonly="readonly" />
					<input name="num" type="hidden" value="${update.num }">
					<input type="hidden" name="page" value="${page }"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input name="nickname" value="${update.nickname}" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" id="ir1" name="content"
						style="width: 766px; height: 412px;">${update.content }</textarea></td>
			</tr>
			<tr>
				<td><input type="hidden" name="image" /></td>
			</tr>
			<tr>
				<td colspan="2"><button id="save">수정</button> 
				<button type="button" onclick="location.href='tripBoardView.do?num=${update.num}&page=${page }'">뒤로가기</button>
			</tr>
		</table>
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