<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>�ڽ�����ϱ�</title>
			
		<div id="staticMap" style="width:100%;height:400px;"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var totalStr='${returnName}';
		var parseStr=totalStr.split(',');

		var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
	 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
	 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);

		//alert(parseStr.length);
		var marker=new Array();
		for(var i=0;i<parseStr.length;i++)
		{
			var splitStr=parseStr[i].split('/');
			//alert(splitStr[1]);
			markerPosition=new daum.maps.LatLng(splitStr[1],splitStr[2]);
			marker[i]={position:markerPosition,text:splitStr[0]+"   �ּ� : "+splitStr[3],image:psmarkerImage};
		}
		// �̹��� ������ ǥ���� ��Ŀ�Դϴ�
		// �̹��� ������ ǥ���� ��Ŀ�� Object �����Դϴ�

		var staticMapContainer  = document.getElementById('staticMap'), // �̹��� ������ ǥ���� div   
			staticMapOption = { 
					center: new daum.maps.LatLng(37.515504, 126.907628), // �̹��� ������ �߽���ǥ
        			level: 8, // �̹��� ������ Ȯ�� ����
        			marker:marker
    			};

		// �̹��� ������ ǥ���� div�� �ɼ����� �̹��� ������ �����մϴ�
	  var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
		//alert(staticMap.getCenter());
		//staticMap.setCenter(markerPosition);
		
			</script>
				
	</head>
	<body>
	${dto.category}	

	</body>
</html>