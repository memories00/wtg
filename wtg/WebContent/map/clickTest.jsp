<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="map" style="width:1200px;height:550px;"></div> 
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=724958f2e1f7b67c37acebb26e173723&libraries=services"></script> 
<script> 
	var geocoder = new daum.maps.services.Geocoder();
    var cnt=0;
    var j=0;
    var allTitle=new Array();
    
	var container = document.getElementById('map'); 
 		var options = { 
 			center: new daum.maps.LatLng(37.515504, 126.907628), 
 			level: 6
 		};  		  
 		var map = new daum.maps.Map(container, options); 
 		
 		var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
 	    imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
 	    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
 	   var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
 		
 		//장소에 대한 마커를 미리생성 상태는 setMap(null)
 		var marker= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 			}); 
 		var marker1= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 		});
 		var marker2= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 		}); 
 		var marker3= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 		}); 
 		var marker4= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 		});
 		
 		//지하철 역에 대한 마커를 미리생성 상태는 setMap(null)
 		var SubMarker= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 			image: markerImage 
 			}); 
 		var SubMarker1= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 			image: markerImage
 		});
 		var SubMarker2= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 			image: markerImage
 		}); 
 		var SubMarker3= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 			image: markerImage
 		}); 
 		var SubMarker4= new daum.maps.Marker({ 
 			position: map.getCenter(), //마커의 위치는 입력한곳
 			image: markerImage
 		});
 		
	
 		daum.maps.event.addListener(map, 'click', function(mouseEvent)//마우스 클릭이벤트 
 		 { 
 			var position=mouseEvent.latLng;
 			var masterMarker;
 			
 			
 			if(cnt==0)//시작점
 			{
 				masterMarker=marker;//맨아래에서 한번에 해결하기위해 치환
 				
 				xPoint.value=position.getLat();//맵에서 마우스로 선택한 좌표를 text출력
 	 			yPoint.value=position.getLng();
 				
 	 			searchJibun("address",mouseEvent.latLng); 
 	 			
 	 			var subMaster=searchSub(mouseEvent.latLng);
 	 			SubMarker.setPosition(subMaster);
 	 			SubMarker.setMap(map);
	 	 			
 			}		
 			if(cnt==1)
 			{
 				masterMarker=marker1;
 				xPoint1.value=position.getLat();
 	 			yPoint1.value=position.getLng();
 	 			
 	 			searchJibun("address1",mouseEvent.latLng);
 	 			
 	 			var subMaster=searchSub(mouseEvent.latLng);
 	 			SubMarker1.setPosition(subMaster);
 	 			SubMarker1.setMap(map);
 	 			
 			}
 			
 			if(cnt==2)
 			{
 				masterMarker=marker2;
 				xPoint2.value=position.getLat();
 	 			yPoint2.value=position.getLng();
 	 			
 	 			searchJibun("address2",mouseEvent.latLng);
 	 			
 	 			var subMaster=searchSub(mouseEvent.latLng);
 	 			SubMarker2.setPosition(subMaster);
 	 			SubMarker2.setMap(map);

 			}
 			if(cnt==3)
 			{
 				masterMarker=marker3;
 				xPoint3.value=position.getLat();
 	 			yPoint3.value=position.getLng();
 	 			
 	 			searchJibun("address3",mouseEvent.latLng);
 	 			
 	 			var subMaster=searchSub(mouseEvent.latLng);
 	 			SubMarker3.setPosition(subMaster);
 	 			SubMarker3.setMap(map);
 	 			

 			}
 			if(cnt==4)
 			{
 				masterMarker=marker4;
 				xPoint4.value=position.getLat();
 	 			yPoint4.value=position.getLng();
 	 			
 	 			searchJibun("address4",mouseEvent.latLng);
 	 			
 	 			var subMaster=searchSub(mouseEvent.latLng);
 	 			SubMarker4.setPosition(subMaster);
 	 			SubMarker4.setMap(map);
 	 			

 			}
 			masterMarker.setPosition(position); //목적지 마커를 이동
 			masterMarker.setMap(map);//목적지 마커를 출력
 			
 		 });
 		
 		function initMarker()
 		{
 			cnt++;		//select를 누를때마다 증가 
 			var addForm=document.getElementById("add");
 			if(cnt<5)
 			{
 				var str='경유지'+cnt+'<br/>x좌표<input type="text" name="xPoint'+cnt+'"/><br/>y좌표<input type="text" name="yPoint'+cnt+'"/><input type="button" value="select" onclick="initMarker()">'
 							+'<br><input type="text" name="address'+cnt+'"size="50"/>';
 				if(cnt==4)
 				{
 					var str='도착지<br/>x좌표<input type="text" name="xPoint'+cnt+'"/><br/>y좌표<input type="text" name="yPoint'+cnt+'"/><input type="button" value="select" onclick="initMarker()">'
 					+'<br><input type="text" name="address'+cnt+'"size="50"/>';
 				}
 				
 				var addedDiv=document.createElement("div");//요소를 생성
 	 			addedDiv.setAttribute("id","keyword_Frm");
 	 			addedDiv.innerHTML=str;//str을 대입
 	 			addForm.appendChild(addedDiv);//출력
 			}
 			else if(cnt>4)    //출력창이 5개일때
 			{
 				alert("더이상 추가할수 없습니다");
 				cnt=4;
 			}			
 		}
 		
 		function searchJibun(addName,position)
 		{
 			var name=document.getElementsByName(addName)[0];
 			var callback = function(status, result) { //선택된 좌표를 기준으로 주소를 검색
	 			    if (status === daum.maps.services.Status.OK) {
	 			        // 요청위치에 건물이 없는 경우 도로명 주소는 빈값입니다
	 			       name.value=result[0].jibunAddress.name;//주소창에 주소를 출력 지번
	 			    }   
	 			};
	 			geocoder.coord2detailaddr(position, callback);			
 		}
 		
 		function searchSub(mouseEvent)
 		{			
 			//alert(addSub);
 			//alert("1");
 			var arr=new Array();
 		    var strArr=new Array();
 		   var markerPosition;
 		  //  alert("1-1");
 		  map.setCenter(mouseEvent);
 		  // alert("1-2");
 			var places = new daum.maps.services.Places(map);
 			// 공공기관 코드 검색
 			//alert("2");
 			
	 			var callback = function(status, result)
	 			{
	 				//alert("3");
	 			    if (status === daum.maps.services.Status.OK)
	 			    {
	 			    	//alert(status);
	 			    	 for (var i=0; i<result.places.length; i++) 
	 			    	 {	 			    		 
	 			    		var a=distanceSum(result.places[i]);     //마커를 출력 		            	
	 		            	arr[i]=a; 	 		            	 
	 		            	var str=a.split('/');
	 		            	strArr[i]=str[0]; 
	 		            	//alert(arr[i]);
	 			    	 }
	 			    	  strArr.sort(function(a,b)
	 			    	  {
	 			        	   return a-b;
	 			          });
	 			    	 // alert(strArr[0]);
	 			    	 for(var i=0;i<arr.length;i++)
	 	         		{
	 	         			var b=arr[i];
	 	            		var str=b.split   ('/');
	 	         			
	 	         			if(strArr[0]==str[0])
	 	         				{      		
	 	         				//alert(str[0]);
	 	         					var strLnt=str[1];
	 	         					var strLng=str[2];
	 	         					var strTitle=str[3];
	 	         				
	 	         					allTitle[j++]=str[3];
	 	         					
	 	         					//alert(strLnt+strLng+strTitle);
	 	         					 markerPosition  = new daum.maps.LatLng(strLnt, strLng);
   				
	 	         				}
	 	         		}
	 			    }
	 			};
	 			
	 			places.categorySearch('SW8', callback, {
	 			    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
	 			    location: mouseEvent
	 			});
				alert("dd");
	 			return markerPosition;
 		}
 
 		
 		
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

 </script> 
 출발지 선택<br/>
 x좌표<input type="text" name="xPoint" ><br>
 y좌표<input type="text" name="yPoint" ><br>
 주소<input type="text" name="address"  size="50"><br>
 <input type="button" value="select" onclick="initMarker()">
 <div id="add"></div>
 