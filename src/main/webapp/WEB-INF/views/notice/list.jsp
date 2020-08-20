<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../scr.jsp" %>
<script type="text/javascript">
		function searchNotice() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "";
			document.getElementById("searchform").submit();
		}
		</script>
</head>
<body>
<%@ include file ="../nav.jsp" %>
	<div class="container" align="center">
	<c:set var="i" value="0"></c:set>
      <div>
      	<br><br><br><br><br>
      	
      	<table class="table table-condensed">
      		<tr>
      			<th>번호</th>
      			<th>제목</th>
      			<th>작성자</th>
      			<th colspan="4">날짜</th>
   			</tr>
   			<c:forEach var="list" items="${list}">
   			<tr>
   				<td>${list.noticeno}</td>
   				<td><a href="${root}/notice/${list.noticeno}">${list.subject}</a></td>
   				<td>${list.userid}</td>
   				<td>${list.regtime}</td>
   				<c:if test="${userinfo == null or userinfo.id != 'admin'}">
   					<td colspan="3"></td>
   				</c:if>
   				<c:if test="${userinfo != null}">
   					<c:if test="${userinfo.id == 'admin'}">   
   						<td><a href="${root}/notice/mvmodify/${list.noticeno}">수정</a></td>
   						<td></td>
   						<td><a href="${root}/notice/delete/${list.noticeno}">삭제</a></td>
   					</c:if>
   				</c:if>
   			</tr>
   			</c:forEach>
   			<tr><td colspan="7"></td></tr>
   			<tr>
   				<td colspan="6"></td>
   				<td>
   					<c:if test="${userinfo == null or userinfo.id != 'admin'}">
   						<td></td>
   					</c:if>
   					<c:if test="${userinfo != null}">
   						<c:if test="${userinfo.id == 'admin'}">   
   						<a href="${root}/notice/mvwrite">글 작성</a>
   						</c:if>
   					</c:if>
   				</td>
   			</tr>
		</table>
      </div>
      <div>
      		<form id="searchform" action="${root}/notice.do">
      		<input type="hidden" name="act" value="search">
      		<input type="hidden" name="page" value="">
      			<div class="form-group">			
      				<select id="key" id="key" name="key">
      					<option value="subject">제목
      					<option value="content">내용
      				</select>
      				<input type="text" id="word" name="word" value="${word}">
      				<button type="submit" class="btn btn-default">검색</button>
      			</div>
      		</form>
      	</div>
      <!-- pagination Nav -->

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
     		$("option[value='${key}']").prop("selected", true);
     	});
    	function submit(idx) {
    		let form = $('#searchform');
    		$('input[name="page"]').val(idx);
    		form.submit();
    	}
    </script>
		<%-- <div class="col-lg-8" align="center">
			<h2>공지 목록</h2>
			<table class="table table-borderless">
				<tr>
					<td align="right"><a href="${root}/notice/mvwrite">글쓰기</a></td>
				</tr>
			</table>
			<c:forEach var="notice" items="${notices}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info">
							<td>작성자 : ${notice.userid}</td>
							<td align="right">작성일 : ${notice.regtime}</td>
						</tr>
						<tr>
							<td colspan="2" class="table-danger"><strong>${notice.noticeno}.
									${notice.subject}</strong></td>
						</tr>
						<tr>
							<td colspan="2">${notice.content}</td>
						</tr>
						<c:if test="${userinfo.id == notice.userid}">
							<tr>
								<td colspan="2"><a href="${root}/notice.do/mvmodify/${notice.noticeno}">수정</a> 
								<a href="${root}/notice.do?act=delete&noticeno=${notice.noticeno}">삭제</a></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</c:forEach>

			<c:if test="${notices == null}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
	</div> --%>
	<%@ include file="../foot.jsp"%>
</body>
</html>
