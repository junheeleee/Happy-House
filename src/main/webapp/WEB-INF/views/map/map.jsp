<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userinfo" value="${sessionScope.userInfo}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../scr.jsp" %>
</head>
<body>
<%@ include file ="../nav.jsp" %>
      <div>
      	<div>
      		<h3>아파트 거래 정보</h3>
      	</div>
      	<div>
      		시도 : <select id="sido">
				<option class="form-control" value="0">선택</option>
			</select>
			구군 : <select id="gugun">
				<option class="form-control" value="0">선택</option>
			</select>
			읍면동 : <select id="dong">
				<option class="form-control" value="0">선택</option>
			</select>
      		<form id="aptsearchform">
      		<input type="hidden" name="act" value="search">
      		<input type="hidden" name="page" value="">
      			<div class="form-group">
      				<label class="checkbox-inline">
					  <input type="checkbox" id="type0" name="type" value="0">아파트 매매
					</label>
					<label class="checkbox-inline">
					  <input type="checkbox" id="type1" name="type" value="1">아파트 전월세
					</label>
					<label class="checkbox-inline">
					  <input type="checkbox" id="type2" name="type" value="2">다세대,주택 매매
					</label>
					<label class="checkbox-inline">
					  <input type="checkbox" id="type3" name="type" value="3">다세대,주택 전월세
					</label>
      			</div>
      			<c:if test="${types != null}">
      				<script>
      				$(function() {
	      				<c:forEach var="type" items="${types}">
							$("#type${type}").prop("checked", true);
	      				</c:forEach>
      					});
      				</script>
      			</c:if>
      			<c:if test="${types == null}">
      				<script>
      					$(function() {
							$("input:checkbox[name='type']").prop("checked", true);
      					});
      				</script>
      			</c:if>
      			<%-- <div class="form-group">
      				<select id="key" id="key" name="key">
		      			<option value="dong">동      						
   						<option value="aptName">아파트이름      						
      				</select>
      				<input type="hidden">
      				<input type="text" id="word" name="word" value="${word}">
      				<a class="btn btn-default" onclick="submit(1)">검색</a>
      			</div> --%>
      		</form>
      	</div>
      	<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
      	<table class="table table-sm">
      		<tr>
      			<th>번호</th>
      			<th>동</th>
      			<th>이름 (가격) </th>
      			<th>건설년도</th>
      			<th>지번코드</th>
   			</tr>
   			<tbody id="htable">
   			</tbody>
		</table>
      </div>
      
		
		<!-- Modal -->
		<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" align="center">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="modalLabel">사진</h4>
		      </div>
		      <div class="modal-body">
		        <img id="aptimg" alt="" src="">
		        <p id="modalcontent"></p>
		      </div>
		    </div>
		  </div>
		</div>

		<div align="center">
			<nav id="pagingnav">
			</nav>
		</div>
		

