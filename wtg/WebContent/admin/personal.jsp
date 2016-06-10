<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ���</title>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/admin.css"/>
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
<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div id="header">
	<jsp:include page="/include/adminHeader.jsp" flush="false"/>
</div>
<!--�������������������������������� ž ����������������������������������-->

<div id="ad_contents">
	<div id="ad_section">
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
	</div>
</div>

<!--������������������������������� ���� ����������������������������������-->
<div id="ad_footer">
	<jsp:include page="/include/adminFooter.jsp" flush="false"/>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>
</body>
</html>