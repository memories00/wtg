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
        	<input type="button" id="12" value="������12" onclick="categoryType(this)"/>
        	<input type="button" id="14" value="��ȭ�ü�14" onclick="categoryType(this)"/>
        	<input type="button" id="28" value="������28" onclick="categoryType(this)"/>
        	<input type="button" id="32" value="����32" onclick="categoryType(this)"/>
    		<input type="button" id="38" value="����38" onclick="categoryType(this)"/>
    		<input type="button" id="39" value="������39" onclick="categoryType(this)"/>
        </div>   
    </div>
</div>


<script>
var mapContainer = document.getElementById('map'), 			// ������ ǥ���� div 
   	mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), 	// ������ �߽���ǥ
    level: 5 												// ������ Ȯ�� ����
	};  
var map = new daum.maps.Map(mapContainer, mapOption); 		//������ �����մϴ�   
var ps = new daum.maps.services.Places();  					//��� �˻� ��ü�� �����մϴ�
var markers=[], infos=[];									//��Ŀ�� ������ ���� �迭�� �����մϴ�.
var mapTypeControl = new daum.maps.MapTypeControl();		//�Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
var zoomControl = new daum.maps.ZoomControl();				// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
var name, x, y, addr1, addr2, img, tel;

map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	// ������ Ÿ�� ��Ʈ���� �߰��մϴ�
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);		// ������ �� ��Ʈ���� �߰��մϴ�


//������ ī�װ��� �����͸� ��û�մϴ�.
function categoryType(a) {
	hideMarkers();	//�̹� ������ ��Ŀ�� ����ϴ�.
	var t = a.getAttribute('id');
		$.ajax({
	        url:"/wtg/typeSearch.nhn",
	        data: {
	        	typeId : t
	        },
	        success : cut
	    });
	}

	
// �Ľ̵� �����͸� �и��մϴ�.
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

//��Ŀ�� �����ϰ� ������ ǥ���մϴ�
function addMarker(xy) {
		//��Ŀ�� �����մϴ�
		var marker = new daum.maps.Marker({
	 		position: xy,
	 		title: name
		});
		
 		marker.setMap(map);		//��Ŀ�� ������ ���ϴ�
		markers.push(marker);	//��Ŀ�� �迭�� �ֽ��ϴ�	
 		
		//��Ŀ�� ��� ���������츦 �����մϴ�
		var infowindow = new daum.maps.InfoWindow({
			content : name
		})
		
		//��Ŀ�� ���콺�� �ø��� ���������찡 �����Ǵ� �̺�Ʈ�� �߰��մϴ�
		daum.maps.event.addListener(marker, 'mouseover', function()
			{ 
// 				var a = marker.getPosition().getLat();
// 				var b = marker.getPosition().getLng();
// 				a = Number(a);
// 				b = Number(b);
// 				//������������ ��ġ�� ��Ŀ ������ �����մϴ�
// 				a += 0.0001;	
// 				b += 0.0043;
// 				position = new daum.maps.LatLng(a,b);
// 				//���������� ����
// 				infowindow.setPosition(position);
				//���������� ǥ��
				alert(name+"\\"+addr1+"\\"+addr2+"\\"+img+"\\"+tel);
				infowindow.open(map, marker);
			});
		
		//���콺�� ��Ŀ ������ ������ �� ���������찡 ������ �̺�Ʈ�� �߰��մϴ�.
		daum.maps.event.addListener(marker, 'mouseout', function()
			{
				infowindow.close();
			})
	}

//ǥ�õ� ��� ��Ŀ�� ����ϴ�
function hideMarkers(map)
	{
		for (var i=0; i<markers.length; i++)
		{
			markers[i].setMap(null);	
		}
	}
	
	
//��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
//��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
// var overlay = new daum.maps.CustomOverlay({
//  content: content,
//  map: map,
//  position: marker.getPosition()       
// });
	
//��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
// daum.maps.event.addListener(marker, 'click', function() {
//     overlay.setMap(map);
// });

// Ŀ���� �������̸� �ݽ��ϴ� 
// function closeOverlay() {
//     overlay.setMap(null);     
// }
</script>


