<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=724958f2e1f7b67c37acebb26e173723&libraries=services"></script>

<!-- 지도생성 -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:200px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <p>
                <form onsubmit="searchPlaces(); return false;">
                키워드 : <input type="text" value="${keyword}" id="keyword" size="15"> 
                <button type="submit">검색하기</button> 
            </p>
        </div>
        <hr>
		<!--UL=순서없는 목록 태그-->
        <ul id="placesList"></ul>
        <div id="pagination"></div>
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


</script>