<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/findpassword1.css?after"
	type="text/css">
</head>
<body>
  <form id="findpassword2" action="findpassword2">
	<div class="login-page">
		<div id="title">비밀번호 &nbsp;찾기</div>
		<div id="blankBox"></div>
		<div class="form">
			<div id="loginTitle">아이디 입력</div>
			<div id="blankBox"></div>
			<form class="login-form">
				<div id="message">비밀번호를 &nbsp;찾고자 &nbsp;하는 &nbsp;아이디를
					&nbsp;입력해 &nbsp;주세요.</div>
				<hr>

				<div>
					<input class="inputBox1" type="text" placeholder="아이디" id="idBox" name="username"><br>
				</div>
				<div>
					<input class="inputBox1" type="text" placeholder="이름" id="nameBox"><br>
				</div>
				<div id="message2">
					아이디를 &nbsp;모르시나요? &nbsp;<a href="findid1">아이디 &nbsp;찾기</a>
					<div id="message3" style="display: none;">회원정보를 찾을수 없습니다.</div>

				</div>
				<div id="footer">
					<button type="button" onclick="findpassword2()">다음</button>
				</div>
				<input type="hidden" id="email" name="email">
			</form>
		</div>
	</div>
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="resources/js/findpassword1.js?after"></script>
</body>
</html>