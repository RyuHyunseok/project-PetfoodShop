<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="path" value="${pageContext.request.contextPath}" />
<main>
  <div class="container-fluid px-4">
    <h1 class="mt-4">상품관리</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item active">상품관리</li>
    </ol>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table me-1"></i>
        <a class="btn btn-primary" href="${ path }/admin/product/productaddform">상품등록</a>
      </div>
      <div class="card-body">
        <table id="datatablesSimple"  style="width:100%">
          <thead>
            <tr>
              <th>Name</th>
              <th>Price</th>
              <th>CategoryL</th>
              <th>CategoryM</th>
              <th>Image</th>
              <th>Quantity</th>
              <th>Edit / Del</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Name</th>
              <th>Position</th>
              <th>Office</th>
              <th>Age</th>
              <th>Start date</th>
              <th>Quantity</th>
              <th>Edit / Del</th>
            </tr>
          </tfoot>
          <tbody>
            <!-- forEach 돌려야 함 -->
			<c:forEach items="${AdminProducts }" var="a">
            <tr>
              <td>${a.name }</td>
              <td>${a.price }</td>
              <td>${a.categoryL }</td>
              <td>${a.categoryM }</td>
              <td>${a.imgPath }</td>
              <td>${a.quantity }</td>
              <td>
                <i style="cursor: pointer;" onclick="editProduct(${a.id})" class="fa-solid fa-pen-to-square"></i> / <i style="cursor: pointer;"
                  onclick="deleteProduct(${a.id})" class="fa-solid fa-trash-can"></i>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</main>
<form id="frmEdit" action="${ path }/admin/product/producteditform" method="post">
  <input type="hidden" id="productEditId" name="productId" value="">
</form>
<form id="frmDelete" action="${ path }/admin/product/productdelete" method="post">
  <input type="hidden" id="productDelId" name="productId" value="">
</form>


<script src="resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.css" />
<script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"/></script>
<script>
	function editProduct(id) {
		document.querySelector("#productEditId").value = id;
		frmEdit.submit();
	}

	function deleteProduct(id) {
		document.querySelector("#productDelId").value = id;
		frmDelete.submit();
	}
	
	new DataTable('#datatablesSimple', {
		order: false
	});
</script>



<script>
$(document).ready( function () {
	$('#datatablesSimple').DataTable();
} );
</script>
