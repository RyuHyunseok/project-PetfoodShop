<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.order-list, .order-list-quantity {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.order-list li {
	margin-bottom: 5px;
}

.order-list-quantity li {
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Order List</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Orderlist</span>
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
						<table>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문일자</th>
									<th>상품명</th>
									<th>구매수량</th>
									<th>결제금액</th>
								</tr>
							</thead>
							<tbody>


								<!-- 
									<tr>
										<td class="shoping__cart__total" id="orderId">
											<h5>${o.id }</h5>
										</td>
										<td class="shoping__cart__total">
											<h5>${o.regDate }</h5>
										</td>
										<td id="productName" style="text-align: center;">
											<ul class="order-list">
												<li>상품1</li>
												<li>상품2</li>
												<li>상품3</li>
											</ul>
										</td>
										<td>
											<ul class="order-list-quantity">
												<li>수량1</li>
												<li>수량2</li>
												<li>수량3</li>
											</ul>
										</td>
										<td class="shoping__cart__total">0</td>
										<td class="shoping__cart__total"><input type="checkbox"
											id="orderIdCheckbox1"></td>
									</tr>
								-->

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="#" class="primary-btn cart-btn cart-btn-right"
							onclick="cancelPay()"><span class="icon_loading"></span> 주문
							취소</a>
					</div>
				</div>
			</div>
			<div id="buttons" class="product__pagination"
				style="text-align: center;">
				<!-- 이 안에 버튼이 들어갑니다 -->
			</div>
		</div>
		<form action="refundresult" method="post" id="refundresult"></form>
	</section>
	<!-- Shoping Cart Section End -->

	<!-- push test -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script src="resources/js/orderlist.js?after"></script>
</body>
</html>