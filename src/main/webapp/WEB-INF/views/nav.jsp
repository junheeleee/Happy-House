<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 <c:if test="${cookie.saveid.value != null}">
	<c:set var="svid" value="${cookie.saveid.value}"/>
	<c:set var="ckid" value=" checked"/>
	<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
</c:if>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark ">
			<a href="${root}/" class="navbar-brand">Happy House</a>
			<!-- Toggle Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item">
					<a href="${root}/notice/search" class="nav-link">공지사항</a>
					</li>
					<li class="nav-item">
					<a href="${root}/map" class="nav-link">주택 매물 찾기</a>
					</li>
					<li class="nav-item">
					<a href="${root}/commerce" class="nav-link">관심지역 상권 정보</a>
					</li>
					<a href="${root}/mvpollution" class="nav-link">지역 오염도</a>
					</li>
					<li class="nav-item">
					<a href="${root}/user/search" class="nav-link">회원 정보 검색</a>
					</li>
					<li class="nav-item">
					<a href="${root}/qna" class="nav-link">QnA</a>
					</li>
					<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          ${userinfo.name}
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="${root}/mvmodify">정보 수정</a>
				          <a class="dropdown-item" href="${root}/logout">로그아웃</a>
				       	</div>
			        </li>
				</ul>
			</div>
		</nav>