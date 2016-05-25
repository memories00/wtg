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
				<li id="start"  onmousedown="startDrag(event,0)">
					<span class="ico_comm ico_start"></span>
				</li>
				<li id="pass"  onmousedown="startDrag(event,1)">
					<span class="ico_comm ico_pass"></span>
				</li>
				<li id="end"  onmousedown="startDrag(event,2)">
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
					<input type="button" value="경유지추가" onclick="addPass()">
				</div>	
					<hr>
						<ul id="placesList"></ul>	
						<input type="button" value="등록하기"  style="width:300px;height:40px;"onclick="nextStep()">		
			</div>
		</div>
</div>	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var container = document.getElementById('map'); //div id=map자리에 지도를생성			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 6
									  };  			
			var map = new daum.maps.Map(container, options); 
			var geocoder = new daum.maps.services.Geocoder();//지번을검색할대 사용
			var ps = new daum.maps.services.Places();//검색기능을 사용할때의 선언
			var cnt=0;//경유지추가시 button의 name 카운트
			var passMarkerInfo=new Array();//경유지마커들을 경유지추가버튼을 누를때생성
			
			//////////////출발지의 마커와 이미지를 미리생성//////////////
			var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // 출발마커이미지의 주소입니다    
	 		 	    stimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
	 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
	 		 	    
			var startMarker=new daum.maps.Marker({
				map:map,
				position:map.getCenter(),
				image:startImage,
				draggable:true,
				clickable:true
			});
			
			startMarker.setMap();
			
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

 					endMarker.setMap();
 					/////////////////////경유지 마커 이미지/////////////////
 					var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // 경유지마커이미지의 주소입니다    
			 		 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
			 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
							psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
		
			 		 	    
			 		 	    
			 		var passMarker0 =  new daum.maps.Marker({
				           map: map, // 마커를 표시할 지도
				           position:map.getCenter(), // 마커를 표시할 위치
				           image : psmarkerImage, // 마커 이미지
				           draggable: true
				    	});	
			 		var passMarker1 =  new daum.maps.Marker({
				           map: map, // 마커를 표시할 지도
				           position:map.getCenter(), // 마커를 표시할 위치
				           image : psmarkerImage, // 마커 이미지
				           draggable: true
				    	});
			 		var passMarker2 =  new daum.maps.Marker({
				           map: map, // 마커를 표시할 지도
				           position:map.getCenter(), // 마커를 표시할 위치
				           image : psmarkerImage, // 마커 이미지
				           draggable: true
				    	});
			 		var passMarker3 =  new daum.maps.Marker({
				           map: map, // 마커를 표시할 지도
				           position:map.getCenter(), // 마커를 표시할 위치
				           image : psmarkerImage, // 마커 이미지
				           draggable: true
				    	});
			 		var passMarker4 =  new daum.maps.Marker({
				           map: map, // 마커를 표시할 지도
				           position:map.getCenter(), // 마커를 표시할 위치
				           image : psmarkerImage, // 마커 이미지
				           draggable: true
				    	});
			 		passMarker0.setMap();
			 		passMarker1.setMap();
			 		passMarker2.setMap();
			 		passMarker3.setMap();
			 		passMarker4.setMap();
			///////////////////////////////////////////////////////////////
			var cnt=0;//경유지추가시 button의 name 카운트
			var totalStn=new Array();
			///경유지추가를 눌렀을때 동적으로 생성되는 태그들
	
			function addPass(){
				
				if(cnt<5)
				{
					//alert("add"+cnt);
					var addTag=document.getElementById("passText");
					var str='경유지:&nbsp;<input type="text" id="passKey'+cnt+'" style="width:200px" onkeypress="enterKey(event,this);"> <input type="button" id="btn/passKey'+cnt+'" value="삭제" onclick="deletePass(this)">';
					var addDiv=document.createElement('li');
					addDiv.setAttribute("id","Li/passKey"+cnt);
					addDiv.innerHTML=str;
					addTag.appendChild(addDiv);
					cnt++;
				}
				else
				{
					alert("더이상 추가할수 없습니다.")
					cnt=5;
				}


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
			     var listEl = document.getElementById('placesList');
		    		removeAllChildNods(listEl);
				//alert("11");
				//alert("cnt"+cnt);
				var parseId=LiId.getAttribute('id').toString();
				var findY=parseId.indexOf('y');
				//alert("2");
				var count=parseId.substring(findY+1,parseId.length);

				document.getElementById("passText").removeChild(LiId.parentNode);
				if(count==0){passMarker0.setMap();}
				if(count==1){passMarker1.setMap();}
				if(count==2){passMarker2.setMap();}
				if(count==3){passMarker3.setMap();}
				if(count==4){passMarker4.setMap();}
				
				count=Number(count);
				basicName[count+1]="";
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
 						if(textId.substring(0,3)=='end')
 						{
 							passCnt=0;
 						}
 						if(textId.substring(0,5)=='start')
 						{
 							passCnt=0;
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
 				            //bounds.extend(placePosition);  
 							fragment.appendChild(itemEl);			
 				       	}
 						// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
 						listEl.appendChild(fragment);
 						menuEl.scrollTop = 0;
 						// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
 						map.setLevel(6);					
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
 	 				    if(passCnt==0)//출발지,도착지를 선택했을경유
 	 				    {
 	 						var button = "<input type='button' value='출발' id='"+title+"/"+x+"/"+y+"/"+places.address+"' onclick='choice(0,this);'><input type='button' value='도착' id='"+title+"/"+x+"/"+y+"/"+places.address+"' onclick='choice(2,this);'>";
 	 				    }
 	 				    if(passCnt==1)//경유지를 추가했을경우
 	 				    {
 	 				    	var button = "<input type='button' value='경유지' id='"+title+"/"+x+"/"+y+"/"+places.address+"' onclick='choice(1,this);'>";
 	 				    }
 	 				    el.innerHTML = itemStr+button;
 	 				    el.className = 'item';
 	 				    
 	 				    return el;
 	 				}  
 	 			 	
 	 			 	var basicName=new Array();
 	 			 	
 	 			   function choice(index,bt)
 	 			   {//검색리스트에서 선택을 눌렀을경우
 	 			    	if(index==0)
 	 			    	{
 	 			    		var btnId=bt.getAttribute('id');
 	 			    		var parseId=btnId.split("/");
 	 			    		var parseAddress=parseId[3];
 	 			    		//alert(parseAddress);
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);//아이디에 합쳐져있는 위치값을가져온다
 	 			    		var tagId=document.getElementById('startKey');
 	 			    		
 	 			    		fragment = document.createDocumentFragment();
 	 			    		startMarker.setTitle(parseId[0]);//마커에 이름을 생성
 	 			    		startMarker.setPosition(markerPosition);//미리생성한 출발마커의 위치를 이동한다.
 	 			    		startMarker.setMap(map);//마커를 출력
 	 			    		tagId.value=parseId[0];	//input창에 이름을 출력
 	 			    		
 	 			    		searchSub(index,markerPosition,parseAddress);
 	 			    		
 	 			    		basicName[0]=btnId;
 	 			    		var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			    	}
 	 			   		if(index==1)
 	 			   		{	   			
	 	 			   		var btnId=bt.getAttribute('id'); 			   		
		 			    	var parseId=btnId.split("/");
		 			    	var parseAddress=parseId[3];
		 			    	//alert(parseAddress);
		 			    	var minus=1;
		 			    	var plusId=cnt-minus;
		 			    	var tagId=document.getElementById('passKey'+plusId);	 			    	
		 			    	var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
		 			    	
		 			    	basicName[cnt]=btnId;
		 			    	//alert("choice");
		 			    	//alert("brees"+cnt);
		 			    	
		 			    	
		 			    	fragment = document.createDocumentFragment();
		 			    	if(cnt==1)
							{
		 			    		//alert("marker0");
		 			    		//alert(position);
								passMarker0.setPosition(markerPosition);
								passMarker0.setMap(map);
							}
							if(cnt==2)
							{
								passMarker1.setPosition(markerPosition);
								passMarker1.setMap(map);
							}
							if(cnt==3)
							{
								passMarker2.setPosition(markerPosition);
								passMarker2.setMap(map);
							}
							if(cnt==4)
							{
								passMarker3.setPosition(markerPosition);
								passMarker3.setMap(map);
							}
							if(cnt==5)
							{
								passMarker4.setPosition(markerPosition);
								passMarker4.setMap(map);
							}
		 			    	tagId.value=parseId[0];	
		 			    	
		 			    	searchSub(index,markerPosition,parseAddress);

		 			    	var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			   		}
 	 			    	if(index==2)
 	 			    	{
 	 			    		var btnId=bt.getAttribute('id');
 	 			    		var parseId=btnId.split("/");
 	 			    		var parseAddress=parseId[3];
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
 	 			    		var tagId=document.getElementById('endKey');
 	 			    		
 	 			    		fragment = document.createDocumentFragment();
 	 			    		endMarker.setTitle(parseId[0]);
 	 			    		endMarker.setPosition(markerPosition);
 	 			    		endMarker.setMap(map);
 	 			    		
 	 			    		//tagId.value=parseId[0];	
 	 			    		
 	 			    		searchSub(index,markerPosition,parseAddress);
 	 			    		
 	 			    		basicName[cnt+1]=btnId;
 	 			    		var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			    	}
 	 				   
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
 			var endPosition;
 			
 			function searchSub(index,position,address)
			{

				map.setCenter(position);
				//alert("2");
				var ps = new daum.maps.services.Places(map); 
			    // 카테고리로 지하철 검색합니다
			    ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
			    var arr=new Array();
			    var strArr=new Array();
			    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
			   // alert("3");
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
			         						allTitle[0]=str[0]+"/"+strTitle+"/"+address+"/"+strLnt+","+strLng;

			         						if(startKey.value!="" && endKey.value!="")
			         						{
			         							//alert("여기0");
			         						     var listEl = document.getElementById('placesList');
			         				    		removeAllChildNods(listEl);
			         							CheckStation("0");
			         							checkCourse();
			         						}
			         					}
			         					if(index==1)
			         					{
			         						
			         						allTitle[cnt]=str[0]+"/"+strTitle+"/"+address+"/"+strLnt+","+strLng;
			         						CheckStation(index);
			         						
			         						if(startKey.value!="" && endKey.value!="")
			         						{
			         						
			         						     var listEl = document.getElementById('placesList');
			         				    		removeAllChildNods(listEl);
			         							CheckStation("1");
			         							checkCourse();
			         						}
			         					}
			         					if(index==2)
			         					{
			         						if(address==undefined)
			         						{
			         							address="";
			         						}			         						
			         						endInfo="도착지: "+endKey.value+"<br/>주소: "+address+"<br/> 근처역: "+strTitle+"<br/>역까지의 거리: "+str[0]+"m<br/><hr>";
			         						endPosition=strTitle;

			         						if(startKey.value!="" && endKey.value!="")
			         						{
			         							//alert("여기2");
			         						     var listEl = document.getElementById('placesList');
			         				    		removeAllChildNods(listEl);
			         							CheckStation("2");
			         							checkCourse();
			         						}
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
 			/////////////////// 여행경로를 찾는 메서드들//////////////////
 			
 			function checkCourse()
 			{	
 				//alert(allTitle.length);
 				var parseInfo=allTitle[0].split('/');//거리/역이름/주소/x,y 로 결합
 				var el = document.createElement('li');//li를 추가	 			 
 				fragment = document.createDocumentFragment();
 				var listEl = document.getElementById('placesList');//진행상황 리스트를 치환
 				
 				if(parseInfo[2]=="undefined")
 				{
 					parseInfo[2]="";				
 				}

 				var start="출발지: "+startKey.value+"<br/>주소: "+parseInfo[2]+"<br/> 근처역: "+parseInfo[1]+"<br/>역까지의 거리: "+parseInfo[0]+"m<br/><hr>";	

 				var b="";

				for(var i=1; i<allTitle.length;i++)
				{
				//	alert(allTitle[i]);
					var info=allTitle[i].split('/');
				//	alert("1"+info);
					var parseInfo=info[2];
				//	alert("2"+parseInfo);
					var name="passKey"+(i-1);
				//	alert("3"+name);
					var c=document.getElementById(name);
					if(parseInfo=="undefined")
					{
						parseInfo="";
					}

					var pass="경유지: "+c.value+"<br/> 주소: "+parseInfo+"<br/>근처역: "+info[1]+"<br/>역까지의 거리: "+info[0]+"m<br/><hr>";
					b=b+pass;
				}
				el.innerHTML=start+b+endInfo;//출발지+경유지+도착지로 결합
				fragment.appendChild(el);
				listEl.appendChild(fragment);
 			}
 			
 			
 			function CheckStation(a)
 	 		{
 				//alert("??"+cnt);
 	 			var firstLo;
 	 			var lastLo;
 	 			var endCnt=0;
 	 			//alert("????"+a);
 	 			if(a==0)
 	 			{
 	 				//alert(allTitle[0]);
 	 				var parseStr=allTitle[0].split('/');	 	 	 			
 	 	 			var parseNum=parseStr[1].indexOf('역',1);
 	 	 			var endStr=endPosition.indexOf('역',1);
	 	 			firstLo=parseStr[1].substring(0,parseNum);
	 	 			lastLo=endPosition.substring(0,endStr);	
 	 								
 	 			}
 	 			
	 	 		if(a==1)
	 	 		{
	 	 			var firStr=allTitle[cnt-1].split('/');
	 	 			var firStr1=firStr[1].indexOf('역',1);
	 		 				
	 	 			var laStr=allTitle[cnt].split('/');
	 	 			var laStr1=laStr[1].indexOf('역',1);
	 	 			
	 	 			firstLo=firStr[1].substring(0,firStr1);
	 	 			lastLo=laStr[1].substring(0,laStr1);
	 	 		}
	 	 		if(a==2)
	 	 		{
	 	 			if(allTitle.length==1)
	 	 			{
	 	 				//alert("왔니");
	 	 				var parseStr=allTitle[0].split('/');	 	 	 			
	 	 	 			var parseNum=parseStr[1].indexOf('역',1);
	 	 	 			var endStr=endPosition.indexOf('역',1);
		 	 			firstLo=parseStr[1].substring(0,parseNum);
		 	 			lastLo=endPosition.substring(0,endStr);	
		 	 			endCnt=0;
	 	 			}
	 	 			else
	 	 			{
	 	 				var parseStr=allTitle[(allTitle.length-1)].split('/');	 	 	 			
	 	 	 			var parseNum=parseStr[1].indexOf('역',1);
	 	 	 			var endStr=endPosition.indexOf('역',1);
		 	 			firstLo=parseStr[1].substring(0,parseNum);
		 	 			lastLo=endPosition.substring(0,endStr);	
		 	 			endCnt=1;
	 	 			}
	 	 		}

	 	 		var firstStr = escape(encodeURIComponent(firstLo)); 
 	 			var lastStr = escape(encodeURIComponent(lastLo)); 
 	 			$.ajax({		
 	 				url:"searchStation.nhn?start="+firstStr+"&end="+lastStr,
		 	 				success:function(data)
		 	 				{
		 	 					if(a==0)
		 	 					{
		 	 						//alert("a2");
		 	 						totalStn[0]=data.replace(/\s/gi, '');			
		 	 					}
		 	 					if(a==1)
		 	 					{
		 	 						//alert("a1");
		 	 						totalStn[cnt-1]=data.replace(/\s/gi, '');
		 	 					}
		 	 					if(a==2 && endCnt==0)
		 	 					{
		 	 						//alert("a2-0");
		 	 						totalStn[0]=data.replace(/\s/gi, '');
		 	 					}
		 	 					if(a==2 && endCnt==1)
		 	 					{
		 	 						//alert("배열의길이"+totalStn.length);
		 	 						//alert("a2-1");
		 	 						totalStn[totalStn.length]=data.replace(/\s/gi, '');
		 	 					}
		 	 					
		 	 				}
 		 	 	        })
 	 		}
 			function nextStep()
 			{
 				//alert(basicName.length);
 				location.href="insertTable.nhn?basicName="+basicName;

 			}
/////////////////////////////////////////////// 
			var cateTotal;
			
			function startDrag(e,cateCnt)
			{
				cateTotal=cateCnt;
				var x=e.x;
				var y=e.y;
					
				var img=document.createElement("img");
				if(cateCnt==0)//선택한 깃발에따리 이미지를 생성해주고 생성한 이미지에 id를 추가
				{
					img.setAttribute("src","map/red_b.png");
					img.setAttribute("id","imgtest");
				}
				if(cateCnt==1)
				{
					img.setAttribute("src","map/green_b.png");
					img.setAttribute("id","imgtest");
				}
				if(cateCnt==2)
				{
					img.setAttribute("src","map/blue_b.png");
					img.setAttribute("id","imgtest");
				}	
					img.style.zIndex=6;
					var a=document.body.appendChild(img);
					
					img.style.position="absolute";
					img.style.left=(x-5)+"px";
					img.style.top=(y-60)+"px";
					
				     targetObj = a;
				     var e_obj = window.event? window.event : e;
				     img_L = getLeft(a) - e_obj.clientX;
				     img_T = getTop(a) - e_obj.clientY;
				     			     						
				     document.onmousemove = moveDrag;
				     document.onmouseup = stopDrag;
				     
				     if(e_obj.preventDefault)e_obj.preventDefault(); 
				}
				
			function moveDrag(e)   //깃발카테고리에서 이미지들을 이동할때
			{
			     var e_obj = window.event? window.event : e;
			     var dmvx = parseInt(e_obj.clientX + img_L);
			     var dmvy = parseInt(e_obj.clientY + img_T);
			     targetObj.style.left = dmvx +"px";
			     targetObj.style.top = dmvy +"px";
			     return false;
			}
			
			function stopDrag(e)//이동한 이미지가 멈췄을때 실행
			{
				var aa=document.getElementById('imgtest');//화면에 출력되어있는 이미지의 아이디값을 치환
				aa.parentNode.removeChild(aa);//이미지를 삭제
			     document.onmousemove = null;
			    
				if(document.onmouseup !=null)
			     {
			    	 var mapProjection = map.getProjection(),
					 point = new daum.maps.Point(e.x, e.y);//모니터상의 px을 지도상의 좌표로 변환

					var position=mapProjection.coordsFromContainerPoint(point); // 화면 좌표에 해당하는 지도 좌표
					//alert(position);
					if(cateTotal==0)
					{
							//startMarker.setTitle(parseId[0]);//마커에 이름을 생성
	 			    		startMarker.setPosition(position);//미리생성한 출발마커의 위치를 이동한다.
	 			    		startMarker.setMap(map);//마커를 출력
	 			    		var address=searchJibun(position,cateTotal);
	 			    		searchSub(cateTotal,position,address);
	 			    		
	 			    	//basicName[0]=address+"-"+position.getLat()+"-"+position.getLng()+"-"+address;
  		
					}
					
					if(cateTotal==1)
					{
						//alert("stop"+cateTotal);
						addPass();
						var address;
						if(cnt==1)
						{
							passMarker0.setPosition(position);
							passMarker0.setMap(map);
							address=searchJibun(position,cateTotal,0);
						}
						if(cnt==2)
						{
							passMarker1.setPosition(position);
							passMarker1.setMap(map);
							address=searchJibun(position,cateTotal,1);
						}
						if(cnt==3)
						{
							passMarker2.setPosition(position);
							passMarker2.setMap(map);
							address=searchJibun(position,cateTotal,2);
						}
						if(cnt==4)
						{
							passMarker3.setPosition(position);
							passMarker3.setMap(map);
							address=searchJibun(position,cateTotal,3);
						}
						if(cnt==5)
						{
							passMarker4.setPosition(position);
							passMarker4.setMap(map);
							address=searchJibun(position,cateTotal,4);
						}
						
						//alert(address);
 			    		searchSub(cateTotal,position,address);
 			    		

				    }     
			    
					if(cateTotal==2)
			     	{
						var listEl = document.getElementById('placesList');
				    		removeAllChildNods(listEl);
						//endMarker.setTitle(parseId[0]);
	 			    	endMarker.setPosition(position);
	 			    	endMarker.setMap(map);	
	 			    	var address=searchJibun(position,cateTotal);
 			    		searchSub(cateTotal,position,address);
 			    		//basicName[cnt+1]=address+"-"+position.getLat()+"-"+position.getLng()+"-"+address;

			     	}				
				}
			}
			
			var img_L = 0;
		   	var img_T = 0;
			var targetObj;
				
			function getLeft(o)
			{
			     return parseInt(o.style.left.replace('px', ''));
			}
			function getTop(o)
			{
			     return parseInt(o.style.top.replace('px', ''));
			}
			
			function searchJibun(position,cateCnt,drag)
	 		{
				var jibunResult;
	 			var callback = function(status, result) { //선택된 좌표를 기준으로 주소를 검색	  
	 				if (status === daum.maps.services.Status.OK) 
	 				{
	 					
	 					 if(cateCnt==0)
	 					 {
	 						 startKey.value= result[0].jibunAddress.name;
	 						basicName[0]=result[0].jibunAddress.name+"/"+position.getLat()+"/"+position.getLng()+"/"+result[0].jibunAddress.name;
	 					 } 
	 					
		 			     if(cateCnt==1)
	 					 {
		 			      	if(drag==0){passKey0.value=result[0].jibunAddress.name;}
		 			      	if(drag==1){passKey1.value=result[0].jibunAddress.name;}
		 			      	if(drag==2){passKey2.value=result[0].jibunAddress.name;}
		 			   	  	if(drag==3){passKey3.value=result[0].jibunAddress.name;}
		 			      	if(drag==4){passKey4.value=result[0].jibunAddress.name;}
		 			      	basicName[cnt]=result[0].jibunAddress.name+"/"+position.getLat()+"/"+position.getLng()+"/"+result[0].jibunAddress.name;
		 			      	alert("쉼표가어딨냐"+result[0].jibunAddress.name);
		 			  
		 			    	  
	 				 	 }
		 			    if(cateCnt==2)
	 					 {
		 			    	//alert("지번검색2");
	 						 endKey.value= result[0].jibunAddress.name;
	 						basicName[cnt+1]=result[0].jibunAddress.name+"/"+position.getLat()+"/"+position.getLng()+"/"+result[0].jibunAddress.name;
	 					 }
		 			  
		 			   jibunResult=result[0].jibunAddress.name;
		 			
		 			    }   
		 			};
		 			geocoder.coord2detailaddr(position, callback);		
		 			return jibunResult;
	 		}
			daum.maps.event.addListener(startMarker, 'dragend', function(mouseEvent) {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
			        var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
			     var position=startMarker.getPosition();
			     var address=searchJibun(position,cateTotal);
		    		searchSub(cateTotal,position,address);
			     
			     
			});
			daum.maps.event.addListener(endMarker, 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
			     var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
				 var position=endMarker.getPosition();
			     var address=searchJibun(position,cateTotal);
		    		searchSub(cateTotal,position,address);
			});
			
			daum.maps.event.addListener(passMarker0, 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다  
			     //alert("1");
			     var listEl = document.getElementById('placesList');
 			    		removeAllChildNods(listEl);
	 	 		 var position=passMarker0.getPosition();
			     var address=searchJibun(position,1,0);

		    		searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker1, 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다    
			     var listEl = document.getElementById('placesList');
			    		removeAllChildNods(listEl);
	 	 		 var position=passMarker1.getPosition();
			     var address=searchJibun(position,1,1);

		    		searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker2, 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다    
			     var listEl = document.getElementById('placesList');
			    		removeAllChildNods(listEl);
	 	 		 var position=passMarker2.getPosition();
			     var address=searchJibun(position,1,2);

		    		searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker3, 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다    
			     var listEl = document.getElementById('placesList');
			    		removeAllChildNods(listEl);
	 	 		 var position=passMarker3.getPosition();
			     var address=searchJibun(position,1,3);

		    		searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker4, 'dragend', function() {
			     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다    
			     var listEl = document.getElementById('placesList');
			    		removeAllChildNods(listEl);
	 	 		 var position=passMarker4.getPosition();
			     var address=searchJibun(position,1,4);

		    		searchSub("1",position,address);
			});
	
	</script>
<body>
 	

</body>
</html>