<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>�Ű� ����</title>
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
		function callAjax(){
			var no= ${dto.no};
			var num=${dto.num};
			$.ajax({
				type: "post",
				data: {no:no,
					   num:num},
				url : "reportDel.nhn",
				success: del,
				error: whenError
			});
		}
		function del(aaa){
			$("#del").html(aaa);
			
		}
		function whenError(){
			alert("error");
		}
		
 </script>
</head>
<body>
 <table align="center" width="500" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td align="center"><h3>�Ű� ����</h3></td>
     </tr>
   </table>
  <table align="center" width="500" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td width="200">��ȣ</td>
      <td>&nbsp;&nbsp;${dto.num}</td>
    <tr>
      <td width="200">�Ű���</td>
      <td>&nbsp;&nbsp;${dto.id}</td>
    </tr>
    <tr>
      <td width="200">�Ű� �Խ��� ��ȣ</td>
      <td><a href="javascript:callAjax();">&nbsp;&nbsp;${dto.no}</a></td>
    </tr>
    <tr>
      <td width="200">�Ű� ����</td>
      <td>&nbsp;&nbsp;${dto.content}</td>
    </tr>
  </table>  
  <div id="del"></div>
</body>
</html>