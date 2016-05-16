<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>�ڽ� ����ϱ�</title>
		<style>
			map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:310px; height:800px;margin:10px 50px 30px 0;padding:5px;overflow-x:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px; }
			.bg_white {background:#fff;}		
			#menu_wrap hr {display: block; height: 1px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
			
			.category, .category *{margin:0;padding:0;color:#000;}   
			.category {position:absolute;overflow:hidden;top:10px;left:320px;width:160px;height:53px;z-index:5;border:1px solid black;font-family:'Malgun Gothic','���� ���',sans-serif;font-size:12px;text-align:center;background-color:#fff;background:rgba(255, 255, 255, 0.7);}
			.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
			.category li{list-style:none;float:left;width:50px;height:55px;padding-top:5px;cursor:pointer;} 
			.category .ico_comm {display:block;width:50px;height:50px;} 
			.category .ico_start { background:url('http://i1.daumcdn.net/localimg/localimages/07/2013/img/red_b.png')}  
			.category .ico_pass {background:url('http://i1.daumcdn.net/localimg/localimages/07/2013/img/green_b.png');}   
			.category .ico_end {background:url('http://i1.daumcdn.net/localimg/localimages/07/2013/img/blue_b.png');} 
			
			
		</style>
		<form onsubmit="searchPlaces(); return false;">
		�˻��� : <input type="text" value="������ġ�� �����ϼ���" style="width:150px; height:25px"id="keyword" size="15"> 
                <button type="submit" style="width:60px;height:25px;">�˻��ϱ�</button> 
                
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
					  <span onclick="ShowTabex('0')" style="padding: 0pt 5px; cursor: pointer;width:140px; height:25px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �˻����</span>
					  <span onclick="ShowTabex('1')" style="padding: 0pt 5px; cursor: pointer;width:140px;height:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����Ȳ</span>
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
					var container = document.getElementById('map'); //div id=map�ڸ��� ����������			
					var options = { 
 												center: new daum.maps.LatLng(37.515504, 126.907628), 
 												level: 7
 											  };  		
					
 					var map = new daum.maps.Map(container, options); 
 					
					var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // ��Ŀ�̹����� �ּ��Դϴ�    
	 		 	    stimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					var StmarkerImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
 					
 					var startMarker = new daum.maps.Marker({
 					    map: map, // ��� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
 					    position: map.getCenter(),
 					    image:StmarkerImage,
 					    draggable: true, // ��� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
 					});
 					startMarker.setMap();
 					var edimageSrc = 'http://127.0.0.1:8000/wtg/map/blue_b.png', // ��Ŀ�̹����� �ּ��Դϴ�    
	 		 	    edimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	 		 	    edimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					EdmarkerImage = new daum.maps.MarkerImage(edimageSrc, edimageSize, edimageOption);
 					
 					var EndMarker = new daum.maps.Marker({
 					    map: map, // ���� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
 					    position:  map.getCenter(),
 					    image:EdmarkerImage,
 					    draggable: true, // ���� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
 					});
 					EndMarker.setMap();
 					var ps = new daum.maps.services.Places();
 					// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
 					function searchPlaces() {												
 						var keyword = document.getElementById('keyword').value;	
 					    if (!keyword.replace(/^\s+|\s+$/g, '')) {
 					     alert('Ű���带 �Է����ּ���!');
 					    return false;
 					    }
 					    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
 					    // keywordSearch(keyword, callback, options) (�˻�Ű����,����� ���� �ݹ��Լ�,�ɼ�)
 					    // keyword�� �˻��ϸ� placesSearchCB�� �Լ����·� ����� �޴´�.
 					    ps.keywordSearch(keyword, placesSearchCB); 							
 					}
 					
 				// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
 					function placesSearchCB(status, data, pagination){	
 							//daum.maps.services.Status.OK=�˻���� ����.

 					     if (status === daum.maps.services.Status.OK) {						
 					        // ���������� �˻��� �Ϸ������
 					        // �˻� ����� ǥ���մϴ�
 					        displayPlaces(data.places);
 					        // ������ ��ȣ�� ǥ���մϴ�
 					    	} else if (status === daum.maps.services.Status.ZERO_RESULT) {
 					       	alert('�˻� ����� �������� �ʽ��ϴ�.');
 					      	return;
 					     } 
 					 }
 				
 				    function displayPlaces(places) 
 				    {
 				        //�� ���������� id���� placesList�� ��Ҹ� ������ listEl������ �ְڴ�.
 						var listEl = document.getElementById('placesList'),  
 				    		menuEl = document.getElementById('menu_wrap'),
 				    		fragment = document.createDocumentFragment(), 					
 							bounds = new daum.maps.LatLngBounds(), 	//��ǥ���� �簢���� ������ ǥ���ϴ� ��ü�� �����Ѵ�.					
 				    		listStr = '';
 				        //���� �˻������ �����.
 						removeAllChildNods(listEl);

 				    	for ( var i=0; i<places.length; i++ )
 				    	{ 
 				    		placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude);
 				            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�		
 				            // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
 				            // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
 				            bounds.extend(placePosition);  
 							fragment.appendChild(itemEl);			
 				       	}
 						// �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
 						listEl.appendChild(fragment);
 						menuEl.scrollTop = 0;
 						// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
 						map.setBounds(bounds);
 						
 					    }
 			    
 			 	// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
 			    function getListItem(index, places) {
 				    var title = places.title;
 				    var x = places.latitude;
 				    var y = places.longitude;
 				    
 					var el = document.createElement('li');
 					var itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
 				           '<div class="info" id="'+title+"-"+x+"-"+y+'" onmouseover="openinfo(this)" onmouseout="closeinfo()">' +                                      
 				           '<h5>' + places.title + '</h5>';
 					if (places.newAddress) 
 					{ //���θ��ּ��̸�     
 						itemStr += '<span>' + places.newAddress + '</span>' + '<span class="jibun gray">' +  places.address  + '</span>'; 	
 					} 
 					else 
 					{ //�����ּ��̸�		            
 						itemStr += '<span>' +  places.address  + '</span>'; 
 					}				
 				    itemStr += '<span class="tel">' + places.phone  + '</span>' + '</div>'; 
 					var button = "<input type='button' value='�����ϱ�' id='"+title+"-"+x+"-"+y+"' onclick='choice(this);'>";
 					
 				    el.innerHTML = itemStr+button;
 				    el.className = 'item';
 				    
 				    return el;  	    
 				}  
 			 	
 			   function getPlayItem(title) 
 			   {
 				  var el = document.createElement('li');
 				  el.setAttribute("id","img"+selectCnt);
 				  var dd=el.getAttribute("id");
 				  
 				  el.innerHTML=title+'<input type="button" id="'+dd+'"value="����" onclick="deleteForm(this)">';
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
 			   

 			 	//�����ϱ� Ŭ���� ��Ŀ�� ������ �����ݴϴ�
 			    function choice(bt){
;
 			    	var a = bt.getAttribute('id');
 			    	var strArray=a.split('-');
 			    	fragment = document.createDocumentFragment();
 			    	var markerPosition  = new daum.maps.LatLng(strArray[1], strArray[2]);
 			
 			    	makePassMarker(strArray[0],markerPosition);
 				
 					ShowTabex('1');
 			
 			    } 
 			   
 			 	//�������Ʈ�� ���콺�����ÿ� ���������� ǥ��
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
 			 	
 			 	
 			    // ���� �˻� ����� ����� �Լ�
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
							
							var imageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // ��Ŀ�̹����� �ּ��Դϴ�    
			 		 	    imageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
			 		 	    imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
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

						var position=mapProjection.coordsFromContainerPoint(point); // ȭ�� ��ǥ�� �ش��ϴ� ���� ��ǥ
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
	 					    map: map, // ��� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
	 					    position: title,
	 					    image:markerImage,
	 					    draggable: true, // ��� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
	 					});
	 					passMarker.setMap(map);
	 					alert("�־Ȼ���");
	 					
	 					
					}
					else
					{
						alert("���̻� �߰��Ҽ� �����ϴ�.")
					}				
				}
				daum.maps.event.addListener(startMarker, 'dragend', function() {
				     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�
				   
				});

				
				
 			    
 				</script>
</head>
	<body>

	</body>
</html>