<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="resources/img/breadcrumb.jpg">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>Checkout</h2>
          <div class="breadcrumb__option">
            <a href="home">Home</a>
            <span>Checkout</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
  <div class="container">
    <div class="checkout__form">
      <h4>Billing Details</h4>


        <div class="row">
          <div class="col-lg-8 col-md-6">
            <div class="checkout__input__checkbox">
              <label for="diff-acc">
                기본배송지
                <input type="checkbox" id="diff-acc" onchange="checkboxChange()" checked>
                <span class="checkmark"></span>
              </label>
            </div>
            <br>
            <div class="row">
              <div class="col-lg-6">
                <div class="checkout__input">
                  <p>
                    받는 분 성함
                    <span>*</span>
                  </p>
                  <input type="text" value="${MemberInfo.name }" id="name" name="name" maxlength="5" required>
                  <input type="hidden" value="${MemberInfo.id}" name="id">
                </div>
              </div>
              <div class="col-lg-6">
                <div class="checkout__input">
                  <p>
                    받는 분 전화번호
                    <span>*</span>
                  </p>
                  <input type="text" value="${MemberInfo.tel }" id="tel" name="tel" maxlength="11" required>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-4">
                <div class="checkout__input">
                  <p>
                    받는 분 주소
                    <span>*</span>
                  </p>
                  <input type="text" value="${MemberInfo.postcode }" id="postcode" placeholder="우편번호" required>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="checkout__input">
                  <p>
                    &nbsp;
                    <span>&nbsp;</span>
                  </p>
                  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-6">
                <div class="checkout__input">
                  <input type="text" value="${MemberInfo.roadAddress }" id="roadAddress" placeholder="도로명주소" required>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="checkout__input">
                  <input type="text" value="${MemberInfo.jibunAddress }" id="jibunAddress" placeholder="지번주소">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-8">
                <div class="checkout__input">
                  <input type="text" value="${MemberInfo.detailAddress }" id="detailAddress" placeholder="상세주소" maxlength="30">
                </div>
              </div>
              <div class="col-lg-4">
                <div class="checkout__input">
                  <input type="text" id="extraAddress" placeholder="참고항목">
                </div>
              </div>
            </div>
            <div class="checkout__input">
              <span id="guide" style="color: #999; display: none"></span>
            </div>
            <div class="checkout__input">
              <p>
                배송 시 요청사항 (30자)
                <span>*</span>
              </p>
              <input type="text" id="shippingRequest" name="shippingRequest" placeholder="Notes about your order, e.g. special notes for delivery." maxlength="30">
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="checkout__order">
              <h4>Your Order</h4>
              <div class="checkout__order__products">
                Products
                <span>Total</span>
              </div>
              
              <c:set var="totalPrice" value="0"/>	<!-- c:set 은 변수를 선언하고 값을 설정 할 수 있음 --> 
              										<!-- '<'와 '>'는 HTML에서 태그를 나타내기 위한 특수문자이기 때문에 주석내에서 그대로 사용하면
              											HTML Paser가 잘못 해석할 수 있어서 조심해야함 -->
        
              <ul>
              
				<c:forEach items="${Carts }" var="c"> 
                 <li>${c.name } x ${c.quantity}
                 <span>${c.price * c.quantity }</span>                 
                 </li>
     			 <c:set var="totalPrice" value="${totalPrice + (c.price * c.quantity) }"/>
           <input type="hidden" value="${c.name}" class="productName" data-name="${c.name }"/>
				</c:forEach>
                
              </ul>
              <div class="checkout__order__subtotal">
                Total
                <span id="finalTotalPrice">${totalPrice }</span>
              </div>
 
              <p>환불 가능.</p>
              <div class="checkout__input__checkbox">
                <label for="payment">
                  Check Payment
                  <input type="checkbox" id="payment" onClick="return false;">
                  <span class="checkmark"></span>
                </label>
              </div>
              <div class="checkout__input__checkbox">
                <label for="paypal">
                  Paypal
                  <input type="checkbox" id="paypal" onClick="return false;">
                  <span class="checkmark"></span>
                </label>
              </div>
              <button class="site-btn" onclick="requestPay()">PLACE ORDER</button>
            </div>
          </div>
        </div>

      
<!-- <button onclick="requestPay()">결제하기</button> -->

    </div>
  </div>
