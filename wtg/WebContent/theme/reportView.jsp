<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/wtg/lib/font.css">
<html>
<head>
<title>신고 내용</title>
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
<table align="center" width="500" border="0px" cellspacing="0" cellpadding="0" bordercolor="#E2E2C7">
     <tr>
       <td align="center"><h3>신고 내용</h3></td>
     </tr>
   </table>
  <table align="center" width="500" border="1px" cellspacing="0" cellpadding="0" bordercolor="#E2E2C7">
    <tr>
      <td width="200" height="30">번호</td>
      <td>&nbsp;&nbsp;${dto.num}</td>
    <tr>
      <td width="200" height="30">신고자</td>
      <td>&nbsp;&nbsp;${dto.id}</td>
    </tr>
    <tr>
      <td width="200" height="30">신고 게시판 번호</td>
      <td><a href="javascript:callAjax();">&nbsp;&nbsp;${dto.no}</a></td>
    </tr>
    <tr>
      <td width="200" height="30">신고 내용</td>
      <td>&nbsp;&nbsp;${dto.content}</td>
    </tr>
  </table>  
  <div id="del"></div>
</body>
</html>