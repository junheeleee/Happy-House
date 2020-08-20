<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}" />
<!DOCTYPE html>
<html>
<head>
<title>Happy House :: Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="./scr.jsp"%>
</head>
<body>
	<c:if test="${userinfo != null}">
		<%@ include file="./nav.jsp"%>
	</c:if>
	<div class="jumbotron text-center mb-0">
		<h1>Happy House</h1>
		<p>안녕하세요! Happy House입니다!</p>
	</div>
	<c:if test="${userinfo == null}">
		<h3>${msg}</h3>
		<%@ include file="user/login.jsp"%>
	</c:if>
	<c:if test="${userinfo != null}">

		<!-- content -->
		<div class="container pt-3">
			<div class="row">
				<!-- left content -->
				<div class="col-sm-4">
					<h2>About Happy House</h2>
					<p>내 집 마련의 꿈! Happy House와 함께하세요!</p>
					<hr>
					<!-- side menu (link) -->
					<h3>오늘의 이슈</h3>
					<ul class="list-group">
						<li class="list-group-item list-group-item-action"><a
							href="${root}/mvhot">베스트 조회 매물</a></li>

					</ul>
					<hr>
					<h3>오늘의 집</h3>

					 <img src="${root}/img/창신동두산.jpg" class="img-fluid rounded p-3"> <img
					src="${root}/img/창신동덕산.jpg" class="img-fluid rounded p-3">
					
				</div>
				<!-- right content -->
				<div class="col-sm-8">
					<h2>오늘의 추천 매물</h2>
					<div class="container">

						<section>
							<div>
								<div class="container">
									<div class="mt-2 mb-2">
										<img src="${root }/img/LA.png" width="800">
									</div>
								</div>
							</div>
						</section>
						<!-- End Breadcrumbs -->
						<!-- section start -->
						<section id="index_section">
						
							

									<!-- here start -->

									<!-- <div id="map" style="width: 100%; height: 500px; margin: auto;"></div> -->
									<!-- <script async defer
										src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcMs5TBKzs82fwgElH_jZ5ycqJG5uKNZM&callback=initMap"></script>
									<script>
										var multi = {
											lat : 37.5012743,
											lng : 127.039585
										}; // 멀티캠퍼스좌표
										var map;
										function initMap() {
											map = new google.maps.Map(document
													.getElementById('map'), {
												center : multi,
												zoom : 17
											});
											var marker = new google.maps.Marker(
													{
														position : multi,
														map : map
													});
										}
									</script> -->
									<%-- <img src="banner.jpg" class="img-fluid rounded">--%>
									<hr>
									<!-- side menu (link) -->
									<video oncontextmenu="return false;" id="myVideo" width="800" controls>
									<source src="${root }/src/video.mp4" type="video/mp4">
									</video>
								
							
					</div>
	</c:if>
	</div>
	</div>
	</div>
	<!-- footer -->
<%@ include file="./foot.jsp"%>
</body>
</html>
