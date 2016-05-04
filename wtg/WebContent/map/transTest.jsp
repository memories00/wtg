<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 <html>
<head>
    <meta charset="utf-8">
    <title>카테고리로 장소 검색하기</title>
    
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="../../documentation/#CategoryCode" target="_blank">카테고리 코드목록을 보시려면 여기를 클릭하세요!</a>
    </em>
</p>
<div id="map" style="width:1200px;height:800px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06fa7b42a2af7b8c46c9ca9a71d40206&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.491412,127.061642), // 지도의 중심좌표
        level: 4// 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

var marker1= new daum.maps.Marker({ 
		    position: map.getCenter() //마커의 위치는 입력한곳
		}); 
	   // map.panTo(markerPosition);    //화면이 마커를 선택한쪽으로 이동     	 		    	  	 		    
		marker1.setMap(map); //마커를띄운다


// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(map); 

// 카테고리로 은행을 검색합니다
ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
var arr=new Array();
var strArr=new Array();
// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {
        for (var i=0; i<data.places.length; i++) {
          	
        	var a=distanceSum(data.places[i]);     //마커를 출력 
        	
        	arr[i]=a; 
        	 //alert(arr[i]);
        	var str=a.split('/');
        	strArr[i]=str[0]; 
        	//alert(str[0]);
        }       
       strArr.sort(function(a,b){
    	   return a-b;
    		   });
      		//alert(arr.length);
      		//alert(strArr[0]);
     	for(var i=0;i<arr.length;i++)
     		{
     			//alert(strArr[0]);
     			var b=arr[i];
     			//alert(b);
        		var str=b.split('/');
     			//alert("dd");
     			
     			if(strArr[0]==str[0])
     				{
     					
     					var strLnt=str[1];
     					var strLng=str[2];
     					
     					
     					var markerPosition  = new daum.maps.LatLng(strLnt, strLng);
     					var marker = new daum.maps.Marker({ 
     	   	 			    position: markerPosition //마커의 위치는 입력한곳
     	   	 			}); 
     					   // map.panTo(markerPosition);    //화면이 마커를 선택한쪽으로 이동     	 		    	  	 		    
     	       	 		marker.setMap(map); //마커를띄운다
     				}
     		 
     		
     		}
    }
}


// 지도에 마커를 표시하는 함수입니다
function distanceSum(place) {
    // 마커를 생성하고 지도에 표시합니다
    var distance;
    var dis=new  daum.maps.LatLng(place.latitude, place.longitude);
    
    clickLine = new daum.maps.Polyline({
        map: map, // 선을 표시할 지도입니다 
        path: [map.getCenter()], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
        strokeWeight: 0, // 선의 두께입니다 
        strokeColor: '#db4040', // 선의 색깔입니다
        strokeOpacity: 0, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid' // 선의 스타일입니다
    });
    
    var path = clickLine.getPath();

    // 좌표 배열에 클릭한 위치를 추가합니다
    path.push(dis);
    clickLine.setPath(path);
    distance = Math.round(clickLine.getLength());
    alert(place.title);
    distance=distance+"/"+place.latitude+"/"+place.longitude;
    return distance;
}


</script>
</body>
</html>
