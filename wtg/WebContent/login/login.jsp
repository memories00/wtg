<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body onLoad="init()">
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
function init(){
	var xobj;
	var actual_JSON;
	
	if(window.XMLHttpRequest)
	{
		xobj = new XMLHttpRequest();
		alert("1-1-1");
	}
	else
	{
		xobj = new ActiveXObject("Microsoft.XMLHTTP");
		alert("1-1-2");
	}
		
	alert("1-2");
	
	var token;
	var url;

	token = document.location.href.split("=")[1];
	token = token.split("&")[0];
	alert(token);
	url = "https://apis.daum.net/user/v1/show.json?access_token="+token;
	alert(url);
	
	alert("1-3");
	xobj.onreadystatechange = function getToken()
	{
		alert("2-1");
		alert(xobj.readyState);
	/*
		ready State: ajax 통신의 진행중인 상태를 알려줌.
		0:초기화 되지 않은 상태(open메소드가 아직 호출되지 않은 상태)
		1:open 메소드가 호출된 상태(send메소드는 호출되지 않은 상태)
		2:송신완료, 요청을 시작한 상태(요청은 했지만 데이터가 오지 않은 상태)
		3:수신중인 상태(데이터가 들어오고있는상태)			
		4:수신 완료(데이터를 모두 받은 상태)
	*/
		alert("2-2");
		alert(xobj.status);
	/*
		status: 데이터 수신의 성공여부를 판단해주는 속성
		0:로컬로 접근 성공
		200:해당 url로 접근 성공
		403:접근 거부
		404:해당 url이 없음
		500:서버오류
	*/
		
		alert("2-3");
		alert(xobj.readyState);
		if (xobj.readyState == "4")
		{
			alert("2-3-1");
			alert(xobj);
			alert(xobj.responseJSON);
			actual_JSON=JSON.parse(xobj.responseJSON);
			alert(actual_JSON);
			alert(xobj.responseJSON);
			alert("2-3-2");
		}	

	};
	
	alert("1-4");
	alert(xobj);
	xobj.open("GET", url, true);
	alert("1-5");
	xobj.send(null);
	alert("1-6");
	
	alert("3");

	
}
</script>
</body>