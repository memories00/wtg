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
 		
 		var imageSrc = 'http://127.0.0.1:8000/wtg/map/sub.png', // ��Ŀ�̹����� �ּ��Դϴ�    
 	    imageSize = new daum.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
 	    imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
 	   var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
 		
 		//��ҿ� ���� ��Ŀ�� �̸����� ���´� setMap(null)
 		var marker= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 			}); 
 		var marker1= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 		});
 		var marker2= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 		}); 
 		var marker3= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 		}); 
 		var marker4= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 		});
 		
 		//����ö ���� ���� ��Ŀ�� �̸����� ���´� setMap(null)
 		var SubMarker= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 			image: markerImage 
 			}); 
 		var SubMarker1= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 			image: markerImage
 		});
 		var SubMarker2= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 			image: markerImage
 		}); 
 		var SubMarker3= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 			image: markerImage
 		}); 
 		var SubMarker4= new daum.maps.Marker({ 
 			position: map.getCenter(), //��Ŀ�� ��ġ�� �Է��Ѱ�
 			image: markerImage
 		});
 		
	
 		daum.maps.event.addListener(map, 'click', function(mouseEvent)//���콺 Ŭ���̺�Ʈ 
 		 { 
 			var position=mouseEvent.latLng;
 			var masterMarker;
 			//alert("1");
 			
 			if(cnt==0)//������
 			{
 				//alert("2");
 				masterMarker=marker;//�ǾƷ����� �ѹ��� �ذ��ϱ����� ġȯ
 				
 				xPoint.value=position.getLat();//�ʿ��� ���콺�� ������ ��ǥ�� text���
 	 			yPoint.value=position.getLng();
 	 			//alert("3");
 	 			searchJibun("address",mouseEvent.latLng); 
 	 			
 				var arr=new Array();
 	 		    var strArr=new Array();
 	 		   var markerPosition;
 	 		  map.setCenter(mouseEvent.latLng);
 	 			var places = new daum.maps.services.Places(map);
 	 			// ������� �ڵ� �˻�
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //��Ŀ�� ��� 		            	
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
 		 			    // Map ��ü�� �������� �ʾ����Ƿ� ��ǥ��ü�� �����Ͽ� �Ѱ��ش�.
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
 	 			// ������� �ڵ� �˻�
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //��Ŀ�� ��� 		            	
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
 		 			    // Map ��ü�� �������� �ʾ����Ƿ� ��ǥ��ü�� �����Ͽ� �Ѱ��ش�.
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
 	 			// ������� �ڵ� �˻�
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //��Ŀ�� ��� 		            	
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
 		 			    // Map ��ü�� �������� �ʾ����Ƿ� ��ǥ��ü�� �����Ͽ� �Ѱ��ش�.
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
 	 			// ������� �ڵ� �˻�
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //��Ŀ�� ��� 		            	
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
 		 			    // Map ��ü�� �������� �ʾ����Ƿ� ��ǥ��ü�� �����Ͽ� �Ѱ��ش�.
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
 	 			// ������� �ڵ� �˻�
				//alert("4");
 		 			var callback = function(status, result)
 		 			{
 		 				//alert("5");
 		 			    if (status === daum.maps.services.Status.OK)
 		 			    {
 		 			    	//alert("6");
 		 			    	 for (var i=0; i<result.places.length; i++) 
 		 			    	 {	 			    		 
 		 			    		var a=distanceSum(result.places[i]);     //��Ŀ�� ��� 		            	
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
 		 			    // Map ��ü�� �������� �ʾ����Ƿ� ��ǥ��ü�� �����Ͽ� �Ѱ��ش�.
 		 			    location: mouseEvent.latLng
 		 			});
 	 			

 			}
 			masterMarker.setPosition(position); //������ ��Ŀ�� �̵�
 			masterMarker.setMap(map);//������ ��Ŀ�� ���
 			
 		 });
 		
 		function initMarker()
 		{
 			cnt++;		//select�� ���������� ���� 
 			var addForm=document.getElementById("add");
 			if(cnt<5)
 			{
 				var str='������'+cnt+'<br/>x��ǥ<input type="text" name="xPoint'+cnt+'"/><br/>y��ǥ<input type="text" name="yPoint'+cnt+'"/><input type="button" value="select" onclick="initMarker()">'
 							+'<br><input type="text" name="address'+cnt+'"size="50"/>';
 				if(cnt==4)
 				{
 					var str='������<br/>x��ǥ<input type="text" name="xPoint'+cnt+'"/><br/>y��ǥ<input type="text" name="yPoint'+cnt+'"/><input type="button" value="select" onclick="initMarker()">'
 					+'<br><input type="text" name="address'+cnt+'"size="50"/>';
 				}
 				
 				var addedDiv=document.createElement("div");//��Ҹ� ����
 	 			addedDiv.setAttribute("id","keyword_Frm");
 	 			addedDiv.innerHTML=str;//str�� ����
 	 			addForm.appendChild(addedDiv);//���
 			}
 			else if(cnt>4)    //���â�� 5���϶�
 			{
 				alert("���̻� �߰��Ҽ� �����ϴ�");
 				cnt=4;
 			}			
 		}
 		
 		function searchJibun(addName,position)
 		{
 			var name=document.getElementsByName(addName)[0];
 			var callback = function(status, result) { //���õ� ��ǥ�� �������� �ּҸ� �˻�
	 			    if (status === daum.maps.services.Status.OK) {
	 			        // ��û��ġ�� �ǹ��� ���� ��� ���θ� �ּҴ� ���Դϴ�
	 			       name.value=result[0].jibunAddress.name;//�ּ�â�� �ּҸ� ��� ����
	 			    }   
	 			};
	 			geocoder.coord2detailaddr(position, callback);			
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
 		function CheckStation()
 		{
 			var firstLo;
 			var lastLo;
 			if(cnt>0&&cnt<5)
 				{

	 				var firStr=allTitle[cnt-1];
	 				var firStr1=firStr.indexOf('��');
	 				
	 				var laStr=allTitle[cnt];
	 				var laStr1=laStr.indexOf('��');
	 				
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
 				var imageSrc = 'http://127.0.0.1:8000/wtg/map/pass.png', // ��Ŀ�̹����� �ּ��Դϴ�    
 		 	    imageSize = new daum.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
 		 	    imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
 		 	   var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
 				
 		 	    var passMkPosition=new daum.maps.LatLng(d[0],d[1]);
 				var passMarker= new daum.maps.Marker({ 
 		 			position: passMkPosition, //��Ŀ�� ��ġ�� �Է��Ѱ�
 		 			image:markerImage
 				}); 
 				passMarker.setMap(map);
 				
 			}
 			
 		}

 </script> 
 <input type="button" value="�����˻�" onclick="CheckStation()">
 ����� ����<br/>
 x��ǥ<input type="text" name="xPoint" ><br>
 y��ǥ<input type="text" name="yPoint" ><br>
 �ּ�<input type="text" name="address"  size="50"><br>
 <input type="button" value="select" onclick="initMarker()">
 <div id="add"></div>
 