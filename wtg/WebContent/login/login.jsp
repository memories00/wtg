<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>


	<a id="login-btn" href="javascript:loginWithKakao()">
		<img src="/wtg/img/loginBtn.jpg" width="100"/>
	</a>
	<a id="logout-btn" href="javascript:logoutWithKakao()">
		<img src="/wtg/img/logoutBtn.jpg" width="100"/>
	</a>

<div id="kakao-profile"></div>
<script type='text/javascript'>
  //<![CDATA[
    // ����� ���� JavaScript Ű�� ������ �ּ���.
    alert("script");
    Kakao.init('43d7c500ee93e1ffb8beb38776c7d47a');
    function loginWithKakao() {
      // �α��� â�� ���ϴ�.
      var token;
      alert("login");
      Kakao.Auth.login({
        success: function(authObj) {
        	alert("login-success");
        	getKakaotalkUserProfile();
			token = JSON.stringify(authObj);
			alert(token);
        },
        fail: function(error) {
        	console.log(error);
        }
      });
    };
    
    function logoutWithKakao() {
    	alert("logout");
		Kakao.API.request({
			url: '/v1/user/logout',
			success: function(res){
				alert("logout-success");
				alert("�α׾ƿ���");
				$("#kakao-profile").text("");
			},
			fail: function(error){
			console.log(error);
			}
		});
	};
    
    function getKakaotalkUserProfile(){
    	alert("profile");
    	Kakao.API.request({
			url: '/v1/user/me',
			success: function(res){
				$("#kakao-profile").append(res.properties.nickname);
				$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname}));
			},
			fail: function(error){
				console.log(error);
			}
		});
	}
  //]]>
</script>
</body>
</html>