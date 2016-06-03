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
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="header">
	<div id="info">
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

	<div id="logo">
	로고로고로고로고로고로고로로고고고고고고로로로로ㅗ로
	</div>


	<div id="menu">
		<div id=menu_box>
		<ul id="admin_menu">
			<li>
				<a href="http://localhost:8000/wtg/member.nhn">회원 관리</a>
				<ul id="sub_menu">
					<li><a href="http://localhost:8000/wtg/memAdmin.nhn">회원정보 조회</a></li>
					<li><a href="http://localhost:8000/wtg/userstats.nhn">이용자 통계</a></li>
				</ul>
			</li>
			<li>
				<a href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 관리</a>
				<ul id="sub_menu">
					<li><a href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 정보 관리</a></li>
					<li><a href="http://localhost:8000/wtg/pageDesignAdmin.nhn">디자인 관리</a></li>
				</ul>
			</li>
			<li>
				<a href="http://localhost:8000/wtg/boardAdmin.nhn">게시판 관리</a>
				<ul id="sub_menu">
					<li><a href="http://localhost:8000/wtg/boardAdmin.nhn">게시글 관리</a></li>
					<li><a href="http://localhost:8000/wtg/boardReportAdmin.nhn">신고글 관리</a></li>
					<li><a href="http://localhost:8000/wtg/boardReplyAdmin.nhn">덧글 관리</a></li>
				</ul>
			</li>
		</ul>
		</div>
	</div>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div class="dif" id="contents">
	<div id="section">
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
<div id="footer">
	<hr color="gray">
	<div class="dif" id="link">
	<a href="http://localhost:8000/wtg/login.nhn">회사소개</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">고객센터</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">사이트맵</a>
	</div>
	<div class="dif" id="company">
	company
	</div>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>
</body>
</html>