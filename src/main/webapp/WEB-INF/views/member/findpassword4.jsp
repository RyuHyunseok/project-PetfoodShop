<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="resources/css/findpassword4.css" type="text/css">
</head>
<body>
  <div class="login-page">
    <div id="title">비밀번호 &nbsp;찾기</div>
    <div id="blankBox"></div>
    <div class="form">
      <form class="login-form">
        <div id="message">비밀번호가 &nbsp;정상적으로 &nbsp;변경되었습니다.</div>
        
        <div id="footer">
          <button type="button" onclick="signinform()">로그인</button>
        </div>
      </form>
    </div>
  </div>
  <form id="signinform" action="signinform"></form>
<script src="resources/js/findpassword4.js"></script>
</body>
</body>
</html>