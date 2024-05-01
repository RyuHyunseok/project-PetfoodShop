<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Hero Section Begin -->
<section class="hero">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="hero__item set-bg" data-setbg="resources/img/banner/dog-banner-1.jpg">
          <div class="hero__text">
            <span>FRESH PET FOOD</span>
            <h2>
              Pet Food
              <br />
              100% Organic
            </h2>
            <p>A healthy life from healthy food</p>
            <a href="food" class="primary-btn">SHOP NOW</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Hero Section End -->

<!-- Categories Section Begin -->
<section class="categories">
  <div class="container">
    <div class="row">
      <div class="categories__slider owl-carousel">
       
		<c:forEach items="${RandomList}" var="r"> 
		    <div class="col-lg-3">
		        <div class="categories__item set-bg" data-setbg="${r.imgPath }">
		            <h5>
		                <c:choose>
		                    <c:when test="${fn:startsWith(r.categoryId, 'F')}">
		                        <a href="food">Healthy Food</a>
		                    </c:when>
		                    <c:when test="${fn:startsWith(r.categoryId, 'S')}">
		                        <a href="snack">Delicious Snack</a>
		                    </c:when>
		                    <c:when test="${fn:startsWith(r.categoryId, 'P')}">
		                        <a href="supply">Great Supplies</a>
		                    </c:when>
		                </c:choose>
		            </h5>
		        </div>
		    </div>
		</c:forEach>
        
<!--         <div class="col-lg-3"> -->
<%--           <div class="categories__item set-bg" data-setbg="${r.imgPath }"> --%>
<!--             <h5> -->
<!--               <a href="snack">Delicious Snack</a> -->
<!--             </h5> -->
<!--           </div> -->
<!--         </div> -->
        
        
<!--         <div class="col-lg-3"> -->
<%--           <div class="categories__item set-bg" data-setbg="${r.imgPath }"> --%>
<!--             <h5> -->
<!--               <a href="supply">Great Supplies</a> -->
<!--             </h5> -->
<!--           </div> -->
<!--         </div> -->


      </div>
    </div>
  </div>
</section>
<!-- Categories Section End -->