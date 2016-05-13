<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="Api" class="api.lib.Api_Jsp_Client" scope="page"/>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/wtg/js/vticker.min.js"></script>
<script>
$(document).ready(function(){
	   $('.roll').vTicker();
	   $('#pause').click(function(){
		$this=$(this);
		if($this.text()=='Pause'){
			$('.roll').vTicker('pause',true);
			$this.text('Unpause');
		}
		else{
			$('.roll').vTicker('pause',false);
			$this.text('Pause');
			}
	  });
	 });
<%
	String MyKey="5F5DC3B8-FFFF00AA9";
	String XmlPath="/DATA/XML/";
	String initRst=Api.Init(MyKey,XmlPath);
	
	if(initRst=="1"){
		char apiRst=Api.get_today("11010");
		out.print(apiRst);
	}
%>
</script>



<style type="text/css">
body{text-align:center}
.header {font-size:11pt; width:940px; border: 1px solid black;}
#header {height:50px; border: 1px solid black; margin:auto;}
#logo {width:500px; height:50px; border: 1px solid black; margin-left:10px; float:left;}
#info {text-align:right; width:410px; height:50px; border:1px solid black; margin-right:10px; float:right;}

.menu {font-size:11pt; width:940px; border: 1px solid black;}
#menu {width:940px; height:70px; border:1px solid black; margin:auto;}

.section {font-size:13pt; width:940px; border:1px solid black;}

#section {width:940px; border: 1px solid black; margin:auto;}
#search {width:940px; height:200px; border: 1px solid black;}
#content {width:940px; height:300px; border: 1px solid black;}
#theme {width:940px; height:350px; border: 1px solid black;}
.box {width:320px; height:300px; border: 1px solid black; margin-left:4px; float:left;}

#theme {font-size:11pt; text-align:center; width:230px; height:300; margin-left:4px; float:left;}

.footer {font-size:11pt; text-align:center; width:940px; border: 1px solid black;}
#footer {height:100px; border: 1px solid black; margin:auto;}
#f_link {height:50px; width:940px; border:1px solid black; margin:auto;}

#wrapper {min-width:940px; border: 1px solid black; margin:auto; min-hegint:1500px;}

</style>
</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div class="header" id="header">

	<div class="header" id="logo">
	�ΰ�ΰ�ΰ�ΰ�ΰ�ΰ�ηΰ������ηηηΤǷ�
	</div>
	
	<div class="header" id="info">
		<c:choose>
		<c:when test="${sessionScope.memId ne null}">
			${sessionScope.memId} �� ȯ���մϴ�!  
			<a id="logout-btn" onclick="window.location='logout.nhn'">
				<img src="/wtg/img/logoutBtn.jpg" width="100"/>
			</a>
		</c:when>
		<c:otherwise>
			<a href="http://localhost:8000/wtg/login.nhn">
				<img src="/wtg/img/loginBtn.jpg" width="100"/>
			</a>
		</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="menu" id="menu">
		�޴�
</div>

<!--�������������������������������� ž ����������������������������������-->

<div class="section" id="section">
����
	<div class="section" id="content">
	�̹���
	</div>

<br />
	<div class="section" id="search">
	�˻�
	</div>
<br />
	<div class="section" id="theme">
		<div class="box" >�ڽ�1</div>
		<div class="box" >�ڽ�2</div>
		<div class="box" >�ڽ�3</div>
		<div class="box" >
			����:${state_ko}
			<div class="roll">
			<ul>
				<li>����µ�:${temp}<jsp:include page="weather.jsp" flush="false"/></li>
				<li>�ְ�µ�:${max_temp}<jsp:include page="weather.jsp" flush="false"/></li>
				<li>�����µ�:${min_temp}<jsp:include page="weather.jsp" flush="false"/></li>
				<li>�̼�������:${pm10}</li>
			</ul>
			</div>
		</div>
	</div>
<br />
</div>

<!--������������������������������� ���� ����������������������������������-->
<div class="footer" id="footer" >
ǲ��
	<div class="footer" id="f_link">
	<a href="http://localhost:8000/wtg/login.nhn">ȸ��Ұ�</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">������</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">����Ʈ��</a>
	</div>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>

</body>
</html>