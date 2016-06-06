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
	.box2{width:800px; height:550px;float:left; margin:0 0 0 0px}
	.box3{ width:650px; height:400px;float:left;display:block;margin:50px 0 0 50px}
	.box4{ width:600px; height:200px;float:left;margin:60px 0 0 50px}
	.box5{background-color:red;width:170px; height:230px;float:left;margin:65px 0 0 50px;border:1px;}
	.imgbox{background-color:#6600ff; width:150px; height:150px;}
	.box-m{float:left;}
	.box-m2{float:left;display:block;}
	.btn{background-color:#6600ff; width:150px; height:50px; margin:300px 0 0 0}
	.sub{background-color:silver;width:800px;}
	.tag{background-color:pink;width:800px;}
	
	
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
 </head>
 <body>
 <font size="7">${dto.category }</font>
  <div id="warp">
	<div class="box-m">
		<div class="box1" id="map">
		
		</div>
		<div class="box2">
		<div class="sub">����: <input type="text" id="subject" style="width:93%"> </div>
				<form name="frm" id="frm" action="insertDB.nhn" method="post"	accept-charset="EUC-KR">
				<!-- ������������ȣ�� ���� -->
				<div id="editor_frame">			
					<textarea name="daumeditor" id="daumeditor" rows="100" cols="100"
						style="width: 766px; height: 0px; display: none; border: 1px solid black;"></textarea>
				</div>
				<div class="tag">tag: <input type="text" id="tag" style="width:93%"> </div>
				<input type="button" id="save_button" value="��������" style="float:right;margin:5px 0 0 0 "/>	

				<!-- ���� ���� ������� �Ѿ textarea �±� -->

				
			</form>
		</div>
	</div>
	
	<div class="box-m2">
		<div class="box3">
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<font size="4"> 
				   ����� �̸�: ${startTitle} <br />
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ּ�: ${startAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȭ��ȣ: ${startPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${startStn }�� ���� ${startDtc }m ������ �ֽ��ϴ�.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� �ҿ�ð�:${startWalk}��<br />
					<hr> <c:forEach var="alist" items="${list}">
						������
							<c:forTokens var="a" items="${alist}" delims="/" varStatus="i">
							<c:if test="${i.count==1 }"> �̸�: ${a}<br /></c:if>
							<c:if test="${i.count==2 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ּ�: ${a} <br /> </c:if>
							<c:if test="${i.count==3 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȭ��ȣ: ${a} <br/></c:if>
							<c:if test="${i.count==4 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${a}�� ����  </c:if>
							<c:if test="${i.count==5 }">${a}m ������ �ֽ��ϴ�.<br/> </c:if>
							<c:if test="${i.count==6 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� �ҿ�ð�: ${a}�� </c:if>
						</c:forTokens>
						<hr>
					</c:forEach> 
					 ������ �̸�: ${endTitle} <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ּ�: ${endAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȭ��ȣ: ${endPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${endStn }�� ���� ${endDtc }m ������ �ֽ��ϴ�.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� �ҿ�ð�:${endWalk}��<br />
				</font>

			</div>
		</div>
		</div>
		
		<div class="box4">
				
				<div id="imgslide">

					<div id="lista1" class="als-container" >

					<span class="als-prev" ><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						
						  <div class="als-item"style="width:170px; height:230px;" >
						  	<div class="imgbox" id="img1" style="margin:5px 10px 5px 10px ">
						  	</div>
							<div class="filebox bs3-success" id="ex1">
                          		<label for="ex_file1" style="margin:10px 0 0 5px ">���ε�</label> 
                         	 	<input type="file" id="ex_file1" onchange="test();" > 
                        	</div>	
                          </div>
                          	
							 <div class="als-item"style="width:170px; height:230px;" >
						  	<div class="imgbox" id="img2"style="margin:5px 10px 5px 10px ">
						  	</div>
							<div class="filebox bs3-success" id="ex2">
                          		<label for="ex_file2" style="margin:10px 0 0 5px ">���ε�</label> 
                         	 	<input type="file" id="ex_file2" onchange="test();" > 
                        	</div>	
                          </div>
                          
							<div class="als-item"style="width:170px; height:230px;" >
						  	<div class="imgbox" id="img3"style="margin:5px 10px 5px 10px ">
						  	</div>
							<div class="filebox bs3-success" id="ex3">
                          		<label for="ex_file3" style="margin:10px 0 0 5px ">���ε�</label> 
                         	 	<input type="file" id="ex_file3" onchange="test();" > 
                        	</div>	
                          </div>
                          
                           <div class="als-item"style="width:170px; height:230px;" >
						  	<div class="imgbox" id="img4" style="margin:5px 10px 5px 10px ">
						  	</div>
							<div class="filebox bs3-success" id="ex4">
                          		<label for="ex_file4" style="margin:10px 0 0 5px ">���ε�</label> 
                         	 	<input type="file" id="ex_file4" onchange="test();" > 
                        	</div>	
                          </div>
	
					  </ul>
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
					
				  </div>
			</div>		
	</div>
		<div class="box5">
			<div class="imgbox" id="m_img"style="margin:5px 10px 5px 10px ">
			</div>
		<div class="filebox bs3-success"  id="mx">
        	<label for="m_file" style="margin:10px 0 0 50px ">���ε�</label> 
         <input type="file" id="m_file"  onchange="test1(); "> 
		
	</div>
		</div>
	</div>
  </div>
  <form name="form1" method="post" action="plase.nhn">
</form>
<link rel="stylesheet" href="/wtg/daumeditor/css/editor.css" type="text/css" charset="EUC-KR"/>
		<script src="/wtg/daumeditor/js/editor_loader.js" type="text/javascript" charset="EUC-KR"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>	
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/als_demo.css" />
		<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>		
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/CSSreset.min.css" />
		<script>
		function test1()
		{

			var src=$('#m_file').val();
			var index=src.lastIndexOf("\\");
			var str=src.substring(index+1,src.length);
			
			$.ajax({		
	 				url:"imageInsert.nhn?filePath="+src+"&fileName="+str,
	 	 				success:function(data)
	 	 				{		 	
	 	 					var listEl = document.getElementById('m_img');//�����Ȳ ����Ʈ�� ġȯ

	 	 					var imgStr='<img src="\\wtg\\img\\'+str+'"style="width:150px; height:150px;">';
	 	 					var el = document.createElement('li');//li�� �߰�	 			 
	 	 					fragment = document.createDocumentFragment();
	 	 					el.innerHTML=imgStr;
	 	 					fragment.appendChild(el);
	 	 					listEl.appendChild(fragment);	
	 	 				}
		 	 	        })
		}
		function test()
		{
			var src;
			var index;
			var str;
			var listEl;
			if($.trim($('#ex_file1').val()) != '')
			{
				src=$('#ex_file1').val();
				listEl = document.getElementById('img1');//�����Ȳ ����Ʈ�� ġȯ
				
			}
			if($.trim($('#ex_file2').val()) != '')
			{
				src=$('#ex_file2').val();
				listEl = document.getElementById('img2');//�����Ȳ ����Ʈ�� ġȯ
			}
			if($.trim($('#ex_file3').val()) != '')
			{
				src=$('#ex_file3').val();
				listEl = document.getElementById('img3');//�����Ȳ ����Ʈ�� ġȯ
				  }
			if($.trim($('#ex_file4').val()) != '')
			{
				src=$('#ex_file4').val();
				listEl = document.getElementById('img4');//�����Ȳ ����Ʈ�� ġȯ
				  }
			
			index=src.lastIndexOf("\\");
			str=src.substring(index+1,src.length);
			$.ajax({		
	 				url:"imageInsert.nhn?filePath="+src+"&fileName="+str,
	 	 				success:function(data)
	 	 				{		 	 
	 	 					var imgStr='<img src="\\wtg\\img\\'+str+'" style="width:150px; height:150px;">';
	 	 					var el = document.createElement('li');//li�� �߰�	 			 
	 	 						fragment = document.createDocumentFragment();
	 	 					el.innerHTML=imgStr;
	 	 					fragment.appendChild(el);
	 	 					listEl.appendChild(fragment);	
	 	 					
	 	 				}
		 	 	        })

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
				var stimageSrc = 'http://127.0.0.1:8000/wtg/map/img/red_b.png', // ��߸�Ŀ�̹����� �ּ��Դϴ�    
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
				var endimageSrc = 'http://127.0.0.1:8000/wtg/map/img/blue_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
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
    	//alert($('#ex_file1').val());
        //���������Ͱ� ���Ե� form submit
        
        Editor.save();
        
        
    })
})

function submitForm(strName)
{	
	//alert($('#m_file').val());
	var totalStr="";
	if($.trim($('#m_file').val())!='')
	{
		var src=$('#m_file').val();
		var index=src.lastIndexOf("\\");
		var str=src.substring(index+1,src.length);
		totalStr+=str+"@";
		//alert("m"+str);
	}
	 if($.trim($('#m_file').val())==''){
		 totalStr+="defalut.jpg@";
	}
	
	if($.trim($('#ex_file1').val())!='')
	{
		var src=$('#ex_file1').val();
		var index=src.lastIndexOf("\\");
		var str=src.substring(index+1,src.length);
		totalStr+=str+"/";
		//alert("1"+str);
	}
	if($.trim($('#ex_file1').val())==''){
		totalStr+="default.jsp/";
	}
	
	if($.trim($('#ex_file2').val())!='')
	{
		var src=$('#ex_file2').val();
		var index=src.lastIndexOf("\\");
		var str=src.substring(index+1,src.length);
		totalStr+=str+"/";
		//alert("2"+str);
	}
	if($.trim($('#ex_file2').val())==''){
		totalStr+="default.jsp/";
	}
	
	if($.trim($('#ex_file3').val())!='')
	{
		var src=$('#ex_file3').val();
		var index=src.lastIndexOf("\\");
		var str=src.substring(index+1,src.length);
		totalStr+=str+"/";
		//alert("3"+str);
	}
	if($.trim($('#ex_file3').val())==''){
		str+="default.jsp/";
	}
	
	
	if($.trim($('#ex_file4').val())!='')
	{
		var src=$('#ex_file4').val();
		var index=src.lastIndexOf("\\");
		var str=src.substring(index+1,src.length);
		totalStr+=str+"/";
		//alert("4"+str);
	}
	if($.trim($('#ex_file4').val())==''){
		totalStr+="default.jsp/";
	}
	 
	  document.form1.innerHTML = '<input type="hidden" name="totalName" value="'+totalStr+'">';
	  document.form1.submit();
	 var sub=document.getElementById('subject');
	 var hash=document.getElementById('tag');
	 //alert(sub.value);
	  document.frm.innerHTML='<input type="hidden" name="daumeditor" value="'+strName+'">'+
	  													'<input type="hidden" name="subject" value="'+sub.value+'">'+
	  													'<input type="hidden" name="hashtag" value="'+hash.value+'">';
	  document.frm.submit();
}

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
var boardContent;
function setForm(editor) {
    var content = editor.getContent();
    submitForm(editor.getContent());
   $("#daumeditor").val(content);

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