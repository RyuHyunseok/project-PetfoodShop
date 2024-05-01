<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<link rel="stylesheet" href="resources/css/membereditform.css?after"
	type="text/css">
</head>
<body>
  <div id="container">
    <div id="menu">
      <div id="menuHeader">마이페이지</div>
      <hr id="hr1">
      <div id="menuBody">
        <div class="menuBox"><a href="mypageorderlist">-주문목록</a></div>
        <div class="menuClick"><a href="membereditform" style="color: #7fad39">-회원정보 변경</a></div>
        <div class="menuBox"><a href="memberdeleteform">-회원탈퇴</a></div>
        <div class="menuBox"><a href="wishlist">-찜리스트</a></div>
      </div>
    </div>
    <div id="main">
        <div>
          <section class="checkout spad" style="padding-top: 41px">
            <div class="container">
                <div class="row justify-content-center">
                <div class="checkout__form">
                    <h4>회원 정보 수정</h4>
    
                            <div class="col-lg-12 mx-auto" style="width: 733px; padding: 0">
                               
                                <div class="col-lg-12 ">
                                        <div class="checkout__input">
                                            <p>이름<span>*</span></p>
                                            <input type="text" id="nameBox" name="name" value="${member.name }" maxlength="5">
                                        	<div id="nameMessage"></div>
                                        </div>
                                 </div>
                                
                                <div class="col-lg-12 ">
                                    <div class="checkout__input">
                                        <p>아이디<span>*</span></p>
                                        <input type="text" id="idBox" name="username" readonly="readonly" value="${member.username }">
                                        <div id="idMessage"></div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>새 비밀번호<span>*</span></p>
                                        <input type="password" id="passwordBox" name="password">
                                    	<div id="passwordMessage"></div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>새 비밀번호 확인<span>*</span></p>
                                        <input type="password" id="passwordChkBox">
                                    	<div id="passwordChkMessage"></div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>이메일<span>*</span></p>
                                        <input type="text" class="col-lg-8" id="emailBox" name="email" value="${member.email }">
                                    	<div id="emailMessage"></div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>연락처<span>*</span></p>
                                        <input id="telBox1" name="tel1" type="text" class="col-lg-2" style="margin-right: 10px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').substring(0, 3);"  value="">
                                        <input id="telBox2" name="tel2" type="text" class="col-lg-2" style="margin-right: 10px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').substring(0, 4);">
                                        <input id="telBox3" name="tel3" type="text" class="col-lg-2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').substring(0, 4);">
                                    	<div id="telMessage"></div>
                                    </div>
                                    <div class="checkout__input">
                                        <p>우편번호<span>*</span></p>
                                        <input type="text" name="postcode" class="col-lg-8" id="address1" readonly value="${member.postcode }">
                                        <button id="check" style="margin-left: 20px;" onclick="DaumPostcode()">우편번호 찾기</button>
                                    </div>
                                    <div class="checkout__input">
                                        <p>주소<span>*</span></p>
                                        <input type="text" name="roadAddress" placeholder="도로명 주소" class="checkout__input__add" id="address2" readonly  value="${member.roadAddress }">
                                        <input type="text" name="jibunAddress" placeholder="지번 주소" class="checkout__input__add" id="address3" value="${member.jibunAddress }">
                                    	<input type="text" name="detailAddress" placeholder="상세 주소" class="checkout__input__add" id="address4" value="${member.detailAddress }">
                                    </div>
                                    <div class="checkout__input d-flex justify-content-center">
                                        <button id="editbutton" style="margin-right: 100px;" onclick="finalChk()">수정하기</button>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </div>
      </div>
    </div>
    <input id="tel" type="hidden" value="${member.tel }">
    <input id="originalPasswordBox" type="hidden" value="${member.password }">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="resources/js/membereditform.js?after"></script>
</body>
</html>