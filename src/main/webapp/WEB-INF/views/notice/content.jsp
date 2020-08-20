<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<c:set var="noticeDto" value="${notice}"/>
	<style type="text/css">
		.contentdiv
		{
		width:50%;
		border : solid black;
		}
	</style>
	
	<%@ include file="../scr.jsp" %>
</head>
<body>
<%@ include file ="../nav.jsp" %>
	<div class="container">
      <div>

      	<div class="contentdiv" align="left">
      	<table class="table table-condensed">
      		<tr>
      			<th>작성자</th>
      			<td>${noticeDto.userid}</td>
      			<th>날짜</th>
      			<td>${noticeDto.regtime}</td>
   			</tr>
   			<tr>
      			<td colspan="4"><p><p><p><p><p>${noticeDto.content}</td>
   			</tr>
   			<tr>
   				<td><a href="${root}/notice/search" class="btn btn-success">목록보기</a></td>
   			</tr>
		</table>
		
		</div>
      </div>
    </div>
    <%@ include file="../foot.jsp"%>
</body>
</html>