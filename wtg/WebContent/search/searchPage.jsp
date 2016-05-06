<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=724958f2e1f7b67c37acebb26e173723&libraries=services"></script>

<!-- 지도생성 -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:200px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <p>
                <form onsubmit="searchPlaces(); return false;">
                키워드 : <input type="text" value="${keyword}" id="keyword" size="15"> 
                <button type="submit">검색하기</button> 
            </p>
        </div>
        <hr>
		<!--UL=순서없는 목록 태그-->
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   	mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
	};  
	
//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

//키워드로 장소를 검색합니다
searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {												
			var keyword = document.getElementById('keyword').value;	
	     if (!keyword.replace(/^\s+|\s+$/g, '')) {
	     alert('키워드를 입력해주세요!');
	     return false;
	     }
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    // [api]keywordSearch(keyword, callback, options) (검색키워드,결과를 받을 콜백함수,옵션)
	    // keyword로 검색하면 placesSearchCB의 함수형태로 결과를 받는다.
	    ps.keywordSearch(keyword, placesSearchCB); 							
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(status, data, pagination) {						
			//daum.maps.services.Status.OK=검색결과 있음.
	     if (status === daum.maps.services.Status.OK) {						alert("검색완료 콜백");
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data.places);
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	    	} else if (status === daum.maps.services.Status.ZERO_RESULT) {
	       	alert('검색 결과가 존재하지 않습니다.');
	      	return;
	     } 
	 }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {								alert("display까진 들어오는데");								
        //이 문서내에서 id값이 placesList인 요소를 가져와 listEl변수에 넣겠다.
		var listEl = document.getElementById('placesList'),  
    		menuEl = document.getElementById('menu_wrap'),
    		fragment = document.createDocumentFragment(), 					
        //좌표계의 사각영역 정보를 표현하는 객체를 생성한다.
			bounds = new daum.maps.LatLngBounds(), 						
    		listStr = '';											
	
    	for ( var i=0; i<places.length; i++ ) { 
    		
    		var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            //플레이스를 건들면 목록명을 가져오지 못함.
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다		
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);            														alert("좌표재설정 됐는지 확인"+places[i].latitude);	

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
    	var el = document.createElement('li'),
       	itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
           '<div class="info">' +
           '   <h5>' + places.title + '</h5>';

           if (places.newAddress) {
               itemStr += '    <span>' + places.newAddress + '</span>' +
                          '   <span class="jibun gray">' +  places.address  + '</span>';
           } else {
               itemStr += '    <span>' +  places.address  + '</span>'; 
           }

               itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                  		   '</div>';           
				itemStr += '  <span class="x">' + places.latitude  + '</span>' +
                          '</div>'; 
               itemStr += '  <span class="y">' + places.longitude  + '</span>' +
                          '</div>'; 
               el.innerHTML = itemStr;
               el.className = 'item';

               return el;
     }  


</script>

