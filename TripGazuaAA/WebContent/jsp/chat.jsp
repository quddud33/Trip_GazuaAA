<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>채팅프로그램</title>
<style>

	#listBox {
		width:300px;
		height:400px;
		overflow-y:scroll;
		border:1px solid #424242;
		margin-bottom:20px;
	}
	
	ul {
		width:280px;
		padding:0;
		margin:0;
		list-style:none;
	}
	
	li {
		background: #FAFAFA;
		padding:15px 0;
		text-indent:10px;
	}
</style>
</head>
<body>
	<p>
	<button id="openBtn">open</button>
	<button id="closeBtn">close</button>
	</p>
	
	<h1>채팅</h1>
	<div id="listBox">	
	<ul>
		<li>채팅내용</li>
	</ul>
	</div>

	<form id="form">
	<input id="chatInput" />
	<button>보내기</button>
	</form>
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

	var $openBtn = $("#openBtn"),
		$closeBtn = $("#closeBtn"),
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
	
	$closeBtn.click(function() {
		socket.close();//소켓 닫음
	});//click() end
	
	
	function displayMsg(msg) {
		
		$("<li>").text(msg)
		         .appendTo($list);
		
		console.log($list.height());
		//현재 리스트의 
		var size = $list.height();
		
		//스크롤을 지정
		$("#listBox").scrollTop(size);
		
	}//displayMsg() end
	
	
	$openBtn.click(function() {
		
		
		//웹소켓의 프로토콜은 ws://
		socket = new WebSocket("ws://localhost/trip_GazuaAA/chat");
	
		//소켓은 open,close,error,message
		
		socket.onopen = function() {
			displayMsg("서버와 연결되었습니다.");
		}//onopen() end
		socket.onclose = function() {
			displayMsg("서버와 연결이 끊어졌습니다.");
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





