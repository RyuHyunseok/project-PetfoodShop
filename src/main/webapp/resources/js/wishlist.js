/**
 * 
 */

	var thisNum = 0;
	var endNum = 0;
	var selectAllButton = document.getElementById("selectAllButton");
	paging(1);
	if(wishlistNullCheck()) {
		var item = "<tr id='ifNull'><td colspan='5'>찜리스트에 상품이 없습니다</td></tr>"
			$("tbody").append(item);
	};
		
		function selectAll() {
			if(selectAllButton.checked == true) {
				$(".checkBox").each((index,item)=> {
					item.checked = true;
				})	
			} else {
				$(".checkBox").each((index,item)=> {
					item.checked = false;
				})	
			}
		}
		function checkBoxSelect() {
			var bool;
			$(".checkBox").each((index,item)=> {
				if(item.checked == true) {
					bool = true;
				} else {
					bool = false;
					return false;
				}
			});	
			if(bool) {
				selectAllButton.checked = true;			
			} else {
				selectAllButton.checked = false;
			}
		}
		function wishlistDel() {
			if(!wishlistNullCheck()) {
			var productList = [];
			$(".checkBox").each((index,item)=> {
				if(item.checked == true) {
					productList.push(item.value);
				}
			});	
			$.ajax({
				url: "wishlistdel",
				data: {"productList": productList},
				async: false,
				method: "POST",
				traditional: true,
				success: function() {
					$(".checkBox").each((index,item)=> {
						productList.forEach(function(product) {
							if(item.value == product) {
								$("#"+item.value).remove();	
							}
						});
					});	
				},
				error: function(error) {
					console.log(error);
				}
			});
			if(wishlistNullCheck()) {
				var item = "<tr id='ifNull'><td colspan='5'>찜리스트에 상품이 없습니다</td></tr>"
					$("tbody").append(item);
				$(".defaultButton").remove();
			};
			pageNullCheck();
			}
			selectAllButton.checked = false;
		}
		
		function wishlistCart() {
			var productList = [];
			$(".checkBox").each((index,item)=> {
				if(item.checked == true) {
					productList.push(item.value);
				}
			});	
			$.ajax({
				url: "wishlistcart",
				data: {"productList": productList},
				async: false,
				method: "POST",
				traditional: true,
				success: function() {
					alert("상품이 장바구니에 추가되었습니다.")
				},
				error: function(error) {
					console.log(error);
				}
			});
		}
		function paging(num) {
			$.ajax({				//페이징 넘버에따른 페이지리스트를 받아와서 화면에 뿌려준다
				url: "wishlistpaginglist",
				data: {
					"num": num
				},
				method: "POST",
				async: false,
				dataType: "json",
				success: function(res) {
					console.log(res);
					$(".defaultList").remove();
					$.each(res, function(index, value) {
						var item = "<tr id='"+value.id+"' class='defaultList'><td><div class='checkbox-wrapper-21'><label class='control control--checkbox'><input type='checkbox' class='checkBox' value='"+value.id+"' onclick='checkBoxSelect()' /><div class='control__indicator'></div></label></div></td><td><img alt='productImg' src='"+value.imgPath+"' style='width: 40px; height: 40px; margin-right: 10px'></td><td>"+value.name+"</td><td>"+value.price+"</td></tr>"
						$("tbody").append(item);
					})
				},
				error: function(error) {
					console.log(error);	
				}
			});
			$.ajax({
				url: "wishlistpagingbutton",
				data: {
					"num": num
				},
				method: "POST",
				async: false,
				dataType: "json",
				success: function(res) {
					thisNum = res.thisPage;
					endNum = res.endPage;
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
				},
				error: function(error) {
					console.log(error);
				}
			});
		}
		
		function wishlistNullCheck() {
			var bool = false;
			$.ajax({
				url: "wishlistnullcheck",
				async: false,
				success: function(res) {
					if(res == "null") {
						bool = true;
					}
				},
				error: function(error) {
					console.log(error);
				}
			});
			return bool;
		}
		function pageNullCheck() {
			if($(".checkBox").length == 0) {
				
				if(thisNum == 1 && endNum == 1) {
					paging(1);
				} else if(thisNum == 1 && endNum > 1) {
					paging(1);
				}
				else if(thisNum != 0) {
					paging(thisNum-1);
				}
			}
		}