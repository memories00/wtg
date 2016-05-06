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
//��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places();  
//�˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new daum.maps.InfoWindow({zIndex:1});

//Ű����� ��Ҹ� �˻��մϴ�
searchPlaces();

	// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
	function searchPlaces() {												
			var keyword = document.getElementById('keyword').value;	
	     if (!keyword.replace(/^\s+|\s+$/g, '')) {
	     alert('Ű���带 �Է����ּ���!');
	     return false;
	     }
	    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
	    // [api]keywordSearch(keyword, callback, options) (�˻�Ű����,����� ���� �ݹ��Լ�,�ɼ�)
	    // keyword�� �˻��ϸ� placesSearchCB�� �Լ����·� ����� �޴´�.
	    ps.keywordSearch(keyword, placesSearchCB); 							
	}
	
	// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
	function placesSearchCB(status, data, pagination) {						
			//daum.maps.services.Status.OK=�˻���� ����.
	     if (status === daum.maps.services.Status.OK) {						alert("�˻��Ϸ� �ݹ�");
	        // ���������� �˻��� �Ϸ������
	        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
	        displayPlaces(data.places);
	        // ������ ��ȣ�� ǥ���մϴ�
	        displayPagination(pagination);
	    	} else if (status === daum.maps.services.Status.ZERO_RESULT) {
	       	alert('�˻� ����� �������� �ʽ��ϴ�.');
	      	return;
	     } 
	 }

    // �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
    function displayPlaces(places) {								alert("display���� �����µ�");								
        //�� ���������� id���� placesList�� ��Ҹ� ������ listEl������ �ְڴ�.
		var listEl = document.getElementById('placesList'),  
    		menuEl = document.getElementById('menu_wrap'),
    		fragment = document.createDocumentFragment(), 					
        //��ǥ���� �簢���� ������ ǥ���ϴ� ��ü�� �����Ѵ�.
			bounds = new daum.maps.LatLngBounds(), 						
    		listStr = '';											
	
    	for ( var i=0; i<places.length; i++ ) { 
    		
    		var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            //�÷��̽��� �ǵ�� ��ϸ��� �������� ����.
            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�		
            // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
            // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
            bounds.extend(placePosition);            														alert("��ǥ�缳�� �ƴ��� Ȯ��"+places[i].latitude);	

                fragment.appendChild(itemEl);
                }
                // �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
                listEl.appendChild(fragment);
                menuEl.scrollTop = 0;
                // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
               	map.setBounds(bounds);
    }
    
 	// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
    function getListItem(index, places) {
    	var el = document.createElement('li'),
       	itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
           '<div class="info">' +
           '   <h5>' + places.title + '</h5>';

           if (places.newAddress) {
               itemStr += '    <span>' + places.newAddress + '</span>' +
                          '   <span class="jibun gray">' +  places.address  + '</span>';
           } else {
               itemStr += '    <span>' +  places.address  + '</span>'; 
           }

               itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                  		   '</div>';           
				itemStr += '  <span class="x">' + places.latitude  + '</span>' +
                          '</div>'; 
               itemStr += '  <span class="y">' + places.longitude  + '</span>' +
                          '</div>'; 
               el.innerHTML = itemStr;
               el.className = 'item';

               return el;
     }  


</script>

