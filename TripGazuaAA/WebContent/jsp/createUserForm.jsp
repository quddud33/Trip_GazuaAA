<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/trip_GazuaAA/Bootstrap/css/nav.css">
<title>회원가입 페이지</title>
</head>
<body>
		<!-- 네비게이션 -->
	<%@ include file="../template/nav.jsp" %>

	<form action="createUser.do">
		<label><b>ID</b></label> 
		<input type="text" placeholder="아이디 입력"
			name="userID" required class="id" oninput="checkID()" id="checkaa"/>
		<label><b>Nickname</b></label> 
		<input type="text" placeholder="닉네임 입력"
			name="nickName" required class="id" id="nickname" oninput="checkID()"/>
		<label> <b>Password</b></label> 
		<input type="password"
			placeholder="비밀번호 입력" name="password" required class="pass"
			oninput="checkPwd()"/> 
			<label> <b>Repeat Password</b></label>
		<input type="password" placeholder="비밀번호 재확인" name="pw_CHECK"
			required class="pass" id="repwd" oninput="checkPwd()"/> 
			<input type="checkbox" checked="checked">수락
		<div class="clearfix">
			<button type="button" class="cancelbtn"
				onclick='$("#_joinsung").css("display", "none")'>취소</button>
			<button type="submit" class="signupbtn" disabled="disabled">로그인</button>
	</form>
	
		<!-- footer 시작 -->
	<%@ include file="../template/footer.jsp" %>
	
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
 
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkID() {
        var inputed = $('.id').val();
        $.ajax({
        	url : "checkID.do",
            data : {
                userID : inputed
            },
            success : function(data) {
            	console.log(data);
                if(inputed=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFCECE");
                    idCheck = 0;
                } else if (data == '0') {
                    $("#checkaa").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                        signupCheck();
                    } 
                } else if (data == '1') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFCECE");
                    idCheck = 0;
                } 
            }
        });
    }
    function checkPwd() {
        var inputed = $('.pass').val();
        var reinputed = $('#repwd').val();
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background-color", "#B0F6AC");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
                signupCheck();
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
            
        }
    }
    //닉네임 입력하지 않았을 경우 가입버튼 비활성화
    function signupCheck() {
        var nickname = $("#nickname").val();
        if(nickname=="") {
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
        } else {
        }
    }
    //캔슬버튼 눌렀을 눌렀을시 인풋박스 클리어
    $(".cancelbtn").click(function(){
            $(".id").val(null);
            $(".pass").val('');
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
    });
</script>
</html>