<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시물 신고</title>
</head>
<body>
 <form action="reportP.nhn" method="post" >
   <table width="400" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td width="100">신고자</td>
       <td width="300"><input type="hidden" name="id" value="${id}" />${id}</td>
     <tr>
       <td width="100">신고 사유</td>
       <td width="300"><input type="text" name="subject"/></td>
     </tr>
     <tr>
       <td width="100">게시물 번호</td>
       <td width="300"><input type="hidden" name="no" value="${no}"/>${no}</td>
     </tr>
     <tr>
       <td width="100"> 신고 내용</td>
       <td width="300"><textarea name="content" cols="30" rows="15"></textarea></td>
     </tr>
     <tr>
       <td align="center" colspan="2">
         <input type="submit" value="등록">
         <input type="reset" value="다시입력">
       </td>
   </table> 
 </form>
</body>
</html>