<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/adminCss.css" />
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div id="header">
	<div id="info">
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

	<div id="logo">
	�ΰ�ΰ�ΰ�ΰ�ΰ�ΰ�ηΰ������ηηηΤǷ�
	</div>


	<div id="menu">
		<div id=menu_box>
		<ul id="admin_menu">
			<li>
				<a href="http://localhost:8000/wtg/member.nhn">ȸ�� ����</a>
				<ul id="sub_menu">
					<li><a href="http://localhost:8000/wtg/memAdmin.nhn">ȸ������ ��ȸ</a></li>
					<li><a href="http://localhost:8000/wtg/userstats.nhn">�̿��� ���</a></li>
				</ul>
			</li>
			<li>
				<a href="http://localhost:8000/wtg/pageAdmin.nhn">������ ����</a>
				<ul id="sub_menu">
					<li><a href="http://localhost:8000/wtg/pageAdmin.nhn">������ ���� ����</a></li>
					<li><a href="http://localhost:8000/wtg/pageDesignAdmin.nhn">������ ����</a></li>
				</ul>
			</li>
			<li>
				<a href="http://localhost:8000/wtg/boardAdmin.nhn">�Խ��� ����</a>
				<ul id="sub_menu">
					<li><a href="http://localhost:8000/wtg/boardAdmin.nhn">�Խñ� ����</a></li>
					<li><a href="http://localhost:8000/wtg/boardReportAdmin.nhn">�Ű�� ����</a></li>
					<li><a href="http://localhost:8000/wtg/boardReplyAdmin.nhn">���� ����</a></li>
				</ul>
			</li>
		</ul>
		</div>
	</div>
</div>
<!--�������������������������������� ž ����������������������������������-->

<div class="dif" id="contents">
	<div id="section">
		<br />
		<br />
		<br />
		������ ������ �Դϴ�.
		<br />
		<br />
		<br />
	</div>
</div>

<!--������������������������������� ���� ����������������������������������-->
<div id="footer">
	<hr color="gray">
	<div class="dif" id="link">
	<a href="http://localhost:8000/wtg/login.nhn">ȸ��Ұ�</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">������</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">����Ʈ��</a>
	</div>
	<div class="dif" id="company">
	company
	</div>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>
</body>
</html>