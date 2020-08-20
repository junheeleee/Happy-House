<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House :: 비밀번호 찾기</title>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#pwdSearchBtn").click(function() {

			if ($("#userid").val() == "") {
				alert("아이디 입력!!!");
				return;
			} else {
				document.getElementById("idform").action = "${root}/user/pwsearch";
				document.getElementById("idform").submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="jumbotron text-center mb-0">
		<h1>Happy House</h1>
		<p>안녕하세요! Happy House입니다!</p>
	</div>
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="idform" method="post" action="">
				<input type="hidden" name="act" id="act" value="passwordSearch">
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" class="form-control"
						id="userid" name="userid" placeholder="">
				</div>
				<button type="button" class="btn btn-primary" id="pwdSearchBtn">비밀번호
					찾기</button>
			</form>
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
	<%@ include file="../foot.jsp"%>
</body>
</html>