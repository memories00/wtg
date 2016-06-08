
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>코스확인</title>
<link rel="stylesheet" href="/wtg/daumeditor/css/editor.css" type="text/css" charset="EUC-KR"/>
		<script src="/wtg/daumeditor/js/editor_loader.js" type="text/javascript" charset="EUC-KR"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>	
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/als_demo.css" />
		<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>		
		<style>
		#warp{width:100%;}
	.box_t{background-color:#494949; width:100%; height:15%; float:left; }
	.box1{width:38%; height:80%; float:left;margin:20px 30px 0 30px}
	.box2{;width:50%; height:65%;float:left; margin:0 0 0 0px}
	.box3{ ;width:38%; height:90%;float:left;display:block;margin:20px 0 0 30px}
	.box4{ background-color:#494949;width:50%; height:400px;float:left;margin:20px 0 0 20px;}
	.box5{margin:0px 0 0 0;width:170px; height:170px;float:left;border:1px;}
	.imgbox{ width:150px; height:150px;}
	.box-m{float:left; width:100%;height:50%;}
	.box-m2{float:left;display:block; width:100%;height:50%}
	.preview{ width:50%;height:300; margin: 30px 0px 0 50px}
	
	.body {margin: 10px}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 
.filebox {display:inline-block; margin-right: 10px;}


.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}

.filebox.bs3-success label {
  color: #fff;
  background-color: #5cb85c;
    border-color: #4cae4c;
}
/* imaged preview */
.filebox .upload-display {  /* 이미지가 표시될 지역 */
  margin-bottom: 5px;

}

@media(min-width: 768px) { 
  .filebox .upload-display {
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 0;
  }
}

.filebox .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
  display: inline-block;
  padding: 2px;
  vertical-align: middle;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
   width:100px;
  height:100px;
}

.filebox .upload-display img {  /* 추가될 이미지 */
  display: block;
  max-width: 100%;
  width: 100% \9;
  height: auto;
}
		
		</style>
