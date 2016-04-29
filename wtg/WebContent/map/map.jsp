<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                <title>OpenAPI 2.0 - 지도 생성</title>
                <!-- prevent IE6 flickering -->
                <script type="text/javascript">
                        try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
                </script>

<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=tOiSQTJhQmRZ6nUP94wi"></script>
</head>

<body>
<div id = "testMap" style="border:1px solid #000; width:500px; height:400px; margin:20px;"></div>
 
                <script type="text/javascript">
                        var oPoint = new nhn.api.map.LatLng(37.5010226, 127.0396037);//맵을 시작할때의 시작점좌표
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
                        var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
                        oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨
                        
                        var oSize = new nhn.api.map.Size(28, 37);
                        var oOffset = new nhn.api.map.Size(14, 37);
                        var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
          
                      oMap.attach('mouseenter', function(oCustomEvent) {
                          var oTarget = oCustomEvent.target;
                          // 마커위에 마우스 올라간거면
                          if (oTarget instanceof nhn.api.map.Marker) {
                                  var oMarker = oTarget;
                                  oLabel.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
                          }
                  });
                      
                      function a()
                      {
                      	 sPoint=new nhn.api.map.LatLng( xpoint.value,ypoint.value  );
                      	 var pName=xy.value;
                     	 var oMarker=new  nhn.api.map.Marker(oIcon,
                     			 {  title : pName    // 타이틀  
                      	    	 })
                    	oMarker.setPoint(sPoint);
                    	oMarker.setVisible(true);
                    	oMap.addOverlay(oMarker);
                   		oMap.setCenter(sPoint);//선택한 좌표로 화면이동
                      }
                      function b()
                      {
                    	  var request;
                          if (window.XMLHttpRequest) {
                              request = new XMLHttpRequest;
                          } else {
                              request = new ActiveXObject('Msxml2.XMLHTTP');
                          }
           
                          //2.Ajax 요청
                          request.open("post","http://swopenAPI.seoul.go.kr/api/subway/64676e63666573633733436c6b646b/xml/nearBy/1/5/37.5010226/127.0396037/");
                          request.send();
                          //준비상태가 바뀌면[출처] <html> 자바스크립트 XML 파싱 하기|작성자 Printf
                          request.onreadystatechange = function() {
                        	  alert("하나");
                        	  alert(request.readyState);
                        	  alert("둘");
                        	  if (request.readyState == 4)
                              {
                        		  alert("셋");
                            	  if (request.status >= 200 && request.status < 300) {
                                  var xml = request.responseXML;
                                  alert("넷");
                                      var statnNms = xml.getElementsByTagName("statnNm");
                                      var subwayNms = xml.getElementsByTagName("subwayNm");
                                      for (var i = 0; i < statnNms.length; i++) {
                                          var statnNm = statnNms[i].childNodes[0].nodeValue;
                                          var subwayNm = subwayNms[i].childNodes[0].nodeValue;
                                          alert(statnNm + ":" + subwayNm);
                                      }
           
                                      //요청하는게 xml이면 responseXML 일반텍스트면 response
           
                                  } else {
                                	  alert(request.readyState);
                                      alert(request.status);
                                  }
                              }
                          }
                      }         
                </script>
                 <input type="text" name="xy" value="우리집">
                <input type="text" name="xpoint"  value="37.494612">
                <input type="text" name="ypoint" value="127.063642" >
                <input type="button" value="입력" onclick="a()">
                <input type="button" value="xml" onclick="b()"><br/>
                대치  37.494612 127.063642  <br/>
                영등포 37.515504 126.907628  <br/>
                서울 37.554648 126.972559  <br/>
                신림 37.484201 126.929715  <br/>
                
                <a href ="http://swopenAPI.seoul.go.kr/api/subway/64676e63666573633733436c6b646b/xml/nearBy/1/5/37.5010226/127.0396037/">dd</a> 
                
</body>
</html>
