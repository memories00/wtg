<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div id="header" style="width:100%; heigh:100px;">
	<jsp:include page="/include/mainHeader.jsp" flush="false"/>
</div>
<!--�������������������������������� ž ����������������������������������-->

<div id="ad_contents" style="width:100%; heigh:300px; text-align:center;">
	<div id="ad_section">
		<br />
		<br />
		<br />
		������ ������ �Դϴ�.
		<br />
		<br />
		<br />
	</div>
</div>

<!--������������������������������� ���� ����������������������������������-->
<div id="ad_footer">
	<jsp:include page="/include/mainFooter.jsp" flush="false"/>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>
</body>
</html>