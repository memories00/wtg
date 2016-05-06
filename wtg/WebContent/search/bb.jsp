	<%@ page language="java" contentType="text/html; charset=EUC-KR"
	    pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
	<!-- services ���̺귯�� �ҷ����� -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=724958f2e1f7b67c37acebb26e173723&libraries=services"></script>
	
	<!-- �������� -->
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	
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
// ��Ŀ�� ���� �迭�Դϴ�
var markers = [];
                        
// array for searchResult
var searchResult = [];
                        
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
			   	mapOption = {
			    center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
			    level: 3 // ������ Ȯ�� ����
				};  

			// ������ �����մϴ�    
			var map = new daum.maps.Map(mapContainer, mapOption); 
// ��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places();  
// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// Ű����� ��Ҹ� �˻��մϴ�
searchPlaces();
                        
   // Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
   function searchPlaces() {
   		var keyword = document.getElementById('keyword').value;	
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('Ű���带 �Է����ּ���!');
        return false;
        }
       // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
       // [API�޼ҵ�]keywordSearch(keyword, callback, options) (�˻�Ű����,����� ���� �ݹ��Լ�,�ɼ�)
       // keyword�� �˻��ϸ� placesSearchCB�� �Լ����·� ����� �޴´�.
       ps.keywordSearch(keyword, placesSearchCB); 
   }

   // ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
   function placesSearchCB(status, data, pagination) {
   		//[API.���̺귯��]daum.maps.services.Status.OK=�˻���� ����.
        if (status === daum.maps.services.Status.OK) {
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
    function displayPlaces(places) {
        //�� ���������� id���� placesList�� ��Ҹ� ������ listEl������ �ְڴ�.
		var listEl = document.getElementById('placesList'),  
    		menuEl = document.getElementById('menu_wrap'),
    		fragment = document.createDocumentFragment(), 
        //��ǥ���� �簢���� ������ ǥ���ϴ� ��ü�� �����Ѵ�.
			bounds = new daum.maps.LatLngBounds(), 
    		listStr = '';
        //���� �˻��� ��� ����� �����մϴ�
            removeAllChildNods(listEl);
        //���� �˻��� ��Ŀ�� �����մϴ�	
            removeMarker();

		for ( var i=0; i<places.length; i++ ) {
        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
        	var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i),
            //�÷��̽��� �ǵ�� ��ϸ��� �������� ���Ѵ�.
            itemEl = getListItem(i, places[i], marker); // �˻� ��� �׸� Element�� �����մϴ�

            // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
            // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
            bounds.extend(placePosition);

           	// ��Ŀ�� �˻���� �׸� mouseover ������
            // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
            // mouseout ���� ���� ���������츦 �ݽ��ϴ�
            (function(marker, title) {
                daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
              	});
                                                			
           		daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
                });

                itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                infowindow.close();
                };
                })(marker, places[i].title);

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

//��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, idx, title) {
var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
    imageSize = new daum.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
    imgOptions =  {
        spriteSize : new daum.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
        spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
        offset: new daum.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
    },
    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new daum.maps.Marker({
        position: position, // ��Ŀ�� ��ġ
        image: markerImage 
    });

marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

return marker;
}

//���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
for ( var i = 0; i < markers.length; i++ ) {
    markers[i].setMap(null);
}   
markers = [];
}

//�˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
function displayPagination(pagination) {
var paginationEl = document.getElementById('pagination'),
    fragment = document.createDocumentFragment(),
    i; 

// ������ �߰��� ��������ȣ�� �����մϴ�
while (paginationEl.hasChildNodes()) {
    paginationEl.removeChild (paginationEl.lastChild);
}

for (i=1; i<=pagination.last; i++) {
    var el = document.createElement('a');
    el.href = "#";
    el.innerHTML = i;

    if (i===pagination.current) {
        el.className = 'on';
    } else {
        el.onclick = (function(i) {
            return function() {
                pagination.gotoPage(i);
            }
        })(i);
    }

    fragment.appendChild(el);
}
paginationEl.appendChild(fragment);
}

//�˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
//���������쿡 ��Ҹ��� ǥ���մϴ�
function displayInfowindow(marker, title) {
var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

infowindow.setContent(content);
infowindow.open(map, marker);
}

// �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
function removeAllChildNods(el) {   
while (el.hasChildNodes()) {
    el.removeChild (el.lastChild);
}
}
</script>							
    														
    									