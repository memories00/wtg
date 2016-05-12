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
	�ΰ�ΰ�ΰ�ΰ�ΰ�ΰ�ηΰ������ηηηΤǷ�
	</div>
	
	<div class="top" id="info">
		<c:choose>
		<c:when test="${sessionScope.memId ne null}">
			${sessionScope.memId} �� ȯ���մϴ�!  
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
ȸ��Ұ� ������ ����Ʈ ��
</div>
</body>
</html>