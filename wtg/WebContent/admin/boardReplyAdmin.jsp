<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/adminCss.css"/>
</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div id="header">
	<jsp:include page="/include/adminHeader.jsp" flush="false"/>
</div>

<!--�������������������������������� ž ����������������������������������-->

<div id="contents">
	<div id="section">
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
<div id="footer">
	<jsp:include page="/include/adminFooter.jsp" flush="false"/>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>

</body>
</html>