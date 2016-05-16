<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

  function main_Category()
  {
  	document.main.action="/wtg/category.nhn"
  	document.main.submit();
  }
  function main_Slide()
  {
	document.main.action="/wtg/mainslide.nhn"
	document.main.submit();
  }
  function category_Delete()
  {
  	var frm=document.main.check2;
  	var len = frm.length;
  	var size=0;

  	if(frm.checked==true)
  	{
			alert("�����Ͻ� ������ ���� �Ǿ����ϴ�");
  		  	document.main.action="/wtg/categorydelete.nhn"
  		    document.main.submit();
  	}
  	else if(frm.checked==false)
  	{
  			alert("���õ� ������ �����ϴ�");
  	}
  	else if(len>1)
  	{
  		for(i = 0; i < len ; i++)
  		{
  			if(frm[i].checked==true)
  			{
  				size++;
  			}
  		}
  		if(size == 0)
  		{
  			alert("���õ� ������ �����ϴ�");
  		}
  		else
  		{
  			alert("�����Ͻ� ������ ���� �Ǿ����ϴ�");
  		  	document.main.action="/wtg/categorydelete.nhn"
  		    document.main.submit();
  		}
  	}
  }
  function slide_Delete()
  {
  	var frm=document.main.check;
  	var len = frm.length;
  	var size=0;

  	if(frm.checked==true)
  	{
			alert("�����Ͻ� ������ ���� �Ǿ����ϴ�");
  		  	document.main.action="/wtg/slidedelete.nhn"
  		    document.main.submit();
  	}
  	else if(frm.checked==false)
  	{
  			alert("���õ� ������ �����ϴ�");
  	}
  	else if(len>1)
  	{
  		for(i = 0; i < len ; i++)
  		{
  			if(frm[i].checked==true)
  			{
  				size++;
  			}
  		}
  		if(size == 0)
  		{
  			alert("���õ� ������ �����ϴ�");
  		}
  		else
  		{
  			alert("�����Ͻ� ��ǰ�� ���� �Ǿ����ϴ�");
  		  	document.main.action="/wtg/slidedelete.nhn"
  		    document.main.submit();
  		}
  	}
  }
  function allChk(obj)
  {
  	var chkobj = document.getElementsByName("check");
  	var length = chkobj.length;
  	var check = obj.checked;
  	if(obj.checked==true)
  	{
  		for(var i=0; i<length; i++)
  		{
  			if(chkobj[i].type=="checkbox")
  			{
  				chkobj[i].checked=true;
  			}
  		}
  	}
  	else
  	{
  		for(var i=0; i<length; i++)
  		{
  			if(chkobj[i].type=="checkbox")
  			{
  				chkobj[i].checked=false;
  			}
  		}
  	}
  }
  function allChk2(obj)
  {
  	var chkobj = document.getElementsByName("check2");
  	var length = chkobj.length;
  	var check = obj.checked;
  	if(obj.checked==true)
  	{
  		for(var i=0; i<length; i++)
  		{
  			if(chkobj[i].type=="checkbox")
  			{
  				chkobj[i].checked=true;
  			}
  		}
  	}
  	else
  	{
  		for(var i=0; i<length; i++)
  		{
  			if(chkobj[i].type=="checkbox")
  			{
  				chkobj[i].checked=false;
  			}
  		}
  	}
  }
</script>

<style type="text/css">
body{text-align:center}
.header {font-size:11pt;}
#header {height:140px;}
#admin {text-align:right; color:#ffffff; height:35px; background-image:url('/wtg/img/admin.png');}
#logo {width:950px; height:100px; border: 1px solid black; margin:auto;}

.menu {font-size:11pt; width:950px; text-align:center; margin:auto;}
#menu {width:950px; height:50px; margin-top:5px; background-image:url('/wtg/img/menu.png');}

.section {font-size:13pt; width:950px; margin:auto;}
#section {width:950px; min-height:800px;}
#search {width:950px; margin-top:5px;}
#main_search {width:950px; height:100px;}
#sub_search {width:950px; height:250px; display:none;}
#content {width:950px; min-height:300px; background-image:url('/wtg/img/content.png'); margin-top:5px;}

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
	<div class="header" id="admin">
		<c:choose>
			<c:when test="${sessionScope.memId ne '168456368'}">
				<script>
					alert("���ٱ����� �����ϴ�.");
					location.replace("/wtg/main.nhn");
				</script>
			</c:when>


			<c:otherwise>
				${sessionScope.memId} �����ڴ�
				<a id="logout-btn" onclick="window.location='main.nhn'">
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
�ΰ� �̹��� �ٲٱ�
</div>
	<div class="section" id="content">
		<form name="main" method="post"  enctype="multipart/form-data">
<table>
	<tr>
		<td>
		�����̵� �̹��� ����
		</td>
	</tr>
	<tr>
	  <td>���ϰ��:
	    <input type="text" name="fileaddr">
	  </td>
	  <td>
	    <input type="file" name="upload" />
	  </td>
	  <td>
	    <input type="button" value="�����̵��߰�" onClick="main_Slide()">
	  </td>
	  <tr>
	    <td colsapn="3">
	      	�����̵� ��üüũ<input id="allCheck" type="checkbox" onclick="allChk(this);"/>
	    </td>
	  </tr>
	  <tr>
	    <c:forEach var="list" items="${list}">
		  <td>
			<a href="http://${list.fileaddr}/" target="_parent">
			<img src="/wtg/adminImg/${list.filetime}${list.orgname}" width="100px" height="100px"/>
			</a>
			&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="check" value="${list.no}"/>${list.no}
			&nbsp;&nbsp;&nbsp;
			${list.fileaddr}
		  </td>
		</c:forEach>
	  </tr>
	<tr>
	  <td>
		<input type="button" value="����" onClick="slide_Delete()">
	  </td>
	</tr>
	<tr>
	  <td>
		���ϰ��:<input type="text" name="fileaddr2">
	  </td>
	  <td>
		<input type="file" name="category" />
	  </td>
	  <td>
	    <input type="button" value="ī�װ��߰�" onClick="main_Category()">
	  </td>
	</tr>
	<tr>
	  <td>
	    	ī�װ� ��üüũ<input id="allCheck" type="checkbox" onclick="allChk2(this);"/>
	  </td>
	</tr>
	<tr>
	  <c:forEach var="list2" items="${list2}">
		<td>
		  <a href="http://${list2.fileaddr2}/" target="_parent">
		  <img src="/wtg/categoryimg/${list2.filetime2}${list2.orgname2}" width="100px" height="100px"/>
		  </a>
		  &nbsp;&nbsp;&nbsp;
		  <input type="checkbox" name="check2" value="${list2.no2}"/>${list2.no2}
		  &nbsp;&nbsp;&nbsp;
		  ${list2.fileaddr2}
		</td>
	  </c:forEach>
	</tr>
	<tr>
	  <td>
		<input type="button" value="����" onClick="category_Delete()">
	  </td>
	</tr>
</table>
</form>
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