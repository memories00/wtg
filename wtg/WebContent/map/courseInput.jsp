<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/inputCss.css"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ڽ�����ϱ�</title>

	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
	<link href="/wtg/lib/default.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/wtg/lib/fonts.css" rel="stylesheet" type="text/css" media="all" />
<style>
	.box_t{background-color:#494949; width:100%; height:15%; float:left; }
	.box_b{width:100%; height:50px; }
	.box1{ width:13%; height:100%; float:left; }
	.box2{width:65%; height:100%; float:left; margin:5px 0 0 50px; overflow: auto;}
	.box3{ width:13%; height:100%; float:left;  margin:5px 0 0 50px; }
	
</style>
</head>
<body>
<div id="ad_footer">
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
<div id="wrapper">
<c:choose>
	<c:when test="${sessionScope.memId ne null}">
<div class="map_wrap">
	<div id="map" style="width:100%; height:100%;"></div>
		<div class="category" style="margin:10% 0 0 30px">
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
		<div id="menu_wrap" class="bg_white" style="margin:10% 0 0 10px">

			<div class="option">
					�׸����� : 
					<select id="cate">
						<option>������</option>
						<option>����Ʈ</option>
						<option>�������</option>
						<option>����</option>
					</select>
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
<div id="ad_footer">
	<jsp:include page="/include/mainFooter.jsp" flush="false"/>
</div>

</div>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06fa7b42a2af7b8c46c9ca9a71d40206&libraries=services"></script>
		<script>
		var container = document.getElementById('map'); //div id=map�ڸ��� ����������			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 6
									  };  			
			var map = new daum.maps.Map(container, options); 
			var geocoder = new daum.maps.services.Geocoder();//�������˻��Ҵ� ���
			var ps = new daum.maps.services.Places();//�˻������ ����Ҷ��� ����
			var cnt=0;//�������߰��� button�� name ī��Ʈ
			var passMarkerInfo=new Array();//��������Ŀ���� �������߰���ư�� ����������
			
			//////////////������� ��Ŀ�� �̹����� �̸�����//////////////
			var stimageSrc = 'http://127.0.0.1:8000/wtg/map/img/red_b.png', // ��߸�Ŀ�̹����� �ּ��Դϴ�    
	 		 	    stimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
	 		 	    
			var startMarker=new daum.maps.Marker({
				map:map,
				position:map.getCenter(),
				image:startImage,
				draggable:true,
				clickable:true
			});
			
			startMarker.setMap();
			
			//////////////////////�������� ��Ŀ�� �̹����� �̸�����//////////////////////////
			var endimageSrc = 'http://127.0.0.1:8000/wtg/map/img/blue_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
	 		 	    endimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	 		 	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
					endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
 					
 					var endMarker = new daum.maps.Marker({
 					    map: map, // ���� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
 					    position:  map.getCenter(),
 					    image:endImage,
 					    draggable: true, // ���� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
 					});

 					endMarker.setMap();
 					/////////////////////������ ��Ŀ �̹���/////////////////
 					var psimageSrc = 'http://127.0.0.1:8000/wtg/map/img/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
			 		 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
			 		 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
							psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);

			 		var passMarker0 =  new daum.maps.Marker({
				           map: map, // ��Ŀ�� ǥ���� ����
				           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
				           image : psmarkerImage, // ��Ŀ �̹���
				           draggable: true
				    	});	
			 		var passMarker1 =  new daum.maps.Marker({
				           map: map, // ��Ŀ�� ǥ���� ����
				           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
				           image : psmarkerImage, // ��Ŀ �̹���
				           draggable: true
				    	});
			 		var passMarker2 =  new daum.maps.Marker({
				           map: map, // ��Ŀ�� ǥ���� ����
				           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
				           image : psmarkerImage, // ��Ŀ �̹���
				           draggable: true
				    	});
			 		var passMarker3 =  new daum.maps.Marker({
				           map: map, // ��Ŀ�� ǥ���� ����
				           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
				           image : psmarkerImage, // ��Ŀ �̹���
				           draggable: true
				    	});
			 		var passMarker4 =  new daum.maps.Marker({
				           map: map, // ��Ŀ�� ǥ���� ����
				           position:map.getCenter(), // ��Ŀ�� ǥ���� ��ġ
				           image : psmarkerImage, // ��Ŀ �̹���
				           draggable: true
				    	});
			 		passMarker0.setMap();
			 		passMarker1.setMap();
			 		passMarker2.setMap();
			 		passMarker3.setMap();
			 		passMarker4.setMap();
			///////////////////////////////////////////////////////////////
			var cnt=0;//�������߰��� button�� name ī��Ʈ

			///�������߰��� �������� �������� �����Ǵ� �±׵�
	
			function addPass(){
				
				if(cnt<5)
				{
					//alert("add"+cnt);
					var addTag=document.getElementById("passText");
					var str='������:&nbsp;<input type="text" id="passKey'+cnt+'" style="width:200px" onkeypress="enterKey(event,this);"> <input type="button" id="btn/passKey'+cnt+'" value="����" onclick="deletePass(this)">';
					var addDiv=document.createElement('li');
					addDiv.setAttribute("id","Li/passKey"+cnt);
					addDiv.innerHTML=str;
					addTag.appendChild(addDiv);
					cnt++;
				}
				else
				{
					alert("���̻� �߰��Ҽ� �����ϴ�.")
					cnt=5;
				}


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
				//alert(basicName[count+1]);
				alert(basicName.length);
				basicName.splice(count+1,basicName.length);
				
				
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
 	 				    itemStr += '<span class="tel">' +"</br>"+"��ȭ��ȣ: "+ places.phone  + '</span>' + '</div>'; 
 	 				    if(passCnt==0)//�����,�������� ������������
 	 				    {
 	 						var button = "<input type='button' value='���' id='"+title+"/"+x+"/"+y+"/"+places.address+"/"+ places.phone  +"' onclick='choice(0,this);'><input type='button' value='����' id='"+title+"/"+x+"/"+y+"/"+places.address+"/"+ places.phone  +"' onclick='choice(2,this);'>";
 	 				    }
 	 				    if(passCnt==1)//�������� �߰��������
 	 				    {
 	 				    	var button = "<input type='button' value='������' id='"+title+"/"+x+"/"+y+"/"+places.address+"/"+ places.phone  +"'onclick='choice(1,this);'>";
 	 				    }
 	 				    el.innerHTML = itemStr+button;
 	 				    el.className = 'item';
 	 				    
 	 				    return el;
 	 				}  
 	 			 	
 	 			 	var basicName=new Array();
 
 	 			   function choice(index,bt)
 	 			   {//�˻�����Ʈ���� ������ ���������
 	 			    	if(index==0)
 	 			    	{
 	 			   
 	 			    		var btnId=bt.getAttribute('id');
 	 			    		var parseId=btnId.split("/");
 	 			    		var parseAddress=parseId[3];
 	 			    		var phone=parseId[4];
 	 			    		var tagId=document.getElementById('startKey');
 	 			    	
 	 			    		//alert(parseAddress);
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);//���̵� �������ִ� ��ġ���������´�
 	 			    		//var tagId=document.getElementById('startKey');
 	 			    	
 	 			    		fragment = document.createDocumentFragment();
 	 			    		startMarker.setTitle(parseId[0]);//��Ŀ�� �̸��� ����
 	 			    		startMarker.setPosition(markerPosition);//�̸������� ��߸�Ŀ�� ��ġ�� �̵��Ѵ�.
 	 			    		startMarker.setMap(map);//��Ŀ�� ���
 	 			    		tagId.value=parseId[0];	 //inputâ�� �̸��� ���
 	 			    	
 	 			    		searchSub(index,markerPosition,parseAddress,phone);
 	 			    		if(phone=="")
 	 			    		{
 	 			    			phone="��ϵǾ����� �ʽ��ϴ�.";	
 	 			    			basicName[0]=btnId+"/"+phone+"/";
 	 			    		}
 	 			    		else
 	 			    		{
 	 			    			basicName[0]=btnId;
 	 			    		}
 	 			
 	 			    		
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
		 			    	
		 			    	fragment = document.createDocumentFragment();
		 			    	if(cnt==1)
							{
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
 	 			    		var phone=parseId[4];
 	 			    		var tagId=document.getElementById('endKey');
 	 	
 	 			    		var markerPosition  = new daum.maps.LatLng(parseId[1], parseId[2]);
 	 			    		//var tagId=document.getElementById('endKey');
 	 			    		
 	 			    		fragment = document.createDocumentFragment();
 	 			    		endMarker.setTitle(parseId[0]);
 	 			    		endMarker.setPosition(markerPosition);
 	 			    		endMarker.setMap(map);
 	 			    		
 	 			    		searchSub(index,markerPosition,parseAddress);
 	 			    		if(phone=="")
 	 			    		{
 	 			    			phone="��ϵǾ����� �ʽ��ϴ�.";	
 	 			    			basicName[cnt+1]=btnId+"/"+phone+"/";
 	 			    		}
 	 			    		else
 	 			    		{
 	 			    			basicName[cnt+1]=btnId;
 	 			    		}
 	 			    		
 	 			    		
 	 			    		var listEl = document.getElementById('placesList');
 	 			    		removeAllChildNods(listEl);
 	 			    	}	   
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
 			var endStn;
 			
 			function searchSub(index,position,address)
			{
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
			         						allTitle[0]=str[0]+"/"+strTitle+"/"+address+"/"+strLnt+"^"+strLng;

			         						if(startKey.value!="" && endKey.value!="")
			         						{
			         							//alert("����0");
			         						     var listEl = document.getElementById('placesList');
			         				    		removeAllChildNods(listEl);
			         							checkCourse();
			         						}
			         					}
			         					if(index==1)
			         					{
			         						
			         						allTitle[cnt]=str[0]+"/"+strTitle+"/"+address+"/"+strLnt+"^"+strLng;
			         						
			         						if(startKey.value!="" && endKey.value!="")
			         						{	
			         						     var listEl = document.getElementById('placesList');
			         				    		removeAllChildNods(listEl);
			         							checkCourse();
			         						}
			         					}
			         					if(index==2)
			         					{
			         						if(address==undefined)
			         						{
			         							address="��ϵǾ����� �ʽ��ϴ�.";
			         						}
			         						endInfo="������: "+endKey.value+"<br/>�ּ�: "+address+"<br/> ��ó��: "+strTitle+"<br/>�������� �Ÿ�: "+str[0]+"m<br/><hr>";
			         						endStn=str[0]+"/"+strTitle+"/"+address+"/"+strLnt+"^"+strLng;

			         						if(startKey.value!="" && endKey.value!="")
			         						{
			         							//alert("����0");
			         						     var listEl = document.getElementById('placesList');
			         				    		removeAllChildNods(listEl);
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
 			
 			function checkCourse()
 			{	
 				var parseInfo=allTitle[0].split('/');//�Ÿ�/���̸�/�ּ�/x,y �� ����
 				var el = document.createElement('li');//li�� �߰�	 			 
 				fragment = document.createDocumentFragment();
 				var listEl = document.getElementById('placesList');//�����Ȳ ����Ʈ�� ġȯ
 				//alert("2");
 				if(parseInfo[2]=="undefined")
 				{
 					parseInfo[2]="��ϵǾ� ���� �ʽ��ϴ�.";				
 				}

 				var start="�����: "+startKey.value+"<br/>�ּ�: "+parseInfo[2]+"<br/> ��ó��: "+parseInfo[1]+"<br/>�������� �Ÿ�: "+parseInfo[0]+"m<br/><hr>";	

 				var b="";

				for(var i=1; i<allTitle.length;i++)
				{
					var info=allTitle[i].split('/');
					var parseInfo=info[2];
					var name="passKey"+(i-1);

					var c=document.getElementById(name);
					if(parseInfo=="undefined")
					{
						parseInfo="��ϵǾ� ���� �ʽ��ϴ�.";
					}
						var pass="������: "+c.value+"<br/> �ּ�: "+parseInfo+"<br/>��ó��: "+info[1]+"<br/>�������� �Ÿ�: "+info[0]+"m<br/><hr>";
						b=b+pass;
				
				}
				el.innerHTML=start+b+endInfo;//�����+������+�������� ����
				fragment.appendChild(el);
				listEl.appendChild(fragment);		
 			}
 			
 			function nextStep()
 			{
 				var cate=document.getElementById('cate');
	
 				//alert(basicName);
 				location.href="insertTable.nhn?cate="+cate.value+"&basicName="+basicName+"&allTitle="+allTitle+"&endStn="+endStn;

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
					img.setAttribute("src","map/img/red_b.png");
					img.setAttribute("id","imgtest");
				}
				if(cateCnt==1)
				{
					img.setAttribute("src","map/img/green_b.png");
					img.setAttribute("id","imgtest");
				}
				if(cateCnt==2)
				{
					img.setAttribute("src","map/img/blue_b.png");
					img.setAttribute("id","imgtest");
				}	
					img.style.zIndex=6;
					var a=document.body.appendChild(img);
					
					img.style.position="absolute";
					img.style.left=(x-5)+"px";
					img.style.top=(y-10)+"px";
					
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
	 			    		startMarker.setPosition(position);//�̸������� ��߸�Ŀ�� ��ġ�� �̵��Ѵ�.
	 			    		startMarker.setMap(map);//��Ŀ�� ���
	 			    		var address=searchJibun(position,cateTotal);
	 			    		searchSub(cateTotal,position,address);
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

			     	}				
				}
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
			
			function searchJibun(position,cateCnt,drag)
	 		{
				var jibunResult;
	 			var callback = function(status, result) { //���õ� ��ǥ�� �������� �ּҸ� �˻�	  
	 				if (status === daum.maps.services.Status.OK) 
	 				{
	 					
	 					 if(cateCnt==0)
	 					 {
	 						startKey.value= result[0].jibunAddress.name;
	 						basicName[0]=result[0].jibunAddress.name+"/"+position.getLat()+"/"+position.getLng()+"/"+result[0].jibunAddress.name+"/  ";
	 					 } 
	 					
		 			     if(cateCnt==1)
	 					 {
		 			      	if(drag==0){passKey0.value=result[0].jibunAddress.name;}
		 			      	if(drag==1){passKey1.value=result[0].jibunAddress.name;}
		 			      	if(drag==2){passKey2.value=result[0].jibunAddress.name;}
		 			   	  	if(drag==3){passKey3.value=result[0].jibunAddress.name;}
		 			      	if(drag==4){passKey4.value=result[0].jibunAddress.name;}
		 			      	basicName[cnt]=result[0].jibunAddress.name+"/"+position.getLat()+"/"+position.getLng()+"/"+result[0].jibunAddress.name+"/  ";
	 				 	 }
		 			    if(cateCnt==2)
	 					 {
	 						 endKey.value= result[0].jibunAddress.name;
	 						basicName[cnt+1]=result[0].jibunAddress.name+"/"+position.getLat()+"/"+position.getLng()+"/"+result[0].jibunAddress.name+"/  ";
	 					 }
		 			  
		 			   jibunResult=result[0].jibunAddress.name;
		 			
		 			    }   
		 			};
		 			geocoder.coord2detailaddr(position, callback);		
		 			return jibunResult;
	 		}
			daum.maps.event.addListener(startMarker, 'dragend', function(mouseEvent) {
			     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�
			        var listEl = document.getElementById('placesList');
 	 			    removeAllChildNods(listEl);
			     	var position=startMarker.getPosition();
			     	var address=searchJibun(position,cateTotal);
		    		searchSub(cateTotal,position,address);
     
			});
			daum.maps.event.addListener(endMarker, 'dragend', function() {
			     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�
			     var listEl = document.getElementById('placesList');
 	 			 removeAllChildNods(listEl);
				 var position=endMarker.getPosition();
			     var address=searchJibun(position,cateTotal);
		    	 searchSub(cateTotal,position,address);
			});
			
			daum.maps.event.addListener(passMarker0, 'dragend', function() {
			     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�  
			     var listEl = document.getElementById('placesList');
 			     removeAllChildNods(listEl);
	 	 		 var position=passMarker0.getPosition();
			     var address=searchJibun(position,1,0);

		    	searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker1, 'dragend', function() {
			     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�    
			     var listEl = document.getElementById('placesList');
			     removeAllChildNods(listEl);
	 	 		 var position=passMarker1.getPosition();
			     var address=searchJibun(position,1,1);

		    	searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker2, 'dragend', function() {
			     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�    
			     var listEl = document.getElementById('placesList');
			     removeAllChildNods(listEl);
	 	 		 var position=passMarker2.getPosition();
			     var address=searchJibun(position,1,2);

		    	searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker3, 'dragend', function() {
			     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�    
			     var listEl = document.getElementById('placesList');
			    		removeAllChildNods(listEl);
	 	 		 var position=passMarker3.getPosition();
			     var address=searchJibun(position,1,3);

		    		searchSub("1",position,address);
			});
			daum.maps.event.addListener(passMarker4, 'dragend', function() {
			     // ��� ��Ŀ�� �巡�װ� ����� �� ��Ŀ �̹����� ���� �̹����� �����մϴ�    
			     var listEl = document.getElementById('placesList');
			    		removeAllChildNods(listEl);
	 	 		 var position=passMarker4.getPosition();
			     var address=searchJibun(position,1,4);

		    		searchSub("1",position,address);
			});
	
	</script>
</c:when>
			<c:otherwise>
			<script>
				alert("�α��� �� �̿��ϼ���");
				//window.location="main.nhn";
			</script>
			</c:otherwise>
	</c:choose>	

</body>

</html>