<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       
<c:forEach var="list" items="${list}">
${list.category}/${list.num}@
${list.s_name}/${list.s_point}@
${list.p1_name}/${list.p1_point}#
${list.p2_name}/${list.p2_point}#
${list.p3_name}/${list.p3_point}#
${list.p4_name}/${list.p4_point}#
${list.p5_name}/${list.p5_point}@
${list.e_name}/${list.e_point}@
${list.content}/${list.subject}/${list.readhit}/${list.good}$
</c:forEach>