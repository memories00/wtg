<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- services ���̺귯�� �ҷ����� -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>

<!-- ajax -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- �������� -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
        </div>
        
        <hr> 
		
        <div id="type">
        	<input type="button" id="12" value="������" onclick="contentType(this)"/>
        	<input type="button" id="14" value="��ȭ�ü�" onclick="contentType(this)"/>
        	<input type="button" id="28" value="������" onclick="contentType(this)"/>
        	<input type="button" id="32" value="����" onclick="contentType(this)"/>
    		<input type="button" id="38" value="����" onclick="contentType(this)"/>
    		<input type="button" id="39" value="������" onclick="contentType(this)"/>
        </div>   
    </div>
</div>

<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
   	mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
    level: 5 // ������ Ȯ�� ����
	};  
//������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 
//��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places();  
//������ �缳���� ���������� ������ ��ü�� �����մϴ�.
//var bounds = new daum.maps.LatLngBounds();
//��Ŀ�� ���� �迭�� �����մϴ�.
var markers=[];
//�Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
var mapTypeControl = new daum.maps.MapTypeControl();
// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
// daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//������ Ÿ���� �����͸� ��û�մϴ�.
function contentType(type) {
	hideMarkers();	//������ ��Ŀ�� ����ϴ�.
	var t = type.getAttribute('id');
		$.ajax({
	        url:"/wtg/typeSearch.nhn",
	        data: {
	        	typeId : t
	        },
	        success : cut
	    });
	}
	
//��Ҹ�/x��ǥ/y��ǥ�� �и��մϴ�.
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

//��Ŀ�� �߰��ϰ� �ʿ� ǥ���մϴ�.
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

//��Ŀ�� ����ϴ�
function hideMarkers(map)
	{
		for (var i=0; i<markers.length; i++)
			{
			markers[i].setMap(null);
			}
	}
</script>


