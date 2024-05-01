<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
#hover1:hover {
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2);
}
#titleMessage {
	font-weight: bold;
	letter-spacing: -0.09em;
	font-size: 23px;
	margin: 27px 0 18px 0;
}
.quotes {
	font-family: "";
	position: relative;
	bottom: 2px;
}
</style>
</head>
<body>

  <!-- Product Section Begin -->
  
  <section class="product spad" style="padding-top: 0">
    <div class="container">
      <div class="row" style="flex: 1 1">
        <div class="col-lg-9 col-md-7" style="flex: 100%; max-width: 100%">
          <div id="titleMessage"><span class="quotes">' </span>${searchInput }<span class="quotes"> '</span> &nbsp;&nbsp;에 대한 검색결과</div>
  		  <hr>
          <div class="filter__item" style="border: 0; padding-top: 30px"">  
            <div id="row" class="row">
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
            <!-- <div class="col-lg-4 col-md-6 col-sm-6 defaultList">
              <div class="product__item">
                <div class="product__item__pic set-bg" data-setbg="${p.imgPath }" id="hover1">
                  <ul class="product__item__pic__hover">
                    <li><a href="addcart?productId=${p.id }">
                        <i class="fa fa-shopping-cart"></i>
                      </a></li>
                  </ul>
                </div>
                <div class="product__item__text">
                  <h6>
                    <h6>${p.name }</h6>
                  </h6>
                  <h5>${p.price }</h5>
                </div>
              </div>
            </div> -->
           <c:forEach items="${products}" var="p">
            <input class="product" type="hidden" value="${p.id }"/>
           </c:forEach>
            

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
<script src="resources/js/searchresult.js"></script>
<script>
    // successMessage가 모델에 존재할 경우 alert을 띄운다.
    <c:if test="${not empty successMessage}">
        alert("${successMessage}");
    </c:if>
</script>
