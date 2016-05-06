<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- services ���̺귯�� �ҷ����� -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=724958f2e1f7b67c37acebb26e173723&libraries=services"></script>

<!-- �������� -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:200px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <p>
                <form onsubmit="searchPlaces(); return false;">
                Ű���� : <input type="text" value="${keyword}" id="keyword" size="15"> 
                <button type="submit">�˻��ϱ�</button> 
            </p>
        </div>
        <hr>
		<!--UL=�������� ��� �±�-->
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
   	mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
    level: 3 // ������ Ȯ�� ����
	};  
	
//������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 


</script>