/**
 * 
 */

paging(1);
		var orderList;
		
		function paging(num) {
			var orders = [];
			var orderDetail;
			var products = [];
			$.ajax({
				url : "orderspaginglist",
				data : {
					"num" : num
				},
				async : false,
				dataType : "json",
				success : function(res) {
					$.each(res, function(index, value) {
						orders.push(value);
					});
				},
				error : function(error) {
					console.log(error);
				}
			});
			$.ajax({
				url : "orderdetailpaginglist",
				async : false,
				dataType : "json",
				success : function(res) {
					orderDetail = res;
				},
				error : function(error) {
					console.log(error);
				}
			});
			$
					.ajax({
						url : "orderlistpagingbutton",
						data : {
							"num" : num
						},
						async : false,
						dataType : "json",
						success : function(res) {
							console.log(res);
							$(".defaultButton").remove();
							var prev = "";
							var next = "";
							if (res.prev) {
								prev = "<a class='defaultButton' onclick='paging("
										+ (res.startPage - 1)
										+ ")'><i class='fa fa-long-arrow-left'></i></a>";
								$("#buttons").append(prev);
							}
							for (var i = res.startPage; i <= res.endPage; i++) {
								if (i != res.thisPage) {
									var item = "<a class='defaultButton' onclick='paging("
											+ i + ")'>" + i + "</a>";
									$("#buttons").append(item);
								} else {
									var item = "<a class='defaultButton' style='background-color: #7fad39; color: white; border: 0;' onclick='paging("
											+ i + ")'>" + i + "</a>";
									$("#buttons").append(item);
								}
							}
							if (res.next) {
								next = "<a class='defaultButton' onclick='paging("
										+ (res.endPage + 1)
										+ ")'><i class='fa fa-long-arrow-right'></i></a>";
								$("#buttons").append(next);
							}
							var pagingfunction = "paging(" + res.thisPage + ")";
							$('#sortBy').attr('onchange', pagingfunction);
						},
						error : function(error) {
							console.log(error);
						}
					});
			$.ajax({
				url : "orderlistproduct",
				async : false,
				dataType : "json",
				success : function(res) {
					console.log(res);
					if(res){
						console.log("o");
						$.each(res, function(index, value) {
							products.push(value);
						});
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
			$(".defaultOrderlist").remove();
			$
					.each(
							orders,
							function(index, order) {
								var total = 0;
								var item = "<tr class='defaultOrderlist'><td class='shoping__cart__total' id='orderId'><h5>"
										+ order.id
										+ "</h5></td><td class='shoping__cart__total'><h5>"
										+ order.regDate
										+ "</h5></td><td id='productName' style='text-align: center;'><ul class='order-list'>";
								$
										.each(
												orderDetail,
												function(index, orderdetail) {
													if (order.id == orderdetail.orderId) {
														$
																.each(
																		products,
																		function(
																				index,
																				product) {
																			if (product.id == orderdetail.productId) {
																				item += "<li>"
																						+ product.name
																						+ "</li>";
																				total += product.price
																						* orderdetail.quantity;
																				order.total = total;
																			}
																			;
																		});
													}
													;
												});
								item += "</ul></td><td><ul class='order-list-quantity'>";
								$
										.each(
												orderDetail,
												function(index, orderdetail) {
													if (order.id == orderdetail.orderId) {
														item += "<li>"
																+ orderdetail.quantity
																+ "</li>";
													}
													;
												});
								item += "</ul></td><td class='shoping__cart__total'>"
										+ total
										+ "</td><td class='shoping__cart__total'><input type='checkbox' class='checkBox' id= "+order.id+"></td></tr>";
								$("tbody").append(item);
							});
			orderList = orders;
		}
		
		function cancelPay() {
			var token = "";
			var deleteList = [];
			//token 얻기
			 $.ajax({
				    url: 'gettoken',
				    method: 'POST',
				    data: {
				    	"apiKey": "7674253462235442",
				    	"secretKey": "YmIPpTaImCXX3EEd55gtFK7tjc4GoxVPLly255djpKTf4bCac00BNIiymEVNtfUpMsy2G20jNyXa1YaU"
				    },
				    dataType: "text",
				    async: false,
				    success: function(res) {
				    	token = res;
				    },
				    error: function(request, status, error) {
				    	console.log(request);
				    	console.log(status);
				    	console.log(error);
				    }
				  });
			
		   //주문취소할 주문정보 얻기
			$.each(orderList,function(index, order) {
				$(".checkBox").each((index, item) => {
					if(item.checked == true) {
						if(order.id == item.id) {
							deleteList.push(order);	
						}
					}
				})
			});
			

			//취소요청
			$.each(deleteList, function(index, order) {
				$.ajax({
					url: "refundrequest",
					method: "POST",
					async: false,
					data: {
						"token": token,
						"merchant_uid": order.id, 
						"reason": "환불하는이유: 그냥"
					},
					success: function() {
						console.log("성공");
						var item = "<input type='hidden' name='orderId' value="+order.id+"><input type='hidden' name='refundBool' value='success'>";
						$("#refundresult").append(item);
					},
					error: function(request, status, error) {
						console.log(request, status, error);
						var item = "<input type='hidden' name='refundBool' value="+order.id+"><input type='hidden' name='refundBool' value='fail'>";
						$("#refundresult").append(item);
					}
				});
			}); 

			$("#refundresult").submit();
		  }