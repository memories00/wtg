<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <title>�׸�����</title>
</head>
 <body>
   <table width="600" border="0" cellspacing="0" cellpadding="2"> 
     <tr>
       <td align="center"><h2>�׸�����</h2></td>
     </tr> 
   </table>
   
<%--      <c:if test="${ }"> --%>
<!--        <form action="" method="post" enctype="multipart/form-data"> -->
<%--      </c:if> --%>
<%--      <c:if test="${ }"> --%>
       <form action="themeWritePro.nhn" method="post" enctype="multipart/form-data"> 
<%--      </c:if> --%>
   
   <table width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td width="100">����</td>
       <td width="500"><input type="text" name="subject" value=""/></td>
     </tr>
     <tr>
       <td>�۾���</td>
       <td><input type="hidden" name="name" value="${memId}"/>${memId}</td>
     </tr>
     <tr>
       <td>����</td>
       <td><textarea name="content" cols="50" rows="30"></textarea>
     <tr>
     <tr>
       <td>÷���̹���</td>
       <td><input type="file" name="save"></td>
     </tr>
     <tr>
       <td align="right" colspan="2">
         <input type="submit" value="���">
         <input type="button" value="���" onClick="javascript:location.href='themeList.nhn'">
       </td>
     </tr>
   </table> 
 </form> 
   
   
 </body>