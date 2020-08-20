<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:if test="${cookie.saveid.value != null}">
	<c:set var="svid" value="${cookie.saveid.value}"/>
	<c:set var="ckid" value=" checked"/>
</c:if>
<div>
              <a><strong>${userinfo.name}</strong>님 환영합니다.</a>
              <a href="${root}/mvmodify">정보 수정</a>&nbsp;
              <a href="${root}/logout">로그아웃</a>           	

</div>