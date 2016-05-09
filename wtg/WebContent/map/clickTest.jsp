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
 		
 		var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // ��Ŀ�̹����� �ּ��Դϴ�    
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
 			
 			
 			if(cnt==0)//������
 			{
 				masterMarker=marker;//�ǾƷ����� �ѹ��� �ذ��ϱ����� ġȯ
 				
 				xPoint.value=position.getLat();//�ʿ��� ���콺�� ������ ��ǥ�� text���
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
 			// ������� �ڵ� �˻�
 			//alert("2");
 			
	 			var callback = function(status, result)
	 			{
	 				//alert("3");
	 			    if (status === daum.maps.services.Status.OK)
	 			    {
	 			    	//alert(status);
	 			    	 for (var i=0; i<result.places.length; i++) 
	 			    	 {	 			    		 
	 			    		var a=distanceSum(result.places[i]);     //��Ŀ�� ��� 		            	
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
	 			    // Map ��ü�� �������� �ʾ����Ƿ� ��ǥ��ü�� �����Ͽ� �Ѱ��ش�.
	 			    location: mouseEvent
	 			});
				alert("dd");
	 			return markerPosition;
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

 </script> 
 ����� ����<br/>
 x��ǥ<input type="text" name="xPoint" ><br>
 y��ǥ<input type="text" name="yPoint" ><br>
 �ּ�<input type="text" name="address"  size="50"><br>
 <input type="button" value="select" onclick="initMarker()">
 <div id="add"></div>
 