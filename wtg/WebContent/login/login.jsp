<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
<script type="text/javascript">
	/*
		다음 
		client id 3883566921979662937
		client secret bcea2bb9b4e465fa9814c8161358b094

		요청
		http://127.0.0.1:8000/wtg/main.nhn
		콜백
		http://127.0.0.1:8000/wtg/login.nhn
	*/
	
	var token;
	var url;

	token = document.location.href.split("=")[1];
	token = token.split("&")[0];
	alert(token);
	
	url = "https://apis.daum.net/user/v1/show.json?access_token="+token;
	
	
</script>
<script type="text/javascript" src="https://apis.daum.net/user/v1/show.json?access_token=${access_token}">
	alert(access_token);
</script>
</body>