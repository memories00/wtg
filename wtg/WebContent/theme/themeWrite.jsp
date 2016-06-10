<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/contents.css"/>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <title>테마여행</title>
</head>
<script>
function main_Category()
{
	document.cate.action="/wtg/category.nhn"
	document.cate.submit();
}
function theme_Write()
{
	document.cate.action="/wtg/themeWritePro.nhn"
	document.cate.submit();
}
</script>
 <body>
<!-- --------------------------------------------------------------------------------- -->
<div id="wrapper">
<div id="bs_header">
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
<div id="tw_contents">
   <table width="600" border="0" cellspacing="0" cellpadding="2"> 
     <tr>
       <td align="center"><h2>테마여행</h2></td>
     </tr> 
   </table>
    <form name=cate method="post" enctype="multipart/form-data"> 

   
   <table width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td width="100">제목</td>
       <td width="500"><input type="text" name="subject" value=""/></td>
     </tr>
     <tr>
       <td>글쓴이</td>
       <td><input type="hidden" name="name" value="${memId}"/>${memId}</td>
     </tr>
     <tr>
       <td>내용</td>
       <td><textarea name="content" cols="50" rows="30"></textarea>
     <tr>
     <tr>
       <td width="200">첨부이미지</td>
       <td><input type="file" name="save"></td>
     </tr>
     <tr>
       <td align="right" colspan="2">
         <input type="button" value="등록" onClick="theme_Write()">
         <input type="button" value="목록" onClick="javascript:location.href='themeList.nhn'">
       </td>
     </tr>
   </table> 
 </form> 
</div>
<div id="bs_footer">
	<jsp:include page="/include/mainFooter.jsp" flush="false"/>
</div>
</div>
</body>
</html>