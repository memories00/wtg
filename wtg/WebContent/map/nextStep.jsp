<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>               
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>코스등록하기</title>
<link rel="stylesheet" href="lib/als_demo.css">
<link rel="stylesheet" href="lib/CSSreset.min.css">
<link rel="stylesheet" href="sample/css/map.css">
<link rel="stylesheet" href="sample/css/style.css">
 </head>

<body onload="aa()">

<div id="header" style="width:100%; height:80px;">
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
 
 <font size="7">${dto.category }</font>
  
  <div id="container">
  	<div class="col-sm-12">
		<div class="col-sm-6">
			<div class="panel-body ">
					<div class="box1" id="map">
				</div>
			</div>
		</div><!-- /지도 부분끝 -->
	<div class="col-sm-6">
			<div class="panel-body">
					<div class="sub">제목: <input type="text" id="subject" style="width:80%"> </div>
				<form name="frm" id="frm" action="insertDB.nhn" method="post"	accept-charset="EUC-KR">
				<!-- 에디터프레임호출 영역 -->
				<div id="editor_frame" style="margin:10px 0 0 0" >			
				
					<textarea name="daumeditor" id="daumeditor" 
						style=" height: 100px; display: none; border: 1px solid black;"></textarea>
				</div>
				<div class="tag">tag: <input type="text" id="tag" style="width:80%; margin:10px; 0 0 0"> </div>
				<input type="button" id="save_button" value="등록하기" style="float:right;margin:5px 0 0 0 "/>	

				<!-- 실제 값이 담겨져서 넘어갈 textarea 태그 -->

				
			</form>
			</div>
		</div>
	</div>
	<div class="container">
	<div class="col-sm-6">
			<div class="panel-body ">
				<div id="menu_wrap" class="bg_white">
			<div class="option">
				<font size="4"> 
				   출발지 이름: ${startTitle} <br />
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
					 도착지 이름: ${endTitle} <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소: ${endAddress} <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호: ${endPhone } <br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${endStn }역 까지 ${endDtc }m 떨어져 있습니다.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예상 소요시간:${endWalk}분<br />
				</font>

			</div>
		</div>
			</div>
		</div>
<div class="col-sm-5">
			<div class="panel-body ">
			<div id="imgslide">
			<section id="content">
					<div id="lista1" class="als-container" >

					<span class="als-prev" ><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						
						  <li class="als-item">
						  	<div class="imgbox" id="img1" >
						  	</div>
							<div class="filebox bs3-success" id="ex1">
                          		<label for="ex_file1" style="margin:10px 0 0 5px ">업로드</label> 
                         	 	<input type="file" id="ex_file1" onchange="test();" > 
                        	</div>	
                          </li>
                          	
							 <li class="als-item">
						  	<div class="imgbox" id="img2">
						  	</div>
							<div class="filebox bs3-success" id="ex2">
                          		<label for="ex_file2" style="margin:10px 0 0 5px ">업로드</label> 
                         	 	<input type="file" id="ex_file2" onchange="test();" > 
                        	</div>	
                          </li>
                          
							<li class="als-item">
						  	<div class="imgbox" id="img3">
						  	</div>
							<div class="filebox bs3-success" id="ex3">
                          		<label for="ex_file3" style="margin:10px 0 0 5px ">업로드</label> 
                         	 	<input type="file" id="ex_file3" onchange="test();" > 
                        	</div>	
                          </li>
                          
                           <li class="als-item">
						  	<div class="imgbox" id="img4" >
						  	</div>
							<div class="filebox bs3-success" id="ex4">
                          		<label for="ex_file4" style="margin:10px 0 0 5px ">업로드</label> 
                         	 	<input type="file" id="ex_file4" onchange="test();" > 
                        	</div>	
                          </li>
	
					  </ul>
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
					
				  </div>
				  </section>
			</div>
		</div>
	</div>
<div class="col-sm-1">
	<div class="imgbox" id="m_img"style="margin:5px 10px 5px 10px;border:1px solid ">
			</div>
		<div class="filebox bs3-success"  id="mx">
        	<label for="m_file" style="margin:5px 0 0 35px ">업로드</label> 
         <input type="file" id="m_file"  onchange="test1(); "> 
		
	</div>
