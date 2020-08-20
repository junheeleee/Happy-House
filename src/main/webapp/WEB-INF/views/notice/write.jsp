<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>공지사항 작성</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../scr.jsp" %>
  <script type="text/javascript">
  $(document).ready(function() {
		 $('#writeBtn').click(function(){        	
			 if ($("#subject").val() == "") {
					alert("제목 입력!!!");
					return;
				} else if ($("#content").val() == "") {
					alert("내용 입력!!!");
					return;
				}else {
					$.ajax({
						type:'POST',
						url:'${root}/notice/write',
						data: { //JSON.stringify({
							  userid: $("#id").val(),
							  subject: $("#subject").val(),
							  content: $("#content").val()
						     },
						//);
						success:function(data){    				
							
							location.href="${root}/notice/search";
							//location.href
						},
						error:function(request,status,error){
						    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							//alert("작성 실패 "+"\n"+"관리자에게 문의하세요.");
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
		<h2>공지사항 쓰기</h2>
		<form id="writeform" method="post" action="">
			<input type="hidden" id="id" name="id" value="${userinfo.id }">
			<input type="hidden" name="act" value="write">
			<div class="form-group" align="left">
				<label for="subject">제목:</label>
				<input type="text" class="form-control" id="subject" name="subject">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<button type="button" class="btn btn-primary" id="writeBtn">공지사항 작성</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>
</div>
<%@ include file="../foot.jsp"%>
</body>
</html>