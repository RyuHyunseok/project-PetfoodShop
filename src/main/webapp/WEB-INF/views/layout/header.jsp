<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header Section Begin -->
<style>
#search:-webkit-autofill,
#search:-webkit-autofill:hover,
#search:-webkit-autofill:focus,
#search:-webkit-autofill:active {
    transition: background-color 5000s ease-in-out 0s;
    -webkit-transition: background-color 9999s ease-out;
    -webkit-box-shadow: 0 0 0px 1000px white inset !important;
    -webkit-text-fill-color: #b2b2b2 !important;
}
</style>
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
							<li>Free Shipping for all Order of $99</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="header__top__right">
						<div class="header__top__right__social">
							<a href="https://www.youtube.com/@TV-el4bl"> <i
								class="fa fa-youtube"></i>
							</a> <a href="https://www.instagram.com/dhuman_happy/"> <i
								class="fa fa-instagram"></i>
							</a> <a href="https://www.dhuman.co.kr/"> <i
								class="fa fa-linkedin"></i>
							</a>
						</div>
						<c:if test="${empty sessionScope.id }">
							<span class="edit">
								<div class="header__top__right__auth" id="login">
									<a href="signinform"> <i class="fa fa-user"></i> 로그인
									</a>
								</div>
							</span>
						</c:if>
						<c:if test="${!empty sessionScope.id }">
							<span class="edit">
								<div class="header__top__right__auth">
									<a href="logout"> <i></i> 로그아웃
									</a>
								</div>
								<div class="header__top__right__social">
									<a href="signinform"> <i></i>
									</a>
								</div>
								<div class="header__top__right__auth">
									<a href="mypage"> <i></i> 마이페이지
									</a>
								</div>
								<div class="header__top__right__social">
									<a href="#"> <i></i>
									</a>
								</div>
								<div class="header__top__right__auth">
									<a href="#"> <i class="fa fa-user"></i> ${sessionScope.name }
									</a>
								</div>
							</span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="header__logo">
					<a href="home"> <img src="resources/img/logo.png" alt="">
					</a>
				</div>
			</div>
			<div class="col-lg-7">
				<nav class="header__menu">
					<ul>
						<li class="active"><a href="home">Home</a></li>
						<li><a href="food">강아지 화식</a>
							<ul class="header__menu__dropdown">
								<li><a href="chicken">닭가슴살</a></li>
								<li><a href="beef">소고기</a></li>
								<li><a href="salmon">연어</a></li>
								<li><a href="duck">오리</a></li>
							</ul></li>
						<li><a href="snack">간식</a>
							<ul class="header__menu__dropdown">
<!-- 								<li><a href="topping">토핑/육포</a></li> -->
<!-- 								<li><a href="healthfood">보양식</a></li> -->
								<li><a href="petmilk">펫밀크/무스</a></li>
								<li><a href="treat">트릿</a></li>
								<li><a href="gum">껌</a></li>
								<li><a href="supplement">영양제</a></li>
<!-- 								<li><a href="giftset">선물세트</a></li> -->
							</ul></li>
						<li><a href="supply">펫용품</a>
							<ul class="header__menu__dropdown">
								<li><a href="pottypad">배변패드</a></li>
								<li><a href="bathsupply">목욕용품</a></li>
								<li><a href="outingsupply">외출용품</a></li>
								<li><a href="dailysupply">생활용품</a></li>
<!-- 								<li><a href="dryfeed">건사료</a></li> -->
							</ul></li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<c:if test="${empty sessionScope.username }">
							<li><a href="signinform"> <i class="fa-solid fa-heart fa-xl" style="color: #041b12; font-size: 30px;"></i>
							</a></li>
						</c:if>
						<c:if test="${!empty sessionScope.id }">
							<li><a href="wishlist"> <i class="fa-solid fa-heart fa-xl" style="color: #041b12; font-size: 30px;"></i> <span id="wishlistCount" style="width:15px; height:15px; font-size:12px">0</span>
							</a></li>
						</c:if>
						<c:if test="${empty sessionScope.username }">
							<li><a href="signinform"> <i class="fa-solid fa-cart-shopping fa-xl" style="color: #041b12; font-size: 30px;"></i>
							</a></li>
						</c:if>
						<c:if test="${!empty sessionScope.id }">
							<li><a href="cartlist"> <i class="fa-solid fa-cart-shopping fa-xl" style="color: #041b12; font-size: 30px; "></i> <span id="cartlistCount" style="width:15px; height:15px; font-size:12px">0</span>
							</a></li>
						</c:if>
					</ul>
					<div class="header__cart__price">
					<c:if test="${empty sessionScope.username }">
					</c:if>
					<c:if test="${!empty sessionScope.id }">
						item: <a href="orderlist"><span>주문 목록</span></a>
					</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Hero Section Begin -->
<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>All category</span>
					</div>
					<ul>
						<li><a href="food">자연화식</a></li>
						<div class="dropdown-divider"></div>
						<li><a href="chicken">닭가슴살</a></li>
						<li><a href="beef">소고기</a></li>
						<li><a href="salmon">연어</a></li>
						<li><a href="duck">오리</a></li>
						<div class="dropdown-divider"></div>
						<li><a href="snack">간식</a></li>
						<div class="dropdown-divider"></div>
						<li><a href="petmilk">펫밀크/무스</a></li>
						<li><a href="treat">트릿</a></li>
						<li><a href="gum">껌</a></li>
						<li><a href="supplement">영양제</a></li>
						<div class="dropdown-divider"></div>
						<li><a href="supply">펫용품</a></li>
						<div class="dropdown-divider"></div>
						<li><a href="pottypad">배변패드</a></li>
						<li><a href="bathsupply">목욕용품</a></li>
						<li><a href="outingsupply">외출용품</a></li>
						<li><a href="dailysupply">생활용품</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form" style="width: 100%;">
						<form action="searchresult" onsubmit="return blankChk()">
							<input type="text" id="search" name="name"
								placeholder="찾고 싶은 상품을 검색해보세요!" spellcheck="false">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var search = document.getElementById("search");
	function blankChk() {
		var bool = false;
		if(search.value != "") {
			bool = true;
		} else {
			bool = false;
		}
		if(search.value.trim() != "") {
			bool = true;
		} else {
			bool = false;
		}
		
		return bool;
	}
	
	$(document).ready(function(){
		if (${not empty sessionScope.id}){ // 사용자 id가 있는 경우에만 ajax 요청을 실행한다. sessionScope은 JSP에서 세션의 속성에 접근할 때 사용되는 내장 객체(sessionScope.속성)
			$.ajax({
				url: 'getWishlistCount', // 서버에서 찜목록 갯수를 가져올 URL
				method: 'GET',
				success: function(data) {
					// 성공적으로 응답받았을 때 실행되는 함수
					console.log(data);
					$('#wishlistCount').text(data.wishlistCount); // 가져온 찜목록 갯수를 span 태그에 넣기
				},
				error: function(xhr, status, error){
					console.error(error);
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
	});
	
</script>
<!-- Hero Section End -->
<script src="https://kit.fontawesome.com/24b9e74e14.js" crossorigin="anonymous"></script>
