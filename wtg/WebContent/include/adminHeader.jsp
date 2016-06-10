<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/header.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
<div id="ad_info">
	<c:choose>
		<c:when test="${sessionScope.memId ne '168456368'}">
			<script>
				alert("���ٱ����� �����ϴ�.");
				//location.replace("/wtg/main.nhn");
			</script>
		</c:when>

		<c:otherwise>
			${sessionScope.memId} �����ڴ�
		</c:otherwise>
	</c:choose>
</div>

<div id="ad_logo">
	<img id="ad_logo_img" src="/wtg/themeImg/${logo}" style="width: 100%; max-width: 200px; height:100%; max-height:100px;"/>
</div>

<div id="ad_menu">
	<div id="topMenu">
		<ul>
			<li class="topMenuLi">
				<a class="menuLink" href="http://localhost:8000/wtg/member.nhn">ȸ�� ����</a>
				<ul class="submenu">
					<li><a class="submenuLink" href="http://localhost:8000/wtg/memAdmin.nhn">ȸ������ ��ȸ</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/userstats.nhn">�̿��� ���</a></li>
				</ul>
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="http://localhost:8000/wtg/pageAdmin.nhn">������ ����</a>
				<ul class="submenu">
					<li><a class="submenuLink" href="http://localhost:8000/wtg/pageAdmin.nhn">������ ���� ����</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/pageDesignAdmin.nhn">������ ����</a></li>
				</ul>
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="http://localhost:8000/wtg/boardAdmin.nhn">�Խ��� ����</a>
				<ul class="submenu">
					<li><a class="submenuLink" href="http://localhost:8000/wtg/boardAdmin.nhn">�Խñ� ����</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/boardReportAdmin.nhn">�Ű�� ����</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/boardReplyAdmin.nhn">���� ����</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

</body>
