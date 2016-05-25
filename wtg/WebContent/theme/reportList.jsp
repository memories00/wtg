<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>신고접수</title>
</head>
<body>
  <table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
    <tr>
	  <td align="center"><h3>신고접수</h3></td>
	</tr>
  </table>
  <table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
    <tr align="center">
      <td width="50">번호</td>
      <td width="400">제목</td>
      <td width="80">신고자</td>
      <td width="80">신고 날짜</td>
      <td wudth="90">처리 상태</td>
    </tr>
 <c:forEach var="list" items="${list}">
    <tr align="center">
      <td>${list.num}</td>
      <td align="left"><a href="reportView.nhn?num=${list.num}">${list.subject}</a></td>
      <td align="center">${list.id }</td>
      <td align="center"><fmt:formatDate value="${list.regdate}" pattern="MM.dd"/></td>
  
  <c:if test="${list.process==0}">
      <td align="center">미 확 인</td>
  </c:if> 
  <c:if test="${list.process==1}">
      <td align="center">확 인 중</td>
  </c:if>
  <c:if test="${list.process==2}">
      <td align="center">삭제 완료</td>
  </c:if>
  <c:if test="${list.process==3}">
      <td align="center">처리 완료</td>
  </c:if>   
    </tr>
 </c:forEach>
 <c:if test="list.size() <= 0">
				
	<tr bgcolor="#FFFFFF"  align="center">
	  <td colspan="5">등록된 게시물이 없습니다.</td>
    </tr>						
	<tr bgcolor="#777777">
      <td height="1" colspan="5"></td>
    </tr>
 </c:if>
    <tr align="center">
      <td colspan="5">${pagingHtml}</td>
    </tr>
  </table>
</body>
</html>