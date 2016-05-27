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
    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
        </div>
        <hr> 
        <div id="type">
        	<input type="button" id="12" value="관광지12" onclick="categoryType(this)"/>
        	<input type="button" id="14" value="문화시설14" onclick="categoryType(this)"/>
        	<input type="button" id="28" value="레포츠28" onclick="categoryType(this)"/>
        	<input type="button" id="32" value="숙박32" onclick="categoryType(this)"/>
    		<input type="button" id="38" value="쇼핑38" onclick="categoryType(this)"/>
    		<input type="button" id="39" value="음식점39" onclick="categoryType(this)"/>
        </div>   
    </div>
</div>


<script>
var mapContainer = document.getElementById('map'), 			// 지도를 표시할 div 
   	mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), 	// 지도의 중심좌표
    level: 5 												// 지도의 확대 레벨
	};  
var map = new daum.maps.Map(mapContainer, mapOption); 		//지도를 생성합니다   
var ps = new daum.maps.services.Places();  					//장소 검색 객체를 생성합니다
var markers=[], infos=[];									//마커와 정보를 담을 배열을 생성합니다.
var mapTypeControl = new daum.maps.MapTypeControl();		//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var name, x, y, addr1, addr2, img, tel;

map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	// 지도에 타입 컨트롤을 추가합니다
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);		// 지도에 줌 컨트롤을 추가합니다


//선택한 카테고리의 데이터를 요청합니다.
function categoryType(a) {
	hideMarkers();	//이미 생성된 마커를 지웁니다.
	var t = a.getAttribute('id');
		$.ajax({
	        url:"/wtg/typeSearch.nhn",
	        data: {
	        	typeId : t
	        },
	        success : cut
	    });
	}

	
// 파싱된 데이터를 분리합니다.
function cut(info) {
	var line=info.split('^^');
		for(var i=0; i<line.length-1; i++)
		{
			var el = line[i].split("--");
				name = el[0];
				x = el[2];
				y = el[1];
				addr1 = el[3];
				addr2 = el[4];
				img = el[5];
				tel = el[6];
			addMarker(new daum.maps.LatLng(x,y));	
 		}
		//alert(map.getBounds());
	}

//마커를 생성하고 지도에 표시합니다
function addMarker(xy) {
		//마커를 생성합니다
		var marker = new daum.maps.Marker({
	 		position: xy,
	 		title: name
		});
		
 		marker.setMap(map);		//마커를 지도에 띄웁니다
		markers.push(marker);	//마커를 배열에 넣습니다	
 		
		//마커에 띄울 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			content : name
		})
		
		//마커에 마우스를 올리면 인포윈도우가 생성되는 이벤트를 추가합니다
		daum.maps.event.addListener(marker, 'mouseover', function()
			{ 
// 				var a = marker.getPosition().getLat();
// 				var b = marker.getPosition().getLng();
// 				a = Number(a);
// 				b = Number(b);
// 				//인포윈도우의 위치를 마커 옆으로 조정합니다
// 				a += 0.0001;	
// 				b += 0.0043;
// 				position = new daum.maps.LatLng(a,b);
// 				//인포윈도우 생성
// 				infowindow.setPosition(position);
				//인포윈도우 표시
				alert(name+"\\"+addr1+"\\"+addr2+"\\"+img+"\\"+tel);
				infowindow.open(map, marker);
			});
		
		//마우스가 마커 밖으로 나갔을 때 인포윈도우가 닫히는 이벤트를 추가합니다.
		daum.maps.event.addListener(marker, 'mouseout', function()
			{
				infowindow.close();
			})
	}

//표시된 모든 마커를 숨깁니다
function hideMarkers(map)
	{
		for (var i=0; i<markers.length; i++)
		{
			markers[i].setMap(null);	
		}
	}
	
	
//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
// var overlay = new daum.maps.CustomOverlay({
//  content: content,
//  map: map,
//  position: marker.getPosition()       
// });
	
//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
// daum.maps.event.addListener(marker, 'click', function() {
//     overlay.setMap(map);
// });

// 커스텀 오버레이를 닫습니다 
// function closeOverlay() {
//     overlay.setMap(null);     
// }
</script>


