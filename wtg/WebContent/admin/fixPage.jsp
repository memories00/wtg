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
			alert("선택하신 파일이 삭제 되었습니다");
  		  	document.main.action="/wtg/categorydelete.nhn"
  		    document.main.submit();
  	}
  	else if(frm.checked==false)
  	{
  			alert("선택된 파일이 없습니다");
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
  			alert("선택된 파일이 없습니다");
  		}
  		else
  		{
  			alert("선택하신 파일이 삭제 되었습니다");
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
			alert("선택하신 파일이 삭제 되었습니다");
  		  	document.main.action="/wtg/slidedelete.nhn"
  		    document.main.submit();
  	}
  	else if(frm.checked==false)
  	{
  			alert("선택된 파일이 없습니다");
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
  			alert("선택된 파일이 없습니다");
  		}
  		else
  		{
  			alert("선택하신 상품이 삭제 되었습니다");
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
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="header">
	<jsp:include page="/include/adminHeader.jsp" flush="false"/>
</div>

<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div id="ad_contents">

	<div id="ad_section">
		로고 이미지 바꾸기
		<form name="logo" method="post" enctype="multipart/form-data">
			<div><input type="file" name="logo_upload" /><input type="button" value="로고변경" onClick="logo_Change()"></div>
		</form>
		<img src=/>*로고는 가로 950px 세로 100px의 크기의 이미지를 넣어주세요.
	</div>
	
	<div id="ad_section">
	테마 색 바꾸기
	</div>
	
	<div id="ad_section">
		<form name="main" method="post"  enctype="multipart/form-data">
<table>
	<tr>
		<td>
		슬라이드 이미지 변경
		</td>
	</tr>
	<tr>
	  <td>파일경로:
	    <input type="text" name="fileaddr">
	  </td>
	  <td>
	    <input type="file" name="upload" />
	  </td>
	  <td>
	    <input type="button" value="슬라이드추가" onClick="main_Slide()">
	  </td>
	  <tr>
	    <td colsapn="3">
	      	슬라이드 전체체크<input id="allCheck" type="checkbox" onclick="allChk(this);"/>
	    </td>
	  </tr>

	<tr>
	  <td>
		<input type="button" value="삭제" onClick="category_Delete()">
	  </td>
	</tr>
</table>
</form>
	</div>
</div>

<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 바텀 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="ad_footer">
	<jsp:include page="/include/baseFooter.jsp" flush="false"/>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>

</body>
</html>