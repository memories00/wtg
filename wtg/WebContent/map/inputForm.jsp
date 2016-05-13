<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>코스 등록하기</title>
		<style>
			map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:300px;margin:10px 0 30px 80%;padding:5px;overflow-x:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px; }
			.bg_white {background:#fff;}
			#menu_wrap hr {display: block; height: 1px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
		</style>

		<div class="map_wrap">
    <div id="map" style="width:100%; height:500px;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white" >
        <div class="option">
            <p>
                <form onsubmit="searchPlaces(); return false;">
                검색어 : <input type="text" value="이태원 맛집" style="width:150px; height:25px"id="keyword" size="15"> 
                <button type="submit" style="width:60px;height:25px;">검색하기</button> 
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
					var container = document.getElementById('map'); //div id=map자리에 지도를생성
 					var options = { 
 												center: new daum.maps.LatLng(37.515504, 126.907628), 
 												level: 7
 											  };  		  
 					var map = new daum.maps.Map(container, options); 
 					var marker=new daum.maps.Marker({
 						position:map.getCenter()
 					});
 					
 					daum.maps.event.addListener(map, 'click', function(mouseEvent)//마우스 클릭이벤트 
 					 		 {  		
 								marker.setPosition(mouseEvent.latLng);
 								marker.setMap(map);
 								marker.get
 					 		 });
 					
 					
 				</script>
</head>
	<body>

	</body>
</html>