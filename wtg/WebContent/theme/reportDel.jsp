<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:if test="${dto !=null }">
 <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td align="center"><h3>테마여행</h3></td>
     </tr>
   </table>
   <table align="center" width="600" border="1" cellspacing="0" cellpadding="0">
     <tr>
       <td>번호</td>
       <td>${dto.no }</td>
     </tr>
     <tr>
       <td>제목</td>
       <td>${dto.subject }</td>
     </tr>
     <tr>
       <td>글쓴이</td>
       <td>${dto.name }</td>
     </tr>
     <tr>
       <td>내용</td>
       <td>${dto.content }</td>
     </tr>
     <tr>
       <td>조회수</td>
       <td>${dto.readhit}</td>
     </tr>
     <tr>
       <td>이미지</td>
       <td>${dto.file_savname}</td>
     </tr>
    </table>
    <input type="button" value="삭제" onClick="javascript:location.href='reportDelete.nhn?no=${dto.no}&num=${rto.num }'">
    </c:if>
   <c:if test="${dto ==null }">
   <div align="center"> 삭제 되었습니다!</div>
   </c:if>
</body>
</html>