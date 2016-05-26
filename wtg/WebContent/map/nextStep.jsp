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
			<title>�ڽ�����ϱ�</title>
			<font size="6">${dto.category }</font>
			<table border="2" width="800px">
				<tr>
					<td><div id="map" style="width:100%;height:500px;"></div></td>
				<tr>
			</table>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<font size="4">
					�����  �̸�: ${startTitle} �ּ�: ${startAddress} <br/> ��ȭ��ȣ: ${startPhone } ��ó��: ${startStn } ��ó�������Ÿ�: ${startDtc }m �̵��ð�: ${startWalk}��<br/>
					<hr>
					
						<c:forEach var="alist" items="${list}">
						������
							<c:forTokens var="a" items="${alist}" delims="/" varStatus="i">
						<c:if test="${i.count==1 }"> �̸�: ${a}</c:if> <c:if test="${i.count==2 }">�ּ�: ${a} </c:if>  <c:if test="${i.count==3 }"><br/> ��ȭ��ȣ: ${a} </c:if>
							<c:if test="${i.count==4 }">��ó�������� �Ÿ�: ${a} </c:if> <c:if test="${i.count==5 }">��ó��: ${a}m </c:if> <c:if test="${i.count==6 }">�̵��ð�: ${a}�� </c:if> 
							</c:forTokens>
						<hr>
						</c:forEach>
					������ �̸�: ${endTitle} �ּ�: ${endAddress} <br/> ��ȭ��ȣ: ${endPhone }  ��ó��: ${endStn } ��ó�������Ÿ�: ${endDtc }m �̵��ð�: ${endWalk }��<br/>
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
		

		var container = document.getElementById('map'); //div id=map�ڸ��� ����������			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 7
									  };  			
		var map = new daum.maps.Map(container, options); 
			
		for( var i=0;i<markers.length;i++)
		{
			
			if(i==0)
			{
				var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // ��߸�Ŀ�̹����� �ּ��Դϴ�    
 		 	    stimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
				var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
 		 	    
				var startMarker = new daum.maps.Marker({
			        map: map, // ��Ŀ�� ǥ���� ����
			        position: markers[i].latlng, // ��Ŀ�� ǥ���� ��ġ
			        title : markers[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
				});
			        startMarker.setImage(startImage);
			}
			if(i==markers.length-1)
			{
				var endimageSrc = 'http://127.0.0.1:8000/wtg/map/blue_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
 		 	    endimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
 		 	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
				endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
 		 	    
				var endMarker = new daum.maps.Marker({
			        map: map, // ��Ŀ�� ǥ���� ����
			        position: markers[i].latlng, // ��Ŀ�� ǥ���� ��ġ
			        title : markers[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
				});
 		 	    
 		 	    
				 endMarker.setImage(endImage);
			}
			if(i>0&&i<markers.length-1)
			{
				var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
 		 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
				psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
 		 	    
				var marker = new daum.maps.Marker({
			        map: map, // ��Ŀ�� ǥ���� ����
			        position: markers[i].latlng, // ��Ŀ�� ǥ���� ��ġ
			        title : markers[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
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
			<td><font size="7">����������</font></td>
		</tr>
	</table>
	</body>
</html>