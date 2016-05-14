<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>코스 등록하기</title>
		<style>
			map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:300px;margin:10px 0 30px 80%;padding:5px;overflow-x:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px; }
			.bg_white {background:#fff;}
			#menu_wrap hr {display: block; height: 1px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
		</style>
		<form onsubmit="searchPlaces(); return false;">
		검색어 : <input type="text" value="이태원 맛집" style="width:150px; height:25px"id="keyword" size="15"> 
                <button type="submit" style="width:60px;height:25px;">검색하기</button> 
                
		<div class="map_wrap">
    <div id="map" style="width:100%; height:900px;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white" >
        <div class="option">
            <p>
                
            </p>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
  			<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script> 
				<script> 	
					var container = document.getElementById('map'); //div id=map자리에 지도를생성
 					var options = { 
 												center: new daum.maps.LatLng(37.515504, 126.907628), 
 												level: 7
 											  };  		  
 					var map = new daum.maps.Map(container, options); 
 					var marker=new daum.maps.Marker({
 						position:map.getCenter()
 					});
 					
 					daum.maps.event.addListener(map, 'click', function(mouseEvent)//마우스 클릭이벤트 
 					 		 {  		
 								marker.setPosition(mouseEvent.latLng);
 								marker.setMap(map);
 								marker.get
 					 		 });
 					var ps = new daum.maps.services.Places();
 					// 키워드 검색을 요청하는 함수입니다
 					function searchPlaces() {												
 						var keyword = document.getElementById('keyword').value;	
 					    if (!keyword.replace(/^\s+|\s+$/g, '')) {
 					     alert('키워드를 입력해주세요!');
 					    return false;
 					    }
 					    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
 					    // keywordSearch(keyword, callback, options) (검색키워드,결과를 받을 콜백함수,옵션)
 					    // keyword로 검색하면 placesSearchCB의 함수형태로 결과를 받는다.
 					    ps.keywordSearch(keyword, placesSearchCB); 							
 					}
 					
 				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
 					function placesSearchCB(status, data, pagination) {	
 							//daum.maps.services.Status.OK=검색결과 있음.

 					     if (status === daum.maps.services.Status.OK) {						
 					        // 정상적으로 검색이 완료됐으면
 					        // 검색 목록을 표출합니다
 					        displayPlaces(data.places);
 					        // 페이지 번호를 표출합니다
 					    	} else if (status === daum.maps.services.Status.ZERO_RESULT) {
 					       	alert('검색 결과가 존재하지 않습니다.');
 					      	return;
 					     } 
 					 }
 				
 				    function displayPlaces(places) {
 				        //이 문서내에서 id값이 placesList인 요소를 가져와 listEl변수에 넣겠다.
 						var listEl = document.getElementById('placesList'),  
 				    		menuEl = document.getElementById('menu_wrap'),
 				    		fragment = document.createDocumentFragment(), 					
 							bounds = new daum.maps.LatLngBounds(), 	//좌표계의 사각영역 정보를 표현하는 객체를 생성한다.					
 				    		listStr = '';
 				        //이전 검색목록을 지운다.
 						removeAllChildNods(listEl);

 				    	for ( var i=0; i<places.length; i++ ) { 
 				    		placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude);
 				            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다		
 				            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
 				            // LatLngBounds 객체에 좌표를 추가합니다
 				            bounds.extend(placePosition);  
 							fragment.appendChild(itemEl);
 							
 				       	}

 						// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
 						listEl.appendChild(fragment);
 						menuEl.scrollTop = 0;
 						// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
 						map.setBounds(bounds);
 						
 					    }
 			    
 			 	// 검색결과 항목을 Element로 반환하는 함수입니다
 			    function getListItem(index, places) {
 				    var title = places.title;
 				    var x = places.latitude;
 				    var y = places.longitude;
 				    
 					var el = document.createElement('li');
 					var itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
 				           '<div class="info" id="'+title+"-"+x+"-"+y+'" onmouseover="openinfo(this)" onmouseout="closeinfo()">' +                                      
 				           '<h5>' + places.title + '</h5>';
 					           if (places.newAddress) { //도로명주소이면
 					               itemStr += '<span>' + places.newAddress + '</span>' +
 					                          '<span class="jibun gray">' +  places.address  + '</span>'; 	
 					           } else { //지번주소이면
 					             itemStr += '<span>' +  places.address  + '</span>'; 
 					           }
 				       	itemStr += '<span class="tel">' + places.phone  + '</span>' + '</div>'; 
 				
 					var button = "<input type='button' value='선택하기' id='"+title+"-"+x+"-"+y+"' onclick='choice(this);'>";
 					
 				    el.innerHTML = itemStr+button;
 				    el.className = 'item';
 				    
 				    return el;  
 				    
 				}  

 			 	//선택하기 클릭시 마커를 지도에 보여줍니다
 			    function choice(bt){
 			    	var a = bt.getAttribute('id');
 			    	var strArray=a.split('-');
 			    	var markerPosition  = new daum.maps.LatLng(strArray[1], strArray[2]);
 					// 마커 생성
 					marker.setPosition(markerPosition);
 					// 마커 지도 위에 표시
 					marker.setMap(map);
 					//지도레벨 3으로 고정
 					map.setLevel(3);
 					//마커를 부드럽게 이동이동
 					map.panTo(markerPosition); 
 					
 			    } 
 			   
 			 	//결과리스트에 마우스오버시에 인포윈도우 표시
 			 	function openinfo(op) {
 			 		var b = op.getAttribute('id');	
 			 		var strArray = b.split('-');
 			 		
 			 		var infoPosition=new daum.maps.LatLng(strArray[1], strArray[2])
 			 		    infowindow = new daum.maps.InfoWindow({
 			 			position: infoPosition,
 			 			content: strArray[0]
 			 		});
 			 		 
 			  		infowindow.open(map); 
 			  		map.panTo(infoPosition);
 			 	}
 			 	
 			 	function closeinfo() {
 					infowindow.close();
 			 	}
 			 	
 			 	
 			    // 이전 검색 결과를 지우는 함수
 			    function removeAllChildNods(el) {   
 			        while (el.hasChildNodes()) {
 			            el.removeChild (el.lastChild);
 			        }
 			    }
 					
 					
 					
 					
 				</script>
</head>
	<body>

	</body>
</html>