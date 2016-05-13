<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:900px;height:600px;"></div>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>
<script>
var allTitle=new Array();
var j=0;
var marker;
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng( 37.491412,127.061642),        // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };
// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 
// 장소 검색 객체를 생성합니다


function a() //입력버튼 클릭시 실행
	{ 
		var markerPosition  = new daum.maps.LatLng(xpoint.value, ypoint.value);  //입력창의 x,y값을 넣어준다

		// 마커를 생성합니다 
		displayMarker(markerPosition)	;
	    marker.setMap(map);
		var infowindow = new daum.maps.InfoWindow({
		    map: map, // 인포윈도우가 표시될 지도
		    position : markerPosition, //위치
		    clickable: true,
		    content : xy.value,//입력창에서 입력한값
		    removable : true//창의 x종료버튼
		});
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(markerPosition);    //화면이 마커를 선택한쪽으로 이동      
	    searchSub(markerPosition); 
	}

//지도에 마커를 표시하는 함수입니다
function distanceSum(place)
{
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
	distance=distance+"/"+place.latitude+"/"+place.longitude+"/"+place.title;
	return distance;
}

function b()
{
	var center=new daum.maps.LatLng( 37.491412,127.061642)
	 map.panTo(center);    //화면이 마커를 선택한쪽으로 이동     
} 



daum.maps.event.addListener(map, 'click', function(mouseEvent) 
{        
	 displayMarker(mouseEvent.latLng);
	 marker.setMap(map)	
	 map.panTo(mouseEvent.latLng);    //화면이 마커를 선택한쪽으로 이동  
	 searchSub(mouseEvent.latLng);		//현재위치에서 가까운 지하철역 검색
    
});

function displayMarker(location)
{
	    marker = new daum.maps.Marker({ 
	    position: location,     //마커의 위치는 입력한곳
	}); 
	
}

function searchSub(position)
{
	map.setCenter(position);
	var ps = new daum.maps.services.Places(map); 
	
    // 카테고리로 지하철 검색합니다
    ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
    var arr=new Array();
    var strArr=new Array();
    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB (status, data, pagination) {
    	//alert(status);
        if (status === daum.maps.services.Status.OK) {
        	//alert("3");	
            for (var i=0; i<data.places.length; i++) {
            	//alert("4");	
            	var a=distanceSum(data.places[i]);     //마커를 출력 
            	
            	arr[i]=a; 
            	 
            	var str=a.split('/');
            	strArr[i]=str[0]; 
            	//alert(str[0]);
            }       
           strArr.sort(function(a,b){
        	   return a-b;
        		   });
         	for(var i=0;i<arr.length;i++)
         		{
         			var b=arr[i];
            		var str=b.split('/');
         			
         			if(strArr[0]==str[0])
         				{      					
         					var strLnt=str[1];
         					var strLng=str[2];
         					var strTitle=str[3];
         					
         					allTitle[j++]=str[3];
         					
         					
         					var markerPosition  = new daum.maps.LatLng(strLnt, strLng);

         					displayMarker(markerPosition);
         					//marker.setMap(map); //마커를띄운다
         					var infowindow = new daum.maps.InfoWindow({
     							 map: map,  // 인포윈도우가 표시될 지도
      							 position : markerPosition, 
      							clickable: true,
       							 content : strTitle,
      						 	 removable : true
  								 });
         					   // map.panTo(markerPosition);    //화면이 마커를 선택한쪽으로 이동     	 		    	  	 		    
        	       	 		
         				}         		
         		}
        }
    }
	
}

</script>

 	   <input type="text" name="xy" value="우리집"> 
                 <input type="text" name="xpoint"  value=37.49822162439627> 
                 <input type="text" name="ypoint" value="127.03105819665858" > 
                 <input type="button" value="입력" onclick="a()">   
                 <input type="button" value="원점이동" onclick="b()">
                 <input type="button" value="지하철구간" onclick="callAjax()">  <br/>
                 대치  37.494612 127.063642  <br/> 
                 영등포 37.515504 126.907628  <br/> 
                 서울 37.554648 126.972559  <br/> 
                 신림 37.484201 126.929715  <br/>   
 </body> 
 </html>    