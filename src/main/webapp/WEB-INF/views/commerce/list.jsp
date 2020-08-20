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
<%@ include file ="../nav.jsp" %>
   <div class="container">
      
      <div>
         <div>
            <h3>상권 정보</h3>
         </div>
         <script>
            function geocode(jsonData) {
               let idx = 0;
               $.each(jsonData.list, function(index, vo) {
                  let tmpLat;
                  let tmpLng;
                  $.get("https://maps.googleapis.com/maps/api/geocode/json"
                        ,{key:'AIzaSyCcMs5TBKzs82fwgElH_jZ5ycqJG5uKNZM'
                           , address:vo.address+"+"+vo.shopname
                        }
                        , function(data, status) {
                           tmpLat = data.results[0].geometry.location.lat;
                           tmpLng = data.results[0].geometry.location.lng;
                           addMarker(tmpLat, tmpLng, vo.shopname);
                        }
                        , "json"
                  );//get
               });//each
            }
         </script>
         
         <div>
            <form id="searchform" name="searchform">
               <input type="hidden" name="page" value="">
               <div class="form-group">
               관심지역 : <input type="text" id="interestArea" name="interestArea" value="${interestArea}" placeholder="관심지역을 입력해주세요">
               <a class="btn btn-default" onclick="submit(1)">검색</a> 
               <br>
                  <select id="key" name="key">
                     <option value="shopname">가게명
                     <option value="codename1">업종
                     <option value="codename3">세부 업종
                  </select>
                  <!-- <a class="btn btn-default" onclick="setInterest">설정</a> -->
                  <input type="text" id="word" name="word" value="${word}">
                  <a class="btn btn-default" onclick="submit(1)">검색</a>
               </div>
            </form>
         </div>
         <div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcMs5TBKzs82fwgElH_jZ5ycqJG5uKNZM&callback=initMap"></script>
<script>
var multi = {lat: 37.5665734, lng: 126.978179};
   var map;
   function initMap() {
      map = new google.maps.Map(document.getElementById('map'), {
         center: multi, zoom: 12
      });
      //var marker = new google.maps.Marker({position: multi, map: map});
   }
   function addMarker(tmpLat, tmpLng, shopname) {
      console.log("addMarker");
      var marker = new google.maps.Marker({
         position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
         label: shopname,
         title: shopname
      });
      //multi = {lat: tmpLat, lng: tmpLng};
//      map = new google.maps.Map(document.getElementById('map'), {
//         center: multi, zoom: 12
   //   });
      marker.addListener('click', function() {
         map.setZoom(17);
         map.setCenter(marker.getPosition());
      });
      var hear = new google.maps.LatLng(tmpLat, tmpLng);
      map.panTo(hear); //위치 정보를 통해 맵에 표시 
      marker.setMap(map);
      map.setZoom(14);
   }
   
    function submit(idx) {
         $("input[name='page']").val(idx);
         console.log("asdasd"+$("interestArea").val());
        $.ajax({
            url : "${root}/commerce/search", // 요기에
            type : "POST",
            data : {
            	 key: $("#key").val(),
            	 word: $("#word").val(),
            	 page: idx,
            	 interestArea: $("#interestArea").val()
            },
            success : function(data) {
               let commerhtml;
               //console.log(data.list);
               console.log(data.key);
               console.log(data.word);
               console.log(data.list);
               if(data.list.length == 0) {
                  commerhtml += "<tr><td colspan=\"5\">검색결과가 없습니다.</td></tr>"
                  $("#htable").html(commerhtml);
               }
               geocode(data);
               for(var i = 0; i < data.list.length; i++) {
                  commerhtml += "<tr>"
                  + "<td>" + data.list[i].shopname + "</td>"
                  + "<td>" + data.list[i].codename1 + "</td>"
                  + "<td>" + data.list[i].codename3 + "</td>"
                  + "<td>" + data.list[i].address
                  + "</td></tr>";
                     
                        
                     $("#htable").html(commerhtml);
               }
               
               console.log(data.paging);
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
                     pagehtml += "  <li \"page-item\"><a class=\"page-link\" onclick=\"submit("
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
               console.log(xhr);
                alert(xhr + " : " + status);
            }
            
        });
      }
</script>
         <table class="table table-condensed">
            <tr>
               <th>가게명</th>
               <th>업종</th>
               <th>세부업종</th>
               <th>주소</th>
            </tr>
            <tbody id="htable">
            </tbody>
      </table>
      </div>
      <nav id="pagingnav">
      </nav>
      
    </div>
<!--      <script>
        $(function() {
           submit(1);
           $("option[value='${key}']").prop("selected", true);
        });
    </script> -->
    <%@ include file="../foot.jsp"%>
    
</body>
</html>