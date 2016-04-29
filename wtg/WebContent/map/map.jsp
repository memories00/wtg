<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                <title>OpenAPI 2.0 - ���� ����</title>
                <!-- prevent IE6 flickering -->
                <script type="text/javascript">
                        try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
                </script>

<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=tOiSQTJhQmRZ6nUP94wi"></script>
</head>

<body>
<div id = "testMap" style="border:1px solid #000; width:500px; height:400px; margin:20px;"></div>
 
                <script type="text/javascript">
                        var oPoint = new nhn.api.map.LatLng(37.5010226, 127.0396037);//���� �����Ҷ��� ��������ǥ
                        nhn.api.map.setDefaultPoint('LatLng');
                        oMap = new nhn.api.map.Map('testMap' ,{
                                                point : oPoint,
                                                zoom : 10,
                                                enableWheelZoom : true,
                                                enableDragPan : true,
                                                enableDblClickZoom : false,
                                                mapMode : 0,
                                                activateTrafficMap : false,
                                                activateBicycleMap : false,
                                                minMaxLevel : [ 1, 14 ],
                                                size : new nhn.api.map.Size(500, 400)
                                        });
                        var oLabel = new nhn.api.map.MarkerLabel(); // - ��Ŀ �� ����.
                        oMap.addOverlay(oLabel); // - ��Ŀ �� ������ �߰�. �⺻�� ���� ������ �ʴ� ���·� �߰���
                        
                        var oSize = new nhn.api.map.Size(28, 37);
                        var oOffset = new nhn.api.map.Size(14, 37);
                        var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
          
                      oMap.attach('mouseenter', function(oCustomEvent) {
                          var oTarget = oCustomEvent.target;
                          // ��Ŀ���� ���콺 �ö󰣰Ÿ�
                          if (oTarget instanceof nhn.api.map.Marker) {
                                  var oMarker = oTarget;
                                  oLabel.setVisible(true, oMarker); // - Ư�� ��Ŀ�� �����Ͽ� �ش� ��Ŀ�� title�� �����ش�.
                          }
                  });
                      
                      function a()
                      {
                      	 sPoint=new nhn.api.map.LatLng( xpoint.value,ypoint.value  );
                      	 var pName=xy.value;
                     	 var oMarker=new  nhn.api.map.Marker(oIcon,
                     			 {  title : pName    // Ÿ��Ʋ  
                      	    	 })
                    	oMarker.setPoint(sPoint);
                    	oMarker.setVisible(true);
                    	oMap.addOverlay(oMarker);
                   		oMap.setCenter(sPoint);//������ ��ǥ�� ȭ���̵�
                      }
                      function b()
                      {
                    	  var request;
                          if (window.XMLHttpRequest) {
                              request = new XMLHttpRequest;
                          } else {
                              request = new ActiveXObject('Msxml2.XMLHTTP');
                          }
           
                          //2.Ajax ��û
                          request.open("post","http://swopenAPI.seoul.go.kr/api/subway/64676e63666573633733436c6b646b/xml/nearBy/1/5/37.5010226/127.0396037/");
                          request.send();
                          //�غ���°� �ٲ��[��ó] <html> �ڹٽ�ũ��Ʈ XML �Ľ� �ϱ�|�ۼ��� Printf
                          request.onreadystatechange = function() {
                        	  alert("�ϳ�");
                        	  alert(request.readyState);
                        	  alert("��");
                        	  if (request.readyState == 4)
                              {
                        		  alert("��");
                            	  if (request.status >= 200 && request.status < 300) {
                                  var xml = request.responseXML;
                                  alert("��");
                                      var statnNms = xml.getElementsByTagName("statnNm");
                                      var subwayNms = xml.getElementsByTagName("subwayNm");
                                      for (var i = 0; i < statnNms.length; i++) {
                                          var statnNm = statnNms[i].childNodes[0].nodeValue;
                                          var subwayNm = subwayNms[i].childNodes[0].nodeValue;
                                          alert(statnNm + ":" + subwayNm);
                                      }
           
                                      //��û�ϴ°� xml�̸� responseXML �Ϲ��ؽ�Ʈ�� response
           
                                  } else {
                                	  alert(request.readyState);
                                      alert(request.status);
                                  }
                              }
                          }
                      }         
                </script>
                 <input type="text" name="xy" value="�츮��">
                <input type="text" name="xpoint"  value="37.494612">
                <input type="text" name="ypoint" value="127.063642" >
                <input type="button" value="�Է�" onclick="a()">
                <input type="button" value="xml" onclick="b()"><br/>
                ��ġ  37.494612 127.063642  <br/>
                ������ 37.515504 126.907628  <br/>
                ���� 37.554648 126.972559  <br/>
                �Ÿ� 37.484201 126.929715  <br/>
                
                <a href ="http://swopenAPI.seoul.go.kr/api/subway/64676e63666573633733436c6b646b/xml/nearBy/1/5/37.5010226/127.0396037/">dd</a> 
                
</body>
</html>