<!-- here start -->
<script>
let colorArr = ['table-primary','table-success','table-danger'];
$(document).ready(function(){
	console.log("index.jsp : 138");
	$.get("${pageContext.request.contextPath}/FSelectBoxController/sido"
		,function(data, status){
			console.log(data);
			$.each(data, function(index, vo) {
				$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
			});//each
		}//function
		, "json"
	);//get
});//ready
$(document).ready(function(){
	console.log("index.jsp : 150");
	$("#sido").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController/gugun/"+$('#sido').val()
				,function(data, status){
					console.log("${pageContext.request.contextPath}/FSelectBoxController/gugun/"+$('#sido').val());
					console.log(data);
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#gugun").change(function() {
		console.log("index.jsp : 165");
		$.get("${pageContext.request.contextPath}/FSelectBoxController/dong/"+$('#gugun').val()
				,function(data, status){
					console.log("${pageContext.request.contextPath}/FSelectBoxController/dong/"+$('#gugun').val());
					console.log(data);
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#dong").change(function() {
		console.log("index.jsp : 179");
		$.get("${pageContext.request.contextPath}/FSelectBoxController/apt/"+$('#dong').val()
				,{command:"apt", dong:$("#dong").val(), "page":1}
				,function(data, status){
					console.log("${pageContext.request.contextPath}/FSelectBoxController/apt/"+$('#dong').val());
					console.log(data);
					let str;
					$.each(data.list, function(index, vo) {
						/* let amount = getamount(vo.aptName, vo.jibun); */
						str += "<tr>"
						+ "<td>" + vo.no + "</td>"
						+ "<td>" + vo.dong + "</td>"
						+ "<td style=\"cursor:pointer;color:blue;\" data-toggle=\"modal\" data-target=\"#imgModal\" data-code=\""
						+ vo.code+"\""+ "data-aptname=\""+vo.aptName+"\"" +">" + vo.aptName + "</td>"
						+ "<td>" + vo.buildYear + "</td>"
						+ "<td>" + vo.code
						+ "</td></tr>";
					});//each
					$("#htable").html(str);
					
					let pagehtml = "<ul class=\"pagination justify-content-center\">";
			    	if(data.paging.prev) {
			    		pagehtml += "<li class=\"page-item\">"
				    +"  <a class=\"page-link\" onclick=\"submit("
				    + (data.paging.beginPage - 1)
				    +")\" aria-label=\"Previous\">"
					+"      <span aria-hidden=\"true\">&laquo;</span>"
					+"    </a>"
					+"  </li>"
			    	}
			    	for(var i = data.paging.beginPage; i <= data.paging.endPage; i++) {
			    		if(data.paging.page == i) {		    			
				    		pagehtml += "  <li class=\"page-item active\"><a class=\"page-link\" onclick=\"submit("
				    				+ i +")\">"
				    				+ i + "</a></li>"
			    		} else {
			    			pagehtml += "  <li class=\"page-item\"><a class=\"page-link\"  onclick=\"submit("
			    					+ i + ")\">"
			    					+ i + "</a></li>"
			    		}
			    	}
			    	if(data.paging.next) {
			    	pagehtml += "  <li class=\"page-item\">"
					+"    <a class=\"page-link\" onclick=\"submit("
					+(data.paging.endPage + 1)
					+")\" aria-label=\"Next\">"
					+"      <span aria-hidden=\"true\">&raquo;</span>"
					+"    </a>"
					+"  </li>"
			    	}
					pagehtml+="</ul>"
					$("#pagingnav").html(pagehtml);
					console.log(data.list);
					geocode(data.list);
				}//function
				, "json"
		);//get
	});//change
});//ready
function geocode(jsonData) {
	let idx = 0;
	console.log("index.jsp : 236");
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyCcMs5TBKzs82fwgElH_jZ5ycqJG5uKNZM'
					, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
				}
				, function(data, status) {
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					addMarker(tmpLat, tmpLng, vo.aptName, vo.code);
				}
				, "json"
		);//get
	});//each
}
</script>

<!-- here end -->
<!-- map start -->

<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcMs5TBKzs82fwgElH_jZ5ycqJG5uKNZM&callback=initMap"></script>
<script>
	var multi = {lat: 37.5665734, lng: 126.978179};
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
		var marker = new google.maps.Marker({position: multi, map: map});
	}
	function addMarker(tmpLat, tmpLng, aptName, code) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			//label: code,
			title: aptName
		});
		marker.addListener('click', function() {
			map.setZoom(17);
			map.setCenter(marker.getPosition());
			callHouseDealInfo(marker, aptName, code);
		});
		marker.setMap(map);
		var hear = new google.maps.LatLng(tmpLat, tmpLng);
		map.panTo(hear); //위치 정보를 통해 맵에 표시 
		map.setZoom(15);
	}
	function callHouseDealInfo(marker, aptName, code) {
		new google.maps.InfoWindow({
		    content: aptName
		}).open(map, marker);
	}
