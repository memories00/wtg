<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body onLoad="init()">
<script type="text/javascript">
	/*
		���� 
		client id 3883566921979662937
		client secret bcea2bb9b4e465fa9814c8161358b094

		��û
		http://127.0.0.1:8000/wtg/main.nhn
		�ݹ�
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
		ready State: ajax ����� �������� ���¸� �˷���.
		0:�ʱ�ȭ ���� ���� ����(open�޼ҵ尡 ���� ȣ����� ���� ����)
		1:open �޼ҵ尡 ȣ��� ����(send�޼ҵ�� ȣ����� ���� ����)
		2:�۽ſϷ�, ��û�� ������ ����(��û�� ������ �����Ͱ� ���� ���� ����)
		3:�������� ����(�����Ͱ� �������ִ»���)			
		4:���� �Ϸ�(�����͸� ��� ���� ����)
	*/
		alert("2-2");
		alert(xobj.status);
	/*
		status: ������ ������ �������θ� �Ǵ����ִ� �Ӽ�
		0:���÷� ���� ����
		200:�ش� url�� ���� ����
		403:���� �ź�
		404:�ش� url�� ����
		500:��������
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