</head>
<body>
<div class="box_t">
	</div> 
	<font size="7">카테고리: ${dto.category }</font>
  <div id="warp">
	<div class="box-m">
		<div class="box1" id="map">
		
		</div>
		<div class="box2">
			제목: <input type="text" id="subject" value="${dto.subject }" style="width:90%; margin:20px 0 0 0">
			<textarea style="margin:10px 0 0 0;width:100%" rows="20" cols="100">${dto.content }</textarea>
			tag: <input type="text" id="tag" value="${dto.hashtag }" style="margin:10px 0 0 0; width:90%;">
			<div class="gAndh" align="center">
				<c:if test="${statusCnt==0 }">
					<input type="button" value="좋아요" onclick="check(0)">&nbsp;&nbsp;&nbsp;<input type="button" value="싫거든요" onclick="check(1)"><input type='text' id="ghStatus" value="좋아요를 선택하셨어요" style="background-color:white;"readonly> 
				</c:if>
				<c:if test="${statusCnt==1 }">
					<input type="button" value="좋아요" onclick="check(0)">&nbsp;&nbsp;&nbsp;<input type="button" value="싫거든요" onclick="check(1)"><input type='text'   id="ghStatus" value="싫어요를 선택하셨어요" style="background-color:white;"readonly> 
				</c:if>
				<c:if test="${statusCnt==2 }">
				<input type="button" value="좋아요" onclick="check(0)">&nbsp;&nbsp;&nbsp;<input type="button" value="싫거든요" onclick="check(1)">
				</c:if>
				
		</div>
		</div>
	</div>
	 
	<div class="box-m2">
		<div class="box3">
			
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<font size="4"> 
				   출발지 이름: ${sDto.startPlace} <br />
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: ${sDto.startAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호: ${sDto.startPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sDto.startStn }역 까지 ${sDto.startDis }m 떨어져 있습니다.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 소요시간:${sDto.startWT}분<br />
					<hr> <c:forEach var="list" items="${list}">
					경유지 이름: ${list.passPlace } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: ${list.passAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호: ${list.passPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.passStn }역 까지 ${list.passDis}m 떨어져 있습니다.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 소요시간:${list.passWT}분<br />
						<hr>
					</c:forEach> 
					 도착지 이름: ${eDto.endPlace} <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: ${eDto.endAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호: ${eDto.endPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${eDto.endStn }역 까지 ${eDto.endDis }m 떨어져 있습니다.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 소요시간:${eDto.endWT}분<br />
				</font>

			</div>
		</div>
		</div>
	<div class="box4">
		
			<div id="imgslide" >
				<div id="lista1" class="als-container" style="margin:30px 0 0 0; width:100%; ">
					<span class="als-prev" ><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					 
					  	<c:forEach var="s_image" items="${s_image }">	
					  	 <ul class="als-wrapper">			
						  <div class="als-item"style="width:50%;height:400;" >
						  	<div class="imgbox" id="img1" style="background-color:#494949;margin:5px 10px 5px 10px ">
						  	<img src=http://127.0.0.1:8000/wtg/img/${s_image} style="width:50%;height:400;">
						  	</div>
                          </div>
                           </ul>
                          </c:forEach>
					</div>		
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>	
				  </div>
	</div>
	 
		</div>
	</div>
	</div>


  <script>
  	var container = document.getElementById('map'); //div id=map자리에 지도를생성			
	var options = { 
									center: new daum.maps.LatLng(37.515504, 126.907628), 
									level: 7
								  };  			
	var map = new daum.maps.Map(container, options);
	
	var totalStr='${passInfo}';  //주소/x^y@
	var parse1=totalStr.split('@');
	
	var bounds = new daum.maps.LatLngBounds();
	var markers=new Array();
	for(var i=0; i<parse1.length-1;i++)
	{
		var parse2=parse1[i].split('/');//parse2[0]은 주소 [1]은 x^y
		var parsePoint=parse2[1].split('^');
		markerPosition=new daum.maps.LatLng(parsePoint[0],parsePoint[1]);
		markers[i]={latlng:markerPosition,title:parse2[0]};
		bounds.extend(markers[i].latlng);
	}

	for( var i=0;i<markers.length;i++)
	{
		var psimageSrc = 'http://127.0.0.1:8000/wtg/map/img/green_b.png', // 경유지마커이미지의 주소입니다    
	 	    psimageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
	 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
	 	    
		var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: markers[i].latlng, // 마커를 표시할 위치
	        title : markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
	    });
		 marker.setImage(psmarkerImage);
	}
	
	
	var s_Info='${s_point}';
	var e_Info='${e_point}';
	var s_point=s_Info.split('^');
	var e_point=e_Info.split('^');
	
	stPosition=new daum.maps.LatLng(s_point[0],s_point[1]);
	edPosition=new daum.maps.LatLng(e_point[0],e_point[1]);
	bounds.extend(stPosition);
	bounds.extend(edPosition);
	map.setBounds(bounds);
	var stimageSrc = 'http://127.0.0.1:8000/wtg/map/img/red_b.png', // 출발마커이미지의 주소입니다    
	    stimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
	    
	var startMarker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position:stPosition, // 마커를 표시할 위치
        title : '${s_name}', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
        image:startImage
	});
	
	
	var endimageSrc = 'http://127.0.0.1:8000/wtg/map/img/blue_b.png', // 도착지마커이미지의 주소입니다    
	    endimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
	    
	var endMarker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: edPosition, // 마커를 표시할 위치
        title :'${e_name}', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
        image:endImage
	});
	$.noConflict();
	jQuery( document ).ready(function( $ ) {
			$("#lista1").als({
				visible_items: 1,
				scrolling_items: 1,
				orientation: "horizontal",
				circular: "yes",
				autoscroll: "no",
				interval: 5000,
				speed: 500,
				easing: "linear",
				direction: "right",
				start_from: 0
			});
	});
	function check(num)
	{
		if(num==0)//좋아요
		{
			$.ajax({		
					url:"gAndh.nhn?cnt="+num+"&num=${dto.num}",
	 	 				success:function(data)
	 	 				{
	 	 					var str=data.replace(/\s/gi, '');
	 	 					if(str=="1")
	 	 						{
	 	 							document.getElementById('ghStatus').value="좋아요를 선택하셨어요";
	 	 						}
	 	 				}
		 	 	        })
		}
		
		if(num==1)//싫거든요
		{
			$.ajax({		
				url:"gAndh.nhn?cnt="+num+"&num=${dto.num}",
	 	 				success:function(data)
	 	 				{
	 	 					var str=data.replace(/\s/gi, '');
	 	 					if(str=="0")
 	 						{
	 	 						document.getElementById('ghStatus').value="싫어요를 선택하셨어요";
 	 						}
	 	 				}
		 	 	        })
		}
		
		
		
	}
	
	
	
  </script>
</body>
</html>