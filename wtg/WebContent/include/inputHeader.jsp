<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/header.css"/>
<div id="in_info">
	<c:choose>
		<c:when test="${sessionScope.memId ne null}">
			${sessionScope.memName} 님 환영합니다!  
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
<div id="in_logo">
	<img id="in_logo_img" src="/wtg/themeImg/${logo}" style="width: 100%; max-width: 200px; height:100%; max-height:100px;"/>
</div>	