</section>
<!-- Checkout Section End -->


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;
						document.getElementById("jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
					}
				}).open();
	}
	
	
  function checkboxChange() {
        var checkbox = document.getElementById("diff-acc");
        var name = document.getElementById("name");
        var tel = document.getElementById("tel");
        var postcode = document.getElementById("postcode");
        var roadAddress = document.getElementById("roadAddress");
        var jibunAddress = document.getElementById("jibunAddress");
        var detailAddress = document.getElementById("detailAddress");
        

            if (checkbox.checked) {
                // 체크박스가 체크된 경우
                  name.value = "${MemberInfo.name}";
                  tel.value = "${MemberInfo.tel}";
                  postcode.value = "${MemberInfo.postcode}";
                  roadAddress.value = "${MemberInfo.roadAddress}";
                  jibunAddress.value = "${MemberInfo.jibunAddress}";
                  detailAddress.value = "${MemberInfo.detailAddress}";
            } else {
                  name.value = "";
                  tel.value = "";
                  postcode.value = "";
                  roadAddress.value = "";
                  jibunAddress.value = "";
                  detailAddress.value = "";
            }
        }
  
    
</script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>

	var nameInput = document.getElementById("name");
	var telInput = document.getElementById("tel");
	var postcodeInput = document.getElementById("postcode");
	var roadAddressInput = document.getElementById("roadAddress");
	var jibunAddressInput = document.getElementById("jibunAddress");
	var detailAddressInput = document.getElementById("detailAddress");
	var shippingRequestInput = document.getElementById("shippingRequest");


function requestPay() {
	
	if(nameInput.value.trim() === "") {
    alert("이름은 필수 입력사항입니다.");
  } else if(telInput.value.trim() === ""){ // trim() : 문자열에서 시작과 끝의 공백을 제거하는 함수
    alert("전화번호는 필수 입력사항입니다.");
  } else if(postcodeInput.value.trim() === ""){
    alert("우편번호는 필수 입력사항입니다.");
  } else if(roadAddressInput.value.trim() === ""){
    alert("도로명주소는 필수 입력사항입니다.");
  } else if(jibunAddressInput.value.trim() === ""){
    alert("지번주소는 필수 입력사항입니다.");
  } else if(detailAddressInput.value.trim() === ""){
    alert("상세주소는 필수 입력사항입니다(xx동, xx호).");
  } else if(shippingRequestInput.value.trim() === ""){
    alert("배송요청사항은 필수 입력사항입니다.");
  } else {
	
  IMP.init('imp11233520'); 

	var productName = document.querySelectorAll(".productName");
	var productNameArray = [];
	for (var i = 0; i < productName.length; i++) {
	    productNameArray.push(productName[i].value);
	}
	var productNameString = productNameArray.join(',');
	
	var ShipRequest = document.getElementById("shippingRequest");
	
    var name = document.getElementById("name").value;
    var tel = document.getElementById("tel").value;
    var postcode = document.getElementById("postcode").value;
    var roadAddress = document.getElementById("roadAddress").value;
    var jibunAddress = document.getElementById("jibunAddress").value;
    var detailAddress = document.getElementById("detailAddress").value;
    var shippingRequest = document.getElementById("shippingRequest").value;

	
  IMP.request_pay({
    pg: "kakaopay",
    pay_method: "card",
    merchant_uid : new Date().getTime(), // 주문 번호
    id : '${c.id}', // 주문 id
    name : productNameString, // 상품명
    amount : '${totalPrice}', // 결제 금액
    buyer_name : name,
    buyer_tel : tel,
    buyer_addr : roadAddress + "," + jibunAddress + "," + detailAddress + "," + shippingRequest,
    buyer_postcode : postcode,

  }, function (rsp) {
	    console.log(rsp);
	    if (rsp.success) {
	      var msg = '결제가 완료되었습니다.';
	      alert(msg);
	      
	      var result = {
	    	"id" : rsp.merchant_uid,
            "customerId" : '${MemberInfo.id}',
            "name" : rsp.buyer_name,
            "postcode" : rsp.buyer_postcode,
            "Address" : rsp.buyer_addr,
            "productName" : rsp.name,
            "quantity" : rsp.quantity,
            "tel" : rsp.buyer_tel
	      }
	      
		  location.href = '${path}/commonmessage';
	      console.log(result);
	      
        $.ajax({
          url:'${ path }/checkout',
          type:'POST',
          contentType: 'application/json',
          dataType: 'json',
          data:JSON.stringify(result),
          success: function (res) {
            console.log(res);
            location.href = '${path}/commonmessage';
            
          },
          error: function (err) {
            console.log(err);
          }
        });

	    } else {
	      var msg = '결제에 실패하였습니다.';
	      msg += '에러내용 : ' + rsp.error_msg;
	      alert(msg);
	    }
	  });
}
}
</script>


