<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>               
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style>
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:47%; height:505px;margin:50px 50px 50px 820px;padding:5px;overflow-x:auto;background:rgba(0, 0, 0,0.3);z-index: 0.1;font-size:12px;border-radius: 0px; }
			.bg_white {background:#fff;}		
			#menu_wrap hr {display: block; height: 4px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>코스등록하기</title>
			<font size="6">${dto.category }</font>
			<table border="2" width="800px">
				<tr>
					<td><div id="map" style="width:100%;height:500px;"></div></td>
				<tr>
			</table>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<font size="4">
					출발지  이름: ${startTitle} 주소: ${startAddress} <br/> 전화번호: ${startPhone } 근처역: ${startStn } 근처역까지거리: ${startDtc }m 이동시간: ${startWalk}분<br/>
					<hr>
					
						<c:forEach var="alist" items="${list}">
						경유지
							<c:forTokens var="a" items="${alist}" delims="/" varStatus="i">
						<c:if test="${i.count==1 }"> 이름: ${a}</c:if> <c:if test="${i.count==2 }">주소: ${a} </c:if>  <c:if test="${i.count==3 }"><br/> 전화번호: ${a} </c:if>
							<c:if test="${i.count==4 }">근처역까지의 거리: ${a} </c:if> <c:if test="${i.count==5 }">근처역: ${a}m </c:if> <c:if test="${i.count==6 }">이동시간: ${a}분 </c:if> 
							</c:forTokens>
						<hr>
						</c:forEach>
					도착지 이름: ${endTitle} 주소: ${endAddress} <br/> 전화번호: ${endPhone }  근처역: ${endStn } 근처역까지거리: ${endDtc }m 이동시간: ${endWalk }분<br/>
					</font>
					
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
			
			if(i==0)
			{
				var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // 출발마커이미지의 주소입니다    
 		 	    stimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
 		 	    
				var startMarker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: markers[i].latlng, // 마커를 표시할 위치
			        title : markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
				});
			        startMarker.setImage(startImage);
			}
			if(i==markers.length-1)
			{
				var endimageSrc = 'http://127.0.0.1:8000/wtg/map/blue_b.png', // 도착지마커이미지의 주소입니다    
 		 	    endimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
 		 	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
 		 	    
				var endMarker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: markers[i].latlng, // 마커를 표시할 위치
			        title : markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
				});
 		 	    
 		 	    
				 endMarker.setImage(endImage);
			}
			if(i>0&&i<markers.length-1)
			{
				var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // 경유지마커이미지의 주소입니다    
 		 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
 		 	    
				var marker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: markers[i].latlng, // 마커를 표시할 위치
			        title : markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
			    });
 		 	    
 		 	    
				 marker.setImage(psmarkerImage);
			}
			
		}
		map.setBounds(bounds);


			
			</script>
				
	</head>
	<body>
	<br/>
	<br/>
	<table border="2" style="width:100%;height:400px">
		<tr>
			<td><font size="7">다음에디터</font></td>
		</tr>
	</table>
	</body>
</html>