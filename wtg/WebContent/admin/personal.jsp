<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ���</title>
</head>
<script>
function personal_Check()
{
	var frm= document.personal;
	 //alert("abc="+frm.req.checked); 
	 //alert("abc="+frm.req.value); 
	if(frm.req.checked==true){
		alert("ȸ������ �������� �̵��մϴ�.");
		document.personal.action="/spring/personal.nhn"
  		document.personal.submit();
	}else{
		alert("�������� ���� ���Ǹ� �ؾ��մϴ�.");
	}
}
</script>
<body>
 <form name="personal" method="post">
 <table width="600" height="650">
  <tr>
   <td align="center">
   <center><b>�̿��� ����</b></center>
   <br>
   <center>
   <textarea rows="32" cols="150" name="per">${dto.per}</textarea>
   <center>
   <br>
   </td>
  </tr>
  <tr>
   <td align="center" valign="top">
    <input type="button" name="yes" value="����" onclick="personal_Check()"/>&nbsp;&nbsp;&nbsp;
   </td>
  </tr>
 </table>
 </form>