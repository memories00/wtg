<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 <html>
<head>
    <meta charset="utf-8">
    <title>ī�װ��� ��� �˻��ϱ�</title>
    
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="../../documentation/#CategoryCode" target="_blank">ī�װ� �ڵ����� ���÷��� ���⸦ Ŭ���ϼ���!</a>
    </em>
</p>
<div id="map" style="width:1200px;height:800px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06fa7b42a2af7b8c46c9ca9a71d40206&libraries=services"></script>
<script>
// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(37.491412,127.061642), // ������ �߽���ǥ
        level: 4// ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 

var marker1= new daum.maps.Marker({ 
		    position: map.getCenter() //��Ŀ�� ��ġ�� �Է��Ѱ�
		}); 
	   // map.panTo(markerPosition);    //ȭ���� ��Ŀ�� ������������ �̵�     	 		    	  	 		    
		marker1.setMap(map); //��Ŀ������


// ��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places(map); 

// ī�װ��� ������ �˻��մϴ�
ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
var arr=new Array();
var strArr=new Array();
// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB (status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {
        for (var i=0; i<data.places.length; i++) {
          	
        	var a=distanceSum(data.places[i]);     //��Ŀ�� ��� 
        	
        	arr[i]=a; 
        	 //alert(arr[i]);
        	var str=a.split('/');
        	strArr[i]=str[0]; 
        	//alert(str[0]);
        }       
       strArr.sort(function(a,b){
    	   return a-b;
    		   });
      		//alert(arr.length);
      		//alert(strArr[0]);
     	for(var i=0;i<arr.length;i++)
     		{
     			//alert(strArr[0]);
     			var b=arr[i];
     			//alert(b);
        		var str=b.split('/');
     			//alert("dd");
     			
     			if(strArr[0]==str[0])
     				{
     					
     					var strLnt=str[1];
     					var strLng=str[2];
     					
     					
     					var markerPosition  = new daum.maps.LatLng(strLnt, strLng);
     					var marker = new daum.maps.Marker({ 
     	   	 			    position: markerPosition //��Ŀ�� ��ġ�� �Է��Ѱ�
     	   	 			}); 
     					   // map.panTo(markerPosition);    //ȭ���� ��Ŀ�� ������������ �̵�     	 		    	  	 		    
     	       	 		marker.setMap(map); //��Ŀ������
     				}
     		 
     		
     		}
    }
}


// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function distanceSum(place) {
    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
    var distance;
    var dis=new  daum.maps.LatLng(place.latitude, place.longitude);
    
    clickLine = new daum.maps.Polyline({
        map: map, // ���� ǥ���� �����Դϴ� 
        path: [map.getCenter()], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
        strokeWeight: 0, // ���� �β��Դϴ� 
        strokeColor: '#db4040', // ���� �����Դϴ�
        strokeOpacity: 0, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
        strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
    });
    
    var path = clickLine.getPath();

    // ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
    path.push(dis);
    clickLine.setPath(path);
    distance = Math.round(clickLine.getLength());
    alert(place.title);
    distance=distance+"/"+place.latitude+"/"+place.longitude;
    return distance;
}


</script>
</body>
</html>
