<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/header.css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
<div id="ad_info">
	<c:choose>
		<c:when test="${memId ne '168456368'}">
			<script>
				alert("���ٱ����� �����ϴ�.");
				//location.replace("/wtg/main.nhn");
			</script>
		</c:when>

		<c:otherwise>
			${sessionScope.memId} �����ڴ� &nbsp;&nbsp;<a href="main.nhn">���� �������� �̵�</a>
		</c:otherwise>
	</c:choose>
</div>

<div id="ad_menu">
	<div id="topMenu">
		<ul>
			<li><a class="submenuLink" href="memAdmin.nhn">ȸ������ ��ȸ</a></li>
			<li><a class="submenuLink" href="userstats.nhn">�̿��� ���</a></li>
			<li><a class="submenuLink" href="per.nhn">������ ���� ����</a></li>
			<li><a class="submenuLink" href="boardAdmin.nhn">�Խñ� ����</a></li>
			<li><a class="submenuLink" href="reportList.nhn">�Ű�� ����</a></li>
			<li><a class="submenuLink" href="boardReplyAdmin.nhn">���� ����</a></li>
		</ul>
	</div>
</div>

</body>
