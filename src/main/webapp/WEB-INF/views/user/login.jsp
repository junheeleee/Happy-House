<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.happyhouse_id.value ne null}">
	<c:set var="saveid" value="${cookie.happyhouse_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<title>Happy House :: Login</title>
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
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="loginform" method="post" action="">
		<input type="hidden" name="act" id="act" value="login">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="" value="${saveid}">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="" onkeydown="javascript:if(event.keyCode == 13) {login();}">
			</div>
			<div class="form-group form-check" align="right">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장
			    </label>
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" onclick="javascript:login()">로그인</button>
				
			</div>
		</form>
		<button type="button" class="btn btn-primary" onclick="javascript:movePasswordSearch();">비밀번호 찾기</button>
				<button type="button" class="btn btn-primary" onclick="javascript:moveJoin();">회원가입</button>
	</div>
</div>
<script type="text/javascript">
function login() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("password").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		console.log("login");
		document.getElementById("loginform").action = "/login";
		document.getElementById("loginform").submit();
	}
}
function movePasswordSearch() {
	document.location.href = "mvpasswordSearch";
}	 
function moveJoin() {
	document.location.href = "mvjoin";
}
function move() {
	document.location.href = "commerce";
}	
var result = '${msg}';
if(result=='ok')
	alert("회원정보 수정 완료, 다시 로그인");
</script>
</body>
</html>