<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
<c:forEach var="list" items="${list}" end="4">
<c:if test="${list.filec<=5}">
코스:${list.filetime}
등수:${list.filec}<br />
</c:if>
</c:forEach>
</body>
</html>

====================================

java코드

	@RequestMapping("/testsql.nhn")
	public String testsql(HttpServletRequest request){
		List<SlideDTO> list = new ArrayList<SlideDTO>();
		list = sqlMapClidetTemplate.queryForList("main.testsql",null);
		request.setAttribute("list", list);
		return "/main/testsql.jsp";
	}

===================================

sql코드

    <select id="testsql" resultClass="slide">
		select filetime, DENSE_RANK() over(order by filec desc) as filec from(
		select filetime, count(*) AS filec
		from sldie
		group by filetime
		having count(*)>0)
	</select>