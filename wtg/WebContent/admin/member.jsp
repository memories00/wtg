<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/contents.css"/>

<script>
function mem_Search()
{
	document.mem.action="/wtg/memsearch.nhn"
	document.mem.submit();
}
function mem_Delete()
{
	document.mem.action="/wtg/memdelete.nhn"
	document.mem.submit();
}
function mem_Board()
{
	document.mem.action="/wtg/memboard.nhn"
	document.mem.submit();
}
</script>

<html>
<body>
<div id="wrapper">
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="header">
	<jsp:include page="/include/adminHeader.jsp" flush="false"/>
</div>

<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div id="ad_contents">
	<div id="ad_section">
		<form name="mem" method="post"  enctype="multipart/form-data">
			<input type="text" name="search"><input type="button" value="검색" onClick="mem_Search()"><br />
			<c:forEach var="list" items="${list}">
			아이디:${list.id} 가입날짜:${list.reg}
			<input type="checkbox" name="check" value="${list.id}">
			<br />
			</c:forEach>
			<input type="button" value="회원탈퇴" onClick="mem_Delete()">
			<input type="button" value="게시글확인" onClick="mem_Board()">
		</form>
</div>
</div>

<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 바텀 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="ad_footer">
	<jsp:include page="/include/baseFooter.jsp" flush="false"/>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>

</body>
</html>