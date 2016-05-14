<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="map" style="width:1200px;height:550px;"></div> 
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script> 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script> 
	var geocoder = new daum.maps.services.Geocoder();
    var cnt=0;
    var allTitle=new Array();
    var responseData;
    
	var container = document.getElementById('map'); 
 		var options = { 
 			center: new daum.maps.LatLng(37.515504, 126.907628), 
 			level: 6
 		};  		  
 		var map = new daum.maps.Map(container, options); 
 		
 		var imageSrc = 'http://127.0.0.1:8000/wtg/map/sub.png', // 마커이미지의 주소입니다    
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
 			//alert("1");
 			
 			if(cnt==0)//시작점
 			{
 				//alert("2");
 				masterMarker=marker;//맨아래에서 한번에 해결하기위해 치환
 				
 				xPoint.value=position.getLat();//맵에서 마우스로 선택한 좌표를 text출력
 	 			yPoint.value=position.getLng();
 	 			//alert("3");
 	 			searchJibun("address",mouseEvent.latLng); 
 	 			
 				var arr=new Array();
 	 		    var strArr=new Array();
 	 		   var markerPosition;
 	 		  map.setCenter(mouseEvent.latLng);
 	 			var places = new daum.maps.services.Places(map);
 	 			// 공공기관 코드 검색
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //마커를 출력 		            	
 		 		            	arr[i]=a; 	 		            	 
 		 		            	var str=a.split('/');
 		 		            	strArr[i]=str[0]; 
 		 			    	 }
 		 			    	  strArr.sort(function(a,b)
 		 			    	  {
 		 			        	   return a-b;
 		 			          });
 		 			    	 for(var i=0;i<arr.length;i++)
 		 	         		{
 		 	         			var b=arr[i];
 		 	            		var str=b.split   ('/');
 		 	         			
 		 	         			if(strArr[0]==str[0])
 		 	         				{      		
 		 	         					var strLnt=str[1];
 		 	         					var strLng=str[2];
 		 	         					var strTitle=str[3];
 		 	         				
 		 	         					allTitle[0]=str[3];
 		 	         				
 		 	         					 markerPosition  = new daum.maps.LatLng(strLnt, strLng);
 		 	         					SubMarker.setPosition(markerPosition);
 		 	         	 	 			SubMarker.setMap(map);
 	   				
 		 	         				}
 		 	         		}
 		 			    }
 		 			};
 		 			places.categorySearch('SW8', callback, {
 		 			    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
 		 			    location: mouseEvent.latLng
 		 			});
			
 			}		
 			if(cnt==1)
 			{
 				masterMarker=marker1;
 				xPoint1.value=position.getLat();
 	 			yPoint1.value=position.getLng();
 	 			
 	 			searchJibun("address1",mouseEvent.latLng);
 	 			
 	 			var arr=new Array();
 	 		    var strArr=new Array();
 	 		   var markerPosition;
 	 		  map.setCenter(mouseEvent.latLng);
 	 			var places = new daum.maps.services.Places(map);
 	 			// 공공기관 코드 검색
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //마커를 출력 		            	
 		 		            	arr[i]=a; 	 		            	 
 		 		            	var str=a.split('/');
 		 		            	strArr[i]=str[0]; 
 		 			    	 }
 		 			    	  strArr.sort(function(a,b)
 		 			    	  {
 		 			        	   return a-b;
 		 			          });
 		 			    	 for(var i=0;i<arr.length;i++)
 		 	         		{
 		 	         			var b=arr[i];
 		 	            		var str=b.split   ('/');
 		 	         			
 		 	         			if(strArr[0]==str[0])
 		 	         				{      		
 		 	         					var strLnt=str[1];
 		 	         					var strLng=str[2];
 		 	         					var strTitle=str[3];
 		 	         				
 		 	         					allTitle[1]=str[3];
 		 	         				
 		 	         					 markerPosition  = new daum.maps.LatLng(strLnt, strLng);
 		 	         					SubMarker1.setPosition(markerPosition);
 		 	         	 	 			SubMarker1.setMap(map);
 		 	         				}
 		 	         		}
 		 			    }
 		 			};
 		 			places.categorySearch('SW8', callback, {
 		 			    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
 		 			    location: mouseEvent.latLng
 		 			});
 			}
 			
 			if(cnt==2)
 			{
 				masterMarker=marker2;
 				xPoint2.value=position.getLat();
 	 			yPoint2.value=position.getLng();
 	 			
 	 			searchJibun("address2",mouseEvent.latLng);
 	 			
 	 			var arr=new Array();
 	 		    var strArr=new Array();
 	 		   var markerPosition;
 	 		  map.setCenter(mouseEvent.latLng);
 	 			var places = new daum.maps.services.Places(map);
 	 			// 공공기관 코드 검색
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //마커를 출력 		            	
 		 		            	arr[i]=a; 	 		            	 
 		 		            	var str=a.split('/');
 		 		            	strArr[i]=str[0]; 
 		 			    	 }
 		 			    	  strArr.sort(function(a,b)
 		 			    	  {
 		 			        	   return a-b;
 		 			          });
 		 			    	 for(var i=0;i<arr.length;i++)
 		 	         		{
 		 	         			var b=arr[i];
 		 	            		var str=b.split   ('/');
 		 	         			
 		 	         			if(strArr[0]==str[0])
 		 	         				{      		
 		 	         					var strLnt=str[1];
 		 	         					var strLng=str[2];
 		 	         					var strTitle=str[3];
 		 	         				
 		 	         					allTitle[2]=str[3];
 		 	         				
 		 	         					 markerPosition  = new daum.maps.LatLng(strLnt, strLng);
 		 	         					SubMarker2.setPosition(markerPosition);
 		 	         	 	 			SubMarker2.setMap(map);
 	   				
 		 	         				}
 		 	         		}
 		 			    }
 		 			};
 		 			places.categorySearch('SW8', callback, {
 		 			    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
 		 			    location: mouseEvent.latLng
 		 			});

 			}
 			if(cnt==3)
 			{
 				masterMarker=marker3;
 				xPoint3.value=position.getLat();
 	 			yPoint3.value=position.getLng();
 	 			
 	 			searchJibun("address3",mouseEvent.latLng);
 	 			
 	 			var arr=new Array();
 	 		    var strArr=new Array();
 	 		   var markerPosition;
 	 		  map.setCenter(mouseEvent.latLng);
 	 			var places = new daum.maps.services.Places(map);
 	 			// 공공기관 코드 검색
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //마커를 출력 		            	
 		 		            	arr[i]=a; 	 		            	 
 		 		            	var str=a.split('/');
 		 		            	strArr[i]=str[0]; 
 		 			    	 }
 		 			    	  strArr.sort(function(a,b)
 		 			    	  {
 		 			        	   return a-b;
 		 			          });
 		 			    	 for(var i=0;i<arr.length;i++)
 		 	         		{
 		 	         			var b=arr[i];
 		 	            		var str=b.split   ('/');
 		 	         			
 		 	         			if(strArr[0]==str[0])
 		 	         				{      		
 		 	         					var strLnt=str[1];
 		 	         					var strLng=str[2];
 		 	         					var strTitle=str[3];
 		 	         				
 		 	         					allTitle[3]=str[3];
 		 	         				
 		 	         					 markerPosition  = new daum.maps.LatLng(strLnt, strLng);
 		 	         					SubMarker3.setPosition(markerPosition);
 		 	         	 	 			SubMarker3.setMap(map);
 	   				
 		 	         				}
 		 	         		}
 		 			    }
 		 			};
 		 			places.categorySearch('SW8', callback, {
 		 			    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
 		 			    location: mouseEvent.latLng
 		 			});
 			}
 			if(cnt==4)
 			{
 				masterMarker=marker4;
 				xPoint4.value=position.getLat();
 	 			yPoint4.value=position.getLng();
 	 			
 	 			searchJibun("address4",mouseEvent.latLng);
 	 			
 	 			var arr=new Array();
 	 		    var strArr=new Array();
 	 		   var markerPosition;
 	 		  map.setCenter(mouseEvent.latLng);
 	 			var places = new daum.maps.services.Places(map);
 	 			// 공공기관 코드 검색
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //마커를 출력 		            	
 		 		            	arr[i]=a; 	 		            	 
 		 		            	var str=a.split('/');
 		 		            	strArr[i]=str[0]; 
 		 			    	 }
 		 			    	  strArr.sort(function(a,b)
 		 			    	  {
 		 			        	   return a-b;
 		 			          });
 		 			    	 for(var i=0;i<arr.length;i++)
 		 	         		{
 		 	         			var b=arr[i];
 		 	            		var str=b.split   ('/');
 		 	         			
 		 	         			if(strArr[0]==str[0])
 		 	         				{      		
 		 	         					var strLnt=str[1];
 		 	         					var strLng=str[2];
 		 	         					var strTitle=str[3];
 		 	         				
 		 	         					allTitle[4]=str[3];
 		 	         				
 		 	         					 markerPosition  = new daum.maps.LatLng(strLnt, strLng);
 		 	         					SubMarker4.setPosition(markerPosition);
 		 	         	 	 			SubMarker4.setMap(map);
 	   				
 		 	         				}
 		 	         		}
 		 			    }
 		 			};
 		 			places.categorySearch('SW8', callback, {
 		 			    // Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
 		 			    location: mouseEvent.latLng
 		 			});
 	 			

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
 		function CheckStation()
 		{
 			var firstLo;
 			var lastLo;
 			if(cnt>0&&cnt<5)
 				{

	 				var firStr=allTitle[cnt-1];
	 				var firStr1=firStr.indexOf('역');
	 				
	 				var laStr=allTitle[cnt];
	 				var laStr1=laStr.indexOf('역');
	 				
	 				 firstLo=firStr.substring(0,firStr1);
	 				 lastLo=laStr.substring(0,laStr1);		
	 				
	 				var firstStr = escape(encodeURIComponent(firstLo)); 
	 	 			var lastStr = escape(encodeURIComponent(lastLo)); 
	 	 			$.ajax({
	 	 				
	 	 	            url:"searchStation.nhn?start="+firstStr+"&end="+lastStr,
	 	 	            success:function(data){
	 	 	            	responseData=data.replace(/\s/gi, '');
	 	 	            	findStation(responseData);      	
	 	 	            }
	 	 	        })
 				}		
 		}
 		function findStation(data)
 		{			
 			var a=data.slice(0,-1);			
 			var b=a.split('/');
			//alert(b);
 			//alert(a.length);
 			for(var i=0;i<=b.length-1;i++)
 			{
 				var c=b[i].split('^');
 				//alert(c);
 				var d=c[1].split(',');
 				//alert(d[0]+"dd"+d[1]);
 				var imageSrc = 'http://127.0.0.1:8000/wtg/map/pass.png', // 마커이미지의 주소입니다    
 		 	    imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
 		 	    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
 		 	   var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
 				
 		 	    var passMkPosition=new daum.maps.LatLng(d[0],d[1]);
 				var passMarker= new daum.maps.Marker({ 
 		 			position: passMkPosition, //마커의 위치는 입력한곳
 		 			image:markerImage
 				}); 
 				passMarker.setMap(map);
 				
 			}
 			
 		}

 </script> 
 <input type="button" value="구간검색" onclick="CheckStation()">
 출발지 선택<br/>
 x좌표<input type="text" name="xPoint" ><br>
 y좌표<input type="text" name="yPoint" ><br>
 주소<input type="text" name="address"  size="50"><br>
 <input type="button" value="select" onclick="initMarker()">
 <div id="add"></div>
 