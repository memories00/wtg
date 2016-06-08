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
		    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 13px;font-weight: bold;}
		    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		    .info .close:hover {cursor: pointer;}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
			    .desc .address {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
			    .desc .detail address {font-size: 11px;color: #888;margin-top: -2px;}
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
    <div id="map" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
        </div>
        <hr> 
        <div id="type">
        	<input type="button" id="12" value="������" onclick="categoryType(this)"/>
        	<input type="button" id="14" value="��ȭ�ü�" onclick="categoryType(this)"/>
        	<input type="button" id="28" value="������" onclick="categoryType(this)"/>
        	<input type="button" id="32" value="����" onclick="categoryType(this)"/>
    		<input type="button" id="38" value="����" onclick="categoryType(this)"/>
    		<input type="button" id="39" value="������" onclick="categoryType(this)"/>
        </div>   
    </div>
</div>


<script>
var mapContainer = document.getElementById('map'), 			// ������ ǥ���� div 
   	mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), 	// ������ �߽���ǥ
    level: 4 												// ������ Ȯ�� ����  
	};  
var map = new daum.maps.Map(mapContainer, mapOption); 		//������ �����մϴ�    
var ps = new daum.maps.services.Places();  					//��� �˻� ��ü�� �����մϴ�
var markers=[];												//��Ŀ�� ���� �迭�� �����մϴ�.
var mapTypeControl = new daum.maps.MapTypeControl();		//�Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
var zoomControl = new daum.maps.ZoomControl();				//���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
var name, x, y, addr1, addr2, img, tel;
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	// ������ Ÿ�� ��Ʈ���� �߰��մϴ�
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);		// ������ �� ��Ʈ���� �߰��մϴ�

//������ ī�װ��� �����͸� ��û�մϴ�.
function categoryType(a) {
	hideMarkers();								//�̹� ������ ��Ŀ�� ����ϴ�.
//	closeOverlay();
	var t = a.getAttribute('id');				//��ư�� id���� �����ɴϴ�
		$.ajax({
	        url:"/wtg/typeSearch.nhn",
	        data: {
	        	typeId : t
	        },
	        success : cut						//���������� ����ÿ� ȣ��Ǵ� �Լ��Դϴ�.
	    });
	}

var cnt=0;
// �Ľ̵� �����͸� �и��մϴ�.
function cut(info) {
	var line=info.split('^^');					//�����͸� ���κ��� �ڸ��ϴ�.
		for(var i=0; i<line.length-1; i++)
		{
			cnt++;
			var el = line[i].split("--");		
				name = el[0];					//��Ҹ��� �и��մϴ�.
				x = el[2];						//x��ǥ�� �и��մϴ�.
				y = el[1];						//y��ǥ�� �и��մϴ�.
				addr1 = el[3];					//�ּҸ� �и��մϴ�.
				addr2 = el[4];					//���ּҸ� �и��մϴ�.
				img = el[5];					//�̹��� �ּҸ� �и��մϴ�.
				tel = el[6];					//��ȭ��ȣ�� �и��մϴ�.
			addMarker(new daum.maps.LatLng(x,y),cnt);	
 		}
		//alert(map.getBounds());
	}
	
var overInfo=new Array();
//��Ŀ�� �����ϰ� ������ ǥ���մϴ�
function addMarker(xy,cnt) {
	var marker = new daum.maps.Marker({			//��Ŀ�� �����մϴ�
		position: xy,
 		title: name
	});
	
	var content = '<div class="wrap">' + 		//������� �������̿� ǥ���� ������ �Դϴ�
	         '    <div class="info">' + 
	         '        <div class="title">' + name + 
	         '            <div class="close" id="'+cnt+'"onclick="closeOverlay(this)"  title="�ݱ�"></div>' + 
	         '        </div>' + 
	         '        <div class="body">' + 
	         '            <div class="img">' +
	         '                <img src="' + img + '" width="73" height="70">' +
	         '           </div>' + 
	         '            <div class="desc">' + 
	         '                <div class="address">' + addr1 + '</div>' + 
	         '                <div class="detail address">' + addr2 + '</div>' + 
	         '                <div>' + tel + '</div>' + 
	         '            </div>' + 
	         '        </div>' + 
	         '    </div>' +    
	         '</div>';   
	 var overlay = new daum.maps.CustomOverlay({					//������� �������̸� �����մϴ�.
		content: content,
 		position: marker.getPosition(),
  		clickable: true
	});
	overInfo[cnt]=overlay;
	marker.setMap(map);											//��Ŀ�� ������ ���ϴ� 
	markers.push(marker);										//��Ŀ�� �迭�� �ֽ��ϴ�
	daum.maps.event.addListener(marker, 'click', function()	{	//��Ŀ�� Ŭ������ �� �������̸� ǥ���մϴ�
		overlay.setMap(map);
	});

	
 }
 	
	//�������̸� �ݽ��ϴ�
	function closeOverlay(btnId) {		
		var check=btnId.getAttribute('id');		
		overInfo[check].setMap(null);
	}
 	


//ǥ�õ� ��� ��Ŀ�� ����ϴ�
function hideMarkers(map) {
	for (var i=0; i<markers.length; i++)
	{
		markers[i].setMap(null);	
	}
}

			

</script>


