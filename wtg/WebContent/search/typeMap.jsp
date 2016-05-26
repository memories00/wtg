<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 11px;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 15px;font-weight: bold;}
		    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		    .info .close:hover {cursor: pointer;}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
			    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
			    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
		    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		    .info .link {color: #5085BB;}
</style>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>

<!-- ajax -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- 지도생성 -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:200px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
        </div>
        
        <hr> 
		
        <div id="type">
        	<input type="button" id="12" value="관광지12" onclick="contentType(this)"/>
        	<input type="button" id="14" value="문화시설14" onclick="contentType(this)"/>
        	<input type="button" id="28" value="레포츠28" onclick="contentType(this)"/>
        	<input type="button" id="32" value="숙박32" onclick="contentType(this)"/>
    		<input type="button" id="38" value="쇼핑38" onclick="contentType(this)"/>
    		<input type="button" id="39" value="음식점39" onclick="contentType(this)"/>
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
	alert("버튼");
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
	var line=info.split('^^');
		for(var i=0; i<line.length-1; i++)
		{
			var el = line[i].split("--");
			var name = el[0];
			var x = el[1];
			var y = el[2];
			alert("y주소"+y);
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
		
		//커스텀 오버레이에 표시할 컨텐츠 입니다
		var content = '<div class="wrap">' + 
		         '    <div class="info">' + 
		         '        <div class="title">' + 
		         					name + 
		         '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		         '        </div>' + 
		         '        <div class="body">' + 
		         '            <div class="img">' +
		         '                <img src="" width="73" height="70">' +
		         '           </div>' + 
		         '            <div class="desc">' + 
		         '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
		         '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
		         '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
		         '            </div>' + 
		         '        </div>' + 
		         '    </div>' +    
		         '</div>';
		
		daum.maps.event.addListener(marker, 'mouseover', function(){ //마우스오버시에 인포윈도우 열림
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
	
//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new daum.maps.CustomOverlay({
 content: content,
 map: map,
 position: marker.getPosition()       
});
	
//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
daum.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});

// 커스텀 오버레이를 닫습니다 
function closeOverlay() {
    overlay.setMap(null);     
}
</script>


