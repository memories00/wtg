<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 <head> 
<meta charset="utf-8"/> 
<title>Daum ���� �����ϱ�</title> 
</head> 
 <body> 
<div id="map" style="width:500px;height:400px;"></div> 
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06fa7b42a2af7b8c46c9ca9a71d40206"></script> 
<script> 
	var container = document.getElementById('map'); 
 		var options = { 
 			center: new daum.maps.LatLng(37.515504, 126.907628), 
 			level: 3 
 		}; 
  
 		var map = new daum.maps.Map(container, options); 
 		 
 		function a() //�Է¹�ư Ŭ���� ����
 		{ 
 			var markerPosition  = new daum.maps.LatLng(xpoint.value, ypoint.value);  //�Է�â�� x,y���� �־��ش�
 	 
 			// ��Ŀ�� �����մϴ� 
 			var marker = new daum.maps.Marker({ 
 			    position: markerPosition //��Ŀ�� ��ġ�� �Է��Ѱ�
 			}); 
 			 		
 			var infowindow = new daum.maps.InfoWindow({
 			    map: map, // ���������찡 ǥ�õ� ����
 			    position : markerPosition, //��ġ
 			    content : xy.value,//�Է�â���� �Է��Ѱ�
 			    removable : true//â�� x�����ư
 			});
 			
 			marker.setMap(map); //��Ŀ������

 		    // ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
 		    // ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
 		    map.panTo(markerPosition);    //ȭ���� ��Ŀ�� ������������ �̵�        
 		} 
 		

 	</script> 
 	 
 	   <input type="text" name="xy" value="�츮��"> 
                 <input type="text" name="xpoint"  value="37.494612"> 
                 <input type="text" name="ypoint" value="127.063642" > 
                 <input type="button" value="�Է�" onclick="a()">   
                 <input type="button" value="xml" onclick="b()"><br/> 
                 ��ġ  37.494612 127.063642  <br/> 
                 ������ 37.515504 126.907628  <br/> 
                 ���� 37.554648 126.972559  <br/> 
                 �Ÿ� 37.484201 126.929715  <br/> 
                  
                 <a href ="http://swopenAPI.seoul.go.kr/api/subway/64676e63666573633733436c6b646b/xml/nearBy/1/5/37.5010226/127.0396037/">dd</a>  
 </body> 
 </html>    
