<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.top {font-size:10pt; text-align:center; width:850px;}
#logo {width:500px; height:50px;}
#info {width:300px; height:50px;}
.bottom {font-size:10pt; text-align:center;}
#bottom {height:50px;}
#content {width:800px; height:700px;}
</style>
</head>
<body>
<div class="top" id="top">

	<div class="top" id="logo">
	로고로고로고로고로고로고로로고고고고고고로로로로ㅗ로
	</div>
	
	<div class="top" id="info">
		<c:choose>
		<c:when test="${sessionScope.memId ne null}">
			${sessionScope.memId} 님 환영합니다!  
			<a id="logout-btn" onclick="window.location='logout.nhn'">
				<img src="/wtg/img/logoutBtn.jpg" width="100"/>
			</a>
		</c:when>
		<c:otherwise>
			<a href="http://localhost:8000/wtg/login.nhn">
				<img src="/wtg/img/loginBtn.jpg" width="100"/>
			</a>
		</c:otherwise>
		</c:choose>
	</div>
	
</div>

<div id="content">
</div>

<div class="bottom" id="bottom" >
회사소개 고객센터 사이트 맵
</div>
</body>
</html>