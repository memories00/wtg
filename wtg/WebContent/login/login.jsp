<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript'>
	/*
	³×ÀÌÆ¼ºê ¾Û Å°c730093b9991b8f588ed66306bf7f7c7REST 
	API Å°b97d7124e14ac43653426c09bc3ccdda
	JavaScript Å°43d7c500ee93e1ffb8beb38776c7d47a
	Admin Å°a178ee2945da5020159b1f61f8539280
	*/
	$(document).ready(function(){
		Kakao.init('43d7c500ee93e1ffb8beb38776c7d47a');
		alert("1");
		function getKakaotalkUserProfile(){
			alert("2");
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
		
		function createKakaotalkLogin(){
				alert("3");
				Kakao.Auth.createLoginButton({
					container: '#kakao-login-btn',
					success: function(authObj){
						getKakaotalkUserProfile();
						createKakaotalkLogout();
					},
					fail: function(error){
						console.log(error);
					}
				});
		}
		
		function createKakaotalkLogout(){
			//$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				alert("4");
				Kakao.API.request({
					url: '/v1/user/logout',
					success: function(res){
						alert("·Î±×¾Æ¿ôµÊ");
					},
					fail: function(error){
						console.log(error);
					}
				});
		}
		alert("7");
		
		createKakaotalkLogin();
	});
	alert("8");
</script>
</head>
<body>
	 <div id="kakao-login-btn"></div>
	 <div id="kakao-logout-btn"></div>
	 <div id="kakao-profile"></div>
</body>
</html>