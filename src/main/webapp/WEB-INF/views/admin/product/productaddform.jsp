<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<main>
  <div class="container-fluid px-4">
    <div class="card mb-4">
      <div class="card-body">
        상품 등록 페이지 입니다.
      </div>
    </div>
    <div class="card mb-4">
      <div class="card-body">
        <form action="${ path }/admin/product/productadd" method="post">
          <div class="row mb-3">
            <div class="col">
              <label for="productName" class="form-label">Product Name:</label>
              <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name">
            </div>
            <div class="col">
              <label for="categoryL" class="form-label">Product Large Category:</label>
              <select class="form-select" id="categoryL" name="categoryL">
                <option>강아지화식</option>
                <option>간식</option>
                <option>펫용품</option>
              </select>
            </div>
            <div class="col">
              <label for="productPrice" class="form-label">Product Price:</label>
              <input type="text" class="form-control" id="productPrice" name="productPrice" placeholder="Enter product price">
            </div>
          </div>
          <div class="row mb-3">
            <div class="col">
              <label for="categoryM" class="form-label">Product Medium Category:</label>
              <select class="form-select" id="categoryM" name="categoryM">
				<option>닭가슴살</option>
				<option>소고기</option>
				<option>연어</option>
				<option>오리</option>
				<option>펫밀크</option>
				<option>트릿</option>
				<option>껌</option>
				<option>영양제</option>
				<option>배변패드</option>
				<option>목욕용품</option>
				<option>외출용품</option>
				<option>생활용품</option>
              </select>
            </div>
            <div class="col">
              <label for="productQuantity" class="form-label">Product Quantity:</label>
              <input type="text" class="form-control" id="quantity" name="quantity" placeholder="Enter product quantity">
            </div>
            <div class="col">
              <label for="file" class="form-label">Product Image:</label>
              <input type="file" class="form-control" id="file" name="imgFile">
            </div>
          </div>
          <button type="submit" class="btn btn-outline-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>
</main>
<script type="text/javascript">

    document.addEventListener('DOMContentLoaded', function() {
    	
        var categoryLSelect = document.getElementById('categoryL');

        var categoryMSelect = document.getElementById('categoryM');


        categoryLSelect.addEventListener('change', function() {

            var selectedCategoryL = categoryLSelect.value;

            categoryMSelect.innerHTML = '';

            if (selectedCategoryL === '강아지화식') {
                var options = ['닭가슴살', '소고기', '연어', '오리'];
            } else if (selectedCategoryL === '간식') {
                var options = ['펫밀크', '트릿', '껌', '영양제'];
            } else if (selectedCategoryL === '펫용품'){
                var options = ['배변패드', '목욕용품', '외출용품', '생활용품']
            }

            // option을 categoryM select 요소에 추가
            options.forEach(function(option) {
                var optionElement = document.createElement('option');
                optionElement.textContent = option;
                categoryMSelect.appendChild(optionElement);
            });
        });

        // 페이지 로드시 categoryL에 따라 categoryM 옵션 설정
        categoryLSelect.dispatchEvent(new Event('change'));
    });
</script>