<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html>
<head>
	<style>
		<style>
	#warp{width:100%;}
	.box1{background-color:red; width:650px; height:350px; float:left;margin:0 50px 0 50px }
	.box2{background-color:#6600ff; width:800px; height:350px;float:left; margin:0 0 0 0px}
	.box3{background-color:yellow; width:650px; height:400px;float:left;display:block;margin:50px 0 0 50px}
	.box4{ background-color:green;width:800px; height:500px;float:left;margin:50px 0 0 50px}
	.box5{background-color:red;margin:0px 0 0 0;width:170px; height:170px;float:left;border:1px;}
	.imgbox{background-color:#6600ff; width:150px; height:150px;}
	.box-m{float:left;}
	.box-m2{float:left;display:block;}
	.preview{ background-color:blue; width:700px;height:300; margin: 30px 0px 0 50px}
	
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

.filebox input[type="file"] {  /* ���� �ʵ� ����� */
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
.filebox .upload-display {  /* �̹����� ǥ�õ� ���� */
  margin-bottom: 5px;

}

@media(min-width: 768px) { 
  .filebox .upload-display {
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 0;
  }
}

.filebox .upload-thumb-wrap {  /* �߰��� �̹����� ���δ� ��� */
  display: inline-block;
  padding: 2px;
  vertical-align: middle;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
   width:100px;
  height:100px;
}

.filebox .upload-display img {  /* �߰��� �̹��� */
  display: block;
  max-width: 100%;
  width: 100% \9;
  height: auto;
}
	
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ڽ�Ȯ��</title>
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
	<font size="7">ī�װ�: ${dto.category }</font>
  <div id="warp">
	<div class="box-m">
		<div class="box1" id="map">
		
		</div>
		<div class="box2">
			����: <input type="text" id="subject" value="${dto.subject }" style="width:720px;">
			<textarea style="margin:10px 0 0 0" rows="20" cols="117">${dto.content }</textarea>
			tag: <input type="text" id="tag" value="${dto.hashtag }" style="margin:10px 0 0 0; width:720px;">
		</div>
	</div>
	 
	<div class="box-m2">
		<div class="box3">
			
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<font size="4"> 
				   ����� �̸�: ${sDto.startPlace} <br />
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ּ�: ${sDto.startAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȭ��ȣ: ${sDto.startPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sDto.startStn }�� ���� ${sDto.startDis }m ������ �ֽ��ϴ�.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� �ҿ�ð�:${sDto.startWT}��<br />
					<hr> <c:forEach var="list" items="${list}">
					������ �̸�: ${list.passPlace } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ּ�: ${list.passAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȭ��ȣ: ${list.passPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.passStn }�� ���� ${list.passDis}m ������ �ֽ��ϴ�.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� �ҿ�ð�:${list.passWT}��<br />
						<hr>
					</c:forEach> 
					 ������ �̸�: ${eDto.endPlace} <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ּ�: ${eDto.endAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȭ��ȣ: ${eDto.endPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${eDto.endStn }�� ���� ${eDto.endDis }m ������ �ֽ��ϴ�.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� �ҿ�ð�:${eDto.endWT}��<br />
				</font>

			</div>
		</div>
		</div>
	<div class="box4">
		
			<div id="imgslide" style="background-color:silver;">
				<div id="lista1" class="als-container" style="margin:30px 0 0 0; width:800px;">
					<span class="als-prev" ><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					 
					  	<c:forEach var="s_image" items="${s_image }">	
					  	 <ul class="als-wrapper">			
						  <div class="als-item"style="width:700px;height:400;" >
						  	<div class="imgbox" id="img1" style="margin:5px 10px 5px 10px ">
						  	<img src=http://127.0.0.1:8000/wtg/img/${s_image} style="width:700px;height:400;">
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
  	var container = document.getElementById('map'); //div id=map�ڸ��� ����������			
	var options = { 
									center: new daum.maps.LatLng(37.515504, 126.907628), 
									level: 7
								  };  			
	var map = new daum.maps.Map(container, options);
	
	var totalStr='${passInfo}';  //�ּ�/x^y@
	var parse1=totalStr.split('@');
	
	var bounds = new daum.maps.LatLngBounds();
	var markers=new Array();
	for(var i=0; i<parse1.length-1;i++)
	{
		var parse2=parse1[i].split('/');//parse2[0]�� �ּ� [1]�� x^y
		var parsePoint=parse2[1].split('^');
		markerPosition=new daum.maps.LatLng(parsePoint[0],parsePoint[1]);
		markers[i]={latlng:markerPosition,title:parse2[0]};
		bounds.extend(markers[i].latlng);
	}

	for( var i=0;i<markers.length;i++)
	{
		var psimageSrc = 'http://127.0.0.1:8000/wtg/map/img/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
	 	    psimageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
	 	    psimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		psmarkerImage = new daum.maps.MarkerImage(psimageSrc, psimageSize, psimageOption);
	 	    
		var marker = new daum.maps.Marker({
	        map: map, // ��Ŀ�� ǥ���� ����
	        position: markers[i].latlng, // ��Ŀ�� ǥ���� ��ġ
	        title : markers[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
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
	var stimageSrc = 'http://127.0.0.1:8000/wtg/map/img/red_b.png', // ��߸�Ŀ�̹����� �ּ��Դϴ�    
	    stimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
	var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
	    
	var startMarker = new daum.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position:stPosition, // ��Ŀ�� ǥ���� ��ġ
        title : '${s_name}', // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
        image:startImage
	});
	
	
	var endimageSrc = 'http://127.0.0.1:8000/wtg/map/img/blue_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
	    endimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
	endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
	    
	var endMarker = new daum.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: edPosition, // ��Ŀ�� ǥ���� ��ġ
        title :'${e_name}', // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
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
  
	
	
	
  </script>
</body>
</html>