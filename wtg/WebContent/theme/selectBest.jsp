<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/inputCss.css"/>

<style>
.wrap {position: absolute; width: 100px; height: 500px; overflow: hidden;}
		
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
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
				   <option value="default">---대분류를 선택하세요---</option>
				   <option value="best">베스트 여행지</option>
<!-- 				   <option value="keyword">키워드 검색</option> -->
	    		</select><br/>
				<select name="selectTwo" id="selectTwo" onchange="sendOpval(this)">
				   <option value="default">---카테고리를 선택하세요---</option>
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
var container = document.getElementById('map'); 			//지도를 담을 컨테이너 변수
var options = { 											//지도 옵션 설정
		center: new daum.maps.LatLng(37.515504, 126.907628), 
		level: 6
	};  			
var map = new daum.maps.Map(container, options);			//지도 생성
var titleList = [];											//리스트 배열  
var points = [];
var bounds = new daum.maps.LatLngBounds();					//지도범위 재설정을 위한 좌표객체 생성
var ps = new daum.maps.services.Places(); 				//장소검색 객체 생성
var iconMarkers = [];
var markerPosition;
var cnt=0;
var foodImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_food.png'; // 음식점 마커이미지 주소입니다   
var cafeImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_cafe.png'; // 카페 마커이미지의 주소입니다    
var cvsImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_cvs.png'; // 편의점 마커이미지의 주소입니다    
var innImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_inn.png'; // 숙박 마커이미지의 주소입니다    
var parmacyImageSrc = 'http://127.0.0.1:8000/wtg/img/mk_parmacy.png'; // 약국 마커이미지의 주소입니다    
var psimageSize = new daum.maps.Size(45, 60); 				// 마커이미지의 크기입니다 
var psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var psmarkerImage;

var iconOverlay = new daum.maps.CustomOverlay({
		position:map.getCenter(),//마커에 띄울 카테고리 아이콘 오버레이생성
		clickable: true
});	
var dataOverlay = new daum.maps.CustomOverlay({	
	position:map.getCenter(),//마커에 띄울 카테고리 아이콘 오버레이생성//장소정보 오버레이를 생성합니다.
		clickable: true
});

iconOverlay.setMap();
dataOverlay.setMap();
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
//   	//두번째 셀렉트박스가 키워드검색일 경우.
//     else if(val == 'keyword'){								
//         addOption('0', targetE);
//     }
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
			var el = document.createElement('li');//li를 추가	 			 
			fragment = document.createDocumentFragment();
			var imgStr='<div id="'+x+","+y+'" onmouseover="showInfo(this)">'+(i+1)+'순위 선택장소<br/>'+name+'<br/></div><hr>';
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
//좌표에 해당하는 마커를 생성하고 띄움
function addBlueMarker(xy,name, cnt) {
	var marker = new daum.maps.Marker({			//마커생성
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
				
	// 마커를 지도에 표시
	daum.maps.event.addListener(marker, 'click', function(mouseEvent) {	// 클릭 가능한 아이콘 오버레이를 지도에 표시

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
		
		alert("나한테");
		var psimageSrc = '/wtg/img/mk_food.png', // 경유지마커이미지의 주소입니다    
 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
 	    alert("33");
	}
	else if(cate=='CE7'){
		alert("시켜놓고");
		var psimageSrc = '/wtg/img/mk_cafe.png', // 경유지마커이미지의 주소입니다    
 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
	}
	else if(cate=='CS2'){
		alert("넌");
		var psimageSrc = '/wtg/img/mk_cafe.png', // 경유지마커이미지의 주소입니다    , // 경유지마커이미지의 주소입니다    
 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption)
	}
	else if(cate=='AD5'){
		alert("어디간겨");
		var psimageSrc = '/wtg/img/mk_inn.png', // 경유지마커이미지의 주소입니다    
 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
	}
	else {
		alert("????");
		var psimageSrc = '/wtg/img/mk_parmacy.png', // 경유지마커이미지의 주소입니다    
 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
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
	      	  showIconMarker(data.places);					// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
			alert("반경 1km 이내에 해당하는 검색결과가 없습니다");
	    } else if (status === daum.maps.services.Status.ERROR) {
			alert("새로고침 후 다시 선택해주세요");	        
	    }
	}
	//////////////////////정보에 카테고리 써주기///////////////////////////
	var dataOverlay=new Array();
	
	
	function add(cnt,point,place)
	{
		var content = '<div class="cowrap">' + 		//장소정보 오버레이에 표시할 컨텐츠 입니다
        '    <div class="info">' + 
        '        <div class="title">' + place.title+ 
        '            <div class="close" id="'+cnt+'"onclick="closeOverlay(this)"  title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="desc">' + 
        '                <div class="address">'+'주소 : ' + place.address + '</div>' + 
        '                <div>'+'전화번호 : ' + place.phone + '</div>' + 
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
	// 마커를 생성하고 지도에 표시합니다
		var distance;
		var dis=new  daum.maps.LatLng(place.latitude, place.longitude);

		clickLine = new daum.maps.Polyline({
		 map: map, // 선을 표시할 지도입니다  
		 path: [markerPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		 strokeWeight: 0, // 선의 두께입니다 
		 strokeOpacity: 0, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		});
		
		var path = clickLine.getPath();	
		// 좌표 배열에 클릭한 위치를 추가합니다
		path.push(dis);
		clickLine.setPath(path);
		distance = Math.round(clickLine.getLength());

		return distance;
}

//오버레이를 닫습니다
function closeOverlay(a) {		
	var check=a.getAttribute('id');	
//	alert(dataOverlay[check].getPosition());
	dataOverlay[check].setMap(null);
}


// //표시된 모든 마커를 숨깁니다
// function hideMarkers(map) {
// 	alert("dd");
// 	for (var i=0; i<markers.length; i++)
// 	{
// 		markers[i].setMap(null);	
// 	}
// }

//마커를 중심으로 지도 범위를 재설정함
function setbounds() {
    map.setBounds(bounds);
}
	
	
	
</script>




