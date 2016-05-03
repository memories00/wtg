<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
</a>
<script type='text/javascript'>
/*
 네이티브 앱 키c730093b9991b8f588ed66306bf7f7c7REST 
 API 키b97d7124e14ac43653426c09bc3ccdda
 JavaScript 키43d7c500ee93e1ffb8beb38776c7d47a
 Admin 키a178ee2945da5020159b1f61f8539280
 */


  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('43d7c500ee93e1ffb8beb38776c7d47a');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
      location.replace("http://localhost:8000/wtg/login.nhn");
    };
  //]]>
</script>
</body>
</html>