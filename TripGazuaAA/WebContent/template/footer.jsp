<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
 <form action="login.do">
	<div id="bg">
		<div id="loginBox">
				<h2 class="title">Trip GazuaAA</h2>
				<dl>
				<dd>
					<input type="text" name="userID" placeholder="아이디" />
				</dd>
				<dd>
					<input type="password" name="password" placeholder="비밀번호" />
				</dd>
				<dd>
					<button>로그인</button>
				</dd>
				<dd>
					<img class="lBtn" alt="네이버이미지" src="/trip_GazuaAA/img/네이버 아이디로 로그인_완성형_Green.PNG" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=rXNTEaBc1MiIpkex1vR5&state=STATE_STRING&redirect_uri=http://localhost:8080/trip_GazuaAA/naverLogin.do'"/>
				</dd>
				<dd>
					<div style="width: 250px; height: 54px;" class="lBtn g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
				</dd>
				<dd>
					<div scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button" data-width="250" data-height="54" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
				</dd>
			</dl>
		</div>
	</div>
</form>	
<footer style ="background-color: #000000; color: #ffffff">
	<div class="container">
		<div class="row">
			<div class="col-sm-12" style ="text-align: center;"><h5>Copyright &copy; 2018</h5> <h5>강병영 임현준 정민섭 최유강 이한울</h5>
			</div>
		</div>
	</div>
</footer>