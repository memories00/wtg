<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/inputCss.css"/>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5460ec456d4488e25f7b4c60d6a8b21c&libraries=services"></script>


<div id="wrapper">
	<div id="header">
		<jsp:include page="/include/inputHeader.jsp" flush="false"/>
	</div>

	<div class="map_wrap">
		<div id="map" style="width:100%; height:830px"></div>
		<div id="menu_wrap" class="bg_white">'
				<select name="selectOne" id="selectOne" onchange="multiSelect(this, 'selectTwo')">
				   <option value="default">---�����ϼ���---</option>
				   <option value="best">����Ʈ ������</option>
				   <option value="keyword">Ű���� �˻�</option>
	    		</select>
				<select name="selectTwo" id="selectTwo" onchange="sendOpval(this)">
				   <option value="default">---�����ϼ���---</option>
				</select>
			<div id="resultList">����Ʈ������̰�
			</div>
		</div>
	</div>
</div>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var container = document.getElementById('map'); 			//������ ���� �����̳� ����
var options = { 											//���� �ɼ� ����
		center: new daum.maps.LatLng(37.515504, 126.907628), 
		level: 6
	};  			
var map = new daum.maps.Map(container, options);			//���� ����

//���� ����Ʈ�ڽ� ���� �Լ�
function multiSelect(srcE, targetId){						
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

  	//ù��° ����Ʈ�ڽ��� ����Ʈ�������� ��� �ι�° �ڽ� value�� ����
    if(val == 'best'){										
        addOption('�������', targetE);
        addOption('����Ʈ', targetE);
        addOption('������', targetE);
        addOption('����', targetE);
    }
  	//�ι�° ����Ʈ�ڽ��� Ű����˻��� ���.
    else if(val == 'keyword'){								
        addOption('0', targetE);
    }
}

//�ι�° ����Ʈ �ڽ��� value�� �����ϴ� �Լ�
function addOption(value, e){								
    var option = new Option(value);
    try{
        e.add(option);
    }catch(ee){
        e.add(option, null);
    }
}

//�ι�° ����Ʈ �ڽ��� value�� �����ϴ� �Լ�
function removeAll(e){										
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}

function sendOpval(opval){
 	var opval = document.getElementById('selectTwo');
 	var op=opval.value;
	$.ajax({
		type : "post",
		url: "searchBest.nhn",
		data: {op: op},
		success: searchOK,
		error: function() {
			alert("error");
		}
	});
}

function searchOK(list) {
	alert("�̾Ż�!");
	var cnt=0;
	var str=list.replace(/\s/gi, '');
	var line=str.split('@');
		for(var i=0; i<line.length-1; i++)
		{
			var val = line[i].split('^');
				name = val[0];
				x = val[1];
				y = val[2];
				rank = val[3];
			cnt++;	
			addMarker(new daum.maps.LatLng(x,y),cnt);
		}
		alert("��������!");
	$("#resultList").html(list);
}

function addMarker(xy, cnt) {
	alert("��Ŀ��!");
	var marker = new daum.maps.Marker({
		position: xy
	});
	marker.setMap(map);
	map.panTo(xy);
}
	
	
	
	
	
</script>




