<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@charset "UTF-8";
    body {
	margin: 0;
}

* {
	box-sizing: border-box;
}

#container {
	display: flex;
	flex-direction: row;
	margin: 0 auto;
	width: 1280px;
}

#menu {
	height: 300px;
	width: 247px;
	;
}

#main {
	width: 1033px;
}

#menuHeader {
	font-weight: bold;
	letter-spacing: -0.07em;
	font-size: 20px;
	padding: 35px 0 9px 10px;
}

#hr1 {
	margin-left: 0;
	text-align: left;
	width: 210px;
	border: 0;
	border-top: 1px solid rgba(0, 0, 0, .1);
}

#menuBody {
	margin-top: 25px;
	font-size: 14px;
	letter-spacing: -0.09em;
	color: rgb(83, 83, 83);
	font-weight: bold;
}

.menuBox {
	cursor: pointer;
	width: fit-content; padding-left : 15px;
	margin-bottom: 18px;
	padding-left: 15px;
}

.menuClick {
	padding-left: 20px;
	margin-bottom: 18px;
	color: #7fad39;
}
a:link {
	color: rgb(83, 83, 83);
}

a:visited {
	color: rgb(83, 83, 83);
}

a:hover {
	color: rgb(83, 83, 83);
}

a:active {
	color: rgb(83, 83, 83);
}
h4 {
  letter-spacing: -0.1em;
}
.breadcrumb-section {
	display: none !important;
}
.shoping-cart {
	padding: 40px 0;
}
#orderlistContainer {
	padding: 0px !important;
}
</style>
</head>
<body>
	<div id="container">
		<div id="menu">
			<div id="menuHeader">마이페이지</div>
			<hr id="hr1">
			<div id="menuBody">
				<div class="menuClick">
					<a href="mypageorderlist" style="color: #7fad39">-주문목록</a>
				</div>
				<div class="menuBox">
					<a href="membereditform">-회원정보 변경</a>
				</div>
        		<div class="menuBox">
					<a href="memberdeleteform">-회원탈퇴</a>
				</div>
				<div class="menuBox">
					<a href="memberdeleteform">-찜 리스트</a>
				</div>
			</div>
		</div>
		<div id="main">
			
      <section class="checkout spad" style="padding-top: 41px">
        <div class="container">
          <div class="row justify-content-center">
            <div class="checkout__form">
              <h4>주문목록</h4>
              <div id="orderlistContainer" class="col-lg-12 mx-auto" style="width: 1020px;">
                <c:import url="../orderlist/orderlist.jsp"></c:import>
              </div>
            </div>
          </div>
        </div>
      </section>

		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="resources/js/orderlist.js"></script>
</body>
</html>