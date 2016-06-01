<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
					<c:forEach var="searchlist" items="${searchlist}">
					이름 : <b>${searchlist.s_name}</b>
					번호 : <b>${searchlist.num}</b>
					</c:forEach>
</body>
</html>