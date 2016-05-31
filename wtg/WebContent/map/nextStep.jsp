<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>               
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>�ڽ�����ϱ�</title>
<style>
	#warp{width:100%;}
	.box1{background-color:red; width:650px; height:500px; float:left;margin:0 50px 0 50px }
	.box2{background-color:#6600ff; width:800px; height:400px;float:left; margin:0 0 0 0px}
	.box3{background-color:#cccc33; width:650px; height:400px;float:left;display:block;margin:50px 0 0 50px}
	.box4{background-color:#0033cc; width:550px; height:400px;float:left;margin:50px 0 0 50px}
	.box5{background-color:green; width:200px; height:300px;float:left;margin:50px 0 0 50px}
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

 </style>
 </head>
 <body>
 <font size="7">${dto.category }</font>
  <div id="warp">
	<div class="box-m">
		<div class="box1" id="map">
		
		</div>
		<div class="box2">
				<form name="frm" id="frm" action="insertDB.nhn" method="post"
				accept-charset="EUC-KR">
				<!-- ������������ȣ�� ���� -->
				<div id="editor_frame">
					<textarea name="daumeditor" id="daumeditor" rows="100" cols="100"
						style="width: 766px; height: 0px; display: none; border: 1px solid black;"></textarea>
				</div>

				<!-- ���� ���� ������� �Ѿ textarea �±� -->

				<div id="btn" z-Index="5">
					<input type="button" id="save_button" value="��������" />
				</div>
			</form>
		</div>
	</div>
	
	<div class="box-m2">
		<div class="box3">
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<font size="4"> ����� �̸�: ${startTitle} �ּ�: ${startAddress} <br />
					��ȭ��ȣ: ${startPhone } ��ó��: ${startStn } ��ó�������Ÿ�: ${startDtc }m �̵��ð�:
					${startWalk}��<br />
					<hr> <c:forEach var="alist" items="${list}">
						������
							<c:forTokens var="a" items="${alist}" delims="/" varStatus="i">
							<c:if test="${i.count==1 }"> �̸�: ${a}</c:if>
							<c:if test="${i.count==2 }">�ּ�: ${a} </c:if>
							<c:if test="${i.count==3 }">
								<br /> ��ȭ��ȣ: ${a} </c:if>
							<c:if test="${i.count==4 }">��ó�������� �Ÿ�: ${a} </c:if>
							<c:if test="${i.count==5 }">��ó��: ${a}m </c:if>
							<c:if test="${i.count==6 }">�̵��ð�: ${a}�� </c:if>
						</c:forTokens>
						<hr>
					</c:forEach> ������ �̸�: ${endTitle} �ּ�: ${endAddress} <br /> ��ȭ��ȣ: ${endPhone }
					��ó��: ${endStn } ��ó�������Ÿ�: ${endDtc }m �̵��ð�: ${endWalk }��<br />
				</font>

			</div>
		</div>
		</div>
		<div class="box4">
				
				<div id="imgslide">

					<div id="lista1" class="als-container" >

					<span class="als-prev"><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						
						  <li class="als-item"style="width:150px; height:250px;" >
							<div class="filebox bs3-success"  >
                         		<label for="ex_file2" style="width:130px;height:250px"></label> 
                          		<input type="file" id="s_file1"  > 
                          </li>	
							<li class="als-item" style="width:150px; height:250px;">
								<div class="filebox bs3-success"  >
                         		<label for="ex_file2" style="width:130px;height:250px"></label> 
                          		<input type="file" id="s_file2"> 
                        </div>2</li>
							<li class="als-item"style="width:150px; height:250px;">
							<div class="filebox bs3-success"  >
                         		<label for="ex_file2" style="width:130px;height:250px"></label> 
                          		<input type="file" id="s_file3"> 
							</li>
								<li class="als-item"style="width:150px; height:250px;">
								<div class="filebox bs3-success"  >
                         		<label for="ex_file2" style="width:130px;height:250px"></label> 
                          		<input type="file" id="s_file4"> 
                          		</li>
	
					  </ul>
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
					
				  </div>
			</div>		
	</div>
		<div class="box5">
				<div class="filebox bs3-success"  >
                        <label for="ex_file2" style="width:130px;height:240px"></label> 
                 <input type="file" id="m_file"> 
	</div>
		</div>
	</div>
  </div>
<input type="button" value="test" onclick="test()">


<link rel="stylesheet" href="/wtg/daumeditor/css/editor.css" type="text/css" charset="EUC-KR"/>
		<script src="/wtg/daumeditor/js/editor_loader.js" type="text/javascript" charset="EUC-KR"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>	
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/als_demo.css" />
		<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>		
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/CSSreset.min.css" />
		<script>
		function test()
		{
			if($.trim($('#s_file1').val()) != ''){
				   alert("dfdddd");
				  }
		}
		var totalStr='${returnName}';
		//alert(totalStr);
		var parseStr=totalStr.split(',');
		var markers=new Array();
		var bounds = new daum.maps.LatLngBounds();    
		
		for(var i=0;i<parseStr.length;i++)
		{
			var splitStr=parseStr[i].split('/');
			//alert(splitStr[1]);
			markerPosition=new daum.maps.LatLng(splitStr[1],splitStr[2]);
			markers[i]={latlng:markerPosition,title:splitStr[0]};
			bounds.extend(markers[i].latlng);

		}
		

		var container = document.getElementById('map'); //div id=map�ڸ��� ����������			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 7
									  };  			
		var map = new daum.maps.Map(container, options); 
			
		for( var i=0;i<markers.length;i++)
		{
			
			if(i==0)
			{
				var stimageSrc = 'http://127.0.0.1:8000/wtg/map/red_b.png', // ��߸�Ŀ�̹����� �ּ��Դϴ�    
 		 	    stimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
				var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
 		 	    
				var startMarker = new daum.maps.Marker({
			        map: map, // ��Ŀ�� ǥ���� ����
			        position: markers[i].latlng, // ��Ŀ�� ǥ���� ��ġ
			        title : markers[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
				});
			        startMarker.setImage(startImage);
			}
			if(i==markers.length-1)
			{
				var endimageSrc = 'http://127.0.0.1:8000/wtg/map/blue_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
 		 	    endimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
 		 	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
				endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
 		 	    
				var endMarker = new daum.maps.Marker({
			        map: map, // ��Ŀ�� ǥ���� ����
			        position: markers[i].latlng, // ��Ŀ�� ǥ���� ��ġ
			        title : markers[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
				});
 		 	    
 		 	    
				 endMarker.setImage(endImage);
			}
			if(i>0&&i<markers.length-1)
			{
				var psimageSrc = 'http://127.0.0.1:8000/wtg/map/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
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
		}
		map.setBounds(bounds);

			</script>			
	</head>
	  
<body onload="aa()">

<script>
$(function aa(){
    $.ajax({
        url : "/wtg/daumeditor/editor_frame.html",
        success : function(data){
            $("#editor_frame").html(data);
            // ������UI load
            var config = {
                /* ��Ÿ�� �� ���ҽ����� �ε��� �� �ʿ��� �κ�����, ��ΰ� ����Ǹ� �� �κ� ������ �ʿ�. ex) http://xxx.xxx.com */
                txHost: '', 
                /* ��Ÿ�� �� ���ҽ����� �ε��� �� �ʿ��� �κ�����, ��ΰ� ����Ǹ� �� �κ� ������ �ʿ�. ex) /xxx/xxx/ */
                txPath: '', 
                /* �����ʿ����. */
                txService: 'sample', 
                /* �����ʿ����. ������Ʈ�� �������� ��츸 �����Ѵ�. */
                txProject: 'sample',
                /* ��κ��� ��쿡 ���ڿ� */
                initializedId: "", 
                /* �����͸� �ѷ��ΰ� �ִ� ���̾� �̸�(������ �����̳�) */
                wrapper: "tx_trex_container",
                /* ����ϱ� ���� Form �̸� */
                form: "frm", 
                /*�����Ϳ� ���Ǵ� �̹��� ���͸�, �ʿ信 ���� �����Ѵ�. */
                txIconPath: "/wtg/daumeditor/images/icon/editor/", 
                /*������ ���Ǵ� �̹��� ���͸�, ���񽺿��� ����� ���� �ϼ��� �������� �����Ǳ� ���� �����η� �����Ѵ�. */
                txDecoPath: "/daumeditor/images/deco/contents/", 
                canvas: {
                    styles: {
                        /* �⺻ ���ڻ� */
                        color: "#123456", 
                        /* �⺻ ����ü */
                        fontFamily: "����", 
                        /* �⺻ ����ũ�� */
                        fontSize: "10pt", 
                        /*�⺻ ���� */
                        backgroundColor: "#fff", 
                        /*�⺻ �ٰ��� */
                        lineHeight: "1.5", 
                        /* ������ ������ ���� */
                        padding: "8px"
                    },
                    showGuideArea: false
                },
                events: {
                    preventUnload: false
                },
                sidebar: {
                    attachbox: {
                        show: true,
                        confirmForDeleteAll: true
                    }
                },
                /* �̹���÷�� ���� �߰� config */
                size: {
                    /* ������ ���������� ���̰� ���� ��쿡 ���� */
                    contentWidth: 700 
                }
            };
             
            //�����ͳ��� ȯ�漳�� �����ϱ�
            new Editor(config);
        }
    });
     
    //form submit ��ư Ŭ��
    $("#save_button").click(function(){
        //���������Ͱ� ���Ե� form submit
        Editor.save();
    })
})

        //���������Ͱ� ���Ե� form submit
   	


//Editor.save() ȣ�� �� ������ validation ������ ���� �Լ� 
//validation üũ���� �Է������� �� �Լ��� �߰� �������ݴϴ�.
function validForm(editor) {
    var validator = new Trex.Validator();
    var content = editor.getContent();
    
    if (!validator.exists(content)) {
        alert('������ �Է��ϼ���');
        return false;
    }
    return true;
}
  
//validForm �Լ����� true���� ������ �̾ form submit�� �����ִ�  setForm�Լ�
function setForm(editor) {
    var content = editor.getContent();
    //alert(content);
   $("#daumeditor").val(content)

    return true;
}

$.noConflict();
jQuery( document ).ready(function( $ ) {
		$("#lista1").als({
			visible_items: 3,
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