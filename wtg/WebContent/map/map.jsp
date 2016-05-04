<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 <head> 
<meta charset="utf-8"/> 
<title>Daum 지도 시작하기</title> 
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
 		 
 		function a() //입력버튼 클릭시 실행
 		{ 
 			var markerPosition  = new daum.maps.LatLng(xpoint.value, ypoint.value);  //입력창의 x,y값을 넣어준다
 	 
 			// 마커를 생성합니다 
 			var marker = new daum.maps.Marker({ 
 			    position: markerPosition //마커의 위치는 입력한곳
 			}); 
 			 		
 			var infowindow = new daum.maps.InfoWindow({
 			    map: map, // 인포윈도우가 표시될 지도
 			    position : markerPosition, //위치
 			    content : xy.value,//입력창에서 입력한값
 			    removable : true//창의 x종료버튼
 			});
 			
 			marker.setMap(map); //마커를띄운다

 		    // 지도 중심을 부드럽게 이동시킵니다
 		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
 		    map.panTo(markerPosition);    //화면이 마커를 선택한쪽으로 이동        
 		} 
 		

 	</script> 
 	 
 	   <input type="text" name="xy" value="우리집"> 
                 <input type="text" name="xpoint"  value="37.494612"> 
                 <input type="text" name="ypoint" value="127.063642" > 
                 <input type="button" value="입력" onclick="a()">   
                 <input type="button" value="xml" onclick="b()"><br/> 
                 대치  37.494612 127.063642  <br/> 
                 영등포 37.515504 126.907628  <br/> 
                 서울 37.554648 126.972559  <br/> 
                 신림 37.484201 126.929715  <br/> 
                  
                 <a href ="http://swopenAPI.seoul.go.kr/api/subway/64676e63666573633733436c6b646b/xml/nearBy/1/5/37.5010226/127.0396037/">dd</a>  
 </body> 
 </html>    
