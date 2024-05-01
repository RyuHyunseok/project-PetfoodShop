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
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="resources/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>환불결과</h2>
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
								<th>환불결과</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${successRefundList }" var="order">
								<c:set var="rowSum" value="0" />
								<tr>
									<td class="shoping__cart__total" id="orderId">
										<h5>${order.id }</h5>
									</td>
									<td class="shoping__cart__total">
										<h5>${order.regDate }</h5>
									</td>
									<td id="productName" style="text-align: center;">
										<ul class="order-list">
											<c:forEach items="${orderDetailList }" var="orderDetail">
												<c:if test="${orderDetail.orderId eq order.id }">
													<c:forEach items="${productList }" var="product">
														<c:if test="${product.id eq orderDetail.productId }">
															<li>${product.name }</li>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</ul>
									</td>
									<td>
										<ul class="order-list-quantity">
											<c:forEach items="${orderDetailList }" var="orderDetail">
												<c:if test="${orderDetail.orderId eq order.id }">
													<c:forEach items="${productList }" var="product">
														<c:if test="${product.id eq orderDetail.productId }">
															<c:set var="row_sum"
																value="${row_sum + product.price*orderDetail.quantity }" />
															<li>${orderDetail.quantity }</li>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</ul>
									</td>
									<td class="shoping__cart__total"><c:out
											value="${row_sum }" /></td>
									<td class="successRefundMessage">환불완료</td>
								</tr>
							</c:forEach>
							<c:forEach items="${failRefundList }" var="order">
								<c:set var="rowSum" value="0" />
								<tr>
									<td class="shoping__cart__total" id="orderId">
										<h5>${order.id }</h5>
									</td>
									<td class="shoping__cart__total">
										<h5>${order.regDate }</h5>
									</td>
									<td id="productName" style="text-align: center;">
										<ul class="order-list">
											<c:forEach items="${orderDetailList }" var="orderDetail">
												<c:if test="${orderDetail.orderId eq order.id }">
													<c:forEach items="${productList }" var="product">
														<c:if test="${product.id eq orderDetail.productId }">
															<li>${product.name }</li>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</ul>
									</td>
									<td>
										<ul class="order-list-quantity">
											<c:forEach items="${orderDetailList }" var="orderDetail">
												<c:if test="${orderDetail.orderId eq order.id }">
													<c:forEach items="${productList }" var="product">
														<c:if test="${product.id eq orderDetail.productId }">
															<c:set var="row_sum"
																value="${row_sum + product.price*orderDetail.quantity }" />
															<li>${orderDetail.quantity }</li>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</ul>
									</td>
									<td class="shoping__cart__total"><c:out
											value="${row_sum }" /></td>
									<td class="successRefundMessage">환불실패</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	</div>
</section>
</html>