/*  ---------------------------------------------------
    Template Name: Ogani
    Description:  Ogani eCommerce  HTML Template
    Author: Colorlib
    Author URI: https://colorlib.com
    Version: 1.0
    Created: Colorlib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.featured__controls li').on('click', function () {
            $('.featured__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.featured__filter').length > 0) {
            var containerEl = document.querySelector('.featured__filter');
            var mixer = mixitup(containerEl);
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Humberger Menu
    $(".humberger__open").on('click', function () {
        $(".humberger__menu__wrapper").addClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").addClass("active");
        $("body").addClass("over_hid");
    });

    $(".humberger__menu__overlay").on('click', function () {
        $(".humberger__menu__wrapper").removeClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").removeClass("active");
        $("body").removeClass("over_hid");
    });

    /*------------------
		Navigation
	--------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
        Categories Slider
    ------------------------*/
    $(".categories__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 4,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            0: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 3,
            },

            992: {
                items: 4,
            }
        }
    });


    $('.hero__categories__all').on('click', function(){
        $('.hero__categories ul').slideToggle(400);
    });

    /*--------------------------
        Latest Product Slider
    ----------------------------*/
    $(".latest-product__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------------
        Product Discount Slider
    -------------------------------*/
    $(".product__discount__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 3,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
    });

    /*---------------------------------
        Product Details Pic Slider
    ----------------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: true,
        margin: 20,
        items: 4,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------
		Price Range Slider
	------------------------ */
    var rangeSlider = $(".price-range"),
        minamount = $("#minamount"),
        maxamount = $("#maxamount"),
        minPrice = rangeSlider.data('min'),
        maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            minamount.val('$' + ui.values[0]);
            maxamount.val('$' + ui.values[1]);
        }
    });
    minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*------------------
		Single Product
	--------------------*/
    $('.product__details__pic__slider img').on('click', function () {

        var imgurl = $(this).data('imgbigurl');
        var bigImg = $('.product__details__pic__item--large').attr('src');
        if (imgurl != bigImg) {
            $('.product__details__pic__item--large').attr({
                src: imgurl
            });
        }
    });

    /*-------------------
		Quantity change
	--------------------- */
$(document).ready(function () { // 문서가 완전히 로드된 후에 실행되는 함수를 정의
	// pro-qty 클래스를 가진 요소를 찾아서 그 안에 +, - 버튼을 추가함
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    
	// proQty객체 내부에서 .qtybtn 클래스를 가진 요소가 클릭 되었을 때의 이벤트 핸들러(어떤 이벤트가 발생했을 때 실행되는 함수)
    proQty.on('click', '.qtybtn', function () {
    
        var $button = $(this); // 클릭된 버튼객체, $는 jQuery 라이브러리에서 사용되는 식별자
        var $quantityInput = $button.parent().find('input'); // 해당 버튼의 부모 내부에서 input을 찾음(상품 갯수) id="number1", id="number2" ...
        var oldValue = parseFloat($quantityInput.val()); // 현재 수량 가져오기
        var productNum = $quantityInput.attr('id').replace('number', ''); // productNum 추출
		var newVal = 1;
		
        if ($button.hasClass('inc')) {
             newVal = oldValue + 1;
             $quantityInput.val(newVal);
        } else { // 0 미만으로 안되도록 설정
            if (oldValue > 0) {
                newVal = oldValue - 1;
            } else {
                newVal = 0;
            }
        }

        // 새로운 값을 수량 input에 설정
	    $quantityInput.val(newVal);
	    
        // 상품 가격을 가져와서 현재 수량과 곱한 후, 해당 상품의 총 가격 업데이트
        var price = parseFloat($('#price' + productNum).data('price')); // id가 'price'와 (위에서 찾은)'productNum'의 조합인 요소 선택 후 선택된 요소에서 'data-price'라는 데이터 속성값 가져오기
        var totalPrice = newVal * price;
        $('#totalprice' + productNum).text(totalPrice); // $('#totalprice' + productNum)이 요소에 totalPrice의 내용을 설정함
        

        
        
        
    });
    
 
});

	$(document).ready(function () {
	    // Update Cart 버튼 클릭 시 동작
	    $('.cart-btn-right').on('click', function () {
	        var totalSum = 0; // 각 totalprice 값을 더할 변수를 초기화

	        $('[id^="totalprice"]').each(function () { // id가 totalprice로 시작하는 모든 요소를 선택한 후 선택된 요소에 대해 반복 작업을 수행한다.
	            // 각 항목의 텍스트 값을 가져와서 부동 소수점으로 변환하여 더함
	            totalSum += parseFloat($(this).text()); // $(this) : 현재 반복중인 요소
	        });
	
	        // 최종 총 가격을 id가 finalTotalPrice인 요소에 내용을 설정함.
	        $('#finalTotalPrice').text(totalSum);
	    });
	});




})(jQuery);