<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="map" style="width:1900px;height:700px;"></div> 
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06fa7b42a2af7b8c46c9ca9a71d40206&libraries=services,clusterer"></script> 
<script> 
	var container = document.getElementById('map'); 
 		var options = { 
 			center: new daum.maps.LatLng(37.515504, 126.907628), 
 			level: 3 
 		}; 
 		
  
 		var map = new daum.maps.Map(container, options); 
 		
 		var marker = new daum.maps.Marker({ 
			    position: map.getCenter() //마커의 위치는 입력한곳
			});
 		marker.setMap(map);
 		
 		daum.maps.event.addListener(marker, 'click', function(mouseEvent) 
 		{ 
 			marker.setMap(null);
 		});
 		daum.maps.event.addListener(map, 'click', function(mouseEvent) 
 		 { 
 			marker.setMap(map);
 		 });
 		
 </script> 
 	 