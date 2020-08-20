<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../scr.jsp" %>
</head>
<body>
<%@ include file="../nav.jsp" %>
	<div class="container">
      
      
      <div>
      	<div>
      		<h3>${district} 환경 정보</h3>
      	</div>
      	<div>
      		<form id="searchform" action="${root}/pollution.do/search">
      		<input type="text" class="form-control" id="district" name="district" value="${district}" placeholder="구 단위 입력">
      		<input type="hidden" name="page" value="">
      			<div class="form-group">
   <!--    				<select id="yearkey" id="yearkey" name="yearkey">
      					<option value="2019">2019
      					<option value="2018">2018
      					<option value="2017">2017
      					<option value="2016">2016
      					<option value="2015">2015
      					<option value="2014">2014
      				</select>
      				<span>년 </span>
      				<select id="monthkey" id="monthkey" name="monthkey">
      					<option value="1">1
      					<option value="2">2
      					<option value="3">3
      					<option value="4">4
      					<option value="5">5
      					<option value="6">6
      					<option value="7">7
      					<option value="8">8
      					<option value="9">9
      					<option value="10">10
      					<option value="11">11
      					<option value="12">12
      				</select> -->
      				<!-- <span>월 </span> -->
      				<button type="submit" class="btn btn-default" onclick="submit(1)">검색</button>
      			</div>
      		</form>
      	</div>
      	<table class="table table-condensed">
      		<tr>
      			<th>날짜</th>
      			<th>지역구</th>
      			<th>산소</th>
      			<th>오존</th>
      			<th>이산화탄소</th>
      			<th>아황산가스</th>
      			<th>미세먼지</th>
      			<th>초미세먼지</th>
   			</tr>
   			<c:forEach var="list" items="${list}">
   			<tr>
   				<td>${list.polluteDate}</td>
   				<td>${list.district}</td>
   				<td>${list.o2}</td>
   				<td>${list.ozon}</td>
   				<td>${list.carbon}</td>
   				<td>${list.sulfur}</td>
   				<td>${list.finedust}</td>
   				<td>${list.ultraFinedust}</td>
   			</tr>
   			</c:forEach>
		</table>
      </div>
      
      <nav>
			  <ul class="pagination justify-content-center">
			  	<c:if test="${paging.prev}">
			    <li class="page-item">
			      <a class="page-link" onclick="submit(${paging.beginPage-1})" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
				</c:if>
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" step="1" var="index">
				   <c:choose>
				       <c:when test="${paging.page==index}">
			    <li class="page-item active"><a class="page-link" onclick="submit(${index})">${index}</a></li>
				       </c:when>
				       <c:otherwise>
			    <li class="page-item" ><a class="page-link" onclick="submit(${index})">${index}</a></li>
				       </c:otherwise>
				   </c:choose>
				</c:forEach>
				<c:if test="${paging.next}">
			    <li>
			      <a class="page-link" onclick="submit(${paging.endPage+1})" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
				</c:if>
			  </ul>
			</nav>
      
    </div>
     <script>
     	$(function() {
  			$("option[value='${yearkey}']").prop("selected", true);
  			$("option[value='${monthkey}']").prop("selected", true);
  		});
    	function submit(idx) {
    		let form = $('#searchform');
    		$('input[name="page"]').val(idx);
    		form.submit();
    	}
    </script>
    <%@ include file="../foot.jsp"%>
</body>
</html>