</script>
<!-- map end -->
	
    </div>
    <script>
    	
    	console.log($("#aptsearchform").serialize());
    	function submit(idx) {
    		if($("input:checkbox[name='type']:checked").length == 0) {
    			alert("검색 타입을 하나라도 선택해주세요.");
    			return;
    		}
    		
    		$("input[name='page']").val(idx);
			$.ajax({
			    url : "main.do/", // 요기에
			    type : "POST",
			    data : $("#aptsearchform").serialize(), 
			    success : function(data) {
			    	console.log(data);
			    	let apthtml;
			    	if(data.aptlist.length == 0) {
			    		apthtml += "<tr><td colspan=\"5\">검색결과가 없습니다.</td></tr>"
			    		$("#htable").html(apthtml);
			    	}
			    	for(var i = 0; i < data.aptlist.length; i++) {
	    				apthtml += "<tr>"
	    	   				+"<td>"
	    	   				+data.aptlist[i].no
	    	   				+"</td>"
	    	   				+"<td>"
	    	   				+data.aptlist[i].dong
	    	   				+"</td>"
	    	   				+"<td style=\"cursor:pointer;color:blue;\" data-toggle=\"modal\" data-target=\"#imgModal\" " 
	    	   				+"data-code=\""
	    	   				+data.aptlist[i].code
	    	   				+"\" "
	    	   				+"data-aptname=\""
	    	   				+data.aptlist[i].aptName
	    	   				+"\" "
	    	   				+">"
	    	   				+data.aptlist[i].aptName + " (" +data.aptlist[i].dealAmount+")"
	    	   				+"</td>"
	    	   				+"<td>"
	    	   				+data.aptlist[i].buildYear
	    	   				+"</td>"
	    	   				+"<td>"
	    	   				+data.aptlist[i].code
	    	   				+"</td>"
	    	   				+"</tr>"
	    	   			
	    	   				
	    	   			$("#htable").html(apthtml);
	    			}
			    	
			    	let pagehtml = "<ul class=\"pagination justify-content-center\">";
			    	if(data.paging.prev) {
			    		pagehtml += "<li class=\"page-item\">"
				    +"  <a class=\"page-link\" onclick=\"submit("
				    + (data.paging.beginPage - 1)
				    +")\" aria-label=\"Previous\">"
					+"      <span aria-hidden=\"true\">&laquo;</span>"
					+"    </a>"
					+"  </li>"
			    	}
			    	for(var i = data.paging.beginPage; i <= data.paging.endPage; i++) {
			    		if(data.paging.page == i) {		    			
				    		pagehtml += "  <li class=\"page-item active\"><a class=\"page-link\" onclick=\"submit("
				    				+ i +")\">"
				    				+ i + "</a></li>"
			    		} else {
			    			pagehtml += "  <li class=\"page-item\"><a class=\"page-link\" onclick=\"submit("
			    					+ i + ")\">"
			    					+ i + "</a></li>"
			    		}
			    	}
			    	if(data.paging.next) {
			    		pagehtml += "  <li>"
					+"    <a class=\"page-link\" onclick=\"submit("
					+(data.paging.endPage + 1)
					+")\" aria-label=\"Next\">"
					+"      <span aria-hidden=\"true\">&raquo;</span>"
					+"    </a>"
					+"  </li>"
			    	}
					pagehtml+="</ul>"
					$("#pagingnav").html(pagehtml);
					
					for(var i = 0; i < data.types.length; i++) {
						$("#type" + data.types[i]).prop("checked", true);					
					}
					
					if(data.key) {
						console.log(data.key);
						$("option[value='" + data.key + "']").prop("selected", true);
					}
					
					if(data.word) {
						console.log(data.word);
						$("#word").val(data.word);
					}
					
					
			    },
			    error : function(xhr, status) {
			        alert(xhr + " : " + status);
			    }
			});
    	}
    	function getamount(name, jibun){
    		var temp='';
    		$.ajax({
			    cache : false,
			    url : "main.do/amount", // 요기에
			    type : "POST",
			    data : {"aptName" : name, "jibun" : jibun},
			    success : function(data) {
				    temp = data;
			    },
			    error : function(xhr, status) {
			        alert(xhr + " : " + status);
			    }
			});
    		return temp;
    	}
    	function getimg(code, name) {
			$.ajax({
			    cache : false,
			    url : "main.do/click", // 요기에
			    type : "POST",
			    data : {"code" : code, "aptName" : name},
			    success : function(data) {
				    $("#aptimg").attr("src", "img/" + data);
				    $("#modalcontent").html(name);
			    },
			    error : function(xhr, status) {
			        alert(xhr + " : " + status);
			    }
			});
    	};
    	
    	$(function() {    		
    		submit(1);
    		$('#imgModal').on('show.bs.modal', function (event) {
    			let button = $(event.relatedTarget);
    			console.log(button);
    			let code = button.data('code');
    			let name = button.data('aptname');
    			let modal = $(this);
    			getimg(code, name);
   			});
    	});
    	
    </script>
    <%@ include file="../foot.jsp"%>
</body>
</html>