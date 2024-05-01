<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/findid2.css" type="text/css">
</head>
<body>
	<div class="login-page">
		<div id="title">아이디찾기</div>
		<div id="blankBox"></div>
		<div class="form">
			<div id="loginTitle">
				${name } 회원님의 아이디는<br> <b>${username }</b> 입니다
			</div>
			<div id="blankBox"></div>
			<form class="login-form">



				<hr>
				<div id="footer">
					<button type="button" onclick="findpassword()">비밀번호찾기</button>
					<button type="button" onclick="signinform()">로그인하기</button>
				</div>
			</form>
		</div>
	</div>
	<form id="findpassword" action="findpassword1"></form>
	<form id="signinform" action="signinform"></form>
	<script src="resources/js/findid2.js"></script>
</body>
</html>