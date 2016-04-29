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
                       
                        sPoint=new nhn.api.map.LatLng( 37.484201,126.929715  );
                     
                        function a(){
                        var oMarker1=new  nhn.api.map.Marker(oIcon, {  
                            title : '�Ÿ���'  // Ÿ��Ʋ
                    })
                      oMarker.setPoint(sPoint);
                      oMarker.setVisible(true);
                      oMap.addOverlay(oMarker);
                        }
                      
                      oMap.attach('mouseenter', function(oCustomEvent) {
                          var oTarget = oCustomEvent.target;
                          // ��Ŀ���� ���콺 �ö󰣰Ÿ�
                          if (oTarget instanceof nhn.api.map.Marker) {
                                  var oMarker = oTarget;
                                  oLabel.setVisible(true, oMarker); // - Ư�� ��Ŀ�� �����Ͽ� �ش� ��Ŀ�� title�� �����ش�.
                          }
                  });

                      
                </script>
                <input type="button" value="�Ÿ�" onclick="a">
                <input type="button" value="����">
</body>
</html>
