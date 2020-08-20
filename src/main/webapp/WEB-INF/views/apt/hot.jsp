<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../scr.jsp" %>
</head>
<body>

<%@ include file="../nav.jsp" %>
  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h4> 1위  -  ${no1.dong } ${no1.aptName } (${no1.count}회)</h4>
      <p class="lead"><img src="${root}/img/${no1.img }"/></p>
      
<!--       <a href="#" class="btn btn-primary btn-lg"></a> -->
    </header>

    <!-- Page Features -->
    <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="${root}/img/${no2.img }" alt="">
          <div class="card-body">
            <h5 class="card-title">${no2.dong } ${no2.aptName }<br> (${no2.count}회)</h5>
            <p class="card-text"></p>
          </div>
          <div class="card-footer">
<!--             <a href="#" class="btn btn-primary">Find Out More!</a> -->
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="${root}/img/${no3.img }" alt="">
          <div class="card-body">
            <h5 class="card-title">${no3.dong } ${no3.aptName } <br>(${no3.count}회)</h5>
            <p class="card-text"></p>
          </div>
          <div class="card-footer">
<!--             <a href="#" class="btn btn-primary">Find Out More!</a> -->
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="${root}/img/${no4.img }" alt="">
          <div class="card-body">
            <h5 class="card-title">${no4.dong } ${no4.aptName } <br>(${no4.count}회)</h5>
            <p class="card-text"></p>
          </div>
          <div class="card-footer">
<!--             <a href="#" class="btn btn-primary">Find Out More!</a> -->
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="${root}/img/${no5.img }" alt="">
          <div class="card-body">
            <h5 class="card-title">${no5.dong } ${no5.aptName } <br>(${no5.count}회)</h5>
            <p class="card-text"></p>
          </div>
          <div class="card-footer">
            <!-- <a href="#" class="btn btn-primary">Find Out More!</a> -->
          </div>
        </div>
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
<%@ include file="../foot.jsp"%>

  <!-- Bootstrap core JavaScript -->
<!--     <script src="vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
</body>
</html>