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
				alert("접근권한이 없습니다.");
				//location.replace("/wtg/main.nhn");
			</script>
		</c:when>

		<c:otherwise>
			${sessionScope.memId} 관리자님 &nbsp;&nbsp;<a href="main.nhn">메인 페이지로 이동</a>
		</c:otherwise>
	</c:choose>
</div>

<div id="ad_menu">
	<div id="topMenu">
		<ul>
			<li><a class="submenuLink" href="memAdmin.nhn">회원정보 조회</a></li>
			<li><a class="submenuLink" href="userstats.nhn">이용자 통계</a></li>
			<li><a class="submenuLink" href="per.nhn">페이지 정보 관리</a></li>
			<li><a class="submenuLink" href="boardAdmin.nhn">게시글 관리</a></li>
			<li><a class="submenuLink" href="reportList.nhn">신고글 관리</a></li>
			<li><a class="submenuLink" href="boardReplyAdmin.nhn">덧글 관리</a></li>
		</ul>
	</div>
</div>

</body>
