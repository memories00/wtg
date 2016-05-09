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
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    alert("script");
    var obj;
    var accessToken;
    var tokenType;
    var refreshToken;
    var expiresIn;
    var scope;
    var id;
	var nickname;
	var profileImage;
    
    Kakao.init('43d7c500ee93e1ffb8beb38776c7d47a');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
		alert("login");
		Kakao.Auth.login({
			persistAccessToken: true,
			persistRefreshToken: true,
			success: function(authObj) {
				alert("login-success");
				
				getKakaotalkUserProfile();
				
				accessToken = authObj.access_token;
				tokenType = authObj.token_type;
				refreshToken = authObj.refresh_token;
				expiresIn = authObj.expires_in;
				scope = authObj.scope;
				alert(accessToken);
				
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
				
				alert(accessToken);
				
				alert("logout-success");
				alert("로그아웃됨");
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
				id = res.id;
				nickname = res.properties.nickname;
				profileImage = res.properties.profile_image;
				alert(res.id);
				$("#kakao-profile").append(res.id);
				$("#kakao-profile").append(res.properties.nickname);
				$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname}));
				
				alert("post-send");
				sendPost();
			},
			fail: function(error){
				console.log(error);
			}
		});
	}
    
    function sendPost(){
    	$.ajax({
			type: "POST",
			url: "/wtg/login.nhn",
			data: {
				ac_token: accessToken,
				re_token: refreshToken,
			    mem_id: id,
				mem_name: nickname,
				mem_image: profileImage
			},
			async: true,
			success: function(){
				alert("post-success");
			},
			error: function(){
				alert("post-error");
			},
			complete: function(){
				alert("post-complete");
				location.href("/wtg/main.nhn");
			}
		});
    }
  //]]>
</script>




</body>
</html>