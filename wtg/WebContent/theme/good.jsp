<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ctGood ==0 && ctHate==0}">
  &nbsp;&nbsp;${good}
</c:if>
<c:if test="${ctGood !=0 && ctHate==0}">
  &nbsp;&nbsp;${good}
<script>
   alert("���� ���");
</script>
</c:if>
<c:if test="${ctHate !=0}">
  &nbsp;&nbsp;${good}
<script>
   alert("�̹� ���� �ϼ̽��ϴ�!");
</script>
</c:if>