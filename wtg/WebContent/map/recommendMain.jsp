<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
<style>
			map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {background-color:#6600ff;position:absolute;  top:0;left:0;bottom:0;width:400px; height:800px;margin:10px 50px 30px 10px;padding:5px;overflow-x:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px; }
			.bg_white {background:#fff;}		
			#menu_wrap hr {display: block; height: 1px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{background-color:red;text-align: left; height:50px;margin:5px 0 0 0;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
			.box1{background-color:red; width:100%; height:30px; margin:10px 0 0 0 }
</style>			
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>
<c:choose>
		<c:when test="${sessionScope.memId ne null}">
				<div class="map_wrap">
					<div id="map" style="width:100%; height:900px;overflow:hidden;"></div>
						<div id="menu_wrap" class="bg_white">
						<div class="box1">
							<select  id="recMode" style="width:100%;height:30px;font-size:15pt" onchange="test();">
								<option  value="0"  style="font-size:15pt" >����Ʈ ������</option>
								<option  value="1" style="font-size:15pt">Ű���� �˻�</option>	
							</select>
						</div>
					<div class="option" id="best">
						<select id="bestPlace" style="width:100%;height:30px;font-size:15pt" onchange="changeCate()">
							<option  style="font-size:15pt" >�׸��� ������ �ּ���</option>
							<option value="1" style="font-size:15pt" >������</option>
							<option value="2" style="font-size:15pt">���� ����</option>
							<option value="3" style="font-size:15pt">����Ʈ</option>	
							<option value="4" style="font-size:15pt">����</option>	
						</select>							
					</div>
					<hr>
						<ul id="placesList"></ul>	
				</div>
			</div>
				<script>
					var container = document.getElementById('map'); //div id=map�ڸ��� ����������			
					var options = { 
												center: new daum.maps.LatLng(37.515504, 126.907628), 
												level: 6
											  };  			
					var map = new daum.maps.Map(container, options);
					
					
					
			</script>
			<script>
				function test()
				{
					if(recMode.value==0)//����Ʈ ������
					{
						alert("����Ʈ");
					}
					if(recMode.value==1)//Ű����˻�
					{
						alert("Ű����");
					}
				}
				function changeCate()
				{
					
					if(bestPlace.value==1)//������
					{
						var cnt=1;
					}
					if(bestPlace.value==2)//�������
					{
						var cnt=2;
					}
					if(bestPlace.value==3)//����Ʈ
					{
						var cnt=3;
					}
					if(bestPlace.value==4)//����
					{
						var cnt=4;
					}	
					$.ajax({		
	 	 				url:"recomCourse.nhn?cnt="+cnt,
			 	 				success:function(data)
			 	 				{
			 	 					var bestInfo=data.split('@');
			 	 					
			 	 					var p1_total=bestInfo[0].split('/');//[0]�� �̸� [1]�� x^y
			 	 					var p1_point=p1_total[1].split('^');//[0]�� x [1]�� y
			 	 					
			 	 					var p2_total=bestInfo[1].split('/');//[0]�� �̸� [1]�� x^y
			 	 					var p2_point=p2_total[1].split('^');//[0]�� x [1]�� y
			 	 					
			 	 					var p3_total=bestInfo[2].split('/');//[0]�� �̸� [1]�� x^y
			 	 					var p3_point=p3_total[1].split('^');//[0]�� x [1]�� y
			 	 					
			 	 					var p4_total=bestInfo[3].split('/');//[0]�� �̸� [1]�� x^y
			 	 					var p4_point=p4_total[1].split('^');//[0]�� x [1]�� y
			 	 					
			 	 					var p5_total=bestInfo[4].split('/');//[0]�� �̸� [1]�� x^y
			 	 					var p5_point=p5_total[1].split('^');//[0]�� x [1]�� y
			 	 					
			 	 					var positions = [
			 	 					                 {
			 	 					                     title: p1_total[0], 
			 	 					                     latlng: new daum.maps.LatLng(p1_point[0],p1_point[1])
			 	 					                 },
			 	 					                 {
			 	 					                     title: p2_total[0], 
			 	 					                     latlng: new daum.maps.LatLng(p2_point[0],p2_point[1])
			 	 					                 },
			 	 					                 {
			 	 					                     title: p3_total[0], 
			 	 					                     latlng: new daum.maps.LatLng(p3_point[0],p3_point[1])
			 	 					                 },
			 	 					                 {
			 	 					                     title:p4_total[0],
			 	 					                     latlng: new daum.maps.LatLng(p4_point[0],p4_point[1])
			 	 					                 },
			 	 					                 {
			 	 					                     title:p5_total[0],
			 	 					                     latlng: new daum.maps.LatLng(p5_point[0],p5_point[1])
			 	 					                 }
			 	 					             ];

			 	 					var bounds = new daum.maps.LatLngBounds();
			 	 					var psimageSrc = 'http://127.0.0.1:8000/wtg/map/img/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
			 	 				 	psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
			 	 				 	psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
			 	 					psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
			 	 					
			 	 					for (var i = 0; i < positions.length; i ++) {
			 	 					    // ��Ŀ�� �����մϴ�
			 	 					    var marker = new daum.maps.Marker({
			 	 					        map: map, // ��Ŀ�� ǥ���� ����
			 	 					        position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
			 	 					        title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
			 	 					        image : psmarkerImage // ��Ŀ �̹��� 
			 	 					    });
			 	 					    bounds.extend(positions[i].latlng);
			 	 					  searchSub(i,positions[i].title,positions[i].latlng);
			 	 					
			 	 					
			 	 					}
			 	 					map.setBounds(bounds);	
			 	 					//
			 	 					//checkCourse();

	
			 	 				}
	 		 	 	        })
				}
				
				var allTitle=new Array();
				
				function searchSub(cnt,name,position)
				{
					map.setCenter(position);
					var ps = new daum.maps.services.Places(map); 
					
				    // ī�װ��� ����ö �˻��մϴ�
				    ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
				    var arr=new Array();
				    var strArr=new Array();
				    // Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
				    function placesSearchCB (status, data, pagination) {
				    	//alert(status);
				        if (status === daum.maps.services.Status.OK) {
				        	//alert("3");	
				            for (var i=0; i<data.places.length; i++) {
				            	//alert("4");	
				            	var a=distanceSum(data.places[i]);     //��Ŀ�� ��� 
				            	
				            	arr[i]=a; 
				            	 
				            	var str=a.split('/');
				            	strArr[i]=str[0]; 
				            	//alert(str[0]);
				            }       
				           strArr.sort(function(a,b){
				        	   return a-b;
				        		   });
				         	for(var i=0;i<arr.length;i++)
				         		{
				         			var b=arr[i];
				            		var str=b.split('/');
				         			
				         			if(strArr[0]==str[0])
				         				{      					
				         					var strLnt=str[1];
				         					var strLng=str[2];
				         					var strTitle=str[3];
				         					
				         					allTitle[cnt]=str[3];
				         				   var listEl = document.getElementById('placesList');
		         				    		removeAllChildNods(listEl);
		         							checkCourse();

				         				}         		
				         		}
				        }
				    }
					
				}
	 			function checkCourse(index)
	 			{	
	 				var el = document.createElement('li');//li�� �߰�	 			 
	 				fragment = document.createDocumentFragment();
	 				var listEl = document.getElementById('placesList');//�����Ȳ ����Ʈ�� ġȯ
	 				//alert("2");

	 				var b="";
	 				//alert(allTitle.length);
					
						//alert(allTitle[i]);
						var info=allTitle[index].split('/');

						var pass="��õ��"+(i+1)+": "+info[2]+"<br/> �ּ�: ����<br/>��ó��: "+info[1]+"<br/>�������� �Ÿ�: "+info[0]+"m<br/><hr>";
							
			
					el.innerHTML=pass;//�����+������+�������� ����
					fragment.appendChild(el);
					listEl.appendChild(fragment);		
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
	
			
		</c:when>
<c:otherwise>
		<script>
				alert("�α��� �� �̿��ϼ���");
				window.location="main.nhn";
		</script>
</c:otherwise>
</c:choose>	
	</body>
	</html>			