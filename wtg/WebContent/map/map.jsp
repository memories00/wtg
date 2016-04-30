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
		alert(container);
		var options = {
			center: new daum.maps.LatLng(37.515504, 126.907628),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		function a()
		{
			var markerPosition  = new daum.maps.LatLng(xpoint.value, ypoint.value); 
	
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			
			marker.setMap(map);
			
			var moveLatLon = new daum.maps.LatLng(xpoint.value, ypoint.value);
			
			var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new daum.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		    iwRemoveable = true; //removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new daum.maps.InfoWindow({
		    map: map, // 인포윈도우가 표시될 지도
		    position : moveLatLon, 
		    content : xy.value,
		    removable : iwRemoveable
		});
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
              