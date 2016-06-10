<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/inputCss.css"/>

<style>
	.wrap {position: absolute; width: 250px; height: 25px; overflow: hidden; background: #ffffff;}
		.wrap .icon {width: 20px; height: 20px; backbround: #F0F8FF;}
</style>

<div id="wrapper">
	<div id="header">
		<jsp:include page="/include/inputHeader.jsp" flush="false"/>
	</div>

	<div class="map_wrap">
		<div id="map" style="width:100%; height:830px"></div>
		<div id="menu_wrap" class="bg_white">'
				<select name="selectOne" id="selectOne" onchange="multiSelect(this, 'selectTwo')">
				   <option value="default">---�����ϼ���---</option>
				   <option value="best">����Ʈ ������</option>
				   <option value="keyword">Ű���� �˻�</option>
	    		</select>
				<select name="selectTwo" id="selectTwo" onchange="sendOpval(this)">
				   <option value="default">---�����ϼ���---</option>
				</select>
			<div id="resultList">����Ʈ���
			</div>
		</div>
	</div>
</div>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>
<script type="text/javascript">
var container = document.getElementById('map'); 			//������ ���� �����̳� ����
var options = { 											//���� �ɼ� ����
		center: new daum.maps.LatLng(37.515504, 126.907628), 
		level: 6
	};  			
var map = new daum.maps.Map(container, options);			//���� ����
var titleList = [];											//����Ʈ �迭  
var points = [];
var bounds = new daum.maps.LatLngBounds();					//�������� �缳���� ���� ��ǥ��ü ����
var iconCafe = 'CE7';
var ps = new daum.maps.services.Places(map); 				//��Ұ˻� ��ü ����
var iconMarkers = [];
var markerPosition;

//���� ����Ʈ�ڽ� ����
function multiSelect(srcE, targetId){						
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

  	//ù��° ����Ʈ�ڽ��� ����Ʈ�������� ��� �ι�° �ڽ� value�� ����
    if(val == 'best'){										
        addOption('�������', targetE);
        addOption('����Ʈ', targetE);
        addOption('������', targetE);
        addOption('����', targetE);
    }
  	//�ι�° ����Ʈ�ڽ��� Ű����˻��� ���.
    else if(val == 'keyword'){								
        addOption('0', targetE);
    }
}


//�ι�° ����Ʈ �ڽ��� value�� ����
function addOption(value, e){								
    var option = new Option(value);
    try{
        e.add(option);
    }catch(ee){
        e.add(option, null);
    }
}


//�ι�° ����Ʈ �ڽ��� value�� ����
function removeAll(e){										
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}


//���õ� ����Ʈ�ڽ��� �ɼ��� ��Ʈ�ѷ��� ����
function sendOpval(opval){
 	var opval = document.getElementById('selectTwo');
 	var op=opval.value;
	$.ajax({
		type : "post",
		url: "searchBest.nhn",
		data: {op: op},
		success: searchOK,
		error: function() {
			alert("error");
		}
	});
}

//���޹��� ��ŷ������ ������ �°� ����
function searchOK(list) {
//	alert("�̾Ż�!");
	var cnt=0;
	var str=list.replace(/\s/gi, '');
	var line=str.split('@');
		for(var i=0; i<line.length-1; i++)
		{
			var val = line[i].split('^');
				name = val[0];
				x = val[1];
				y = val[2];
				rank = val[3];
			cnt++;	
			var xy = new daum.maps.LatLng(x,y);
			addMarker(xy,cnt);
			bounds.extend(xy);
		}
//	alert("�����缳����!");
	//setbounds();
}


//��ǥ�� �ش��ϴ� ��Ŀ�� �����ϰ� ���
function addMarker(xy, cnt) {
	var marker = new daum.maps.Marker({
		position: xy,
		clickable: true
	});
	var mkPosition = xy;
	alert("��Ŀ������"+mkPosition);
	var icon = '<div class="wrap">' +
			'			<div class="icon" id="CE7" onclick="cateSearch(this)" title="'+xy.getLat()+"/"+xy.getLng()+'">'+ iconCafe +
			'			</div>' +
			'	</div>';	
	var overlay = new daum.maps.CustomOverlay({			// ������� �������� ����
		content: icon,
 		position: marker.getPosition(),
  		clickable: true
	});	
	marker.setMap(map);									// ��Ŀ�� ������ ǥ��
	daum.maps.event.addListener(marker, 'click', function(mouseEvent) {	// Ŭ�� ������ ������ �������̸� ������ ǥ��
		alert("���������̺�Ʈ");
		markerPosition=marker.getPosition();
		//alert("���콺"+markerPosition);
		map.setCenter(markerPosition);
		map.setLevel(4);
		overlay.setMap(map);	
		
	});															
}
	
function cateSearch(id) {
	//var cate = id.getAttribute('id');
	var cate='CS2';
	var xy = id.getAttribute('title');

	
	syPosition=new daum.maps.LatLng(xy.split('/')[0],xy.split('/')[1]);
	alert("Ŭ���̺�Ʈ"+syPosition);
	ps.categorySearch({
		code : cate,
		callback : searchCB,
		location : syPosition,
		radius : 1000,
		sort : 1
	})
}

function searchCB(status, data, pagination) {
//	alert("st"+status);
//	alert("dt"+data.places);
	    if (status === daum.maps.services.Status.OK) {
	        showIconMarker(data.places);					// ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
	       
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
			alert("�ݰ� 1km �̳��� �ش��ϴ� �˻������ �����ϴ�");
	    } else if (status === daum.maps.services.Status.ERROR) {
			alert("����!����!");	        
	    }
	}
	
function showIconMarker(places) {
	alert("�˻���ī�丶Ŀ");
	for (var i=0; i<places.length; i++)
	{
		 var distance=distanceSum(places[i]);
		 alert("�Ÿ�"+distance);
		if(distance<=1000)
		{
//alert("data"+places[i].address); 
			var psimageSrc = 'http://127.0.0.1:8000/wtg/map/img/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
			 		 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
			 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
			var psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
			var xy = new daum.maps.LatLng(places[i].latitude, places[i].longitude);
				alert(i+xy);
			var iconMarker = new daum.maps.Marker({
				position : xy,
				clickable: true,
				image:psmarkerImage
			});	
			iconMarker.setMap(map);
			
		}
//		iconMarkers.push(iconMarker);
//		var mkPosition = iconMarker.getPosition();
//		alert("�ȶ߳�"+mkPosition);
	}
}

function distanceSum(place)
{
	//alert("�質��ٺ�"+markerPosition);
	// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
		var distance;
		var dis=new  daum.maps.LatLng(place.latitude, place.longitude);
		alert("��ǥ:"+dis);
		
		clickLine = new daum.maps.Polyline({
		 map: map, // ���� ǥ���� �����Դϴ� 
		 path: [markerPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
		 strokeWeight: 0, // ���� �β��Դϴ� 
		 strokeColor: 'red', // ���� �����Դϴ�
		 strokeOpacity: 0, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
		 strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
		});
		
		var path = clickLine.getPath();	
		// ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
		path.push(dis);
		clickLine.setPath(path);
		distance = Math.round(clickLine.getLength());

		return distance;
}

 



//��Ŀ�� �߽����� ���� ������ �缳����
function setbounds() {
    map.setBounds(bounds);
}
	
	
	
</script>




