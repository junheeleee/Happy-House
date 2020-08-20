<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메인페이지 (동별, 아파드별 실거래가 검색 기능 포함) -->
<!-- 동별 실거래가 검색 기능과 그 결ㅅ과 -->
<!-- 아파트별 실거래가 검색 기능과 그 결과 -->
<a href = "${root}/housemain.do?act=allList">모든 리스트 보기</a>
</body>
</html>