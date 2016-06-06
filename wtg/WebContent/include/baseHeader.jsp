<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/header.css"/>
<div id="bs_info">
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
<div id="bs_logo">
	<img id="bs_logo_img" src="/wtg/themeImg/${logo}" style="width: 100%; max-width: 200px; height:100%; max-height:100px;"/>
</div>	
<div id="bs_menu">
	<ul>
		<li id="all" onClick="locationHref(this);"><p>All</p></li>
		<li id="관광명소" onClick="locationHref(this);"><p>관광명소</p></li>
		<li id="데이트" onClick="locationHref(this);"><p>데이트</p></li>
		<li id="스포츠" onClick="locationHref(this);"><p>스포츠</p></li>
		<li id="쇼핑" onClick="locationHref(this);"><p>쇼핑</p></li>
		<li id="추천코스" onClick="locationHref(this);"><p>추천코스</p></li>
	</ul>
</div>