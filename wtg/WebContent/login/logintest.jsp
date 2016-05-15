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
	//String MyKey="5F5DC3B8-FFFF00AA9";
	//String XmlPath="/DATA/XML/";
	//String initRst=Api.Init(MyKey,XmlPath);

	//if(initRst=="1"){
	//	char apiRst=Api.get_today("11010");
	//	out.print(apiRst);
	//}
%>


</script>



<style type="text/css">
body{text-align:center}
.header {font-size:11pt;}
#header {height:140px;}
#info {text-align:right; height:35px; background-image:url('/wtg/img/info.png');}
#logo {width:950px; height:100px; border: 1px solid black; margin:auto;}

.menu {font-size:11pt; width:950px; text-align:center; margin:auto;}
#menu {width:950px; height:50px; margin-top:5px; background-image:url('/wtg/img/menu.png');}

.section {font-size:13pt; width:950px; margin:auto;}
#section {width:950px; min-height:800px;}
#search {width:950px; margin-top:5px;}
#main_search {width:950px; height:100px;}
#sub_search {width:950px; height:250px; display:none;}
#content {width:950px; height:300px; background-image:url('/wtg/img/content.png'); margin-top:5px;}

.box {width:230px; height:320px; margin-left:6px; float:left; background-image:url('/wtg/img/box.png');}
#theme {width:950px; height:350px;}

.footer {font-size:11pt;}
#footer {margin-top:5px; margin-bottom:5px; background-image:url('/wtg/img/footer.png');}
#f_link {height:60px; width:950px; margin:auto;}

#wrapper {min-width:950px; border: 1px solid black; margin:auto;}

</style>
</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div class="header" id="header">
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

	<div class="header" id="logo">
	�ΰ�ΰ�ΰ�ΰ�ΰ�ΰ�ηΰ������ηηηΤǷ�
	</div>
</div>

<div class="menu" id="menu">
	�޴�
</div>

<!--�������������������������������� ž ����������������������������������-->

<div class="section" id="section">
	<div class="section" id="content">
	�̹���
	</div>

	<div class="section" id="search">
		<div class="section" id="main_search">
		<a>�� �˻�</a>
		</div>
		<div class="section" id="sub_search">
		</div>
	</div>

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
</div>

<!--������������������������������� ���� ����������������������������������-->
<div class="footer" id="footer">
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