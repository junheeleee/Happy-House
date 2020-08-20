<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Happy House :: Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${findUser == null}">
		<h3>${msg}</h3>
		<%@ include file="./passwordSearch.jsp"%>
	</c:if>
	<c:if test="${findUser != null}">
		<div class="jumbotron text-center mb-0">
			<h1>Happy House</h1>
			<p>안녕하세요! Happy House입니다!</p>
		</div>
		<div class="container" align="center" style="text-align: center; width: 20%; margin-top: 30px" >

		<table class="table table-bordered">
			<th class="table-dark">회원정보</th>
			<th class="table-dark">결과값</th>
			<tr><!-- 첫번째 줄 시작 -->
			    <td>회원아이디</td>
			    <td>${findUser.id}</td>
			</tr><!-- 첫번째 줄 끝 -->
			<tr><!-- 두번째 줄 시작 -->
			    <td>비밀번호</td>
			    <td>${findUser.password}</td>
			</tr><!-- 두번째 줄 끝 -->
			<tr><!-- 두번째 줄 시작 -->
			    <td>이름</td>
			    <td>${findUser.name}</td>
			</tr><!-- 두번째 줄 끝 -->
			<tr><!-- 두번째 줄 시작 -->
			    <td>이메일</td>
			    <td>${findUser.email}</td>
			</tr><!-- 두번째 줄 끝 -->
			<tr><!-- 두번째 줄 시작 -->
			    <td>전화번호</td>
			    <td>${findUser.phone}</td>
			</tr><!-- 두번째 줄 끝 -->
		    </table>
		</div>
		<!-- footer -->
		<div class="jumbotron text-center mt-5 mb-0">
			<h3 class="text-secondary">Happy House</h3>
			<p>
				Happy House’s Homepage is powered by <span class="text-primary">Junhee
					& Gwangil</span> / Designed by <span class="text-primary">Junhee &
					Gwangil</span>
			</p>
		</div>
	</c:if>
	<%@ include file="../foot.jsp"%>
</body>
</html>
