<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" /> -->
<link href="/prj/resources/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
  <div>
    <tiles:insertAttribute name="header" />
  </div>
  <div id="layoutSidenav">
    <div id="layoutSidenav_nav">
      <tiles:insertAttribute name="menu" />
    </div>
    <div id="layoutSidenav_content">
      <tiles:insertAttribute name="body" />
      <tiles:insertAttribute name="footer" />
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="/prj/resources/admin/js/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  <script src="/prj/resources/admin/assets/demo/chart-area-demo.js"></script>
  <script src="/prj/resources/admin/assets/demo/chart-bar-demo.js"></script>
  

<!--   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script> -->
<!--   <script src="/prj/resources/admin/js/datatables-simple-demo.js"></script> -->
</body>
</html>