<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<style>
#hover1:hover {
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
  <!-- Breadcrumb Section Begin -->
  <section class="breadcrumb-section set-bg" data-setbg="resources/img/dog-food1.jpg">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <div class="breadcrumb__text">
            <h2>강아지화식 오리</h2>
            <div class="breadcrumb__option">
              <a href="home">Home</a>
              <span>Shop</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Breadcrumb Section End -->

  <!-- Product Section Begin -->
  <section class="product spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-5">
          <div class="sidebar">
            <div class="sidebar__item">
              <h4>강아지 화식</h4>
              <ul>
                <li><a href="chicken">닭가슴살</a></li>
                <li><a href="beef">소고기</a></li>
                <li><a href="salmon">연어</a></li>
                <li><a href="duck">오리</a></li>

              </ul>
            </div>
            
            <div class="sidebar__item">
              <div class="latest-product__text">
                <h4>추천 상품</h4>
                <div class="latest-product__slider owl-carousel">
                
                  <div class="latest-prdouct__slider__item">
                   <c:forEach items="${RandomList1 }" var="R1">
                    <a class="latest-product__item">
                      <div class="latest-product__item__pic">
                        <img src="${R1.imgPath }" alt="">
                      </div>
                      <div class="latest-product__item__text">
                        <h6>${R1.name }</h6>
                        <span>${R1.price }원</span>
                      </div>
                    </a>
				   </c:forEach>
                  </div>
                  
                  <div class="latest-prdouct__slider__item">
                   <c:forEach items="${RandomList2 }" var="R2">
                    <a class="latest-product__item">
                      <div class="latest-product__item__pic">
                        <img src="${R2.imgPath }" alt="">
                      </div>
                      <div class="latest-product__item__text">
                        <h6>${R2.name }</h6>
                        <span>${R2.price }원</span>
                      </div>
                    </a>
                   </c:forEach>
                  </div>
                  
                  <div class="latest-prdouct__slider__item">
                   <c:forEach items="${RandomList3 }" var="R3">
                    <a class="latest-product__item">
                      <div class="latest-product__item__pic">
                        <img src="${R3.imgPath }" alt="">
                      </div>
                      <div class="latest-product__item__text">
                        <h6>${R3.name }</h6>
                        <span>${R3.price }원</span>
                      </div>
                    </a>
                   </c:forEach>
                  </div>
                  
                </div>
              </div>
            </div>
            
          </div>
        </div>
        
        <div class="col-lg-9 col-md-7">
          <div class="filter__item">
            <div class="row">
              <div class="col-lg-4 col-md-5">
                <div class="filter__sort">
                	<span id="sortByText">Sort By</span>
                	<select id='sortBy'>
                	<option value='default'>기본순</option>
                	<option value='lowPrice'>낮은가격순</option>
                	<option value='highPrice'>높은가격순</option>
                	</select>
                </div>
              </div>
              <div class="col-lg-4 col-md-4">
                <div class="filter__found">
                  <h6>총 
                    <span id="totalNumber"></span>
                     개의 상품이 있습니다.
                  </h6>
                </div>
              </div>
              <div class="col-lg-4 col-md-3">
                <div class="filter__option">
                  <span class="icon_grid-2x2"></span>
                  <span class="icon_ul"></span>
                </div>
              </div>
            </div>
          </div>
          <div id="row" class="row">

          	<!-- 이 안에 페이징된 상품리스트가 들어갑니다 -->

          </div>
          <div id="buttons" class="product__pagination" style="text-align: center;">
            <!-- 이 안에 버튼이 들어갑니다 -->
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Product Section End -->
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	paging(1);	
	
	function paging(num) {
		window.scrollTo(0,400)
		$.ajax({				//페이징 넘버에따른 페이지리스트를 받아와서 화면에 뿌려준다
			url: "paginglist",
			data: {
				"num": num,
				"categoryL": "강아지화식",
				"categoryM": "오리",
				"sortBy": document.getElementById("sortBy").value
			},
			async: false,
			dataType: "json",
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
			url: "pagingbutton",
			data: {
				"num": num,
				"categoryL": "강아지화식",
				"categoryM": "오리"
			},
			async: false,
			dataType: "json",
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
		categoryTotalNumber();
	}
	
	function wishlistInsert(num) {
		$.ajax({
			url: "wishlistinsert",
			data: {"id": num},
			method: "POST",
			async: false,
			success: function(res) {
				alert(res);
				
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
	}
	
	function categoryTotalNumber() {
		$.ajax({				//상품의 전체갯수를 가져오는 함수
			url: "categorytotalnumber",
			data: {
				"categoryL": "강아지화식",
				"categoryM": "오리"
			},
			async: false,
			success: function(res) {
				document.getElementById("totalNumber").innerHTML = res;
			},
			error: function(error) {
				console.log(error);	
			}
		});
	}

    // successMessage가 모델에 존재할 경우 alert을 띄운다.
    <c:if test="${not empty successMessage}">
        alert("${successMessage}");
    </c:if>
</script>
