<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:if test="${status==3 }">
		이미추천하셨습니다
</c:if>
<c:if test="${statusCnt==0 }">
0
</c:if>
<c:if test="${statusCnt==1 }">
1
</c:if>