<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/mainCss.css" />
<html>
<head>
<title>신고접수</title>
</head>
<link rel="stylesheet" type="text/css" href="/wtg/lib/font.css">
<body>
<center>
<div style="width:300px; height:100px; padding:10px; text-align:center; border:1px solid gray;">
<div style="width:100px; height:100px; margin:0 auto; border:1px solid red;">
      TOP
</div>
</div>
</center>
<br />
<div id="layer_fixed">
    <table cellspacing="0" cellpadding="0" style="width:100%; height:100%;">
    <tr>
       <td style="vertical-align:middle; padding-left: 0px; padding-right: 20px;">
       <img id="logo_img" src="/wtg/themeImg/logo.png" style="width: 100%; max-width: 250px; height:100%; max-height:71px;"/>
       </td>
       <td>
       	<div id="menu">
		<div id=menu_box>
		<ul id="main_menu">
			<li id="all" onClick="locationHref(this);"><p>All</p></li>
			<li id="관광명소" onClick="locationHref(this);"><p>관광명소</p></li>
			<li id="데이트" onClick="locationHref(this);"><p>데이트</p></li>
			<li id="스포츠" onClick="locationHref(this);"><p>스포츠</p></li>
			<li id="쇼핑" onClick="locationHref(this);"><p>쇼핑</p></li>
			<li id="추천코스" onClick="locationHref(this);"><p>추천코스</p></li>
		</ul>
		</div>
	</div>
       </td>
       <td>
       sdfadfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
       </td>
    </tr>
    </table>
    <br /><br /><br />
    </div>
  <table align="center" width="700" border="0px" cellspacing="0" cellpadding="0">
    <tr>
	  <td align="center"><h3>신고접수</h3></td>
	</tr>
  </table>
  <table align="center" width="900" border="1px" cellspacing="0" cellpadding="0" bordercolor="#E2E2C7">
    <tr align="center">
      <td width="100" height="50">번호</td>
      <td width="400" height="50">제목</td>
      <td width="130" height="50">신고자</td>
      <td width="80" height="50">신고 날짜</td>
      <td wudth="80" height="50">처리 상태</td>
    </tr>
 <c:forEach var="list" items="${list}">
    <tr align="center">
      <td height="50">${list.num}</td>
      <td align="left" height="50"><a href="reportView.nhn?num=${list.num}">${list.subject}</a></td>
      <td align="center" height="50">${list.id }</td>
      <td align="center" height="50"><fmt:formatDate value="${list.regdate}" pattern="MM.dd"/></td>
  
  <c:if test="${list.process==0}">
      <td align="center" height="50">미 확 인</td>
  </c:if> 
  <c:if test="${list.process==1}">
      <td align="center" height="50">확 인 중</td>
  </c:if>
  <c:if test="${list.process==2}">
      <td align="center" height="50">삭제 완료</td>
  </c:if>
  <c:if test="${list.process==3}">
      <td align="center" height="50">처리 완료</td>
  </c:if>   
    </tr>
 </c:forEach>
 <c:if test="list.size() <= 0">
				
	<tr bgcolor="#FFFFFF"  align="center">
	  <td colspan="5">등록된 게시물이 없습니다.</td>
    </tr>						
	<tr bgcolor="#777777">
      <td height="1" colspan="5"></td>
    </tr>
 </c:if>
    <tr align="center">
      <td colspan="5">${pagingHtml}</td>
    </tr>
  </table>
      <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
    <br /><br /><br />
</body>
</html>