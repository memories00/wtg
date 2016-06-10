<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/adminCss.css"/>
<body>
<div id="wrapper">
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="header">
	<jsp:include page="/include/adminHeader.jsp" flush="false"/>
</div>

<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div id="contents">
	<div id="section">
		<form name="mem" method="post"  enctype="multipart/form-data">
			회원ID검색 : <input type="text" name="search"><input type="button" value="검색" onClick="mem_Search()"><br />
			<table align="center" width="700" border="1px" cellspacing="0" cellpadding="0" bordercolor="#E2E2C7">
			<c:forEach var="list" items="${list}">
			<tr align="center"><td>아이디 : ${list.id}</td><td> 가입날짜 : ${list.reg}</td>
			<td>
			<input type="checkbox" name="check" value="${list.id}">
			</td>
			<br />
			</c:forEach>
			</table>
			<input type="button" value="회원탈퇴" onClick="mem_Delete()">
			<input type="button" value="게시글확인" onClick="mem_Board()">
		</form>
	</div>
</div>

<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 바텀 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="footer">
	<jsp:include page="/include/adminFooter.jsp" flush="false"/>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>

</body>
</html>