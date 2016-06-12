
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ڽ�Ȯ��</title>
<link rel="stylesheet" href="/wtg/daumeditor/css/editor.css" type="text/css" charset="EUC-KR"/>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/wtg/daumeditor/js/editor_loader.js" type="text/javascript" charset="EUC-KR"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>	
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=06fa7b42a2af7b8c46c9ca9a71d40206&libraries=services"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/als_demo.css" />
		<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>		
		<style>
	#warp{width:100%;}
	.box_t{background-color:#494949; width:100%; height:15%; float:left; }
	.box1{width:38%; height:80%; float:left;margin:0px 30px 0 30px}
	.box2{;width:50%; height:65%;float:left; margin:0 0 0 0px}
	.box3{ ;width:38%; height:90%;float:left;display:block;margin:20px 0 0 30px;overflow: auto;}
	.box4{width:50%; height:320px;float:left;margin:20px 0 0 20px;background:rgba(255, 217, 236, 0.3)}
	.box5{margin:0px 0 0 0;width:170px; height:170px;float:left;border:1px;}
	.imgbox{ width:150px; height:150px;}
	.box-m{float:left; width:100%;height:50%;}
	.box-m2{float:left;display:block; width:100%;height:50%}
	.body {margin: 10px}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
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
<div id="header" style="width:100%;">
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
  <div id="warp">

	<div class="box-m">
		<div class="box1" id="map">	
		</div>
		<div class="box2">
			<table border="0">
				<tr>
					<td><br/></td>
				</tr>
				<tr>
					<td align="center"><font size="5" face="����">${dto.subject }</font></td>
				</tr>
				<tr>
					<td><br/><br/><br/></td>
				</tr>
				<tr>
					<td >${dto.content }</td>
				</tr>
				<tr>
					<td><br/><br/><br/></td>
				</tr>
				<tr>
					<td>tag: ${dto.hashtag }</td>
				</tr>
				<tr>
					<td><br/></td>
				</tr>
				
				<tr>
					<td align="center">&nbsp;&nbsp;&nbsp;
						<c:if test="${statusCnt==0 }">
							<input type="button" value="���ƿ�" onclick="check(0)">&nbsp;&nbsp;&nbsp;<input type="button" value="�Ȱŵ��" onclick="check(1)"><input type='text' id="ghStatus" value="���ƿ並 �����ϼ̾��" style="background-color:white;"readonly>
							<a onclick="window.open('report.nhn?num=${dto.num}','����Ȯ��','width:100,height:100');return false;">�Ű�</a> 
						</c:if>
						<c:if test="${statusCnt==1 }">
							<input type="button" value="���ƿ�" onclick="check(0)">&nbsp;&nbsp;&nbsp;<input type="button" value="�Ȱŵ��" onclick="check(1)"><input type='text'   id="ghStatus" value="�Ⱦ�並 �����ϼ̾��" style="background-color:white;"readonly>
							<a onclick="window.open('report.nhn?num=${dto.num}','����Ȯ��','width:100,height:100');return false;">�Ű�</a> 
						</c:if>
						<c:if test="${statusCnt==2 }">
							<input type="button" value="���ƿ�" onclick="check(0)">&nbsp;&nbsp;&nbsp;<input type="button" value="�Ȱŵ��" onclick="check(1)"><input type='text'   id="ghStatus" value="" style="background-color:white;"readonly>
						<a onclick="window.open('report.nhn?num=${dto.num}','����Ȯ��','width:100,height:100');return false;">�Ű�</a>
						</c:if>
					</td>
				</tr>
			
			</table>	
			
						
		</div>
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
			<div id="imgslide" >
				<div id="lista1" class="als-container" style="margin:30px 0 0 0; height:250px;">
					<span class="als-prev" ><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">						 
					  	<c:forEach var="s_image" items="${imageList}" varStatus="i">
					  			
					  	 	<li class="als-item" style="background-color:blue;margin:0 0 0 30px; width:30%; height:250px;" >
						  	<img src="http://127.0.0.1:8000/wtg/img/${s_image}"style="width:100%;height:100%" />
						  	</li>
                      </c:forEach>
                          
					</div>		
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>	
				  </div>
			</div>
	 
		</div>
	</div>
	<table id="commentTable" class="table table-condensed"></table>
<table class="table table-condensed">
		
		<c:forEach var="list" items="${commentList}">
		<tr>
			<td>
			${list.nickname}<a style="cursor:pointer;" id="${list.content}" name="pDel" onclick="deleteComment(this)">����</a>
			<br />
			${list.content}
			</td>
		</tr>
		</c:forEach>
	
		<tr>
			<td>
				<span class="form-inline" role="form">
 				<p>
				<div class="form-group">
					${sessionScope.memId} ${sessionScope.memName}
				</div>
				
				<div class="form-group">
					<button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">Ȯ��</button>
				</div>
				</p>
					<textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
					</span>
			</td>
		</tr>
	</table>	
	</div>
  <div id="ad_footer" style="margin:0px 0 0 0;">
	<jsp:include page="/include/mainFooter.jsp" flush="false" />
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
		var psimageSrc = '/wtg/map/img/green_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
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
	var stimageSrc = '/wtg/map/img/red_b.png', // ��߸�Ŀ�̹����� �ּ��Դϴ�    
	    stimageSize = new daum.maps.Size(55, 55), // ��Ŀ�̹����� ũ���Դϴ�
	    stimageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
	var startImage = new daum.maps.MarkerImage(stimageSrc, stimageSize, stimageOption);
	    
	var startMarker = new daum.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position:stPosition, // ��Ŀ�� ǥ���� ��ġ
        title : '${s_name}', // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ� 
        image:startImage
	});
	
	
	var endimageSrc = '/wtg/map/img/blue_b.png', // ��������Ŀ�̹����� �ּ��Դϴ�    
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
	function check(num)
	{
		alert(num);
		if(num==0)//���ƿ�
		{
			$.ajax({		
					url:"gAndh.nhn?cnt="+num+"&num=${dto.num}",
	 	 				success:function(data)
	 	 				{
	 	 					var str=data.replace(/\s/gi, '');
	 	 					if(str=="1"){
	 	 						//alert("����");
	 	 							document.getElementById('ghStatus').value="���ƿ並 �����ϼ̾��";
	 	 						}
	 	 				}
		 	 	   })
		}
		
		if(num==1)//�Ȱŵ��
		{
			$.ajax({		
				url:"gAndh.nhn?cnt="+num+"&num=${dto.num}",
	 	 				success:function(data)
	 	 				{
	 	 					var str=data.replace(/\s/gi, '');
	 	 					if(str=="0"){
	 	 						document.getElementById('ghStatus').value="�Ⱦ�並 �����ϼ̾��";
 	 						}
	 	 				}
		 	 	   })
		}
	}

		//���� �ϴܿ� �ִ� depth1�� ����� �ٴ� �̺�Ʈ
		$("#commentParentSubmit").click(function( event ) {
                                  
		//ajax�� �����ϰ� �����ϸ� ������ �����͸� ������ �־�� �ϴµ� ���⼭�� �׽�Ʈ�� �׳� �Է°��� ������
			
		var pText = $("#commentParentText");
                                   
		if($.trim(pText.val())==""){
			alert("������ �Է��ϼ���.");
 			pText.focus();
			return;
		}
            
		//alert("1");
		var comment = pText.val();
		//alert(comment);
		var commentParentText = '<tr id="r1" name="commentParentCode">'+
								 '<td colspan=2>'+
                                 '<strong>${sessionScope.memName}</strong><a style="cursor:pointer;" name="pDel">����</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                 '</td>'+
                                 '</tr>';
         //alert(commentParentText);                          
         //���̺��� tr�ڽ��� ������ tr �ڿ� ���δ�. ������ ���̺� �ȿ� tr�� ���δ�.
		if($('#commentTable').contents().size()==0){
			$('#commentTable').append(commentParentText);
		}else{
			$('#commentTable tr:last').after(commentParentText);
		}
                                   
		$("#commentParentText").val("");
		//alert("2");
		
		var mid = ${sessionScope.memId};
			//alert("mem"+mid);
		var bnum = ${dto.num};
			//alert("bnum�� ����"+bnum);
			
		$.ajax({
			type: "POST",
			url: "/wtg/sendComment.nhn",
			data: {
				num: bnum,
				id: mid,
				text: comment
			},
			async: true,
			success: function(){
		//		alert("post-success");
			},
			error: function(){
				alert("�ٽ� �Է��� �ּ���.");
			},
			complete: function(){
		//		alert("post-complete");
			}
		});                        
	});
     
	function deleteComment(bt)
	{
		if($(bt).attr("name")=="pDel"){
			if (confirm("���� �����Ͻðڽ��ϱ�?") == true){    //Ȯ��
		                                           
			var delComment = $(bt).parent().parent();
			var nextTr = delComment.next();
			var delTr;

			var contentId=bt.getAttribute('id');
		
			$.ajax({
				url: "/wtg/deleteCom.nhn?num=${dto.num}&content="+contentId,
			});
			
			//���(depth1)�� ���(depth2_1)�� �ִ��� �˻��Ͽ� ����
			while(nextTr.attr("name")=="commentCode"){
				nextTr = nextTr.next();
				delTr = nextTr.prev();//�����ϰ� �ѱ�� �����Ǽ� ���� ������ �������� �������� ����� �ٽ� ������ ������ ã�� ���� ����
				delTr.remove();
			}
		    delComment.remove();
		    }else{   //���
				return;
			}
			}else{
			//�ڱ� �θ��� tr�� �˾Ƴ���.
			var parentElement = $(bt).parent().parent();
			//��۴ޱ� â�� ���ش�.
			$("#commentEditor").remove();
			//�θ��� �ϴܿ� ��۴ޱ� â�� ����
			var commentEditor = '<tr id="commentEditor">'+
		                        '<td style="width:1%"> </td>'+
		                        '<td>'+
		                        '<span class="form-inline" role="form">'+
		                        '<p>'+
		                        '<div class="form-group">'+
		                        '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" placeholder="�̸�" maxlength="10">'+
		                        '</div>'+
		                        '<div class="form-group">'+
		                        ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">'+
		                        '</div>'+
		                        '<div class="form-group">'+
		                        '<button type="button" id="commentChildSubmit" class="btn btn-default">Ȯ��</button>'+
		                        '</div>'+
		                        '</p>'+
		                        '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
		                        '</span>'+
		                        '</td>'+
		                        '</tr>';
		   		parentElement.after(commentEditor); 
				}
	}
	
	
		$( "#list" ).click(function( event ) {
			location.href='/community/notice';
		});
		$( "#modify" ).click(function( event ) {
			location.href='/community/modify/notice/${community.id}';
		});                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		$( "#delete" ).click(function( event ) {
			location.href='/community/delete/notice/${community.id}';
		});
		$( "#write" ).click(function( event ) {
			location.href='/community/notice/edit';
		});


  </script>
</body>
</html>