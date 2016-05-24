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
    level: 5 // 지도의 확대 레벨
	};  
//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
//지도를 재설정할 범위정보를 가지는 객체를 생성합니다.
//var bounds = new daum.maps.LatLngBounds();
//마커를 담을 배열을 생성합니다.
var markers=[];
//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();
// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//선택한 타입의 데이터를 요청합니다.
function contentType(type) {
	hideMarkers();	//생성된 마커를 지웁니다.
	var t = type.getAttribute('id');
		$.ajax({
	        url:"/wtg/typeSearch.nhn",
	        data: {
	        	typeId : t
	        },
	        success : cut
	    });
	}
	
//장소명/x좌표/y좌표로 분리합니다.
function cut(info) {
	var line=info.split('//');
		for(var i=0; i<line.length-1; i++)
		{
			var el = line[i].split("--");
			var name = el[0];
			var x = el[1];
			var y = el[2];
			addMarker(new daum.maps.LatLng(y,x), name);	
 		}
//		alert(map.getBounds());
		
	}

//마커를 추가하고 맵에 표시합니다.
function addMarker(yx, name) {
		var marker = new daum.maps.Marker({
	 		position: yx,
	 		title: name
		});
		
 		marker.setMap(map);
		markers.push(marker);	
//		bounds.extend(yx);
 //		map.setBounds(bounds);
 		
		var infowindow = new daum.maps.InfoWindow({
			content : name
		})
		
		daum.maps.event.addListener(marker, 'mouseover', function(){
			infowindow.open(map, marker);
		});
		
		daum.maps.event.addListener(marker, 'mouseout', function(){
			infowindow.close();
		})
	}

//마커를 숨깁니다
function hideMarkers(map)
	{
		for (var i=0; i<markers.length; i++)
			{
			markers[i].setMap(null);
			}
	}
</script>


