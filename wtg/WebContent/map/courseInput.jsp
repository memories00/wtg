<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ڽ�����ϱ�</title>

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
				�����:&nbsp; <input type="text" id="startKey" style="width:200px" onkeypress="enterKey(event,this);">		
					<ul id="passText">
					</ul>
				������:&nbsp; <input type="text" id="endKey" style="width:200px" onkeypress="enterKey(event,this);">
				<br/>
				<div align="right">
					<input type="button" value="�������߰�" onclick="addPass()">
				</div>	
					<hr>
						<ul id="placesList"></ul>	
						<input type="button" value="����ϱ�"  style="width:300px;height:40px;"onclick="nextStep()">		
			</div>
		</div>
</div>	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
		var container = document.getElementById('map'); //div id=map�ڸ��� ����������			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 8
									  };  			
			var map = new daum.maps.Map(container, options); 
			var geocoder = new daum.maps.services.Geocoder();//�������˻��Ҵ� ���
			var ps = new daum.maps.services.Places();//�˻������ ����Ҷ��� ����
			var cnt=0;//�������߰��� button�� name ī��Ʈ
			var passMarkerInfo;//��������Ŀ���� �������߰���ư�� ����������
			
			//////////////������� ��Ŀ�� �̹����� �̸�����//////////////
			var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // ��߸�Ŀ�̹����� �ּ��Դϴ�    
	 		 	    stimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
	 		 	    
			var startMarker=new daum.maps.Marker({
				map:map,
				position:map.getCenter(),
				image:startImage,
				draggable:true
			});
			
			var stnStMarker=new daum.maps.Marker({//���ۿ��� ��Ŀ
				map:map,
				position:map.getCenter(),
				draggable:true
			});
			
			startMarker.setMap();
			stnStMarker.setMap();
			
			//////////////////////�������� ��Ŀ�� �̹����� �̸�����//////////////////////////
			var endimageSrc = 'http://127.0.0.1:8000/wtg/map/blue_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
	 		 	    endimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	 		 	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
 					
 					var endMarker = new daum.maps.Marker({
 					    map: map, // ���� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
 					    position:  map.getCenter(),
 					    image:endImage,
 					    draggable: true, // ���� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
 					});
 					
 					var stnEndMarker = new daum.maps.Marker({//�������� ��Ŀ�� �̸�����
 					    map: map, // ���� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
 					    position:  map.getCenter(),
 					    draggable: true, // ���� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
 					});
 					
 					endMarker.setMap();
 					stnEndMarker.setMap();
 					/////////////////////������ ��Ŀ �̹���/////////////////
 					var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
			 		 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
			 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
							psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
			///////////////////////////////////////////////////////
			////////����ö���� ���� ��Ŀ�� ���� �迭����//////
			var cnt=0;//�������߰��� button�� name ī��Ʈ
			var passMarkerInfo;//��������Ŀ���� �������߰���ư�� ����������
			var stnPassMarker;//��������Ŀ���� �������߰���ư�� ����������
			
			
			///�������߰��� �������� �������� �����Ǵ� �±׵�
			
			function addPass(){
		
				var addTag=document.getElementById("passText");
				var str='������:&nbsp;<input type="text" id="passKey'+cnt+'" style="width:200px" onkeypress="enterKey(event,this);"> <input type="button" id="btn/passKey'+cnt+'" value="����" onclick="deletePass(this)">';
				var addDiv=document.createElement('li');
				addDiv.setAttribute("id","Li/passKey"+cnt);
				addDiv.innerHTML=str;
				addTag.appendChild(addDiv);

				stnPassMarker=[
	    	                    {
	    	                    	variable:'stnPassMarker'+cnt,  	                    	
	    	                    }];
				
				passMarkerInfo=[//������ ��Ŀ�� �����ϱ����� �迭
	    	                    {
	    	                    	variable:'passMarker'+cnt,  	        //��������Ŀ�� �̸��� Cnt������ �����Ͽ� �����            	
	    	                    }];
				
				  passMarkerInfo[0].variable = new daum.maps.Marker({
			           map: map, // ��Ŀ�� ǥ���� ����
			           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
			           image : psmarkerImage, // ��Ŀ �̹���
			           draggable: true,
			    	});
				  passMarkerInfo[0].variable.setMap();
			
 		 	stnPassMarker[0].variable = new daum.maps.Marker({
		           map: map, // ��Ŀ�� ǥ���� ����
		           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
		    	});
 		 	stnPassMarker[0].variable.setMap();

				cnt++;
			}
			function insertPass()
			{
				passMarkerInfo=[//������ ��Ŀ�� �����ϱ����� �迭
	    	                    {
	    	                    	variable:'passMarker'+cnt,  	        //��������Ŀ�� �̸��� Cnt������ �����Ͽ� �����            	
	    	                    }];
				
				  passMarkerInfo[0].variable = new daum.maps.Marker({
			           map: map, // ��Ŀ�� ǥ���� ����
			           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
			           image : psmarkerImage // ��Ŀ �̹��� 
			    	});
		 	  passMarkerInfo[0].variable.setMap();
			}
			
			/////////////input Text���� enderŰ�Է��� �������
			 function enterKey(e,here){
			      if(e.keyCode == 13){  //enter key�Է�	
			    	  var textId=here.getAttribute('id');//������ ��ư�� ���̵�
			    	  searchPlaces(textId);
			      }
			   }
			function deletePass(LiId)
			{
				document.getElementById("passText").removeChild(LiId.parentNode);
				cnt--;
				//alert(c);
			}
			
			///////////////////////////////////
			/////////////////////// Ű���� �˻��� ��û�ϴ� �޼���//////////////////
			var passCnt=0;
 					function searchPlaces(textId) {
 						var keyword = document.getElementById(textId).value;	
 						if (!keyword.replace(/^\s+|\s+$/g, '')) {
 					     alert('Ű���带 �Է����ּ���!');
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
 				           // alert(placePosition);
 				            //bounds.extend(placePosition);  
 							fragment.appendChild(itemEl);			
 				       	}
 						// �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
 						listEl.appendChild(fragment);
 						menuEl.scrollTop = 0;
 						// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
 						map.setLevel(6);					
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
 	 				    if(passCnt==0)//�����,�������� ������������
 	 				    {
 	 						var button = "<input type='button' value='���' id='"+title+"-"+x+"-"+y+"-"+places.address+"' onclick='choice(0,this);'><input type='button' value='����' id='"+title+"-"+x+"-"+y+"-"+places.address+"' onclick='choice(2,this);'>";
 	 				    }
 	 				    if(passCnt==1)//�������� �߰��������
 	 				    {
 	 				    	var button = "<input type='button' value='������' id='"+title+"-"+x+"-"+y+"-"+places.address+"' onclick='choice(1,this);'>";
 	 				    }
 	 				    el.innerHTML = itemStr+button;
 	 				    el.className = 'item';
 	 				    
 	 				    return el;
 	 				}  
 	 			 	
 	 			   function choice(index,bt)
 	 			   {//�˻�����Ʈ���� ������ ���������
 	 			    	if(index==0)
 	 			    	{
 	 			    		var btnId=bt.getAttribute('id');
 	 			    		var parseId=btnId.split('-');
 	 			    		var parseAddress=parseId[3];
 	 			    		//alert(parseAddress);
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);//���̵� �������ִ� ��ġ���������´�
 	 			    		var tagId=document.getElementById('startKey');
 	 			    		
 	 			    		fragment = document.createDocumentFragment();
 	 			    		startMarker.setTitle(parseId[0]);//��Ŀ�� �̸��� ����
 	 			    		startMarker.setPosition(markerPosition);//�̸������� ��߸�Ŀ�� ��ġ�� �̵��Ѵ�.
 	 			    		startMarker.setMap(map);//��Ŀ�� ���
 	 			    		tagId.value=parseId[0];	//inputâ�� �̸��� ���
 	 			    		
 	 			    		searchSub(index,markerPosition,parseAddress);
 	 			    		
 	 			    		var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			    	}
 	 			   		if(index==1)
 	 			   		{	   			
	 	 			   		var btnId=bt.getAttribute('id'); 			   		
		 			    	var parseId=btnId.split('-');
		 			    	var parseAddress=parseId[3];
		 			    	//alert(parseAddress);
		 			    	var minus=1;
		 			    	var plusId=cnt-minus;
		 			    	var tagId=document.getElementById('passKey'+plusId);	 			    	
		 			    	var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
		 			    	
		 			    	fragment = document.createDocumentFragment();
		 			    	passMarkerInfo[0].variable.setTitle(parseId[0]);
		 			    	passMarkerInfo[0].variable.setPosition(markerPosition);
		 			    	passMarkerInfo[0].variable.setMap(map);
		 			    	tagId.value=parseId[0];	
		 			    	
		 			    	searchSub(index,markerPosition,parseAddress);

		 			    	var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			   		}
 	 			    	if(index==2)
 	 			    	{
 	 			    		var btnId=bt.getAttribute('id');
 	 			    		var parseId=btnId.split('-');
 	 			    		var parseAddress=parseId[3];
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
 	 			    		var tagId=document.getElementById('endKey');
 	 			    		
 	 			    		fragment = document.createDocumentFragment();
 	 			    		endMarker.setTitle(parseId[0]);
 	 			    		endMarker.setPosition(markerPosition);
 	 			    		endMarker.setMap(map);
 	 			    		tagId.value=parseId[0];	
 	 			    		
 	 			    		searchSub(index,markerPosition,parseAddress);
 	 			    		
 	 			    		var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			    	}
 	 				   
 	 				   var a = bt.getAttribute('id');
 	 			    	var strArray=a.split('-');
 	 			    	fragment = document.createDocumentFragment();
 	 			    	var markerPosition  = new daum.maps.LatLng(strArray[1], strArray[2]);
 	 			
 	 			    	
 	 			    	makePassMarker(strArray[0],markerPosition);//������ ��Ŀ���� �߰��Ѵ�.
 	 			    } 
 	 			 	
 	 			  function removeAllChildNods(el) {   
 	 			        while (el.hasChildNodes()) {
 	 			            el.removeChild (el.lastChild);
 	 			        }
 	 			    }
 			/////////�˻��� ���� �޼���鳡//////////////////////////////////////////\
 			//////////��ó�� ����ö���� �˻�/////////////////////////
 			var allTitle=new Array();
 			var endInfo;
 			var endPosition;
 			
 			function searchSub(index,position,address)
			{
 				//alert("1");
				map.setCenter(position);
				//alert("2");
				var ps = new daum.maps.services.Places(map); 
			    // ī�װ��� ����ö �˻��մϴ�
			    ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
			    var arr=new Array();
			    var strArr=new Array();
			    // Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
			   // alert("3");
			    function placesSearchCB (status, data, pagination) 
			    {
			    	//alert(status);
			        if (status === daum.maps.services.Status.OK) 
			        {	        	
			            for (var i=0; i<data.places.length; i++) 
			            {		            	
			            	var a=distanceSum(data.places[i]);     //��Ŀ�� ��� 
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
			         						//stnStMarker.setTitle(strTitle);
			         						//stnStMarker.setPosition(markerPosition);
			         						//stnStMarker.setMap(map);
			         						
			         						if(startKey.value!="" && endKey.value!="")
			         						{
			         							CheckStation("0");
			         							checkCourse();
			         						}
			         					}
			         					if(index==1)
			         					{
			         						//alert("search"+address);
			         						allTitle[cnt]=str[0]+"/"+strTitle+"/"+address+"/"+strLnt+","+strLng;
			         						//stnPassMarker[0].variable.setTitle(strTitle);
			         						//stnPassMarker[0].variable.setPosition(markerPosition);
			         						//stnPassMarker[0].variable.setMap(map);
			         						//alert("����");
			         						CheckStation(index);
			         					}
			         					if(index==2)
			         					{
			         						if(address==undefined)
			         						{
			         							address="";
			         						}
			         						
			         						endInfo="������: "+endKey.value+"<br/>�ּ�: "+address+"<br/> ��ó��: "+strTitle+"<br/>�������� �Ÿ�: "+str[0]+"m<br/><hr>";
			         						endPosition=strTitle;
			         						//stnEndMarker.setTitle(strTitle);
			         						//stnEndMarker.setPosition(markerPosition);
			         						//stnEndMarker.setMap(map);
			         						//alert("dd");
			         						if(startKey.value!=""  && endKey.value!="")
			         						{
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
 			// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
 				var distance;
 				var dis=new  daum.maps.LatLng(place.latitude, place.longitude);
 				
 				clickLine = new daum.maps.Polyline({
 				 map: map, // ���� ǥ���� �����Դϴ� 
 				 path: [map.getCenter()], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
 				 strokeWeight: 0, // ���� �β��Դϴ� 
 				 strokeColor: '#db4040', // ���� �����Դϴ�
 				 strokeOpacity: 0, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
 				 strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
 				});
 				
 				var path = clickLine.getPath();	
 				// ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
 				path.push(dis);
 				clickLine.setPath(path);
 				distance = Math.round(clickLine.getLength());
 				distance=distance+"/"+place.latitude+"/"+place.longitude+"/"+place.title;
 				return distance;
 			}
 			////////////////////����ö�˻� �޼��峡///////////////////////////
 			/////////////////// �����θ� ã�� �޼����//////////////////
 			var totalStn=new Array();
 			function checkCourse()
 			{	
 				//alert(allTitle.length);
 				var parseInfo=allTitle[0].split('/');//�Ÿ�/���̸�/�ּ�/x,y �� ����
 				var el = document.createElement('li');//li�� �߰�	 			 
 				fragment = document.createDocumentFragment();
 				var listEl = document.getElementById('placesList');//�����Ȳ ����Ʈ�� ġȯ
 				
 				if(parseInfo[2]=="undefined")
 				{
 					parseInfo[2]="";				
 				}

 				var start="�����: "+startKey.value+"<br/>�ּ�: "+parseInfo[2]+"<br/> ��ó��: "+parseInfo[1]+"<br/>�������� �Ÿ�: "+parseInfo[0]+"m<br/><hr>";	

 				var b="";

				for(var i=1; i<allTitle.length;i++)
				{
					var Info=allTitle[i].split('/');
					var parseInfo=info[2];
					var name="passKey"+(i-1);
					var c=document.getElementById(name);
					if(parseInfo[2]=="undefined")
	 				{
	 					parseInfo[2]="";				
	 				}
					//var a=document.createElement('li');
					var pass="������: "+c.value+"<br/> �ּ�: "+parseInfo[2]+"<br/>��ó��: "+Info[1]+"<br/>�������� �Ÿ�: "+Info[0]+"m<br/><hr>";
					b=b+pass;
					
				}
				el.innerHTML=start+b+endInfo;//�����+������+�������� ����
				fragment.appendChild(el);
				listEl.appendChild(fragment);
 			}
 			
 			
 			function CheckStation(a)
 	 		{
 				//alert("1");
 	 			var firstLo;
 	 				var lastLo;
 	 			var endCnt=0;
 	 			//alert("2");
 	 			if(a==1)//�������� 2���̻� �ִ°�� ���������� ������������ ��
 	 			{
 	 				//alert("3");
	 	 			var firStr=allTitle[cnt-1].split('/');
	 	 			var firStr1=firStr[1].indexOf('��',1);
	 		 				
	 	 			var laStr=allTitle[cnt].split('/');
	 	 			var laStr1=laStr[1].indexOf('��',1);
	 	 			
	 	 			firstLo=firStr[1].substring(0,firStr1);
	 	 			lastLo=laStr[1].substring(0,laStr1);	
 	 			}
 	 			
 	 			if(a==0||a==2)
 	 			{
 	 				if(cnt>0)//�������� �ְ� ���������� ���
 	 				{
 	 					//alert("2");
 	 					var parseStr=allTitle[cnt].split('/');
	 	 	 			var parseNum=parseStr[1].indexOf('��',1);
	 	 	 			endCnt=1;
 	 				}
 	 				else//������� ���������ִ°��
 	 				{
	 	 	 			var parseStr=allTitle[0].split('/');	 	 	 			
	 	 	 			var parseNum=parseStr[1].indexOf('��',1);
 	 				}
 	 				var endStr=endPosition.indexOf('��',1);
 	 				//alert(endStr);

 	 	 			firstLo=parseStr[1].substring(0,parseNum);
 	 	 			lastLo=endPosition.substring(0,endStr);		 				
 	 			}
 	 			var firstStr = escape(encodeURIComponent(firstLo)); 
 	 			var lastStr = escape(encodeURIComponent(lastLo)); 
 	 			
 	 			$.ajax({		
 	 				url:"searchStation.nhn?start="+firstStr+"&end="+lastStr,
		 	 				success:function(data)
		 	 				{
		 	 					if(endCnt==1)
		 	 					{
		 	 						totalStn[cnt+1]=data.replace(/\s/gi, '');
		 	 						
		 	 					}
		 	 					else//������� ���������ִ°��
		 	 					{
			 	 					totalStn[0]=data.replace(/\s/gi, '');
			 	 				}
		 	 					
		 	 				}
 		 	 	        })
 	 		}
 			function nextStep()
 			{
 				alert(totalStn[0]);
 			}
/////////////////////////////////////////////// 
			var cateTotal;
			function startDrag(e,cateCnt)
			{
				cateTotal=cateCnt;
				var x=e.x;
				var y=e.y;
					
				var img=document.createElement("img");
				if(cateCnt==0)//������ ��߿����� �̹����� �������ְ� ������ �̹����� id�� �߰�
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
				
			function moveDrag(e)   //���ī�װ����� �̹������� �̵��Ҷ�
			{
			     var e_obj = window.event? window.event : e;
			     var dmvx = parseInt(e_obj.clientX + img_L);
			     var dmvy = parseInt(e_obj.clientY + img_T);
			     targetObj.style.left = dmvx +"px";
			     targetObj.style.top = dmvy +"px";
			     return false;
			}
			
			function stopDrag(e)//�̵��� �̹����� �������� ����
			{
				var aa=document.getElementById('imgtest');//ȭ�鿡 ��µǾ��ִ� �̹����� ���̵��� ġȯ
				aa.parentNode.removeChild(aa);//�̹����� ����
			     document.onmousemove = null;
			    
				if(document.onmouseup !=null)
			     {
			    	 var mapProjection = map.getProjection(),
					 point = new daum.maps.Point(e.x, e.y);//����ͻ��� px�� �������� ��ǥ�� ��ȯ

					var position=mapProjection.coordsFromContainerPoint(point); // ȭ�� ��ǥ�� �ش��ϴ� ���� ��ǥ
					//alert(position);
					if(cateTotal==0)
					{
							//startMarker.setTitle(parseId[0]);//��Ŀ�� �̸��� ����
	 			    		startMarker.setPosition(position);//�̸������� ��߸�Ŀ�� ��ġ�� �̵��Ѵ�.
	 			    		startMarker.setMap(map);//��Ŀ�� ���
	 			    		var address=searchJibun(position);
	 			    		searchSub(cateTotal,position,address);
	 			    		if(startKey.value!=""  && endKey.value!="")
     						{
     							CheckStation("0");
     							checkCourse();
     						}
					}
					
					if(cateTotal==1)
					{
						
						addPass();
						//alert(cnt);
						passMarkerInfo[0].variable.setPosition(position);
	 			    	passMarkerInfo[0].variable.setMap(map);
	 			    	var address=searchJibun(position);
 			    		searchSub(cateTotal,position,address);

				    }     
			    
					if(cateTotal==2)
			     	{
						//endMarker.setTitle(parseId[0]);
	 			    	endMarker.setPosition(position);
	 			    	endMarker.setMap(map);	
	 			    	var address=searchJibun(position);
 			    		searchSub(cateTotal,position,address);
 			    		
 			    		if(startKey.value!=""  && endKey.value!="")
 						{
 							CheckStation("2");
 							checkCourse();
 						}
	 			    	
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
			
			
			function searchJibun(position)
	 		{
				alert(position);
				alert("ddd");
				var jibunResult;
	 			var callback = function(status, result) { //���õ� ��ǥ�� �������� �ּҸ� �˻�	  
	 				if (status === daum.maps.services.Status.OK) 
	 				{
	 					
	 					 if(cateTotal==0)
	 					 {
	 						 startKey.value= result[0].jibunAddress.name;
	 					 } 
	 					
		 			     if(cateTotal==1)
	 					 {
		 			   		var minus=1;
	 			    		var plusId=cnt-minus;  		
	 			    		var keyId=document.getElementById('passKey'+plusId);
		 			       keyId.value= result[0].jibunAddress.name;
	 				 	 }
		 			    if(cateTotal==2)
	 					 {
	 						 endKey.value= result[0].jibunAddress.name;
	 					 }
		 			   jibunResult=result[0].jibunAddress.name;
		 			    }   
		 			};
		 			geocoder.coord2detailaddr(position, callback);		
		 			
		 			return jibunResult;
	 		}
			
			

	</script>
<body>
 	

</body>
</html>