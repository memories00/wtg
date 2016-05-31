<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</body>
</html>