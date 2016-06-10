<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ���</title>
</head>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/adminCss.css"/>
<script>
function personal_Check()
{
	document.personal.action="/wtg/personal.nhn"
  	document.personal.submit();
}
</script>
<body>
<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div id="header">
	<jsp:include page="/include/adminHeader.jsp" flush="false"/>
</div>
<!--�������������������������������� ž ����������������������������������-->

<div id="contents">
	<div id="section">
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