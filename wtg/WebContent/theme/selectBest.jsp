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
				   <option value="default">---선택하세요---</option>
				   <option value="best">베스트 여행지</option>
				   <option value="keyword">키워드 검색</option>
	    		</select>
				<select name="selectTwo" id="selectTwo" onchange="sendOpval(this)">
				   <option value="default">---선택하세요---</option>
				</select>
			<div id="resultList">리스트출력
			</div>
		</div>
	</div>
</div>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>
<script type="text/javascript">
var container = document.getElementById('map'); 			//지도를 담을 컨테이너 변수
var options = { 											//지도 옵션 설정
		center: new daum.maps.LatLng(37.515504, 126.907628), 
		level: 6
	};  			
var map = new daum.maps.Map(container, options);			//지도 생성
var titleList = [];											//리스트 배열  
var points = [];
var bounds = new daum.maps.LatLngBounds();					//지도범위 재설정을 위한 좌표객체 생성
var iconCafe = 'CE7';
var ps = new daum.maps.services.Places(map); 				//장소검색 객체 생성
var iconMarkers = [];
var markerPosition;

//다중 셀렉트박스 생성
function multiSelect(srcE, targetId){						
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

  	//첫번째 셀렉트박스가 베스트여행지일 경우 두번째 박스 value를 생성
    if(val == 'best'){										
        addOption('역사관광', targetE);
        addOption('데이트', targetE);
        addOption('스포츠', targetE);
        addOption('쇼핑', targetE);
    }
  	//두번째 셀렉트박스가 키워드검색일 경우.
    else if(val == 'keyword'){								
        addOption('0', targetE);
    }
}


//두번째 셀렉트 박스의 value를 생성
function addOption(value, e){								
    var option = new Option(value);
    try{
        e.add(option);
    }catch(ee){
        e.add(option, null);
    }
}


//두번째 셀렉트 박스의 value를 제거
function removeAll(e){										
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}


//선택된 셀렉트박스의 옵션을 컨트롤러로 전달
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

//전달받은 랭킹정보를 목적에 맞게 분할
function searchOK(list) {
//	alert("팟씽뺘!");
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
//	alert("범위재설정뺘!");
	//setbounds();
}


//좌표에 해당하는 마커를 생성하고 띄움
function addMarker(xy, cnt) {
	var marker = new daum.maps.Marker({
		position: xy,
		clickable: true
	});
	var mkPosition = xy;
	alert("마커포지션"+mkPosition);
	var icon = '<div class="wrap">' +
			'			<div class="icon" id="CE7" onclick="cateSearch(this)" title="'+xy.getLat()+"/"+xy.getLng()+'">'+ iconCafe +
			'			</div>' +
			'	</div>';	
	var overlay = new daum.maps.CustomOverlay({			// 장소정보 오버레이 생성
		content: icon,
 		position: marker.getPosition(),
  		clickable: true
	});	
	marker.setMap(map);									// 마커를 지도에 표시
	daum.maps.event.addListener(marker, 'click', function(mouseEvent) {	// 클릭 가능한 아이콘 오버레이를 지도에 표시
		alert("오버레이이벤트");
		markerPosition=marker.getPosition();
		//alert("마우스"+markerPosition);
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
	alert("클릭이벤트"+syPosition);
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
	        showIconMarker(data.places);					// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	       
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
			alert("반경 1km 이내에 해당하는 검색결과가 없습니다");
	    } else if (status === daum.maps.services.Status.ERROR) {
			alert("에러!에러!");	        
	    }
	}
	
function showIconMarker(places) {
	alert("검색끝카페마커");
	for (var i=0; i<places.length; i++)
	{
		 var distance=distanceSum(places[i]);
		 alert("거리"+distance);
		if(distance<=1000)
		{
//alert("data"+places[i].address); 
			var psimageSrc = 'http://127.0.0.1:8000/wtg/map/img/green_b.png', // 경유지마커이미지의 주소입니다    
			 		 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
			 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
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
//		alert("안뜨나"+mkPosition);
	}
}

function distanceSum(place)
{
	//alert("김나경바보"+markerPosition);
	// 마커를 생성하고 지도에 표시합니다
		var distance;
		var dis=new  daum.maps.LatLng(place.latitude, place.longitude);
		alert("좌표:"+dis);
		
		clickLine = new daum.maps.Polyline({
		 map: map, // 선을 표시할 지도입니다 
		 path: [markerPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		 strokeWeight: 0, // 선의 두께입니다 
		 strokeColor: 'red', // 선의 색깔입니다
		 strokeOpacity: 0, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		 strokeStyle: 'solid' // 선의 스타일입니다
		});
		
		var path = clickLine.getPath();	
		// 좌표 배열에 클릭한 위치를 추가합니다
		path.push(dis);
		clickLine.setPath(path);
		distance = Math.round(clickLine.getLength());

		return distance;
}

 



//마커를 중심으로 지도 범위를 재설정함
function setbounds() {
    map.setBounds(bounds);
}
	
	
	
</script>




