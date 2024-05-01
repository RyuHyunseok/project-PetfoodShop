<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/signinform.css"
	type="text/css">
</head>
<body>
	<div class="login-page">
		<div id="title">로그인</div>
		<div id="blankBox"></div>
		<div class="form">
			<div id="loginTitle">회원 로그인</div>
			<div id="blankBox"></div>
			<form class="login-form" id="logincheck" action="home" method="POST">
				<input type="text" id="id" name="username" placeholder="아이디" /> <input id="password"
					type="password" name="password" placeholder="비밀번호" />
				<button type="button" id="loginBtn" class="button" onclick="login()">로그인</button>
				<button type="button" id="signupBtn" class="button"
					onclick="signupform1()">회원가입</button>
				<hr>
				<div id="footer">
					<button type="button" onclick="findid()">아이디 찾기</button>
					<button type="button" onclick="findpassword()">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
	<form id="signupform1" action="signupform1"></form>
	<form id="admin" action="admin"></form>
	<form id="findid" action="findid1"></form>
	<form id="findpassword" action="findpassword1"></form>
	<form id="signinpage" action="signinpage" method="post"></form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/js/signinform.js?after"></script>
</body>
</html>