<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/header.css"/>
<div id="bs_info">
	<c:choose>
		<c:when test="${sessionScope.memId ne null}">
			${sessionScope.memName} �� ȯ���մϴ�!  
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
		<li id="�������" onClick="locationHref(this);"><p>�������</p></li>
		<li id="����Ʈ" onClick="locationHref(this);"><p>����Ʈ</p></li>
		<li id="������" onClick="locationHref(this);"><p>������</p></li>
		<li id="����" onClick="locationHref(this);"><p>����</p></li>
		<li id="��õ�ڽ�" onClick="locationHref(this);"><p>��õ�ڽ�</p></li>
	</ul>
</div>