<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/wishlist.css?after" type="text/css">
</head>
<body>
	<div id="container">
		<div id="menu">
			<div id="menuHeader">마이페이지</div>
			<hr id="hr1">
			<div id="menuBody">
				<div class="menuBox"><a href="mypageorderlist">-주문목록</a></div>
				<div class="menuBox">
					<a href="membereditform">-회원정보 변경</a>
				</div>
        <div class="menuBox">
					<a href="memberdeleteform">-회원탈퇴</a>
				</div>
				<div class="menuClick">
					<a href="wishlist" style="color: #7fad39">-찜 리스트</a>
				</div>
			</div>
		</div>
		<div id="main">
			
      <section class="checkout spad" style="padding-top: 41px">
        <div class="container">
          <div class="row justify-content-center">
            <div class="checkout__form">
              <h4>찜 리스트</h4>

              <div class="col-lg-12 mx-auto" style="width: 920px; padding: 0 15px;">
                
                <table>
                  <thead>
                  <tr>
                    <th style="width: 80px">
                      <div class="checkbox-wrapper-21">
                        <label class="control control--checkbox">
                          <input type="checkbox" id="selectAllButton" onclick="selectAll()"/>
                          <div class="control__indicator"></div>
                        </label>
                      </div>
                    </th>
                    <th style="width: 50px"></th>
                    <th>상품명</th>
                    <th>상품금액</th>
                  </tr>
                  </thead>
                  <tbody>
				  <c:forEach items="${wishlist }" var="w">
				  	<tr id="${w.id }" class="defaultList">
                      <td>
                        <div class="checkbox-wrapper-21">
                          <label class="control control--checkbox">
                            <input type="checkbox" class="checkBox" value="${w.id }" onclick="checkBoxSelect()" />
                            <div class="control__indicator"></div>
                          </label>
                        </div>
                      </td>
                      <td>
                      <img alt="productImg" src="${w.imgPath }" style="width: 40px; height: 40px; margin-right: 10px">
                      </td>
                      <td>
                      ${w.name }
                      </td>
                      <td>${w.price }</td>
                    </tr>
				  </c:forEach>  
                  </tbody>
                </table>
                <div id="buttonBox">
                  <button type="button" onclick="wishlistDel()">선택 상품 삭제</button>
                  <button type="button" onclick="wishlistCart()">선택 상품 장바구니</button>
                </div>
                <div id="buttons" class="product__pagination" style="text-align: center;">
	          	</div>
              </div>
            </div>
          </div>
        </div>
      </section>

		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
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
					
					$.ajax({
		                url: 'getWishlistCount',
		                method: 'GET',
		                success: function(data) {
		                    $('#wishlistCount').text(data.wishlistCount);
		                },
		                error: function(error) {
		                    console.log(error);
		                }
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
			
			$.ajax({
				url: 'getCartlistCount', // ajax 통신할 url
				method: 'GET',
				success: function(data) {
					console.log(data);
					$('#cartlistCount').text(data.cartlistCount);
				},
				error: function(error){
					console.error(error);
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
	</script>
</body>
</html>