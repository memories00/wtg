<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/inputCss.css"/>

<style>
.wrap {position: absolute; width: 100px; height: 500px; overflow: hidden;}
		
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','���� ���',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
.category .ico_coffee {background-position:-10px 0;}  
.category .ico_store {background-position:-10px -36px;}   
.category .ico_carpark {background-position:-10px -72px;} 

    .cowrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 11px;line-height: 1.5;}
    .cowrap * {padding: 0;margin: 0;}
	    .cowrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .cowrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 14px;font-weight: bold;}
		    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		    .info .close:hover {cursor: pointer;}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 9px 20 0 20px;height: 75px;}
			    .desc .address {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		    .info .link {color: #5085BB;}
</style>
<div id="header" style="width:100%; height:80px; background-color:#333;">
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
<div id="wrapper">
	<div id="header">
<%-- 		<jsp:include page="/include/inputHeader.jsp" flush="false"/> --%>
	</div>

	<div class="map_wrap">
		<div id="map" style="width:100%; height:830px"></div>
		<div id="menu_wrap" class="bg_white">
				<select name="selectOne" id="selectOne" onchange="multiSelect(this, 'selectTwo')">
				   <option value="default">---��з��� �����ϼ���---</option>
				   <option value="best">����Ʈ ������</option>
<!-- 				   <option value="keyword">Ű���� �˻�</option> -->
	    		</select><br/>
				<select name="selectTwo" id="selectTwo" onchange="sendOpval(this)">
				   <option value="default">---ī�װ��� �����ϼ���---</option>
				</select>
				<br/>
				<hr>
			<ul id="resultList"></ul>
		</div>
	</div>
</div>
<div id="ad_footer">
	<jsp:include page="/include/mainFooter.jsp" flush="false"/>
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
var ps = new daum.maps.services.Places(); 				//��Ұ˻� ��ü ����
var iconMarkers = [];
var markerPosition;
var cnt=0;
var foodImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_food.png'; // ������ ��Ŀ�̹��� �ּ��Դϴ�   
var cafeImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_cafe.png'; // ī�� ��Ŀ�̹����� �ּ��Դϴ�    
var cvsImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_cvs.png'; // ������ ��Ŀ�̹����� �ּ��Դϴ�    
var innImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_inn.png'; // ���� ��Ŀ�̹����� �ּ��Դϴ�    
var parmacyImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_parmacy.png'; // �౹ ��Ŀ�̹����� �ּ��Դϴ�    
var psimageSize = new daum.maps.Size(45, 60); 				// ��Ŀ�̹����� ũ���Դϴ� 
var psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
var psmarkerImage;

var iconOverlay = new daum.maps.CustomOverlay({
		position:map.getCenter(),//��Ŀ�� ��� ī�װ� ������ �������̻���
		clickable: true
});	
var dataOverlay = new daum.maps.CustomOverlay({	
	position:map.getCenter(),//��Ŀ�� ��� ī�װ� ������ �������̻���//������� �������̸� �����մϴ�.
		clickable: true
});

iconOverlay.setMap();
dataOverlay.setMap();
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
//   	//�ι�° ����Ʈ�ڽ��� Ű����˻��� ���.
//     else if(val == 'keyword'){								
//         addOption('0', targetE);
//     }
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
//	hideMarkers();
	var str=list.replace(/\s/gi, '');
	var line=str.split('@');
	var listEl = document.getElementById('resultList');
	removeAllChildNods(listEl);
		for(var i=0; i<line.length-1; i++)
		{
			var val = line[i].split('^');
				name = val[0];
				x = val[1];
				y = val[2];
				rank = val[3];
			cnt++;	
			var xy = new daum.maps.LatLng(x,y);
			addBlueMarker(xy,name,cnt);
			bounds.extend(xy);
			
			listEl = document.getElementById('resultList');
			var el = document.createElement('li');//li�� �߰�	 			 
			fragment = document.createDocumentFragment();
			var imgStr='<div id="'+x+","+y+'" onmouseover="showInfo(this)">'+(i+1)+'���� �������<br/>'+name+'<br/></div><hr>';
			el.innerHTML=imgStr;
			fragment.appendChild(el);
			listEl.appendChild(fragment);	
			
		}
}
function removeAllChildNods(el) {   
      while (el.hasChildNodes()) {
          el.removeChild (el.lastChild);
      }
  }



function showInfo(id)
{
	
	var position=id.getAttribute('id');
	var xy=new daum.maps.LatLng(position.split(',')[0],position.split(',')[1]);
	map.panTo(xy);
	
}
//��ǥ�� �ش��ϴ� ��Ŀ�� �����ϰ� ���
function addBlueMarker(xy,name, cnt) {
	var marker = new daum.maps.Marker({			//��Ŀ����
		position: xy,
		clickable: true,
		title:name
	});
	var iconPack = '<div class="wrap">' +
			'			<div class="icon" id="FD6" onclick="cateSearch(this)" title="'+xy.getLat()+"/"+xy.getLng()+'">'+
			'				<img src="/wtg/img/mk_food.png" style=width:30; height:30>' +
			'			</div>' +
			'			<div class="icon" id="CE7" onclick="cateSearch(this)" title="'+xy.getLat()+"/"+xy.getLng()+'">'+
			'				<img src="/wtg/img/mk_cafe.png" style=width:30; height:30>' +
			'			</div>' +
			'			<div class="icon" id="CS2" onclick="cateSearch(this)" title="'+xy.getLat()+"/"+xy.getLng()+'">'+
			'				<img src="/wtg/img/mk_cvs.png" style=width:30; height:30>' +
			'			</div>' +
			'			<div class="icon" id="AD5" onclick="cateSearch(this)" title="'+xy.getLat()+"/"+xy.getLng()+'">'+
			'				<img src="/wtg/img/mk_inn.png" style=width:30; height:30>' +
			'			</div>' +
			'			<div class="icon" id="PM9" onclick="cateSearch(this)" title="'+xy.getLat()+"/"+xy.getLng()+'">'+
			'				<img src="/wtg/img/parmacy.png" style=width:30; height:30>' +
			'			</div>' +
			'		</div>';	
	marker.setMap(map);
	
	iconOverlay.setContent(iconPack);
				
	// ��Ŀ�� ������ ǥ��
	daum.maps.event.addListener(marker, 'click', function(mouseEvent) {	// Ŭ�� ������ ������ �������̸� ������ ǥ��

		markerPosition=marker.getPosition();	
		map.setCenter(markerPosition);
		map.setLevel(4);
		iconOverlay.setPosition(marker.getPosition());
		iconOverlay.setMap(map);	
	});															
}
	
function cateSearch(id) {
	var cate = id.getAttribute('id');
	var xy = id.getAttribute('title');
	//alert(xy);
	
	if(cate=='FD6'){
		
		alert("������");
		var psimageSrc = '/wtg/img/mk_food.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
 	    alert("33");
	}
	else if(cate=='CE7'){
		alert("���ѳ���");
		var psimageSrc = '/wtg/img/mk_cafe.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
	}
	else if(cate=='CS2'){
		alert("��");
		var psimageSrc = '/wtg/img/mk_cafe.png', // ��������Ŀ�̹����� �ּ��Դϴ�    , // ��������Ŀ�̹����� �ּ��Դϴ�    
 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption)
	}
	else if(cate=='AD5'){
		alert("��𰣰�");
		var psimageSrc = '/wtg/img/mk_inn.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
	}
	else {
		alert("????");
		var psimageSrc = '/wtg/img/mk_parmacy.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
	}
		
//psmarkerImage = new daum.maps.MarkerImage(foodImageSrc, psimageSize, psimageOption);
	var syPosition=new daum.maps.LatLng(xy.split('/')[0],xy.split('/')[1]);
	ps.categorySearch({
		code : cate,
		callback : searchCB,
		location : syPosition,
		sort : 1
	})
}

