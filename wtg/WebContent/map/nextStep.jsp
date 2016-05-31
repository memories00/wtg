<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>               
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style>
			#menu_wrap {position:absolute;  top:0;left:0;bottom:0;width:650px; height:450px;margin:500px 50px 50px 50px;padding:5px;overflow-x:auto;background:rgba(0, 0, 0,0.3);z-index: 0.1;font-size:12px;border-radius: 0px; }
			.bg_white {background:#fff;}		
			#menu_wrap hr {display: block; height: 4px;border: 0;  border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: left;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;} 
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>�ڽ�����ϱ�</title>
			<font size="6">${dto.category }</font>
					<div  id="map" style="width:650px; height:400px;float:left; margin:50px 0px 0px 50px"></div>
<!-- ������ ���� -->
    <form name="frm" id="frm" action="insertDB.nhn" method="post" accept-charset="EUC-KR">
        <!-- ������������ȣ�� ���� -->
       <div id="editor_frame" style="top:0;left:0;bottom:0;width:600px; height:500px;margin:0px 0px 0px 50px;border:1px solid black;float:left;" > </div>  
       	 <textarea name="daumeditor" id="daumeditor" rows="100" cols="100" style="width:766px; height:0px;display: none;border:1px solid black;"></textarea> 
       
       
        <!-- ���� ���� ������� �Ѿ textarea �±� --> 
   
     <div style="float:right">
     	<input type="button" id="save_button" value="��������"/>
     </div> 
      </form>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<font size="4">
					�����  �̸�: ${startTitle} �ּ�: ${startAddress} <br/> ��ȭ��ȣ: ${startPhone } ��ó��: ${startStn } ��ó�������Ÿ�: ${startDtc }m �̵��ð�: ${startWalk}��<br/>
					<hr>
					
						<c:forEach var="alist" items="${list}">
						������
							<c:forTokens var="a" items="${alist}" delims="/" varStatus="i">
						<c:if test="${i.count==1 }"> �̸�: ${a}</c:if> <c:if test="${i.count==2 }">�ּ�: ${a} </c:if>  <c:if test="${i.count==3 }"><br/> ��ȭ��ȣ: ${a} </c:if>
							<c:if test="${i.count==4 }">��ó�������� �Ÿ�: ${a} </c:if> <c:if test="${i.count==5 }">��ó��: ${a}m </c:if> <c:if test="${i.count==6 }">�̵��ð�: ${a}�� </c:if> 
							</c:forTokens>
						<hr>
						</c:forEach>
					������ �̸�: ${endTitle} �ּ�: ${endAddress} <br/> ��ȭ��ȣ: ${endPhone }  ��ó��: ${endStn } ��ó�������Ÿ�: ${endDtc }m �̵��ð�: ${endWalk }��<br/>
					</font>
					
				</div>
			</div>

		<link rel="stylesheet" href="/wtg/daumeditor/css/editor.css" type="text/css" charset="EUC-KR"/>
		<script src="/wtg/daumeditor/js/editor_loader.js" type="text/javascript" charset="EUC-KR"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>	
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06807e3624c0410b3525f8f75a0a967c&libraries=services"></script>
		<script>
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
</script>
	</body>
</html>