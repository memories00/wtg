<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
session : ${sessionScope.memId}
<br />
<c:choose>
<c:when test="${sessionScope.memId ne null}">
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
</body>
</html>