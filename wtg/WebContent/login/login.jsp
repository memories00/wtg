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
			ready State: ajax ����� �������� ���¸� �˷���.
			0:�ʱ�ȭ ���� ���� ����(open�޼ҵ尡 ���� ȣ����� ���� ����)
			1:open �޼ҵ尡 ȣ��� ����(send�޼ҵ�� ȣ����� ���� ����)
			2:�۽ſϷ�, ��û�� ������ ����(��û�� ������ �����Ͱ� ���� ���� ����)
			3:�������� ����(�����Ͱ� �������ִ»���)			
			4:���� �Ϸ�(�����͸� ��� ���� ����)
			*/
			alert("1-3-1");
			alert(xobj.status);
			/*
			status: ������ ������ �������θ� �Ǵ����ִ� �Ӽ�
			0:���÷� ���� ����
			200:�ش� url�� ���� ����
			403:���� �ź�
			404:�ش� url�� ����
			500:��������
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
�Ե�
test