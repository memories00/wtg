<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ctHate ==0 && ctGood==0}">
  &nbsp;&nbsp;${hate}
</c:if>
<c:if test="${ctHate !=0 && ctGood==0}">
  &nbsp;&nbsp;${hate}
<script>
   alert("���� ���");
</script>
</c:if>
<c:if test="${ctGood !=0 }">
  &nbsp;&nbsp;${hate}
<script>
   alert("�̹� ���� �ϼ̽��ϴ�!");
</script>
</c:if>
