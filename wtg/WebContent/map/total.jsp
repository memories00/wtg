<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>���� �����ϱ�</title>
    
</head>
<body>
<!-- ������ ǥ���� div �Դϴ� -->
<div id="map" style="width:900px;height:600px;"></div>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>
<script>
var allTitle=new Array();
var j=0;
var marker;
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new daum.maps.LatLng( 37.491412,127.061642),        // ������ �߽���ǥ
        level: 4 // ������ Ȯ�� ����
    };
// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
var map = new daum.maps.Map(mapContainer, mapOption); 
// ��� �˻� ��ü�� �����մϴ�


function a() //�Է¹�ư Ŭ���� ����
	{ 
		var markerPosition  = new daum.maps.LatLng(xpoint.value, ypoint.value);  //�Է�â�� x,y���� �־��ش�

		// ��Ŀ�� �����մϴ� 
		displayMarker(markerPosition)	;
	    marker.setMap(map);
		var infowindow = new daum.maps.InfoWindow({
		    map: map, // ���������찡 ǥ�õ� ����
		    position : markerPosition, //��ġ
		    clickable: true,
		    content : xy.value,//�Է�â���� �Է��Ѱ�
		    removable : true//â�� x�����ư
		});
	    // ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
	    // ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
	    map.panTo(markerPosition);    //ȭ���� ��Ŀ�� ������������ �̵�      
	    searchSub(markerPosition); 
	}

//������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function distanceSum(place)
{
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
	distance=distance+"/"+place.latitude+"/"+place.longitude+"/"+place.title;
	return distance;
}

function b()
{
	var center=new daum.maps.LatLng( 37.491412,127.061642)
	 map.panTo(center);    //ȭ���� ��Ŀ�� ������������ �̵�     
} 



daum.maps.event.addListener(map, 'click', function(mouseEvent) 
{        
	 displayMarker(mouseEvent.latLng);
	 marker.setMap(map)	
	 map.panTo(mouseEvent.latLng);    //ȭ���� ��Ŀ�� ������������ �̵�  
	 searchSub(mouseEvent.latLng);		//������ġ���� ����� ����ö�� �˻�
    
});

function displayMarker(location)
{
	    marker = new daum.maps.Marker({ 
	    position: location,     //��Ŀ�� ��ġ�� �Է��Ѱ�
	}); 
	
}

function searchSub(position)
{
	map.setCenter(position);
	var ps = new daum.maps.services.Places(map); 
	
    // ī�װ��� ����ö �˻��մϴ�
    ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
    var arr=new Array();
    var strArr=new Array();
    // Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
    function placesSearchCB (status, data, pagination) {
    	//alert(status);
        if (status === daum.maps.services.Status.OK) {
        	//alert("3");	
            for (var i=0; i<data.places.length; i++) {
            	//alert("4");	
            	var a=distanceSum(data.places[i]);     //��Ŀ�� ��� 
            	
            	arr[i]=a; 
            	 
            	var str=a.split('/');
            	strArr[i]=str[0]; 
            	//alert(str[0]);
            }       
           strArr.sort(function(a,b){
        	   return a-b;
        		   });
         	for(var i=0;i<arr.length;i++)
         		{
         			var b=arr[i];
            		var str=b.split('/');
         			
         			if(strArr[0]==str[0])
         				{      					
         					var strLnt=str[1];
         					var strLng=str[2];
         					var strTitle=str[3];
         					
         					allTitle[j++]=str[3];
         					
         					
         					var markerPosition  = new daum.maps.LatLng(strLnt, strLng);

         					displayMarker(markerPosition);
         					//marker.setMap(map); //��Ŀ������
         					var infowindow = new daum.maps.InfoWindow({
     							 map: map,  // ���������찡 ǥ�õ� ����
      							 position : markerPosition, 
      							clickable: true,
       							 content : strTitle,
      						 	 removable : true
  								 });
         					   // map.panTo(markerPosition);    //ȭ���� ��Ŀ�� ������������ �̵�     	 		    	  	 		    
        	       	 		
         				}         		
         		}
        }
    }
	
}

</script>

 	   <input type="text" name="xy" value="�츮��"> 
                 <input type="text" name="xpoint"  value=37.49822162439627> 
                 <input type="text" name="ypoint" value="127.03105819665858" > 
                 <input type="button" value="�Է�" onclick="a()">   
                 <input type="button" value="�����̵�" onclick="b()">
                 <input type="button" value="����ö����" onclick="callAjax()">  <br/>
                 ��ġ  37.494612 127.063642  <br/> 
                 ������ 37.515504 126.907628  <br/> 
                 ���� 37.554648 126.972559  <br/> 
                 �Ÿ� 37.484201 126.929715  <br/>   
 </body> 
 </html>    