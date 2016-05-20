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
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div class="header" id="header">
	<div class="header" id="info">
		<c:choose>
			<c:when test="${sessionScope.memId ne '168456368'}">
				<script>
					alert("접근권한이 없습니다.");
					//location.replace("/wtg/main.nhn");
				</script>
			</c:when>


			<c:otherwise>
				${sessionScope.memId} 관리자님
			</c:otherwise>
		</c:choose>
	</div>

	<div class="header" id="logo">
	로고로고로고로고로고로고로로고고고고고고로로로로ㅗ로
	</div>
</div>

<div class="menu" id="menu">
	<ul id="adminMenu">
		<li>
			<a href="http://localhost:8000/wtg/memAdmin.nhn">회원 관리</a>
			<ul>
				<li><a href="http://localhost:8000/wtg/memAdmin.nhn">회원정보 조회</a></li>
				<li><a href="http://localhost:8000/wtg/memStatsAdmin.nhn">이용자 통계</a></li>
			</ul>
		</li>
		<li>
			<a href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 관리</a>
			<ul>
				<li><a href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 정보 관리</a></li>
				<li><a href="http://localhost:8000/wtg/pageDesignAdmin.nhn">디자인 관리</a></li>
			</ul>
		</li>
		<li>
			<a href="http://localhost:8000/wtg/boardAdmin.nhn">게시판 관리</a>
			<ul>
				<li><a href="http://localhost:8000/wtg/boardAdmin.nhn">게시글 관리</a></li>
				<li><a href="http://localhost:8000/wtg/boardReportAdmin.nhn">신고글 관리</a></li>
				<li><a href="http://localhost:8000/wtg/boardReplyAdmin.nhn">덧글 관리</a></li>
			</ul>
		</li>
	</ul>
</div>

<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div class="section" id="section">
	<div class="section" id="content">
		<br />
		<br />
		<br />
		관리자 페이지 입니다.
		<br />
		<br />
		<br />
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