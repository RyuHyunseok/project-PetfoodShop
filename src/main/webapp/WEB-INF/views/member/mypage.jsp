<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypage.css?after"
	type="text/css">
</head>
<body>
  <div id="container">
    <div id="menu">
      <div id="menuHeader">마이페이지</div>
      <hr id="hr1">
      <div id="menuBody">
        <div class="menuBox"><a href="mypageorderlist">-주문목록</a></div>
        <div class="menuBox"><a href="membereditform">-회원정보 변경</a></div>
        <div class="menuBox"><a href="memberdeleteform">-회원탈퇴</a></div>
        <div class="menuBox"><a href="wishlist">-찜 리스트</a></div>
      </div>
    </div>
    <div id="main">
      <div id="memberBox">
        <img id="profileImg" src="resources/img/member/프로필.png">
        <div id="profileBox">
          <div id="nameBox">
            <span>${member.name } 님</span>
            <span>${member.email }</span>
          </div>
          <div class="profile">
            <span>아이디</span>
            <span>${member.username }</span>
          </div>
          <div class="profile">
            <span>휴대폰번호</span>
            <span>${member.tel }</span>
          </div>
          <div class="profile">
            <div>기본주소</div>
            <div id="address">
              <div>
                <span>도로명</span>
                <span>${member.roadAddress }</span>
              </div>
              <div>
                <span>상세주소</span>
                <span>${member.detailAddress }</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>