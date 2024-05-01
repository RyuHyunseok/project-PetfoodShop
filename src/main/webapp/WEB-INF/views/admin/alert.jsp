<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script>
	var contextPath = "<c:out value='${path}'/>";
	var msg = "<c:out value='${msg}'/>";
	var uri = "<c:out value='${uri}'/>";
	alert(msg);
	location.replace(contextPath + uri);
</script>