var iconMarker;
function searchCB(status, data, pagination) {
	    if (status === daum.maps.services.Status.OK) {
	      	  showIconMarker(data.places);					// ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
			alert("�ݰ� 1km �̳��� �ش��ϴ� �˻������ �����ϴ�");
	    } else if (status === daum.maps.services.Status.ERROR) {
			alert("���ΰ�ħ �� �ٽ� �������ּ���");	        
	    }
	}
	//////////////////////������ ī�װ� ���ֱ�///////////////////////////
	var dataOverlay=new Array();
	
	
	function add(cnt,point,place)
	{
		var content = '<div class="cowrap">' + 		//������� �������̿� ǥ���� ������ �Դϴ�
        '    <div class="info">' + 
        '        <div class="title">' + place.title+ 
        '            <div class="close" id="'+cnt+'"onclick="closeOverlay(this)"  title="�ݱ�"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="desc">' + 
        '                <div class="address">'+'�ּ� : ' + place.address + '</div>' + 
        '                <div>'+'��ȭ��ȣ : ' + place.phone + '</div>' + 
        ' 				 <div>'+ place.category + '</div>' +
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';  
        
        dataOverlay.setContent(content);
       	    
			iconMarker = new daum.maps.Marker({
			position : point,
			clickable: true,
	
		});
		iconMarker.setImage(psmarkerImage);
		iconMarker.setMap(map);
		
		  daum.maps.event.addListener(iconMarker, 'click', function(mouseEvent) 
	       { 
			  dataOverlay.setPosition(iconMarker.getPosition());
			  dataOverlay.setMap(map);

	       });				
	}
	
function showIconMarker(places) {
	for (var i=0; i<places.length; i++)
	{
		 var distance=distanceSum(places[i]);
		if(distance<=1000)
		{
			var xy = new daum.maps.LatLng(places[i].latitude, places[i].longitude);	
	        add(i,xy,places[i]);
			
	
		}
	}
}


function distanceSum(place)
{
	// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
		var distance;
		var dis=new  daum.maps.LatLng(place.latitude, place.longitude);

		clickLine = new daum.maps.Polyline({
		 map: map, // ���� ǥ���� �����Դϴ�  
		 path: [markerPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
		 strokeWeight: 0, // ���� �β��Դϴ� 
		 strokeOpacity: 0, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
		});
		
		var path = clickLine.getPath();	
		// ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
		path.push(dis);
		clickLine.setPath(path);
		distance = Math.round(clickLine.getLength());

		return distance;
}

//�������̸� �ݽ��ϴ�
function closeOverlay(a) {		
	var check=a.getAttribute('id');	
//	alert(dataOverlay[check].getPosition());
	dataOverlay[check].setMap(null);
}


// //ǥ�õ� ��� ��Ŀ�� ����ϴ�
// function hideMarkers(map) {
// 	alert("dd");
// 	for (var i=0; i<markers.length; i++)
// 	{
// 		markers[i].setMap(null);	
// 	}
// }

//��Ŀ�� �߽����� ���� ������ �缳����
function setbounds() {
    map.setBounds(bounds);
}
	
	
	
</script>




