<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<c:forEach var="list" items="${list}">
		${list.category}${list.num}${list.m_image}${list.regdate}${list.subject}${list.content}<br />
	</c:forEach>
</body>
</html>