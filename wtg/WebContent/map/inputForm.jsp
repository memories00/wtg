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
		<form onsubmit="searchPlaces(); return false;">
		검색어 : <input type="text" value="시작위치를 선택하세요" style="width:150px; height:25px"id="keyword" size="15"> 
                <button type="submit" style="width:60px;height:25px;">검색하기</button> 
                
		<div class="map_wrap">
		    <div id="map" style="width:100%; height:900px;overflow:hidden;"></div>
		    	    <div class="category" >
		        <ul>
		            <li id="start" onmousedown="startDrag(event, 0)">
		                 <span class="ico_comm ico_start"></span>
		            </li>
		            <li id="pass" onmousedown="startDrag(event, 1)">
		                <span class="ico_comm ico_pass"></span>
		            </li>
		            <li id="end" onmousedown="startDrag(event, 2)">
		                <span class="ico_comm ico_end"></span>
		            </li>
		        </ul>
		    </div>
    <div id="menu_wrap" class="bg_white" >
        <div class="option">
            <p>
                <div >
					  <div style="border: 1px solid rgb(204, 204, 204);">
					  <span onclick="ShowTabex('0')" style="padding: 0pt 5px; cursor: pointer;width:140px; height:25px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 검색결과</span>
					  <span onclick="ShowTabex('1')" style="padding: 0pt 5px; cursor: pointer;width:140px;height:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진행상황</span>
					  </div>
					</div>
					<div style="text-align: left;">
					  <div id="tab_0" style="width: 100%; display: block;">				  
					  <hr>
					    <ul id="placesList"></ul>
					  </div>
					  <div id="tab_1" style="width: 100%; display: none;">
					    <hr>
					    <ul id="playList"></ul>
					  </div>
					</div>
            </p>
        </div>

        <ul id="placesList"></ul>
      
    </div>
