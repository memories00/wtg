<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>�Ű�����</title>
</head>
<link rel="stylesheet" type="text/css" href="/wtg/lib/font.css">
<body>
<center>
<div style="width:300px; height:100px; padding:10px; text-align:center; border:1px solid gray;">
<div style="width:100px; height:100px; margin:0 auto; border:1px solid red;">
      TOP
</div>
</div>
</center>
<br />
<div id="layer_fixed">
    <table cellspacing="0" cellpadding="0" style="width:100%; height:100%;">
    <tr>
       <td style="vertical-align:middle; padding-left: 20px; padding-right: 20px;">
            ������ ���̾��Դϴ�.
       </td>
    </tr>
    </table>
    <br /><br /><br />
    </div>
  <table align="center" width="700" border="0px" cellspacing="0" cellpadding="0">
    <tr>
	  <td align="center"><h3>�Ű�����</h3></td>
	</tr>
  </table>
  <table align="center" width="900" border="1px" cellspacing="0" cellpadding="0" bordercolor="#E2E2C7">
    <tr align="center">
      <td width="100" height="50">��ȣ</td>
      <td width="400" height="50">����</td>
      <td width="130" height="50">�Ű���</td>
      <td width="80" height="50">�Ű� ��¥</td>
      <td wudth="80" height="50">ó�� ����</td>
    </tr>
 <c:forEach var="list" items="${list}">
    <tr align="center">
      <td height="50">${list.num}</td>
      <td align="left" height="50"><a href="reportView.nhn?num=${list.num}">${list.subject}</a></td>
      <td align="center" height="50">${list.id }</td>
      <td align="center" height="50"><fmt:formatDate value="${list.regdate}" pattern="MM.dd"/></td>
  
  <c:if test="${list.process==0}">
      <td align="center" height="50">�� Ȯ ��</td>
  </c:if> 
  <c:if test="${list.process==1}">
      <td align="center" height="50">Ȯ �� ��</td>
  </c:if>
  <c:if test="${list.process==2}">
      <td align="center" height="50">���� �Ϸ�</td>
  </c:if>
  <c:if test="${list.process==3}">
      <td align="center" height="50">ó�� �Ϸ�</td>
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
      <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
</body>
</html>