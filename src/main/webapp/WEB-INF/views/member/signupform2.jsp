<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="resources/css/signupform2.css?after" type="text/css">
</head>

<body>
	<form action="signupform3" id="form" method="post" onsubmit="return finalChk()">
		<div class="login-page">
			<div id="title">
				<span>기본정보</span> <span>* 표시는 반드시 입력하셔야 하는 항목입니다</span>
			</div>
			<div id="blankBox"></div>
			<hr>
			<div class="form">
				<table>
					<thead>
						<tr>
							<th align="left"><span class="text"><span
									id="required">*</span> 아이디</span></th>
							<td><input spellcheck="false" id="idBox" type="text"
								class="inputBox" name="username" onkeyup="checkReg(event)"
								maxlength="15">
								<div class="messageBox" id="idMessage"></div></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th align="left"><span class="text"><span
									id="required">*</span> 비밀번호</span></th>
							<td><input type="password" id="passwordBox" class="inputBox"
								name="password" maxlength="15" onkeyup="checkReg(event)">
								<div class="messageBox" id="passwordMessage"></div></td>
						</tr>
						<tr>
							<th align="left"><span class="text"><span
									id="required">*</span> 비밀번호 확인</span></th>
							<td><input type="password" id="passwordChkBox"
								class="inputBox" name="passwordChk" maxlength="15" onkeyup="checkReg(event)">
								<div class="messageBox" id="passwordChkMessage"></div></td>
						</tr>
						<tr>
							<th align="left"><span class="text"><span
									id="required">*</span> 이름</span></th>
							<td><input spellcheck="false" type="text" id="nameBox"
								class="inputBox" name="name" maxlength="5" onkeyup="checkReg3(event)">
								<div class="messageBox" id="nameMessage"></div></td>
						</tr>
						<tr>
							<th align="left"><span class="text"><span
									id="required" maxlength="30">*</span> 이메일</span></th>
							<td>
								<div id="test">
									<div class="inline">
										<input spellcheck="false" id="emailBox" type="text"
											class="inputBox" name="email" onkeyup="checkReg3(event)">
									</div>
									<div id="selectBoxEdit2" class="custom-select2 inline" style="width: 150px;">
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
									<div class="messageBox" id="emailMessage"></div>
								</div>
								<div class="checkbox">
									<input type="checkbox" id="checkbox1" /> <label
										for="checkbox1"><b>정보/이벤트 메일 수신에 동의합니다.</b></label>
								</div>
							</td>
						</tr>
						<tr>
							<th align="left"><span class="text"><span
									id="required">*</span> 휴대폰번호</span></th>
							<td><input type="text" id="telBox" class="inputBox"
								name="tel" placeholder="-없이 입력하세요." onkeyup="checkReg2(event)"
								maxlength="11">
								<div class="messageBox" id="telMessage"></div>
								<div>
									<span class="checkbox"> <input type="checkbox"
										id="checkbox2" /> <label id="bold" for="checkbox2">[선택]
											SMS/앱푸시 수신에 동의합니다.</label>
									</span>
								</div>
								<div id="message">
									<label id="labelEdit" for="checkbox2">신상품, 이벤트, 할인 혜택 등 다양한 정보를 알려드려요!</label>
								</div></td>
						</tr>
						<tr>
							<th align="left"><span class="text">&nbsp;&nbsp;주소</span></th>
							<td>
								<div class="flex">
									<input type="text" class="inputBox" id="address1"
										name="postcode" placeholder="우편번호" readonly> <input
										id="postNum" type="button"
										onclick="sample4_execDaumPostcode()" value="우편번호검색">
								</div>
								<div>
									<input type="text" class="inputBox inputBox2" id="address2"
										name="roadAddress" placeholder="도로명" readonly>
								</div>
								<div id="guide" style="color: #999; display: none"></div>
								<div>
									<input type="text" class="inputBox inputBox2" id="address3"
										name="jibunAddress" placeholder="지번" readonly>
								</div>
								<div>
									<input type="text" class="inputBox inputBox2" id="address4"
										name="detailAddress" placeholder="상세주소(생략가능)" maxlength="30">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="footer">
				<button type="button">취소</button>
				<button type="submit">회원가입</button>
			</div>
		</div>
	</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/signupform2.js?after"></script>
</body>
</html>