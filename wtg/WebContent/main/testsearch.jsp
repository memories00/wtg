<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:useBean id="Api" class="api.lib.Api_Jsp_Client" scope="page"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="/wtg/js/vticker.min.js"></script>
<script>

$(function() {
  $('#example').vTicker('init', {
    speed: 1000, 
    pause: 3500,
    showItems: 1,
    padding: 4
  });
});
<%
	String MyKey="5F5DC3B8-FFFF00AA9";
	//String XmlPath="C:/Users/user1/git/wtg/wtg/WebContent/main/";
	String XmlPath="C:/DATA/XML/";
	String initRst=Api.Init(MyKey,XmlPath);

	if(initRst=="1"){
		char apiRst=Api.get_today("11010");
		out.print(apiRst);
	}
%>
</script>
			    <div style="float:left; width:172px; height:60px; color:black; overflow: hidden" >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					지역:${state_ko}
					&nbsp;&nbsp;
					<div id="example">
					<ul style="color:black;">
						<li>현재온도:${temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>최고온도:${max_temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>최저온도:${min_temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>미세먼지농도:${pm10}</li>
					</ul>
					</div>
				</div>