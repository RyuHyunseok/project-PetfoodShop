<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="resources/css/findpassword3.css?after" type="text/css">
</head>
<body>
 <form id="findpassword4" action="findpassword4">
  <div class="login-page">
    <div id="title">비밀번호 &nbsp;찾기</div>
    <div id="blankBox"></div>
    <div class="form">
      <div id="loginTitle">비밀번호 변경</div>
      <div id="blankBox"></div>
      <form class="login-form">
        <div id="message">새로운 &nbsp;비밀번호를 &nbsp;등록해 &nbsp;주세요.</div>
        <hr>
      
        <div>
          <input id="passwordBox" name="password" class="inputBox1" type="password" placeholder="숫자 또는 문자 포함 형태의 6~12자리로 조합해주세요."><br>
          <input type="hidden" id="usernameBox" name="username" value="${username }">
        </div>
        <div class="messageBox" id="passwordMessage"></div>
        <div>
          <input id="passwordChkBox" class="inputBox1" type="password" placeholder="새 비밀번호 확인"><br>
        </div>
        <div class="messageBox" id="passwordChkMessage"></div>
        <div id="message2">
          <div style="display: none;">
            아이디를 &nbsp;모르시나요?
          </div>
        </div>
        <div id="footer">
          <button type="button" onclick="findpassword4()">다음</button>
        </div>
      </form>
    </div>
  </div>
 </form>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/findpassword3.js?after"></script>
</body>
</html>