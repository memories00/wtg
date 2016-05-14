<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>�ڽ� ����ϱ�</title>
		<style>
			map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:300px;margin:10px 0 30px 80%;padding:5px;overflow-x:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px; }
			.bg_white {background:#fff;}
			#menu_wrap hr {display: block; height: 1px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
		</style>
		<form onsubmit="searchPlaces(); return false;">
		�˻��� : <input type="text" value="���¿� ����" style="width:150px; height:25px"id="keyword" size="15"> 
                <button type="submit" style="width:60px;height:25px;">�˻��ϱ�</button> 
                
		<div class="map_wrap">
    <div id="map" style="width:100%; height:900px;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white" >
        <div class="option">
            <p>
                
            </p>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
  			<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script> 
				<script> 	
					var container = document.getElementById('map'); //div id=map�ڸ��� ����������
 					var options = { 
 												center: new daum.maps.LatLng(37.515504, 126.907628), 
 												level: 7
 											  };  		  
 					var map = new daum.maps.Map(container, options); 
 					var marker=new daum.maps.Marker({
 						position:map.getCenter()
 					});
 					
 					daum.maps.event.addListener(map, 'click', function(mouseEvent)//���콺 Ŭ���̺�Ʈ 
 					 		 {  		
 								marker.setPosition(mouseEvent.latLng);
 								marker.setMap(map);
 								marker.get
 					 		 });
 					var ps = new daum.maps.services.Places();
 					// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
 					function searchPlaces() {												
 						var keyword = document.getElementById('keyword').value;	
 					    if (!keyword.replace(/^\s+|\s+$/g, '')) {
 					     alert('Ű���带 �Է����ּ���!');
 					    return false;
 					    }
 					    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
 					    // keywordSearch(keyword, callback, options) (�˻�Ű����,����� ���� �ݹ��Լ�,�ɼ�)
 					    // keyword�� �˻��ϸ� placesSearchCB�� �Լ����·� ����� �޴´�.
 					    ps.keywordSearch(keyword, placesSearchCB); 							
 					}
 					
 				// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
 					function placesSearchCB(status, data, pagination) {	
 							//daum.maps.services.Status.OK=�˻���� ����.

 					     if (status === daum.maps.services.Status.OK) {						
 					        // ���������� �˻��� �Ϸ������
 					        // �˻� ����� ǥ���մϴ�
 					        displayPlaces(data.places);
 					        // ������ ��ȣ�� ǥ���մϴ�
 					    	} else if (status === daum.maps.services.Status.ZERO_RESULT) {
 					       	alert('�˻� ����� �������� �ʽ��ϴ�.');
 					      	return;
 					     } 
 					 }
 				
 				    function displayPlaces(places) {
 				        //�� ���������� id���� placesList�� ��Ҹ� ������ listEl������ �ְڴ�.
 						var listEl = document.getElementById('placesList'),  
 				    		menuEl = document.getElementById('menu_wrap'),
 				    		fragment = document.createDocumentFragment(), 					
 							bounds = new daum.maps.LatLngBounds(), 	//��ǥ���� �簢���� ������ ǥ���ϴ� ��ü�� �����Ѵ�.					
 				    		listStr = '';
 				        //���� �˻������ �����.
 						removeAllChildNods(listEl);

 				    	for ( var i=0; i<places.length; i++ ) { 
 				    		placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude);
 				            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�		
 				            // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
 				            // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
 				            bounds.extend(placePosition);  
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
 				    var title = places.title;
 				    var x = places.latitude;
 				    var y = places.longitude;
 				    
 					var el = document.createElement('li');
 					var itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
 				           '<div class="info" id="'+title+"-"+x+"-"+y+'" onmouseover="openinfo(this)" onmouseout="closeinfo()">' +                                      
 				           '<h5>' + places.title + '</h5>';
 					           if (places.newAddress) { //���θ��ּ��̸�
 					               itemStr += '<span>' + places.newAddress + '</span>' +
 					                          '<span class="jibun gray">' +  places.address  + '</span>'; 	
 					           } else { //�����ּ��̸�
 					             itemStr += '<span>' +  places.address  + '</span>'; 
 					           }
 				       	itemStr += '<span class="tel">' + places.phone  + '</span>' + '</div>'; 
 				
 					var button = "<input type='button' value='�����ϱ�' id='"+title+"-"+x+"-"+y+"' onclick='choice(this);'>";
 					
 				    el.innerHTML = itemStr+button;
 				    el.className = 'item';
 				    
 				    return el;  
 				    
 				}  

 			 	//�����ϱ� Ŭ���� ��Ŀ�� ������ �����ݴϴ�
 			    function choice(bt){
 			    	var a = bt.getAttribute('id');
 			    	var strArray=a.split('-');
 			    	var markerPosition  = new daum.maps.LatLng(strArray[1], strArray[2]);
 					// ��Ŀ ����
 					marker.setPosition(markerPosition);
 					// ��Ŀ ���� ���� ǥ��
 					marker.setMap(map);
 					//�������� 3���� ����
 					map.setLevel(3);
 					//��Ŀ�� �ε巴�� �̵��̵�
 					map.panTo(markerPosition); 
 					
 			    } 
 			   
 			 	//�������Ʈ�� ���콺�����ÿ� ���������� ǥ��
 			 	function openinfo(op) {
 			 		var b = op.getAttribute('id');	
 			 		var strArray = b.split('-');
 			 		
 			 		var infoPosition=new daum.maps.LatLng(strArray[1], strArray[2])
 			 		    infowindow = new daum.maps.InfoWindow({
 			 			position: infoPosition,
 			 			content: strArray[0]
 			 		});
 			 		 
 			  		infowindow.open(map); 
 			  		map.panTo(infoPosition);
 			 	}
 			 	
 			 	function closeinfo() {
 					infowindow.close();
 			 	}
 			 	
 			 	
 			    // ���� �˻� ����� ����� �Լ�
 			    function removeAllChildNods(el) {   
 			        while (el.hasChildNodes()) {
 			            el.removeChild (el.lastChild);
 			        }
 			    }
 					
 					
 					
 					
 				</script>
</head>
	<body>

	</body>
</html>