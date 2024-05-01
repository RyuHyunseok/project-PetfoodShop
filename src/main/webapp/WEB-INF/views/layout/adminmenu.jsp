<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
  <div class="sb-sidenav-menu">
    <div class="nav">
      <div class="sb-sidenav-menu-heading">Core</div>
      <a class="nav-link" href="${path }/admin">
        <div class="sb-nav-link-icon">
        </div>
        상품관리
      </a>
      <a class="nav-link" href="${path }/adminmember">
        <div class="sb-nav-link-icon">
        </div>
        회원관리
      </a>
      
    </div>
  </div>
  <div class="sb-sidenav-footer">
    <div class="small">Logged in as:</div>
    Start Bootstrap
  </div>
</nav>