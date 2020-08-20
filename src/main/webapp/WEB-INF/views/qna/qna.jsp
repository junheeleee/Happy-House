<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=icon href=/favicon.ico>
<title>vue-board</title>
<link href=./js/app.4c3e9bcf.js rel=preload as=script>
<link href=./js/chunk-vendors.d2f6f202.js rel=preload as=script>
<%@ include file="../scr.jsp" %>
</head>
<body>
<%@ include file="../nav.jsp" %>
	<noscript>
		<strong>We're sorry but vue-board doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id=app></div>
	<script src=./js/chunk-vendors.d2f6f202.js></script>
	<script src=./js/app.4c3e9bcf.js></script>
	<%@ include file="../foot.jsp"%>
</body>
</html>