<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- services ���̺귯�� �ҷ����� -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=724958f2e1f7b67c37acebb26e173723&libraries=services"></script>
<!-- ajax -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- �������� -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:200px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
	       <form onsubmit="searchPlaces(); return false;">
		                Ű���� : <input type="text" value="${keyword}" id="keyword" size="15"> 
		       <input type="submit" value="�˻��ϱ�"/>
	       </form>
        </div>
        
        <hr> 
        
		<div id="location">
			���������� ��� <br/>
			<input type="button" id="go" value="Ȯ��"/> <br/>
		</div>	
        <div id="placesList"></div>   
    </div>
</div>

<script>
	$('#go').click(function(){
		$.ajax({
			url:'insertLocation.nhn?start=1&pass=2&end=3',
			type:'post',
			success:function(data){
				$('#location').append(data);
			}
		})
	})
</script>

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
	     if (status === daum.maps.services.Status.OK) {							//alert("�˻��Ϸ� �ݹ�");
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

    // �˻� ��� ����� ǥ���ϴ� �Լ��Դϴ�
    function displayPlaces(places) {											//alert("display���� �����µ�");								
        //�� ���������� id���� placesList�� ��Ҹ� ������ listEl������ �ְڴ�.
		var listEl = document.getElementById('placesList'),  
    		menuEl = document.getElementById('menu_wrap'),
    		fragment = document.createDocumentFragment(), 					
			bounds = new daum.maps.LatLngBounds(), 	//��ǥ���� �簢���� ������ ǥ���ϴ� ��ü�� �����Ѵ�.					
    		listStr = '';
	
    	for ( var i=0; i<places.length; i++ ) { 
    		
    		//������ ���������� �����ߴ�.
    		placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude);
            //�÷��̽��� �ǵ�� ��ϸ��� �������� ����.
            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�		
            // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
            // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
            bounds.extend(placePosition);            							//alert("��ǥ�缳�� �ƴ��� Ȯ��"+places[i].latitude);	
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
           '<h5>' + places.title + '</h5>';
	           if (places.newAddress) { //���θ��ּ��̸�
	               itemStr += '   <span>' + places.newAddress + '</span>' +
	                          '   <span class="jibun gray">' +  places.address  + '</span>'; 	
	           } else { //�����ּ��̸�
	             itemStr += '    <span>' +  places.address  + '</span>'; 
	           }
       	itemStr += '  <span class="tel">' + places.phone  + '</span>' + '</div>';           
		itemStr += '  <span class="x">' + places.latitude  + '</span>' + '</div>'; 
        itemStr += '  <span class="y">' + places.longitude  + '</span>' + '</div>'; 
 
        el.innerHTML = itemStr;
        el.className = 'item';
		
        return el;
     }  


</script>

