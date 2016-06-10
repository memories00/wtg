<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/contents.css"/>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<div id="wrapper">
<div id="bs_header">
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
<div id="lg_contents">
	<div id="content">
		session : ${sessionScope.memId}
		session : ${sessionScope.memName}
		<br />
		<c:choose>
			<c:when test="${sessionScope.memId ne null}">
				<a id="logout-btn" onclick="window.location='logout.nhn'">
					<img src="/wtg/img/logoutBtn.jpg" width="100"/>
				</a>
			</c:when>
			<c:otherwise>
				<a id="login-btn" href="javascript:loginWithKakao()">
					<img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
				</a>
			</c:otherwise>
		</c:choose>
	</div>
<div id="kakao-profile"></div>
<script type='text/javascript'>
  //<![CDATA[
    // ����� ���� JavaScript Ű�� ������ �ּ���.
    var obj;
    var accessToken;
    var tokenType;
    var refreshToken;
    var expiresIn;
    var scope;
    var id;
	var nickname;
	var profileImage;
	var thumbnailImage;
    
    Kakao.init('43d7c500ee93e1ffb8beb38776c7d47a');
    function loginWithKakao() {
      // �α��� â�� ���ϴ�.
		Kakao.Auth.login({
			persistAccessToken: true,
			persistRefreshToken: true,
			success: function(authObj) {
				
				getKakaotalkUserProfile();
				
				accessToken = authObj.access_token;
				tokenType = authObj.token_type;
				refreshToken = authObj.refresh_token;
				expiresIn = authObj.expires_in;
				scope = authObj.scope;
				
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

				alert("���������� �α׾ƿ��Ǿ����ϴ�!");
				$("#kakao-profile").text("");
			},
			fail: function(error){
			console.log(error);
			}
		});
	};
    
    function getKakaotalkUserProfile(){
    	Kakao.API.request({
			url: '/v1/user/me',
			success: function(res){
				id = res.id;
				nickname = res.properties.nickname;
				profileImage = res.properties.profile_image;
				thumbnailImage = res.properties.thumbnail_image;
				$("#kakao-profile").append(res.id);
				$("#kakao-profile").append(res.properties.nickname);
				$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname}));
				
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
				mem_pro: profileImage,
				mem_thumb: thumbnailImage
			},
			async: true,
			success: function(){
				alert("���������� �α��� �Ǿ����ϴ�!");
			},
			error: function(){
				alert("�α��ο� �����Ͽ����ϴ�.");
			},
			complete: function(){
				location.replace("/wtg/main.nhn");
			}
		});
    }
  //]]>
</script>
</div>
<div id="bs_footer">
	<jsp:include page="/include/mainFooter.jsp" flush="false"/>
</div>
</div>
</body>
</html>