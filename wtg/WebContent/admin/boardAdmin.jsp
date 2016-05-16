<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
body{text-align:center}
.header {font-size:11pt;}
#header {height:140px;}
#admin {text-align:right; color:#ffffff; height:35px; background-image:url('/wtg/img/admin.png');}
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
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div class="header" id="header">
	<div class="header" id="admin">
		<c:choose>
			<c:when test="${sessionScope.memId ne '168456368'}">
				<script>
					alert("접근권한이 없습니다.");
					location.replace("/wtg/main.nhn");
				</script>
			</c:when>


			<c:otherwise>
				${sessionScope.memId} 관리자님
				<a id="logout-btn" onclick="window.location='main.nhn'">
					<img src="/wtg/img/loginBtn.jpg" width="100"/>
				</a>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="header" id="logo">
	로고로고로고로고로고로고로로고고고고고고로로로로ㅗ로
	</div>
</div>

<div class="menu" id="menu">
	메뉴
</div>

<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div class="section" id="section">
	<div class="section" id="content">
	내용물
	</div>
</div>

<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 바텀 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div class="footer" id="footer">
	<div class="footer" id="f_link">
	<a href="http://localhost:8000/wtg/login.nhn">회사소개</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">고객센터</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">사이트맵</a>
	</div>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>

</body>
</html>