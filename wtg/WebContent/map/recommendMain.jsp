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
							
						</div>
					<div class="option" id="best">
						<input type="text" id="tagName" ><input type="button" value="검색" onclick="test()">
					</div>
					<hr>
						<ul id="placesList"></ul>	
				</div>
			</div>
				<script>
					function test()
					{
						//alert(tagName.value);
						$.ajax({		
			 				url:"recomCourse.nhn?tag="+tagName.value,
			 	 				success:function(data)
			 	 				{
			 	 					var re=data.replace(/\s/gi, '');
			 	 					var str=re.split("$");//게시글을 구분
			 	 				//str=카테고리/글번호@시작이름/위^치@경유지1이름/1위^치#...5이름/5위^치@도착/위^치@내용/제목/조회수/좋아요$	
			 	 					alert(re);
			 	 					var markers = new Array();
			 	 					for(var i=0;i<str.length-1;i++)
			 	 					{
			 	 						var cateInfo=str[i].split('@')[0];
			 	 						var startInfo=str[i].split('@')[1];
			 	 						var passInfo=str[i].split('@')[2];
			 	 						var endInfo=str[i].split('@')[3];
			 	 						var contentInfo=str[i].split('@')[4];
			 	 						
			 	 						var stPoint= startInfo.split('/')[1];
			 	 						var endPoint= endInfo.split('/')[1];
			 	 						
			 	 						startPosition=new daum.maps.LatLng(stPoint.split('^')[0],stPoint.split('^')[1]);
			 	 						endPosition=new daum.maps.LatLng(endPoint.split('^')[0],endPoint.split('^')[1]);
			 	 						//alert(markerPosition);
			 	 					
			 	 						
			 	 						
			 	 					}
			 	 				}
						 })
					}
					var container = document.getElementById('map'); //div id=map자리에 지도를생성			
					var options = { 
												center: new daum.maps.LatLng(37.515504, 126.907628), 
												level: 6
											  };  			
					var map = new daum.maps.Map(container, options);
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