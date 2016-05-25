<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>�Ű�����</title>
</head>
<body>
  <table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
    <tr>
	  <td align="center"><h3>�Ű�����</h3></td>
	</tr>
  </table>
  <table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
    <tr align="center">
      <td width="50">��ȣ</td>
      <td width="400">����</td>
      <td width="80">�Ű���</td>
      <td width="80">�Ű� ��¥</td>
      <td wudth="90">ó�� ����</td>
    </tr>
 <c:forEach var="list" items="${list}">
    <tr align="center">
      <td>${list.num}</td>
      <td align="left"><a href="reportView.nhn?num=${list.num}">${list.subject}</a></td>
      <td align="center">${list.id }</td>
      <td align="center"><fmt:formatDate value="${list.regdate}" pattern="MM.dd"/></td>
  
  <c:if test="${list.process==0}">
      <td align="center">�� Ȯ ��</td>
  </c:if> 
  <c:if test="${list.process==1}">
      <td align="center">Ȯ �� ��</td>
  </c:if>
  <c:if test="${list.process==2}">
      <td align="center">���� �Ϸ�</td>
  </c:if>
  <c:if test="${list.process==3}">
      <td align="center">ó�� �Ϸ�</td>
  </c:if>   
    </tr>
 </c:forEach>
 <c:if test="list.size() <= 0">
				
	<tr bgcolor="#FFFFFF"  align="center">
	  <td colspan="5">��ϵ� �Խù��� �����ϴ�.</td>
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