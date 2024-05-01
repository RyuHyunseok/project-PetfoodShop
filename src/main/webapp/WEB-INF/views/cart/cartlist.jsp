<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
</head>
<body>
<!-- Breadcrumb Section Begin -->
 <section class="breadcrumb-section set-bg" data-setbg="resources/img/breadcrumb.jpg">
  <div class="container">
   <div class="row">
    <div class="col-lg-12 text-center">
     <div class="breadcrumb__text">
      <h2>Shopping Cart</h2>
       <div class="breadcrumb__option">
        <a href="./index.html">Home</a>
         <span>Shopping Cart</span>
       </div>
     </div>
    </div>
   </div>
  </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="shoping__cart__table">

         <form action="${ path }/checkoutform" method="post">            	
          <table>
            <thead>
              <tr>
                <th class="shoping__product">Products</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th></th>
                </tr>
            </thead>
         	<tbody id="cartTable">
             <c:forEach items="${Carts}" var="c" varStatus="number"> <!-- 각 반복에서 고유한 id를 생성하고자 할 때 JSTL의 varStatus를 이용한다.
                            											주로 forEach 태그에서 활용함. varStatus는 var 속성과 함께 사용되며
                            											var는 현재 반복에서 사용할 변수의 이름. varStatus는 그 변수의 상태를 저장할
                            											변수의 이름을 지정.
                            											varStatus 변수의 주요 속성
                            											 - index : 현재 반복의 인덱스(0부터 시작)을 나타냄
                            											 - count : 현재 반복의 인덱스에 1을 더한 값
                            											 - first : 현재 반복이 첫 번재 반복인 경우 'true'를, 그렇지 않으면 'false'를 나타냄
                            											 - last  : 현재 반복이 마지막 반복인 경우 'true'를, 그렇지 않으면 'false'를 나타냄 -->
                            								
              <tr>
              <td class="shoping__cart__item">
               <img src="${c.imgPath }" alt="" style="width: 80px; height: 80px;">
                 <h5>${c.name }</h5>
                 </td>
                 <td class="shoping__cart__price" type="number" id="price${number.index + 1 }" data-price="${c.price }">
                   ${c.price }
                 </td>
                 <td class="shoping__cart__quantity">
                   <div class="quantity">
                    <div class="pro-qty">
                     <input type="text" value="1" id="number${number.index + 1 }" name="productQuantities"> 
                    </div>
                   </div>
                  </td>
                  <td class="shoping__cart__total" type="number" id="totalprice${number.index + 1 }" >
                    ${c.price }
                  </td>
                  <td class="shoping__cart__item__close">
                    <a href="deletecart?productId=${c.productId }"><span class="icon_close"></span></a>
                  </td>
               </tr>
               <input type="hidden" value="${c.productId }" name="productIds"/>
             </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
           <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <p class="primary-btn cart-btn cart-btn-right" style="cursor: pointer;"><span class="icon_loading"></span>
                            Upadate Cart</p>
                    </div>
                </div>
              	<div class="col-lg-6"></div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Total <span id="finalTotalPrice" >0</span></li>
                        </ul>
                        <button type="submit" class="primary-btn" style="border: 1px solid #7fad39; width: 100%;">PROCEED TO CHECKOUT</button>
                    </div>
                </div>
              </div>
             </form>                   


            
        </div>
    </section>
    <!-- Shoping Cart Section End -->


</body>


<script>
    // successMessage가 모델에 존재할 경우 alert을 띄운다.
    <c:if test="${not empty successMessage}">
        alert("${successMessage}");
    </c:if>

</script>
