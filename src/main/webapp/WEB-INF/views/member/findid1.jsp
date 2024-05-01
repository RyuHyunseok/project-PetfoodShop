<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/findid1.css?after"
	type="text/css">
</head>
<body>
	<div class="login-page">
		<div id="title">아이디찾기</div>
		<div id="blankBox"></div>
		<div class="form">
			<div id="loginTitle">회원 아이디찾기</div>
			<div id="blankBox"></div>
			<form class="login-form" id="findid2" action="findid2">
				<div>
					<input class="radio" id="email" type="radio" name="emailOrTel"
						value="email" onclick="change()" checked> <label
						for="email" onclick="change()">이메일</label> <input class="radio"
						id="tel" type="radio" name="emailOrTel" value="email"
						onclick="change()"> <label for="tel" onclick="change()">휴대폰번호</label>
				</div>
				<div id="gridBox">
					<div id="box1">
						<input id="nameBox" class="inputBox1 inputEdit" type="text"
							placeholder="이름" name="name"><br>
					</div>
					<div id="box2">
						<input class="inputBox1 change inputEdit" id="telBox" type="text"
							placeholder="가입휴대폰번호" style="display: none;"
							onkeyup="checkReg2(event)" maxlength="11" name="tel">
						<div id="emailBox" class="flex">
							<div>
								<input class="inputEdit" id="emailText" spellcheck="false"
									type="text" name="email" placeholder="가입메일주소">
							</div>
							<div id="selectBoxEdit2" class="custom-select2 inline "
								style="width: 150px;">
								<select class="cutom-select2" id="selectBox">
									<option class="selectBoxEdit3" value="self">직접입력</option>
									<option class="selectBoxEdit3" value="self">직접입력</option>
									<option class="selectBoxEdit3" value="naver.com">naver.com</option>
									<option class="selectBoxEdit3" value="hanmail.net">hanmail.net</option>
									<option class="selectBoxEdit3" value="daum.net">daum.net</option>
									<option class="selectBoxEdit3" value="nate.com">nate.com</option>
									<option class="selectBoxEdit3" value="gmail.com">gmail.com</option>
								</select>
							</div>
						</div>
					</div>
					<div id="box3">
						<button type="button" onclick="findid2()">아이디찾기</button>
					</div>
				</div>
				<div id="message" style="display: none; padding-left: 9px"></div>
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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/js/findid1.js?after"></script>
</body>
</html>