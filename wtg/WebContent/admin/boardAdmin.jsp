<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
body {text-align:center}
a {text-decoration:none;}
a:hover {text-decoration:underline;}
ul#adminMenu {border:1px black dashed;}
ul#adminMenu li{border:1px red dashed; float:left; list-style:none;}
ul#adminMenu li:hover ul{display:block;}
ul#adminMenu li li{border:1px blue dashed; float:left; list-style:none;}
.header {font-size:11pt;}
#header {height:140px;}
#info {text-align:right; height:35px; background-image:url('/wtg/img/info.png');}
#logo {width:950px; height:100px; border: 1px solid black; margin:auto;}

.menu {font-size:11pt; width:950px; text-align:center; margin:auto;}
#menu {width:950px; height:50px; margin-top:5px; background-image:url('/wtg/img/menu.png');}

.section {font-size:13pt; width:950px; margin:auto;}
#section {width:950px; min-height:800px;}
#search {width:950px; margin-top:5px;}
#main_search {width:950px; height:100px;}
#sub_search {width:950px; height:250px; display:none;}
#content {width:950px; height:300px; background-image:url('/wtg/img/content.png'); margin-top:5px;}

.box {width:230px; height:320px; margin-left:6px; float:left; background-image:url('/wtg/img/box.png');}
#theme {width:950px; height:350px;}

.footer {font-size:11pt;}
#footer {margin-top:5px; margin-bottom:5px; background-image:url('/wtg/img/footer.png');}
#f_link {height:60px; width:950px; margin:auto;}

#wrapper {min-width:950px; border: 1px solid black; margin:auto;}

</style>
</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div class="header" id="header">
	<div class="header" id="info">
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

	<div class="header" id="logo">
	�ΰ�ΰ�ΰ�ΰ�ΰ�ΰ�ηΰ������ηηηΤǷ�
	</div>
</div>

<div class="menu" id="menu">
	<ul id="adminMenu">
		<li>
			<a href="http://localhost:8000/wtg/memAdmin.nhn">ȸ�� ����</a>
			<ul>
				<li><a href="http://localhost:8000/wtg/memAdmin.nhn">ȸ������ ��ȸ</a></li>
				<li><a href="http://localhost:8000/wtg/memStatsAdmin.nhn">�̿��� ���</a></li>
			</ul>
		</li>
		<li>
			<a href="http://localhost:8000/wtg/pageAdmin.nhn">������ ����</a>
			<ul>
				<li><a href="http://localhost:8000/wtg/pageAdmin.nhn">������ ���� ����</a></li>
				<li><a href="http://localhost:8000/wtg/pageDesignAdmin.nhn">������ ����</a></li>
			</ul>
		</li>
		<li>
			<a href="http://localhost:8000/wtg/boardAdmin.nhn">�Խ��� ����</a>
			<ul>
				<li><a href="http://localhost:8000/wtg/boardAdmin.nhn">�Խñ� ����</a></li>
				<li><a href="http://localhost:8000/wtg/boardReportAdmin.nhn">�Ű�� ����</a></li>
				<li><a href="http://localhost:8000/wtg/boardReplyAdmin.nhn">���� ����</a></li>
			</ul>
		</li>
	</ul>
</div>

<!--�������������������������������� ž ����������������������������������-->

<div class="section" id="section">
	<div class="section" id="content">
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
<div class="footer" id="footer">
	<div class="footer" id="f_link">
	<a href="http://localhost:8000/wtg/login.nhn">ȸ��Ұ�</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">������</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">����Ʈ��</a>
	</div>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>

</body>
</html>