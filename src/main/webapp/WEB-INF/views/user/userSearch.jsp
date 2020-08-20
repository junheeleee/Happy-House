<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House :: 회원정보 찾기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../scr.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
		$("#pwdSearchBtn").click(function() {

			if ($("#userid").val() == "") {
				alert("아이디 입력!!!");
				return;
			}
			/* else {
				$.ajax({
					type:'POST',
					url:'${root}/user/pwsearch',
					data: { //JSON.stringify({
						  userid: $("#userid").val(),
					     },
					//);
					success:function(data){    				
						location.href="${root}/user/mvresult";
						//location.href
						alert("성공");
					},
					error:function(data){
						alert("찾기 실패 "+"\n"+"관리자에게 문의하세요.");
					}
				});
			} */
			else {
				document.getElementById("idform").action = "${root}/user/ussearch";
				document.getElementById("idform").submit();
			}
		});
	});
</script>
</head>
<body>
<%@ include file ="../nav.jsp" %>
	<div class="jumbotron text-center mb-0">
		<h1>Happy House</h1>
		<p>안녕하세요! Happy House입니다!</p>
	</div>
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="idform" method="post" action="/user/pwsearch">
				<input type="hidden" name="act" id="act" value="userSearch">
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" class="form-control"
						id="userid" name="userid" placeholder="">
				</div>
				<button type="button" class="btn btn-primary" id="pwdSearchBtn">회원정보
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