</div>

  			<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script> 
				<script> 	
				<!--
				function ShowTabex(val){
				  for (i=0; i<2; i++) {
				    var tb = document.getElementById('tab_' + i);
				    if (i != val) tb.style.display = "none";
				    else tb.style.display = "block";
				  }
				}
				//-->
			

				 var selectCnt=0;
					var container = document.getElementById('map'); //div id=map자리에 지도를생성			
					var options = { 
 												center: new daum.maps.LatLng(37.515504, 126.907628), 
 												level: 7
 											  };  		
					
 					var map = new daum.maps.Map(container, options); 
 					
					var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // 마커이미지의 주소입니다    
	 		 	    stimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
	 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					var StmarkerImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
 					
 					var startMarker = new daum.maps.Marker({
 					    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
 					    position: map.getCenter(),
 					    image:StmarkerImage,
 					    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
 					});
 					startMarker.setMap();
 					var edimageSrc = 'http://127.0.0.1:8000/wtg/map/blue_b.png', // 마커이미지의 주소입니다    
	 		 	    edimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
	 		 	    edimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					EdmarkerImage = new daum.maps.MarkerImage(edimageSrc, edimageSize, edimageOption);
 					
 					var EndMarker = new daum.maps.Marker({
 					    map: map, // 종료 마커가 지도 위에 표시되도록 설정합니다
 					    position:  map.getCenter(),
 					    image:EdmarkerImage,
 					    draggable: true, // 종료 마커가 드래그 가능하도록 설정합니다
 					});
 					EndMarker.setMap();
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
 					var button = "<input type='button' value='선택하기' id='"+title+"-"+x+"-"+y+"' onclick='choice(this);'>";
 					
 				    el.innerHTML = itemStr+button;
 				    el.className = 'item';
 				    
 				    return el;  	    
 				}  
 			 	
 			   function getPlayItem(title) 
 			   {
 				  var el = document.createElement('li');
 				  el.setAttribute("id","img"+selectCnt);
 				  var dd=el.getAttribute("id");
 				  
 				  el.innerHTML=title+'<input type="button" id="'+dd+'"value="삭제" onclick="deleteForm(this)">';
 				  el.className='here';
 				  fragment = document.createDocumentFragment();
				  
 				  var listEl = document.getElementById('playList');
 				  var playEl=el;
 				  fragment.appendChild(playEl);
 				  listEl.appendChild(fragment);
 				  
			   }
 			   
 			   function deleteForm(id)
 			   {
 				   selectCnt--;
 				   var b=id.getAttribute('id');
 				   var c=document.getElementById(b);
 				   c.innerHTML="";
 				  var listEl = document.getElementById('playList');
 				  listEl.appendChild(c);
 				   //alert(b);
 			   }
 			   

 			 	//선택하기 클릭시 마커를 지도에 보여줍니다
 			    function choice(bt){
;
 			    	var a = bt.getAttribute('id');
 			    	var strArray=a.split('-');
 			    	fragment = document.createDocumentFragment();
 			    	var markerPosition  = new daum.maps.LatLng(strArray[1], strArray[2]);
 			
 			    	makePassMarker(strArray[0],markerPosition);
 				
 					ShowTabex('1');
 			
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
 			   function clickFlag(type)
 			   {
 			   		var flag=type;
 			   		alert(flag);
 			   }
 			  var img_L = 0;
				var img_T = 0;
				var targetObj;
				
				function getLeft(o){
				     return parseInt(o.style.left.replace('px', ''));
				}
				function getTop(o){
				     return parseInt(o.style.top.replace('px', ''));
				}
				
				function moveDrag(e){
				     var e_obj = window.event? window.event : e;
				     var dmvx = parseInt(e_obj.clientX + img_L);
				     var dmvy = parseInt(e_obj.clientY + img_T);
				     targetObj.style.left = dmvx +"px";
				     targetObj.style.top = dmvy +"px";
				     return false;
				}
				
				var count;
				function startDrag(e,cnt){
					count=cnt;
					var x=e.x;
					var y=e.y;
					
					var img=document.createElement("img");
					if(cnt==0)
					{
						img.setAttribute("src","map/red_b.png");
						img.setAttribute("id","imgtest");
					}
					if(cnt==1)
					{
							img.setAttribute("src","map/green_b.png");
							img.setAttribute("id","imgtest");
							
							var imageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // 마커이미지의 주소입니다    
			 		 	    imageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
			 		 	    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
							markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
					}
					if(cnt==2)
					{
						img.setAttribute("src","map/blue_b.png");
						img.setAttribute("id","imgtest");
						
					}	
					img.style.zIndex=6;
					var a=document.body.appendChild(img);
					
					img.style.position="absolute";
					img.style.left=(x-15)+"px";
					img.style.top=(y+30)+"px";
					
				     targetObj = a;
				     var e_obj = window.event? window.event : e;
				     img_L = getLeft(a) - e_obj.clientX;
				     img_T = getTop(a) - e_obj.clientY;
				     			     						
				     document.onmousemove = moveDrag;
				     document.onmouseup = stopDrag;
				     if(e_obj.preventDefault)e_obj.preventDefault(); 
				}
				
				function stopDrag(e)
				{
				var aa=document.getElementById('imgtest');
				aa.parentNode.removeChild(aa);
				     document.onmousemove = null;
				     if(document.onmouseup !=null)
				     {
				    	 var mapProjection = map.getProjection(),
						 point = new daum.maps.Point(e.x, e.y);

						var position=mapProjection.coordsFromContainerPoint(point); // 화면 좌표에 해당하는 지도 좌표
						//alert(position);
						if(count==0)
						{
							getPlayItem("start"+position); 
							startMarker.setPosition(position);
							startMarker.setMap(map);				
						}
						if(count==1)
						{
							makePassMarker("click",position);
					    }     

				     }
				     if(count==2)
				     {
				    	 getPlayItem("End"+position); 
				    	 EndMarker.setPosition(position);
				    	 EndMarker.setMap(map);
				     }
				}
				
				function makePassMarker(name,title)
				{			
					if(selectCnt<3)
					{
						selectCnt++;
						getPlayItem(name); 
						var passMarker = new daum.maps.Marker({
	 					    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
	 					    position: title,
	 					    image:markerImage,
	 					    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
	 					});
	 					passMarker.setMap(map);
	 					alert("왜안생겨");
	 					
	 					
					}
					else
					{
						alert("더이상 추가할수 없습니다.")
					}				
				}
				daum.maps.event.addListener(startMarker, 'dragend', function() {
				     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
				   
				});

				
				
 			    
 				</script>
</head>
	<body>

	</body>
</html>