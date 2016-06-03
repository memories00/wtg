<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html>
<head>
	<style>
		<style>
	#warp{width:100%;}
	.box1{background-color:red; width:650px; height:500px; float:left;margin:0 50px 0 50px }
	.box2{background-color:#6600ff; width:800px; height:400px;float:left; margin:0 0 0 0px}
	.box3{background-color:yellow; width:650px; height:400px;float:left;display:block;margin:50px 0 0 50px}
	.box4{ background-color:green;width:600px; height:200px;float:left;margin:50px 0 0 50px}
	.box5{background-color:red;width:170px; height:230px;float:left;margin:55px 0 0 50px;border:1px;}
	.imgbox{background-color:#6600ff; width:150px; height:150px;}
	.box-m{float:left;}
	.box-m2{float:left;display:block;}
	
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>코스확인</title>
<link rel="stylesheet" href="/wtg/daumeditor/css/editor.css" type="text/css" charset="EUC-KR"/>
		<script src="/wtg/daumeditor/js/editor_loader.js" type="text/javascript" charset="EUC-KR"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>	
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/als_demo.css" />
		<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>		
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/CSSreset.min.css" />
</head>
<body>
	<font size="7"></font>
  <div id="warp">
	<div class="box-m">
		<div class="box1" id="map">
		
		</div>
		<div class="box2">

		</div>
	</div>
	
	<div class="box-m2">
		<div class="box3">
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<font size="4"> 
				   출발지 이름: ${s_name} <br />
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: ${startAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호: ${startPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${startStn }역 까지 ${startDtc }m 떨어져 있습니다.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 소요시간:${startWalk}분<br />
					<hr> <c:forEach var="alist" items="${list}">
						경유지
							<c:forTokens var="a" items="${alist}" delims="/" varStatus="i">
							<c:if test="${i.count==1 }"> 이름: ${a}<br /></c:if>
							<c:if test="${i.count==2 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: ${a} <br /> </c:if>
							<c:if test="${i.count==3 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호: ${a} <br/></c:if>
							<c:if test="${i.count==4 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${a}역 까지  </c:if>
							<c:if test="${i.count==5 }">${a}m 떨어져 있습니다.<br/> </c:if>
							<c:if test="${i.count==6 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 소요시간: ${a}분 </c:if>
						</c:forTokens>
						<hr>
					</c:forEach> 
					 도착지 이름: ${e_name} <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: ${endAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호: ${endPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${endStn }역 까지 ${endDtc }m 떨어져 있습니다.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 소요시간:${endWalk}분<br />
				</font>

			</div>
		</div>
		</div>
	<div class="box4">
					
	</div>
		<div class="box5">
			<div class="imgbox" id="m_img"style="margin:5px 10px 5px 10px ">
			</div>
		<div class="filebox bs3-success"  id="mx">
        	<label for="m_file" style="margin:10px 0 0 50px ">업로드</label> 
         <input type="file" id="m_file"  onchange="test1(); "> 
		
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
	
	var markers=new Array();
	for(var i=0; i<parse1.length-1;i++)
	{
		var parse2=parse1[i].split('/');//parse2[0]은 주소 [1]은 x^y
		var parsePoint=parse2[1].split('^');
		markerPosition=new daum.maps.LatLng(parsePoint[0],parsePoint[1]);
		markers[i]={latlng:markerPosition,title:parse2[0]};

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

  
  </script>
</body>
</html>