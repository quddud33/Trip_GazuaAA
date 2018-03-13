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
<style>
.btn-custom {
	margin-bottom:17px;
	background-color: hsl(145, 62%, 68%) !important;
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#cdf3dd",
		endColorstr="#7adfa4");
	background-image: -khtml-gradient(linear, left top, left bottom, from(#cdf3dd),
		to(#7adfa4));
	background-image: -moz-linear-gradient(top, #cdf3dd, #7adfa4);
	background-image: -ms-linear-gradient(top, #cdf3dd, #7adfa4);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #cdf3dd),
		color-stop(100%, #7adfa4));
	background-image: -webkit-linear-gradient(top, #cdf3dd, #7adfa4);
	background-image: -o-linear-gradient(top, #cdf3dd, #7adfa4);
	background-image: linear-gradient(#cdf3dd, #7adfa4);
	border-color: #7adfa4 #7adfa4 hsl(145, 62%, 63%);
	color: #333 !important;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.33);
	-webkit-font-smoothing: antialiased;
}
.pwdMsg{
	color: #FFCECE;
	font-size: 12px;
}
.pwdCkMsg{
	color: #FFCECE;
	font-size: 12px;
}
.idMsg{
	color: #FFCECE;
	font-size: 12px;
}
</style>
</head>
<body>
      <!-- 네비게이션 -->
   <%@ include file="../template/nav.jsp" %>

   <!-- <form action="createUser.do">
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
    -->
   
   
   
   <div class="container">
  <form action ="createUser.do">
    <div class="form-group">
    <label for="checkaa">아이디 :</label>
    <input type="text" placeholder="아이디 입력"
      name="userID" required class="form-control id" oninput="checkID()" id="checkaa"/>
       <div id="idMsgBox">
      	<p class="idMsg"></p>
      </div>
    </div>
    <div class="form-group">
    <label><b>Nickname</b></label> 
      <input type="text" placeholder="닉네임 입력"
         name="nickName" required class="form-control id" id="nickname" oninput="checkID()"/>
    </div>
   
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password"
         placeholder="비밀번호 입력" id="pwd" name="password" required class="form-control pass"
         oninput="checkPwd()"/> 
      <div id="pwdMsgBox">
      	<p class="pwdMsg"></p>
      </div>
    </div>
    
    <div class="form-group">
         <label for="pwdCheck">비밀번호 확인:</label>
      <input type="password" placeholder="비밀번호 재확인" name="pw_CHECK" 
         required class="form-control pass" id="pwdCheckwd" oninput="checkPwd()"/> 
         <div id="pwdCkMsgBox">
      	<p class="pwdCkMsg"></p>
      </div>
    </div>
    <div class="clearfix">
    <button type="submit" class="btn btn-custom signupbtn" disabled="disabled">가입하기</button>   
    </div>
  </form>
</div>
   
   
   
   
      <!-- footer 시작 -->
   <%@ include file="../template/footer.jsp" %>
   
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script src="/trip_GazuaAA/js/googleLogin.js"></script>
   <script src="/trip_GazuaAA/js/FBLogin.js"></script>
   <script src="/trip_GazuaAA/js/login.js"></script>
<script>
 
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkID() {
        var inputed = $('.id').val();
    	var idwordRules = /^(?=.*[a-z])[a-z0-9\-_]{5,20}$/;
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
                    $(".idMsg").text("아이디를 입력해주세요.");
                    idCheck = 0;
                } else if (data == '0') {
                	if(idwordRules.test(inputed)){
                    $("#checkaa").css("background-color", "#B0F6AC");
                    $(".idMsg").text("");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").css("background-color", "#4CAF50");
                        signupCheck();
                    } 
                	}else{
                		$("#checkaa").css("background-color", "#FFCECE");
                		 $(".idMsg").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다");
                	}
                } else if (data == '1') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFCECE");
                    $(".idMsg").text("이미 가입된 아이디 입니다.");
                    idCheck = 0;
                } 
            }
        });
    }
    function checkPwd() {
		var id = $('.id').val();
        var inputed = $('.pass').val();
        var reinputed = $('#pwdCheckwd').val();
        var tf = checkPassword(id,inputed);//true false = tf 인싸 변수 
        console.log(inputed);
        console.log(reinputed);
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#pwdCheckwd").css("background-color", "#FFCECE");
            $(".pwdCkMsg").text("비밀번호 확인을 써주세요.");
            
        }
        else if (inputed == reinputed) {
            $("#pwdCheckwd").css("background-color", "#B0F6AC");
            $(".pwdCkMsg").text("");
            if(tf == true){
            	pwdCheck = 1;	
            }
            if(idCheck==1 && pwdCheck == 1) {
                $(".signupbtn").prop("disabled", false);
                $(".signupbtn").css("background-color", "#4CAF50");
                signupCheck();
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#pwdCheckwd").css("background-color", "#FFCECE");
            $(".pwdCkMsg").text("비밀번호와 비밀번호 확인이 다릅니다.");
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
    
    function checkPassword(id,password){
    	var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    	var checkNumber = password.search(/[0-9]/g);
    	var checkEnglish = password.search(/[a-z]/ig);
    	if(passwordRules.test(password) == false){
    		
    		$(".pwdMsg").text('숫자,영문자,특수문자가 섞인 8~16자리로 비밀번호 설정 해주세요');
    	
    	return false;

    	}else if(/(\w)\1\1\1/.test(password)){
    	
    			$(".pwdMsg").text('비밀번호에 444같은 문자를 4번 이상 사용하실 수 없습니다.');
        	return false;
    		
    	}else if(password.search(id) > -1){
    	
    			$(".pwdMsg").text('비밀번호에 아이디가 포함되었습니다.');
    
        	return false;
    		
    	}else{
		$(".pwdMsg").text("");
    	return true;

    		}

    	}
    
   

</script>
</html>