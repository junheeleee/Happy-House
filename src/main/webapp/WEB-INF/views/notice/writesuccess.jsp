<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>공지사항 작성 성공</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" align="center">
	<c:if test="${userinfo != null}">
		<header>
			<div style="float: right;">
				<a><strong>${userinfo.name}</strong>님 환영합니다.</a>
				<a href="${root}/main.do?act=mvuserModify">회원 정보 수정</a>
				<a href="${root}/main.do?act=logout">로그아웃</a>
				<a href="${root}/notice.do?act=list">공지사항</a>
				<%-- <br><a href="${root}/main.do?act=mvuserDelete">탈퇴</a> --%>
			</div>
		</header>
	</c:if>
	<div class="col-lg-6">
	  <div class="jumbotron">
	    <h1>공지사항 작성 성공!!!</h1>      
	  </div>  
	  <p><a href="${root}/notice.do?act=list">공지사항 목록</a></p>
	</div>
</div>
</body>
</html>
