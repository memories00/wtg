<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function check(cnt)
	{
		window.location="recomCourse.nhn?cnt="+cnt;
	}

</script>
</head>
<body>
	<input type="button" value="����"  onclick="check(4)">
	<input type="button" value="����Ʈ�ڽ�"onclick="check(2)">
	<input type="button" value="������" onclick="check(1)">
	<input type="button" value="�������" onclick="check(3)">
</body>
</html>