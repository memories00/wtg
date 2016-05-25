<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>코스등록하기</title>
			
		<div id="staticMap" style="width:100%;height:400px;"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var totalStr='${returnName}';
		var parseStr=totalStr.split(',');

		var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // 경유지마커이미지의 주소입니다    
	 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
	 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);

		//alert(parseStr.length);
		var marker=new Array();
		for(var i=0;i<parseStr.length;i++)
		{
			var splitStr=parseStr[i].split('/');
			//alert(splitStr[1]);
			markerPosition=new daum.maps.LatLng(splitStr[1],splitStr[2]);
			marker[i]={position:markerPosition,text:splitStr[0]+"   주소 : "+splitStr[3],image:psmarkerImage};
		}
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다

		var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div   
			staticMapOption = { 
					center: new daum.maps.LatLng(37.515504, 126.907628), // 이미지 지도의 중심좌표
        			level: 8, // 이미지 지도의 확대 레벨
        			marker:marker
    			};

		// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
	  var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
		//alert(staticMap.getCenter());
		//staticMap.setCenter(markerPosition);
		
			</script>
				
	</head>
	<body>
	${dto.category}	

	</body>
</html>