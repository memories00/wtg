<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>�ڽ�����ϱ�</title>
			
		<div id="staticMap" style="width:600px;height:350px;"></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var staticMapContainer  = document.getElementById('staticMap'), // �̹��� ������ ǥ���� div   
			staticMapOption = { 
					center: new daum.maps.LatLng(33.450701, 126.570667), // �̹��� ������ �߽���ǥ
        			level: 3 // �̹��� ������ Ȯ�� ����
    			};
		// �̹��� ������ ǥ���� div�� �ɼ����� �̹��� ������ �����մϴ�
	  var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
		//alert(staticMap.getCenter());
		
			</script>
				
	</head>
	<body>
		

	</body>
</html>