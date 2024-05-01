/**
 * 
 */

paging(1);	
	
	function paging(num) {
		var productList = [];
		$(".product").each((index,item)=> {
			productList.push(item.value);
		});
		$.ajax({				//페이징 넘버에따른 페이지리스트를 받아와서 화면에 뿌려준다
			url: "searchpaginglist",
			data: {
				"num": num,
				"productList": productList,
				"sortBy": document.getElementById("sortBy").value
			},
			async: false,
			dataType: "json",
			traditional: true,
			success: function(res) {
				console.log(res);
				$(".defaultList").remove();
				$.each(res, function(index, value) {
					var item = "<div class='col-lg-4 col-md-6 col-sm-6 defaultList'><div class='product__item'><div class='product__item__pic set-bg' data-setbg='"+value.imgPath+"' id='hover1' style='background-image: url(&quot;"+value.imgPath+"&quot;);'><ul class='product__item__pic__hover'><li><a style='cursor: pointer' onclick='wishlistInsert("+value.id+")'><i class='fa fa-heart'></i></a></li><li><a href='addcart?productId="+value.id+"'><i class='fa fa-shopping-cart'></i></a></li></ul></div><div class='product__item__text'><h6><h6>"+value.name+"</h6></h6><h5>"+value.price+"</h5></div></div><input type='hidden' class='productId' value='"+value.id+"'/></div>"
					$("#row").append(item);
				})
			},
			error: function(error) {
				console.log(error);	
			}
		});
		$.ajax({
			url: "searchpagingbutton",
			data: {
				"num": num,
				"productList": productList
			},
			async: false,
			dataType: "json",
			traditional: true,
			success: function(res) {
				console.log(res);
				$(".defaultButton").remove();
					var prev = "";
					var next = "";
					if(res.prev) {
						prev ="<a class='defaultButton' onclick='paging("+(res.startPage-1)+")'><i class='fa fa-long-arrow-left'></i></a>";
						$("#buttons").append(prev);
					}
					for(var i = res.startPage; i <= res.endPage; i++) {
						if(i != res.thisPage) {
							var item = "<a class='defaultButton' onclick='paging("+i+")'>"+i+"</a>";
							$("#buttons").append(item);
						} else {
							var item = "<a class='defaultButton' style='background-color: #7fad39; color: white; border: 0;' onclick='paging("+i+")'>"+i+"</a>";
							$("#buttons").append(item);
						}
					}
					if(res.next) {
						next ="<a class='defaultButton' onclick='paging("+(res.endPage+1)+")'><i class='fa fa-long-arrow-right'></i></a>";
						$("#buttons").append(next);
					}
					var pagingfunction = "paging("+res.thisPage+")";
				$('#sortBy').attr('onchange',pagingfunction);
			},
			error: function(error) {
				console.log(error);
			}
		});
		searchTotalNumber();
	}
	
	function wishlistInsert(num) {
		$.ajax({
			url: "wishlistinsert",
			data: {"id": num},
			method: "POST",
			async: false,
			success: function(res) {
				alert(res);
			},
			error: function(error) {
				console.log(error);
			}
			
		});
	}
	
	function searchTotalNumber() {
		var productList = [];
		$(".product").each((index,item)=> {
			productList.push(item.value);
		});
		$.ajax({				//상품의 전체갯수를 가져오는 함수
			url: "searchtotalnumber",
			data: {
				"productList": productList
			},
			async: false,
			traditional: true,
			success: function(res) {
				document.getElementById("totalNumber").innerHTML = res;
			},
			error: function(error) {
				console.log(error);	
			}
		});
	}