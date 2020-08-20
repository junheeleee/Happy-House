<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글수정</title>
  <c:set var="notice" value="${notice}"/>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../scr.jsp" %>
  <script type="text/javascript">
  $(document).ready(function() {
		 $('#modifyBtn').click(function(){        	
			 if ($("#subject").val() == "") {
					alert("제목 입력!!!");
					return;
				} else if ($("#content").val() == "") {
					alert("내용 입력!!!");
					return;
				}else {
					console.log("글쓰기");
					$.ajax({
						type:'POST',
						url:'${root}/notice/modify',
						data: { //JSON.stringify({
							  noticeno : ${notice.noticeno},
							  userid: $("#id").val(),
							  subject: $("#subject").val(),
							  content: $("#content").val()
						     },
						//);
						success:function(data){    				
							
							location.href="${root}/notice/search";
							//location.href
						},
						error:function(data){
							alert("작성 실패 "+"\n"+"관리자에게 문의하세요.");
						}
					});
				}
	     });

	});
  </script>
  
</head>
<body>
<%@ include file ="../nav.jsp" %>
<div class="container" align="center">
	<c:if test="${userinfo != null}">
		<header>
			<div style="float: right;">
			<%@ include file="../head.jsp" %>
			</div>
		</header>
	</c:if>
	<div class="col-lg-6" align="center">
		<h2>공지사항 수정</h2>
		<form id="writeform" method="post" action="">
		<input type="hidden" name="act" id="act" value="modify">
		<input type="hidden" name="noticeno" id="noticeno" value="${notice.noticeno}">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${notice.subject }">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content">${notice.content}</textarea>
			</div>
			<button type="button" class="btn btn-primary" id="modifyBtn">공지사항 수정</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>
</div>
<%@ include file="../foot.jsp"%>
</body>
</html>
