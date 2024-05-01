<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/style.css?after" type="text/css">

    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	var IMP = window.IMP;


      function requestPay() {
      IMP.init("imp11233520");
        IMP.request_pay(
          {
            pg: "kakaopay.{TC0ONETIME}",
            pay_method: "card",
            merchant_uid: "57008833-33004",
            name: "당근 10kg",
            amount: 1004,
            buyer_email: "Iamport@chai.finance",
            buyer_name: "포트원 기술지원팀",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
            // callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
          }
        );
      }
    </script>
    
</head>
<body>
  <!-- Page Preloder -->
  <div id="preloder">
    <div class="loader"></div>
  </div>
  <div id="wrap">
    <div>
      <tiles:insertAttribute name="header" />
    </div>
    <hr>
    <div>
      <tiles:insertAttribute name="body" />
    </div>
    <hr>
    <div>
      <tiles:insertAttribute name="footer" />
    </div>
  </div>

  <!-- Js Plugins -->
  <script src="resources/js/jquery-3.3.1.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery.nice-select.min.js"></script>
  <script src="resources/js/jquery-ui.min.js"></script>
  <script src="resources/js/jquery.slicknav.js"></script>
  <script src="resources/js/mixitup.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/main.js"></script>
  
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


  
</body>
</html>