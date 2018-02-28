<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<link rel="stylesheet" href="css/chat.css"/>
<link rel="stylesheet" href="css/loginBox.css"/>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<meta charset="UTF-8">
<title>채팅프로그램</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@ include file="../template/nav.jsp" %>

<div class="chatContainer">
    <div class="chatBox">
        <span class="chatTitle">Trip Gazuaa 채팅방<span id="closeBtn2" class="closeBtnForm"><i class="fa fa-times-circle"></i></span></span>
        <div id="listBox">
   		<ul class="chatul">
   		</ul>
        </div>
        <form id="form">
            <input id="chatInput" class="chatInputBox" />
            <button type="submit" class="chatInputBox_Btn">보내기</button>
        </form>

            <button id="openBtn" class="openBtn">채팅 가즈아~~</button>
         <div class="closeBtnCreate"><i class="fa fa-times-circle"></i><button id="closeBtn1" class="closeBtn">채팅종료</button></div>
    </div>
</div>
	
	
	<!-- footer 시작 -->
<%@ include file="../template/footer.jsp" %>
	
<script>

	var $openBtn = $("#openBtn"),
		$closeBtn1 = $("#closeBtn1"),
		$closeBtn2 = $("#closeBtn2"),
		$list = $("#listBox>ul"),
		$form = $("#form"),
		$input = $("#chatInput"),
		socket = null;//어디에서든 사용하기 위해서 전역변수
		nickName = '${user.nickname}';
		
	
	
	
	$form.submit(function(e) {
		
		//1) 유저가 입력한 글자 얻기
		var chatMsg = $input.val();
		
		//2) 내용비우고 포커스
		$input.val("").focus();
		
		//3) 소켓 보내기
		socket.send(nickName + ":" + chatMsg);

		//form에서 submit막기
		e.preventDefault();
		
	});
	
	$closeBtn1.click(function() {
		socket.close();//소켓 닫음
	});//click() end
	$closeBtn2.click(function() {
		socket.close();//소켓 닫음
	});//click() end
	
	
	function displayMsg(msg) {
		
		if(msg.substr(0, msg.indexOf(':')) == nickName){
			$("<li class='myBalloon'>").text(msg)
			         .appendTo($list);	
		} else {
			$("<li class='balloon'>").text(msg)
			         .appendTo($list);	
		}
		
		console.log($list.height());
		//현재 리스트의 
		var size = $list.height();
		
		//스크롤을 지정
		$("#listBox").scrollTop(size);
		
	}//displayMsg() end
	
	
	$openBtn.click(function() {
		$openBtn.css("display","none");
		//웹소켓의 프로토콜은 ws://
		socket = new WebSocket("ws://localhost:8080/trip_GazuaAA/chat");
	
		//소켓은 open,close,error,message
		
		socket.onopen = function() {
			displayMsg("서버와 연결되었습니다.");
		}//onopen() end
		socket.onclose = function() {
			displayMsg("서버와 연결이 끊어졌습니다. 3초 후 메인페이지로 이동합니다.");
			setTimeout(function(){ location.href = "main.do"; }, 3000);
		}//onclose() end
		socket.onerror = function() {
			displayMsg("서버 점검중입니다 ^-^");
		}//onerror() end
		socket.onmessage = function(e) {
			
			//넘어온 데이터 e.data
			displayMsg(e.data);
			
		}//onmessage() end
		
		
	});
	
	
	
	
</script>
</body>
</html>





