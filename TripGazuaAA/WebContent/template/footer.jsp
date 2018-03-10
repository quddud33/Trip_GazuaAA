<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%if(session.getAttribute("msg") != null) {%>
		<script>
			alert('${msg}');
		</script>
<%session.removeAttribute("msg");}%>

<form action="login.do">
	<div id="bg">
		<div id="loginBox">
			<h2 class="title">Trip GazuaAA</h2>
			<div class="col-md-3">
				<div class="container" style="padding: 0; max-width: 520px">
					<div class="login-box well">
						<legend>로그인</legend>
						<div class="form-group">
							<label for="username-email">아이디</label> <input name="userID"
								value='' placeholder="Username" type="text" class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="password"
								name="password" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Login" />			
						
						</div>
						<dl class="loginBtnBox">
							<dd class="loginBtnBoxdd">
								<img class="lBtn" alt="네이버이미지" 
									src="/trip_GazuaAA/img/네이버 아이디로 로그인_완성형_Green.PNG"
									onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=rXNTEaBc1MiIpkex1vR5&state=STATE_STRING&redirect_uri=http://localhost:8080/trip_GazuaAA/naverLogin.do'" />
							</dd>
							 <dd class="loginBtnBoxdd">
								<div style="width: 250px; height: 54px;" class="lBtn g-signin2"
									data-onsuccess="onSignIn" data-theme="dark"></div>
							</dd> 
							<dd class="loginBtnBoxdd">
								<div scope="public_profile,email" onlogin="checkLoginState();"
									class="fb-login-button" data-width="250" data-height="54"
									data-max-rows="1" data-size="large"
									data-button-type="login_with" data-show-faces="false"
									data-auto-logout-link="false" data-use-continue-as="false"></div>
							</dd>

						</dl>

					</div>
				</div>
			</div>
		</div>
	</div>
</form>






<footer style="background-color: #000000; color: #ffffff">
	<div class="container">
		<div class="row">
			<div class="col-sm-12" style="text-align: center;">
				<h5>Copyright &copy; 2018</h5>
				<h5>강병영 임현준 정민섭 최유강 이한울</h5>
			</div>
		</div>
	</div>
</footer>