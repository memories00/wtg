<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<a href="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=tOiSQTJhQmRZ6nUP94wi&client_secret=wET5G5veYP&code=${code }&state=${state}">ddd</a>
<body onLoad="b()">
<script type="text/javascript">
function init() {

	//window.location.href="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=tOiSQTJhQmRZ6nUP94wi&client_secret=wET5G5veYP&code=${code}&state=${state}";
	
	loadJSON(function(response) 
			{
		alert("1-1");
	var actual_JSON
	
	if(window.XMLHttpRequest)
	{
		actual_JSON=JSON.parse(xobj.responseText);
	}
	else
	{
		actual_JSON=eval("("+xobj.responseText+")");
	}

	});

	}

	function loadJSON(callback)
	{   
		var xobj
		alert("1-1");
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
		
		//xobj.open("GET", "token.xml", true);
		alert("1-2");
		
		xobj.open("GET", "http://localhost:8000/wtg/login.nhn", true);
		xobj.send(null); 
		xobj.onreadystatechange = function ()
		{
			alert("1-3");
			alert(xobj.readyState);
			/*
			ready State: ajax 통신의 진행중인 상태를 알려줌.
			0:초기화 되지 않은 상태(open메소드가 아직 호출되지 않은 상태)
			1:open 메소드가 호출된 상태(send메소드는 호출되지 않은 상태)
			2:송신완료, 요청을 시작한 상태(요청은 했지만 데이터가 오지 않은 상태)
			3:수신중인 상태(데이터가 들어오고있는상태)			
			4:수신 완료(데이터를 모두 받은 상태)
			*/
			alert("1-3-1");
			alert(xobj.status);
			/*
			status: 데이터 수신의 성공여부를 판단해주는 속성
			0:로컬로 접근 성공
			200:해당 url로 접근 성공
			403:접근 거부
			404:해당 url이 없음
			500:서버오류
			*/
			alert("1-3-2");

			
			if (xobj.readyState == 4 && xobj.status == "200")
			{
				alert("2-1");
				alert(xobj.responseText);
				alert("3-1");
				//xobj.open("GET", "token.xml", true);
				callback(xobj.responseText);

				
			}

		};
	} 


</script>
</body>
왔따
test