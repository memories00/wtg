<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>

<!-- ajax -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- 지도생성 -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
        </div>
        
        <hr> 
		
        <div id="type">
        	<input type="button" id="12" value="관광지" onclick="contentType(this)"/>
        	<input type="button" id="14" value="문화시설" onclick="contentType(this)"/>
        	<input type="button" id="28" value="레포츠" onclick="contentType(this)"/>
        	<input type="button" id="32" value="숙박" onclick="contentType(this)"/>
    		<input type="button" id="38" value="쇼핑" onclick="contentType(this)"/>
    		<input type="button" id="39" value="음식점" onclick="contentType(this)"/>
        </div>   
    </div>
</div>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   	mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
	};  
	
//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
//마커를 옮깁니다
var marker = new daum.maps.Marker({
    position:map.getCenter()
});


function contentType(type) {
	var t = type.getAttribute('id');
		$.ajax({
	        url:"/wtg/typeSearch.nhn",
	        data: {
	        	typeId : t
	        },
	        success: test
	    });
	}


function test(a){
	$("#ajaxReturn").html(a);
}
</script>

<div id="ajaxReturn">test:이곳에 xy좌표</div>




