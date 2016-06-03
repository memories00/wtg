<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
<style>
			map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
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
								<option  value="0"  style="font-size:15pt" >베스트 여행지</option>
								<option  value="1" style="font-size:15pt">키워드 검색</option>	
							</select>
						</div>
					<div class="option" id="best">
						<select id="bestPlace" style="width:100%;height:30px;font-size:15pt" onchange="changeCate()">
							<option  style="font-size:15pt" >테마를 선택해 주세요</option>
							<option value="1" style="font-size:15pt" >스포츠</option>
							<option value="2" style="font-size:15pt">역사 관광</option>
							<option value="3" style="font-size:15pt">데이트</option>	
							<option value="4" style="font-size:15pt">쇼핑</option>	
						</select>							
					</div>
					<hr>
						<ul id="placesList"></ul>	
				</div>
			</div>
				<script>
					var container = document.getElementById('map'); //div id=map자리에 지도를생성			
					var options = { 
												center: new daum.maps.LatLng(37.515504, 126.907628), 
												level: 6
											  };  			
					var map = new daum.maps.Map(container, options);
					
					
					
			</script>
			<script>
				function test()
				{
					if(recMode.value==0)//베스트 여행지
					{
						alert("베스트");
					}
					if(recMode.value==1)//키워드검색
					{
						alert("키워드");
					}
				}
				function changeCate()
				{
					
					if(bestPlace.value==1)//스포츠
					{
						var cnt=1;
					}
					if(bestPlace.value==2)//역사관광
					{
						var cnt=2;
					}
					if(bestPlace.value==3)//데이트
					{
						var cnt=3;
					}
					if(bestPlace.value==4)//쇼핑
					{
						var cnt=4;
					}	
					$.ajax({		
	 	 				url:"recomCourse.nhn?cnt="+cnt,
			 	 				success:function(data)
			 	 				{
			 	 					var bestInfo=data.split('@');
			 	 					
			 	 					var p1_total=bestInfo[0].split('/');//[0]은 이름 [1]은 x^y
			 	 					var p1_point=p1_total[1].split('^');//[0]은 x [1]은 y
			 	 					
			 	 					var p2_total=bestInfo[1].split('/');//[0]은 이름 [1]은 x^y
			 	 					var p2_point=p2_total[1].split('^');//[0]은 x [1]은 y
			 	 					
			 	 					var p3_total=bestInfo[2].split('/');//[0]은 이름 [1]은 x^y
			 	 					var p3_point=p3_total[1].split('^');//[0]은 x [1]은 y
			 	 					
			 	 					var p4_total=bestInfo[3].split('/');//[0]은 이름 [1]은 x^y
			 	 					var p4_point=p4_total[1].split('^');//[0]은 x [1]은 y
			 	 					
			 	 					var p5_total=bestInfo[4].split('/');//[0]은 이름 [1]은 x^y
			 	 					var p5_point=p5_total[1].split('^');//[0]은 x [1]은 y
			 	 					
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
			 	 					var psimageSrc = 'http://127.0.0.1:8000/wtg/map/img/green_b.png', // 경유지마커이미지의 주소입니다    
			 	 				 	psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
			 	 				 	psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			 	 					psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
			 	 					
			 	 					for (var i = 0; i < positions.length; i ++) {
			 	 					    // 마커를 생성합니다
			 	 					    var marker = new daum.maps.Marker({
			 	 					        map: map, // 마커를 표시할 지도
			 	 					        position: positions[i].latlng, // 마커를 표시할 위치
			 	 					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			 	 					        image : psmarkerImage // 마커 이미지 
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
					
				    // 카테고리로 지하철 검색합니다
				    ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
				    var arr=new Array();
				    var strArr=new Array();
				    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
				    function placesSearchCB (status, data, pagination) {
				    	//alert(status);
				        if (status === daum.maps.services.Status.OK) {
				        	//alert("3");	
				            for (var i=0; i<data.places.length; i++) {
				            	//alert("4");	
				            	var a=distanceSum(data.places[i]);     //마커를 출력 
				            	
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
	 				var el = document.createElement('li');//li를 추가	 			 
	 				fragment = document.createDocumentFragment();
	 				var listEl = document.getElementById('placesList');//진행상황 리스트를 치환
	 				//alert("2");

	 				var b="";
	 				//alert(allTitle.length);
					
						//alert(allTitle[i]);
						var info=allTitle[index].split('/');

						var pass="추천지"+(i+1)+": "+info[2]+"<br/> 주소: 없음<br/>근처역: "+info[1]+"<br/>역까지의 거리: "+info[0]+"m<br/><hr>";
							
			
					el.innerHTML=pass;//출발지+경유지+도착지로 결합
					fragment.appendChild(el);
					listEl.appendChild(fragment);		
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
				
			</script>
	
			
		</c:when>
<c:otherwise>
		<script>
				alert("로그인 후 이용하세요");
				window.location="main.nhn";
		</script>
</c:otherwise>
</c:choose>	
	</body>
	</html>			