<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/contents.css"/>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  function logo_Change()
  {
  	document.logo.action="/wtg/logochange.nhn"
  	document.logo.submit();
  }
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

</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div id="header">
	<jsp:include page="/include/adminHeader.jsp" flush="false"/>
</div>

<!--�������������������������������� ž ����������������������������������-->

<div id="ad_contents">

	<div id="ad_section">
		�ΰ� �̹��� �ٲٱ�
		<form name="logo" method="post" enctype="multipart/form-data">
			<div><input type="file" name="logo_upload" /><input type="button" value="�ΰ���" onClick="logo_Change()"></div>
		</form>
		<img src=/>*�ΰ�� ���� 950px ���� 100px�� ũ���� �̹����� �־��ּ���.
	</div>
	
	<div id="ad_section">
	�׸� �� �ٲٱ�
	</div>
	
	<div id="ad_section">
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
	  <td>
		<input type="button" value="����" onClick="category_Delete()">
	  </td>
	</tr>
</table>
</form>
	</div>
</div>

<!--������������������������������� ���� ����������������������������������-->
<div id="ad_footer">
	<jsp:include page="/include/baseFooter.jsp" flush="false"/>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>

</body>
</html>