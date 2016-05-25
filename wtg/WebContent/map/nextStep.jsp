<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>코스등록하기</title>
			
		<div id="staticMap" style="width:600px;height:350px;"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div   
			staticMapOption = { 
					center: new daum.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
        			level: 3 // 이미지 지도의 확대 레벨
    			};
		// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
	  var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
		//alert(staticMap.getCenter());
		
			</script>
				
	</head>
	<body>
		

	</body>
</html>