</div>
</div><!-- 2단 -->

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
	 	 					var listEl = document.getElementById('m_img');//진행상황 리스트를 치환

	 	 					var imgStr='<img src="\\wtg\\img\\'+str+'"style="width:100%; height:90%;">';
	 	 					var el = document.createElement('li');//li를 추가	 			 
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
				listEl = document.getElementById('img1');//진행상황 리스트를 치환
				
			}
			if($.trim($('#ex_file2').val()) != '')
			{
				src=$('#ex_file2').val();
				listEl = document.getElementById('img2');//진행상황 리스트를 치환
			}
			if($.trim($('#ex_file3').val()) != '')
			{
				src=$('#ex_file3').val();
				listEl = document.getElementById('img3');//진행상황 리스트를 치환
				  }
			if($.trim($('#ex_file4').val()) != '')
			{
				src=$('#ex_file4').val();
				listEl = document.getElementById('img4');//진행상황 리스트를 치환
				  }
			
			index=src.lastIndexOf("\\");
			str=src.substring(index+1,src.length);
			$.ajax({		
	 				url:"imageInsert.nhn?filePath="+src+"&fileName="+str,
	 	 				success:function(data)
	 	 				{		 	 
	 	 					var imgStr='<img src="\\wtg\\img\\'+str+'" style="width:100%; height:90%;">';
	 	 					var el = document.createElement('li');//li를 추가	 			 
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
		

		var container = document.getElementById('map'); //div id=map자리에 지도를생성			
		var options = { 
										center: new daum.maps.LatLng(37.515504, 126.907628), 
										level: 7
									  };  			
		var map = new daum.maps.Map(container, options); 
			
		for( var i=0;i<markers.length;i++)
		{
			
			if(i==0)
			{
				var stimageSrc = '/wtg/map/img/red_b.png', // 출발마커이미지의 주소입니다    
 		 	    stimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
 		 	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
 		 	    
				var startMarker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: markers[i].latlng, // 마커를 표시할 위치
			        title : markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
				});
				startMarker.setImage(startImage);
			}
			if(i==markers.length-1)
			{
				var endimageSrc = '/wtg/map/img/blue_b.png', // 도착지마커이미지의 주소입니다    
 		 	    endimageSize = new daum.maps.Size(55, 55), // 마커이미지의 크기입니다
 		 	    endimageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				endImage = new daum.maps.MarkerImage(endimageSrc, endimageSize, endimageOption);
 		 	    
				var endMarker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: markers[i].latlng, // 마커를 표시할 위치
			        title : markers[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다 
				});
 		 	    
 		 	    
				 endMarker.setImage(endImage);
			}
			if(i>0&&i<markers.length-1)
			{
				var psimageSrc = '/wtg/map/img/green_b.png', // 경유지마커이미지의 주소입니다    
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
		}
		map.setBounds(bounds);

			</script>			

	  


<script>
$(function aa(){
    $.ajax({
        url : "/wtg/daumeditor/editor_frame.html",
        success : function(data){
            $("#editor_frame").html(data);
            // 에디터UI load
            var config = {
                /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
                txHost: '', 
                /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
                txPath: '', 
                /* 수정필요없음. */
                txService: 'sample', 
                /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
                txProject: 'sample',
                /* 대부분의 경우에 빈문자열 */
                initializedId: "", 
                /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
                wrapper: "tx_trex_container",
                /* 등록하기 위한 Form 이름 */
                form: "frm", 
                /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
                txIconPath: "/wtg/daumeditor/images/icon/editor/", 
                /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
                txDecoPath: "/daumeditor/images/deco/contents/", 
                canvas: {
                    styles: {
                        /* 기본 글자색 */
                        color: "#123456", 
                        /* 기본 글자체 */
                        fontFamily: "굴림", 
                        /* 기본 글자크기 */
                        fontSize: "10pt", 
                        /*기본 배경색 */
                        backgroundColor: "#fff", 
                        /*기본 줄간격 */
                        lineHeight: "1.5", 
                        /* 위지윅 영역의 여백 */
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
                /* 이미지첨부 관련 추가 config */
                size: {
                    /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
                    contentWidth: 700 
                }
            };
             
            //에디터내에 환경설정 적용하기
            new Editor(config);
        }
    });
     
    //form submit 버튼 클릭
    $("#save_button").click(function(){
    	//alert($('#ex_file1').val());
        //다음에디터가 포함된 form submit
        
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

//Editor.save() 호출 한 다음에 validation 검증을 위한 함수 
//validation 체크해줄 입력폼들을 이 함수에 추가 지정해줍니다.
function validForm(editor) {
    var validator = new Trex.Validator();
    var content = editor.getContent();
    
    if (!validator.exists(content)) {
        alert('내용을 입력하세요');
        return false;
    }
    return true;
}
  
//validForm 함수까지 true값을 받으면 이어서 form submit을 시켜주는  setForm함수
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
<jsp:include page="/include/mainFooter.jsp" flush="false"/>
	</body>
</html>