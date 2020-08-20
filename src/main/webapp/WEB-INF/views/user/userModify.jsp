<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}" />
<!DOCTYPE html>
<html>
<head>
<title>Happy House :: 회원 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../scr.jsp" %>
<script type="text/javascript">
/* $(document).ready(function() {
	$("#deleteBtn").click(function() {
		console.log("test");
		document.getElementById("deleteBtn").action = "${root}/user/mvuserDelete";
		document.getElementById("deleteBtn").submit();
		
	});
});
function moveModify() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("userpwd").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("memberform").action = "${root}/user/modify";
		document.getElementById("memberform").submit();
	}
} */
$(document).ready(function() {
	$("#deleteBtn").click(function(){
		console.log("들어옴");
		$.ajax({
			type:'POST',
			url:'${root}/user.do/delete',
			data: { //JSON.stringify({
				  userid: $("#userid").val(),
				  password: $("#userpwd").val(),
			     },
			//);
			success:function(data){    				
				if(data.res == 1){
					alert("삭제 완료");
					location.href="${root}/";
					
				} else if(data.res==0){
					alert("삭제 실패, 비밀번호 확인");
				}
				else{
					alert("에러발생 "+"\n"+"관리자에게 문의하세요.");							
				}
			}
		});
	})
	$("#modifyBtn").click(function() {
		$.ajax({
		    cache : false,
		    url : "${root}/user.do/modify", // 요기에
		    type : "POST",
		    data : {
		    	  id: $("#userid").val(),
				  password: $("#userpwd").val(),
				  name: $("#username").val(),
				  email: $("#emailid").val()+"@"+$("#emaildomain").val(),
				  phone: $("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val()
				  }, 
		    	success : function(data) {
		    	console.log(data);
		    	let check = $("#msg");
		    	if(data.res == 1) {
		    		alert("변경완료");
		    		location.href="${root}/";
		    	} else if(data.res == 0) {
					alert("변경실패");
					location.href="${root}/mvmodify";
		    	} else {
		    		check.html("서버에러!");
		    	}
		    },
		    error : function(xhr, status) {
		        alert(xhr + " : " + status);
		    }
		});
		
	});//click
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
			<form id="memberform" method="post" action="">
				<input type="hidden" name="act" id="act" value="userModify">
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" value="${userinfo.id}"
						class="form-control" id="userid" name="userid" placeholder=""
						readonly="true">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label> <input type="password"
						value="${userinfo.password}" class="form-control" id="userpwd"
						name="userpwd" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호재입력</label> <input type="password"
						class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="name">이름</label> <input type="text"
						value="${userinfo.name}" class="form-control" id="username"
						name="username" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="email">이메일</label><br>
					<div id="email" class="custom-control-inline">
						<input type="text" class="form-control" id="emailid"
							name="emailid" placeholder="" size="25"> @ <select
							class="form-control" id="emaildomain" name="emaildomain">
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</div>
				</div>
				<div class="form-group" align="left">
					<label for="tel">전화번호</label>
					<div id="tel" class="custom-control-inline">
						<select class="form-control" id="tel1" name="tel1">
							<option value="010">010</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="041">041</option>
							<option value="051">051</option>
							<option value="061">061</option>
						</select> _ <input type="text" class="form-control" id="tel2" name="tel2"
							placeholder=""> _ <input type="text" class="form-control"
							id="tel3" name="tel3" placeholder="">
					</div>
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary" id="modifyBtn"
						>수정</button>
					<button type="reset" class="btn btn-warning">초기화</button>
					<div align="right">
						<button type="button" class="btn btn-danger" id="deleteBtn"
							>탈퇴</button>
					</div>

				</div>
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