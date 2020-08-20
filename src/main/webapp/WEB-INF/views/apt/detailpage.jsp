<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<title>Happy House :: Detail Page</title>
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
   <!-- header -->
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

   <div class="jumbotron text-center mb-0">
      <h1>Happy House</h1>
      <p>안녕하세요! Happy House입니다!</p>
   </div>

      <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
         <a href="#" class="navbar-brand">Happy House</a>
         <!-- Toggle Button -->
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
               <li class="nav-item"><a href="${root}/main.do?act="
                  class="nav-link">공지사항</a></li>
               <li class="nav-item"><a href="${root}/main.do?act=housedeal"
                  class="nav-link">주택 실거래가 검색</a></li>
               <li class="nav-item"><a href="${root}/main.do?act="
                  class="nav-link">주택 환경 정보 검색</a></li>
               <li class="nav-item">
             <a href="${root}/main.do?act=mvuserSearch" class="nav-link">회원 정보 검색</a></li>
            </ul>
         </div>
      </nav>
      <!-- content -->
      <div class="container pt-3">
         <div class="row">
            <!-- left content -->
            <div class="col-sm-4">
               <h2>About Happy House</h2>
               <p>내 집 마련의 꿈! Happy House와 함께하세요!</p>
               <hr>
               <!-- side menu (link) -->
               <h3>사이드 메뉴</h3>
               <p>여기는 사이드 메뉴</p>
               <ul class="list-group">
                  <li class="list-group-item list-group-item-action"><a
                     href="#">링크1</a></li>
                  <li class="list-group-item list-group-item-action"><a
                     href="#">링크2</a></li>
                  <li class="list-group-item list-group-item-action"><a
                     href="#">링크3</a></li>
               </ul>
               <hr>
               <h3>오늘의 집</h3>
               <%-- <img src="banner3.jpg" class="img-fluid rounded p-3"> <img
               src="banner5.jpg" class="img-fluid rounded p-3">
               --%>
            </div>
            <!-- right content -->
            <div class="col-sm-8">
               <h1>자세한 정보</h1>
               <c:forEach items="${houseDetail}" var="house">

                  <img src="${root}/img/${house.img}" />
                  <br>
                  <a>아파트 이름 : ${house.aptName}</a>
                  <br>
                  <a>아파트 동 : ${house.dong}</a>
                  <br>
                  <a>건축연도 : ${house.buildYear}</a>
                  <br>
                  <a>아파트 지번 : ${house.jibun}</a>
                  <br>
               </c:forEach>
            </div>
         </div>
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
</body>
</html>