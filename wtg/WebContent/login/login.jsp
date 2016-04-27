<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<a href="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=tOiSQTJhQmRZ6nUP94wi&client_secret=wET5G5veYP&code=${code }&state=${state}">ddd</a>
<script type="text/javascript">
function init() {

	loadJSON(function(response) {

	var actual_JSON = JSON.parse(response);

	});

	}

	function loadJSON(callback) {   
	var xobj = new XMLHttpRequest();
	xobj.overrideMimeType("application/json");
	xobj.open('GET', 'data.json', true);
	
	xobj.onreadystatechange = function () {
	if (xobj.readyState == 4 && xobj.status == "200") {
	callback(xobj.responseText);

	}

	};

	xobj.send(null);  

</script>

¿Ôµû