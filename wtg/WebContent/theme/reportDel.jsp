<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<script>
function report_Check()
{
	alert("����Ȯ�� �Ǿ����ϴ�.");
	document.report.action="/wtg/reportcheck.nhn?no=${dto.no}&num=${rto.num}"
	document.report.submit();
}
</script>
<body>
<form name="report" method="post"  enctype="multipart/form-data">
<c:if test="${dto !=null }">
 <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td align="center"><h3>�׸�����</h3></td>
     </tr>
   </table>
   <table align="center" width="600" border="1" cellspacing="0" cellpadding="0">
     <tr>
       <td>��ȣ</td>
       <td>${dto.no }</td>
     </tr>
     <tr>
       <td>����</td>
       <td>${dto.subject }</td>
     </tr>
     <tr>
       <td>�۾���</td>
       <td>${dto.name }</td>
     </tr>
     <tr>
       <td>����</td>
       <td>${dto.content }</td>
     </tr>
     <tr>
       <td>��ȸ��</td>
       <td>${dto.readhit}</td>
     </tr>
     <tr>
       <td>�̹���</td>
       <td>${dto.file_savname}</td>
     </tr>
    </table>
    <input type="button" value="�Ű�����Ȯ��" onClick="report_Check()">
    <input type="button" value="����" onClick="javascript:location.href='reportDelete.nhn?no=${dto.no}&num=${rto.num }'">
    <input type="button" value="ó�� �Ϸ�" onClick="javascript:location.href='reportcom.nhn?no=${dto.no}&num=${rto.num }'">
    </c:if>
   <c:if test="${dto ==null }">
   <div align="center"> ���� �Ǿ����ϴ�!</div>
   </c:if>
</form>
</body>
</html>