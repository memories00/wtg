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
				alert("접근권한이 없습니다.");
				//location.replace("/wtg/main.nhn");
			</script>
		</c:when>

		<c:otherwise>
			${sessionScope.memId} 관리자님
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
				<a class="menuLink" href="http://localhost:8000/wtg/member.nhn">회원 관리</a>
				<ul class="submenu">
					<li><a class="submenuLink" href="http://localhost:8000/wtg/memAdmin.nhn">회원정보 조회</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/userstats.nhn">이용자 통계</a></li>
				</ul>
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 관리</a>
				<ul class="submenu">
					<li><a class="submenuLink" href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 정보 관리</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/pageDesignAdmin.nhn">디자인 관리</a></li>
				</ul>
			</li>
			<li class="topMenuLi">
				<a class="menuLink" href="http://localhost:8000/wtg/boardAdmin.nhn">게시판 관리</a>
				<ul class="submenu">
					<li><a class="submenuLink" href="http://localhost:8000/wtg/boardAdmin.nhn">게시글 관리</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/boardReportAdmin.nhn">신고글 관리</a></li>
					<li><a class="submenuLink" href="http://localhost:8000/wtg/boardReplyAdmin.nhn">덧글 관리</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

</body>
