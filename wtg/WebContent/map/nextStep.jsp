<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style>
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:50%; height:405px;margin:50px 50px 50px 620px;padding:5px;overflow-x:auto;background:rgba(0, 0, 0,0.1);z-index: 0.1;font-size:12px;border-radius: 0px; }
			.bg_white {background:#fff;}		
			#menu_wrap hr {display: block; height: 4px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>코스등록하기</title>
			<font size="6">${dto.category }</font>
			<table border="2" width="600px">
				<tr>
					<td><div id="map" style="width:100%;height:400px;"></div></td>
				<tr>
			</table>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<font size="4">
					출발  이름: ${startTitle} 주소: ${startAddress} 전화번호: ${startPhone }<br/>
						<c:forEach var="list" items="${list}">
							경유지 이름: ${list} 주소: ${addList} 전화번호: ${phoneList}<br/>
						</c:forEach>
					도착 이름: ${endTitle} 주소: ${endAddress} 전화번호: ${endPhone }<br/>
					</font>
					<hr>
				</div>
			</div>
			
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var totalStr='${returnName}';
		//alert(totalStr);
		var parseStr=totalStr.split(',');
		var markers=new Array();
		var bounds = new daum.maps.LatLngBounds();    
		
		for(var i=0;i<parseStr.length;i++)
		{
			var splitStr=parseStr[i].split('/');
			//alert(splitStr[1]);
			markerPosition=new daum.maps.LatLng(splitStr[1],splitStr[2]);
			markers[i]={latlng:markerPosition,title:splitStr[0]};
			bounds.extend(markers[i].latlng);

		}
		

		var container = document.getElementById('map'); //div id=map자리에 지도를생성			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 7
									  };  			
		var map = new daum.maps.Map(container, options); 
			
		for( var i=0;i<markers.length;i++)
		{
			var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: markers[i].latlng, // 마커를 표시할 위치
		        title : markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
		    });
		}
		map.setBounds(bounds);


			
			</script>
				
	</head>
	<body>

	</body>
</html>