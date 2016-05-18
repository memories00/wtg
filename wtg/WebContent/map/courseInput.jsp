<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>코스등록하기</title>

	<style>
			map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:310px; height:800px;margin:10px 50px 30px 0;padding:5px;overflow-x:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px; }
			.bg_white {background:#fff;}		
			#menu_wrap hr {display: block; height: 1px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
			
			.category, .category *{margin:0;padding:0;color:#000;}   
			.category {position:absolute;overflow:hidden;top:10px;left:320px;width:160px;height:53px;z-index:5;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;background:rgba(255, 255, 255, 0.7);}
			.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
			.category li{list-style:none;float:left;width:50px;height:55px;padding-top:5px;cursor:pointer;} 
			.category .ico_comm {display:block;width:50px;height:50px;} 
			.category .ico_start { background:url('http://i1.daumcdn.net/localimg/localimages/07/2013/img/red_b.png')}  
			.category .ico_pass {background:url('http://i1.daumcdn.net/localimg/localimages/07/2013/img/green_b.png');}   
			.category .ico_end {background:url('http://i1.daumcdn.net/localimg/localimages/07/2013/img/blue_b.png');} 				
	</style>
</head>
<div class="map_wrap">
	<div id="map" style="width:100%; height:900px;overflow:hidden;"></div>
		<div class="category">
			<ul>
				<li id="start" >
					<span class="ico_comm ico_start"></span>
				</li>
				<li id="pass" >
					<span class="ico_comm ico_pass"></span>
				</li>
				<li id="end" >
					<span class="ico_comm ico_end"></span>
				</li>
			</ul>
		</div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<br/>
				출발지:&nbsp; <input type="text" id="startKey" style="width:200px" onkeypress="enterKey(event,this);">		
					<ul id="passText">
					</ul>
				도착지:&nbsp; <input type="text" id="endKey" style="width:200px" onkeypress="enterKey(event,this);">
				<br/>
				<div align="right">
					<input type="button" value="경유지추가" onclick="addPass()"><input type="button" value="코스확인" onclick="checkCourse()"> 
				</div>	
					<hr>
						<ul id="placesList"></ul>			
			</div>
		</div>
</div>	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var container = document.getElementById('map'); //div id=map자리에 지도를생성			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 8
									  };  			
			var map = new daum.maps.Map(container, options); 
			var ps = new daum.maps.services.Places();//검색기능을 사용할때의 선언
			var cnt=0;//경유지추가시 button의 name 카운트
			var passMarkerInfo;//경유지마커들을 경유지추가버튼을 누를때생성
			
			//////////////출발지의 마커와 이미지를 미리생성//////////////
			var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // 출발마커이미지의 주소입니다    
	 		 	    stimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
	 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
	 		 	    
			var startMarker=new daum.maps.Marker({
				map:map,
				position:map.getCenter(),
				image:startImage,
				draggable:true
			});
			
			var stnStMarker=new daum.maps.Marker({//시작역의 마커
				map:map,
				position:map.getCenter(),
				draggable:true
			});
			
			startMarker.setMap();
			stnStMarker.setMap();
			
			//////////////////////도착지의 마커와 이미지를 미리생성//////////////////////////
			var endimageSrc = 'http://127.0.0.1:8000/wtg/map/blue_b.png', // 도착지마커이미지의 주소입니다    
	 		 	    endimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
	 		 	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
 					
 					var endMarker = new daum.maps.Marker({
 					    map: map, // 종료 마커가 지도 위에 표시되도록 설정합니다
 					    position:  map.getCenter(),
 					    image:endImage,
 					    draggable: true, // 종료 마커가 드래그 가능하도록 설정합니다
 					});
 					
 					var stnEndMarker = new daum.maps.Marker({//도착역의 마커를 미리생성
 					    map: map, // 종료 마커가 지도 위에 표시되도록 설정합니다
 					    position:  map.getCenter(),
 					    draggable: true, // 종료 마커가 드래그 가능하도록 설정합니다
 					});
 					
 					endMarker.setMap();
 					stnEndMarker.setMap();
 					/////////////////////경유지 마커 이미비/////////////////
 					var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // 경유지마커이미지의 주소입니다    
			 		 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
			 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
							psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
			///////////////////////////////////////////////////////
			////////지하철역에 사용될 마커를 위한 배열선언//////
			var cnt=0;//경유지추가시 button의 name 카운트
			var passMarkerInfo;//경유지마커들을 경유지추가버튼을 누를때생성
			var stnPassMarker;//경유지마커들을 경유지추가버튼을 누를때생성
			
			
			///경유지추가를 눌렀을때 동적으로 생성되는 태그들
			
			function addPass(){
				var addTag=document.getElementById("passText");
				var str='경유지:&nbsp;<input type="text" id="passKey'+cnt+'" style="width:200px" onkeypress="enterKey(event,this);"> <input type="button" id="btn/passKey'+cnt+'" value="삭제" onclick="deletePass(this)">';
				var addDiv=document.createElement('li');
				addDiv.setAttribute("id","Li/passKey"+cnt);
				addDiv.innerHTML=str;
				addTag.appendChild(addDiv);
				
				passMarkerInfo=[//경유지 마커를 생성하기위한 배열
			    	                    {
			    	                    	variable:'passMarker'+cnt,  	        //경유지마커의 이름을 Cnt에따라 증가하여 만든다            	
			    	                    }];
				
				stnPassMarker=[
	    	                    {
	    	                    	variable:'stnPassMarker'+cnt,  	                    	
	    	                    }];
			   	
 		 	    passMarkerInfo[0].variable = new daum.maps.Marker({
			           map: map, // 마커를 표시할 지도
			           position:map.getCenter(), // 마커를 표시할 위치
			           image : psmarkerImage // 마커 이미지 
			    	});
 		 	  passMarkerInfo[0].variable.setMap();
 		 	  
 		 	stnPassMarker[0].variable = new daum.maps.Marker({
		           map: map, // 마커를 표시할 지도
		           position:map.getCenter(), // 마커를 표시할 위치
		    	});
 		 	stnPassMarker[0].variable.setMap();
 		 	  
 		 	  
				cnt++;
			}
			/////////////input Text에서 ender키입력을 했을경우
			 function enterKey(e,here){
			      if(e.keyCode == 13){  //enter key입력	
			    	  var textId=here.getAttribute('id');//선택한 버튼의 아이디
			    	  searchPlaces(textId);
			      }
			   }
			function deletePass(LiId)
			{
				document.getElementById("passText").removeChild(LiId.parentNode);
				//alert(c);
			}
			
			///////////////////////////////////
			/////////////////////// 키워드 검색을 요청하는 메서드//////////////////
			var passCnt=0;
 					function searchPlaces(textId) {
 						var keyword = document.getElementById(textId).value;	
 						if (!keyword.replace(/^\s+|\s+$/g, '')) {
 					     alert('키워드를 입력해주세요!');
 					    return false;
 					    }
 						//alert(textId.substring(0,4));
 						if(textId.substring(0,4)=='pass')
 						{
 							passCnt=1;
 						}
 					    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
 					    // keywordSearch(keyword, callback, options) (검색키워드,결과를 받을 콜백함수,옵션)
 					    // keyword로 검색하면 placesSearchCB의 함수형태로 결과를 받는다.
 					    ps.keywordSearch(keyword, placesSearchCB); 							
 					}
 					
 				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
 					function placesSearchCB(status, data, pagination){	
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
 				
 				    function displayPlaces(places) 
 				    {
 				        //이 문서내에서 id값이 placesList인 요소를 가져와 listEl변수에 넣겠다.
 						var listEl = document.getElementById('placesList'),  
 				    		menuEl = document.getElementById('menu_wrap'),
 				    		fragment = document.createDocumentFragment(), 					
 							bounds = new daum.maps.LatLngBounds(), 	//좌표계의 사각영역 정보를 표현하는 객체를 생성한다.					
 				    		listStr = '';
 				        //이전 검색목록을 지운다.
 						removeAllChildNods(listEl);

 				    	for ( var i=0; i<places.length; i++ )
 				    	{ 
 				    		placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude);
 				            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다		
 				            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
 				            // LatLngBounds 객체에 좌표를 추가합니다
 				           // alert(placePosition);
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
 	 					if (places.newAddress) 
 	 					{ //도로명주소이면     
 	 						itemStr += '<span>' + places.newAddress + '</span>' + '<span class="jibun gray">' +  places.address  + '</span>'; 	
 	 					} 
 	 					else 
 	 					{ //지번주소이면		            
 	 						itemStr += '<span>' +  places.address  + '</span>'; 
 	 					}				
 	 				    itemStr += '<span class="tel">' + places.phone  + '</span>' + '</div>'; 
 	 				    if(passCnt==0)
 	 				    {
 	 						var button = "<input type='button' value='출발' id='"+title+"-"+x+"-"+y+"' onclick='choice(0,this);'><input type='button' value='도착' id='"+title+"-"+x+"-"+y+"' onclick='choice(2,this);'>";
 	 				    }
 	 				    else
 	 				    {
 	 				    	var button = "<input type='button' value='경유지' id='"+title+"-"+x+"-"+y+"' onclick='choice(1,this);'>";
 	 				    }
 	 				    el.innerHTML = itemStr+button;
 	 				    el.className = 'item';
 	 				    
 	 				    return el;
 	 				}  
 	 			 	
 	 			   function choice(index,bt){//검색리스트에서 선택을 눌렀을경우
 	 			    	if(index==0)
 	 			    	{
 	 			    		var btnId=bt.getAttribute('id');
 	 			    		var parseId=btnId.split('-');
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
 	 			    		var tagId=document.getElementById('startKey');
 	 			    		
 	 			    		fragment = document.createDocumentFragment();
 	 			    		startMarker.setTitle(parseId[0]);
 	 			    		startMarker.setPosition(markerPosition);//미리생성한 출발마커의 위치를 이동한다.
 	 			    		startMarker.setMap(map);//마커를 출력
 	 			    		tagId.value=parseId[0];	//input창에 이름을 출력
 	 			    		
 	 			    		searchSub(index,markerPosition);
 	 			    		
 	 			    		var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			    	}
 	 			   		if(index==1)
 	 			   		{	   			
	 	 			   		var btnId=bt.getAttribute('id'); 			   		
		 			    	var parseId=btnId.split('-');
		 			    	var minus=1;
		 			    	var plusId=cnt-minus;
		 			    	var tagId=document.getElementById('passKey'+plusId);	 			    	
		 			    	var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
		 			    	
		 			    	fragment = document.createDocumentFragment();
		 			    	passMarkerInfo[0].variable.setTitle(parseId[0]);
		 			    	passMarkerInfo[0].variable.setPosition(markerPosition);
		 			    	passMarkerInfo[0].variable.setMap(map);
		 			    	tagId.value=parseId[0];	
		 			    	
		 			    	searchSub(index,markerPosition);
		 			    	
		 			    	var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			   		}
 	 			    	if(index==2)
 	 			    	{
 	 			    		var btnId=bt.getAttribute('id');
 	 			    		var parseId=btnId.split('-');
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
 	 			    		var tagId=document.getElementById('endKey');
 	 			    		
 	 			    		fragment = document.createDocumentFragment();
 	 			    		endMarker.setTitle(parseId[0]);
 	 			    		endMarker.setPosition(markerPosition);
 	 			    		endMarker.setMap(map);
 	 			    		tagId.value=parseId[0];	
 	 			    		
 	 			    		searchSub(index,markerPosition);
 	 			    		
 	 			    		var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			    	}
 	 				   
 	 				   var a = bt.getAttribute('id');
 	 			    	var strArray=a.split('-');
 	 			    	fragment = document.createDocumentFragment();
 	 			    	var markerPosition  = new daum.maps.LatLng(strArray[1], strArray[2]);
 	 			
 	 			    	makePassMarker(strArray[0],markerPosition);//경유기 마커들을 추가한다.
 	 			    } 
 	 			 	
 	 			  function removeAllChildNods(el) {   
 	 			        while (el.hasChildNodes()) {
 	 			            el.removeChild (el.lastChild);
 	 			        }
 	 			    }
 			/////////검색에 관한 메서드들끝//////////////////////////////////////////\
 			//////////근처의 지하철역을 검색/////////////////////////
 			var allTitle=new Array();
 			var endInfo;
 			function searchSub(index,position)
			{
				map.setCenter(position);
				var ps = new daum.maps.services.Places(map); 
			    // 카테고리로 지하철 검색합니다
			    ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
			    var arr=new Array();
			    var strArr=new Array();
			    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
			    function placesSearchCB (status, data, pagination) 
			    {
			    	//alert(status);
			        if (status === daum.maps.services.Status.OK) 
			        {	        	
			            for (var i=0; i<data.places.length; i++) 
			            {		            	
			            	var a=distanceSum(data.places[i]);     //마커를 출력 
			            	arr[i]=a;
			            	var str=a.split('/');
			            	strArr[i]=str[0]; 
			            } 
			            strArr.sort(function(a,b){ 	   return a-b; 		   });
			         	
			            for(var i=0;i<arr.length;i++)
			            {
			         			var b=arr[i];
			            		var str=b.split('/');
			         			
			         			if(strArr[0]==str[0])
			         			{      					
			         					var strLnt=str[1];
			         					var strLng=str[2];
			         					var strTitle=str[3];
			         					var markerPosition=new daum.maps.LatLng(strLnt,strLng);
			         					
			         					if(index==0)
			         					{
			         						allTitle[0]=str[0]+"/"+strTitle+"/"+strLnt+","+strLng;
			         						stnStMarker.setTitle(strTitle);
			         						stnStMarker.setPosition(markerPosition);
			         						stnStMarker.setMap(map);
			         					}
			         					if(index==1)
			         					{
			         						alert(cnt);
			         						allTitle[cnt]=str[0]+"/"+strTitle+"/"+strLnt+","+strLng;
			         						stnPassMarker[0].variable.setTitle(strTitle);
			         						stnPassMarker[0].variable.setPosition(markerPosition);
			         						stnPassMarker[0].variable.setMap(map);
			         					}
			         					if(index==2)
			         					{
			         						endInfo=str[0]+"/"+strTitle+"/"+strLnt+","+strLng;
			         						stnEndMarker.setTitle(strTitle);
			         						stnEndMarker.setPosition(markerPosition);
			         						stnEndMarker.setMap(map);
			         					}	
			         			}         		
			         	}
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
 			////////////////////지하철검색 메서드끝///////////////////////////
 			function checkCourse()
 			{	
 				var parseInfo=allTitle[0].split('/');//거리/역이름/x,y 로 결합
 				var el = document.createElement('li');//li를 추가	 			 
 				fragment = document.createDocumentFragment();
 				var listEl = document.getElementById('placesList');//진행상황 리스트를 치환					 
 					
 				var start="출발지: "+startKey.value+"<br/> 근처역: "+parseInfo[1]+"<br/>역까지의 거리: "+parseInfo[0]+"m";	
 				el.innerHTML=start;
 				fragment.appendChild(el);
 				
				for(var i=1; i<allTitle.length;i++)
				{
			
				}

 			}
 			
 			
	</script>

<body>
 	

</body>
</html>