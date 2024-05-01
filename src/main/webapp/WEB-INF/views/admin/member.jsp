<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<main>

  <div class="container-fluid px-4">
    <h1 class="mt-4">회원관리</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item active">회원관리</li>
    </ol>
    <div class="card mb-4">
      <div class="card-body">
        <table id="datatablesSimple">
          <thead>
            <tr>
              <th>Name</th>
              <th>Username</th>
              <th>Password</th>
              <th>tel</th>
              <th>postcode</th>
              <th>roadAddress</th>
              <th>detailAddress</th>
              <th>email</th>
              <th>regDate</th>
              <th>auth</th>
              <th>Del</th>
            </tr>
          </thead>
          <tbody>
            <!-- forEach 돌려야 함 -->
			<c:forEach items="${members }" var="members">
			<c:if test="${members.auth eq 'user' }">
            <tr>
              <td>${members.name }</td>
              <td>${members.username }</td>
              <td>${members.password }</td>
              <td>${members.tel }</td>
              <td>${members.postcode }</td>
              <td>${members.roadAddress }</td>
              <td>${members.detailAddress }</td>
              <td>${members.email }</td>
              <td>${members.regDate }</td>
              <td>${members.auth }</td>
              <td>
                <i style="cursor: pointer; margin-left: 13px" onclick="adminMemberDelete('${members.username}')" class="fa-solid fa-trash-can"></i>
              </td>
            </tr>
            </c:if>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  </main>


<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="resources/js/adminmember.js" type="text/javascript"></script> -->

<script src="resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.css" />
<script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"/></script>
<script src="resources/js/adminmember.js" type="text/javascript"></script>

