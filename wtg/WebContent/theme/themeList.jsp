<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/mainCss.css"/>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<div id=head style="background-color:white;width:100%;height:70px">�̰��� ���</div>

<div id=firstLine style="background-color:silver; width:100%; height:30px; display:table-cell; vertical-align:middle">
	<div style="float:left"><a href="main.nhn">Ȩ</a> ></div>
	<div style="float:left">�׸��� �ڽ� ></div>
	<div style="float:left">${category}</div>
</div>

<div id="alignbutton" style="background-color:pink; align:left">
	<input type="button" value="�ֽż�" onClick="javascript:location.href='themeList.nhn?cate=${category}'">
    <input id="readBtn" type="button" value="��ȸ��" onClick="javascript:location.href='themeList.nhn?cate=${category}&a=1'">
    <input id="goodBtn" type="button" value="��õ��" onClick="javascript:location.href='themeList.nhn?cate=${category}&a=2'"></td>
</div>

<div id="list" style="background-color:skyblue; align:left">
    <c:forEach var="list" items="${list}">
   		<a href="courseView.nhn?num=${list.num}"> 
	      	<div id="image" >
	      		<img src="http://127.0.0.1:8000/wtg/img/${list.m_image}" style="width:80px; heigth:80px"/>
	      	</div>
	       	<div>
		       	<div>
		       		���� : ${list.subject}
		       	</div>
	        	<div>
	       			��ȸ�� : ${list.readhit}&nbsp;&nbsp;&nbsp;����� : <fmt:formatDate value="${list.regdate}" type="date"/>
	       		</div>
	       		<div>
	       			���� : 
	       			<!-- ǥ�õǴ� ���� ���ڼ��� �����Ѵ� -->
		    		<c:choose> 
			   			<c:when test="${fn:length(list.content) > 40}">
				          	<c:out value="${fn:substring(list.content,0,39)}"/>....
			   			</c:when>
			   			<c:otherwise>
			   				<c:out value="${list.content}"/>
			   			</c:otherwise>
					</c:choose>
	       		</div>
	       		<div>
	       			�±� : ${list.hashtag}
	       		</div>
	       	</div>
	    </a> 
   </c:forEach>
</div>
 
<div>${pagingHtml}</div>
 
