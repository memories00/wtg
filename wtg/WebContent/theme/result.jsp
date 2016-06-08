<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="list" items="${list}" varStatus="i">
	<c:if test="${i.count>1}">	
		${list.p1_name}^${list.p1_point}^${list.rank}@
	</c:if>
</c:forEach>