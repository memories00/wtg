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
    level: 3 // ������ Ȯ�� ����
	};  
	
//������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 
//��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places();  
//��Ŀ�� �ű�ϴ�
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

<div id="ajaxReturn">test:�̰��� xy��ǥ</div>




