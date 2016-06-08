<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/inputCss.css"/>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>


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
			<div id="resultList">리스트출력은이곳
			</div>
		</div>
	</div>
</div>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var container = document.getElementById('map'); 			//지도를 담을 컨테이너 변수
var options = { 											//지도 옵션 설정
		center: new daum.maps.LatLng(37.515504, 126.907628), 
		level: 6
	};  			
var map = new daum.maps.Map(container, options);			//지도 생성

//다중 셀렉트박스 생성 함수
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

//두번째 셀렉트 박스의 value를 생성하는 함수
function addOption(value, e){								
    var option = new Option(value);
    try{
        e.add(option);
    }catch(ee){
        e.add(option, null);
    }
}

//두번째 셀렉트 박스의 value를 제거하는 함수
function removeAll(e){										
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}

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

function searchOK(list) {
	alert("팟씽뺘!");
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
			addMarker(new daum.maps.LatLng(x,y),cnt);
		}
		alert("마지막뺘!");
	$("#resultList").html(list);
}

function addMarker(xy, cnt) {
	alert("마커뺘!");
	var marker = new daum.maps.Marker({
		position: xy
	});
	marker.setMap(map);
	map.panTo(xy);
}
	
	
	
	
	
</script>




