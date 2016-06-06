<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/contents.css"/>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	function locationHref(a) {
		var ty = a.getAttribute("id");
		location.href="/wtg/themeList.nhn?cate="+ty;
	}
</script>
<script type="text/javascript">
        $(document).ready(function(){ // 
	      $("#readBtn").click(function(){
	          callAjax();
	      });
	    });
        
		function callAjax(){
			var a=1;
		     $.ajax({
		 	        type: "post",
		 	        data: {a:a},
		 	        url : "themeList.nhn",
		 	        success: list,		//��������û ������ ���� �Լ�
		 	        error: whenError	//��������û ���н� �����Լ�
		      	}); 
	    }
		function list(data){
			$("#list").html(data);
		}
		
		$(document).ready(function(){  
		      $("#goodBtn").click(function(){
		          callAjax2();
		      });
		});
		
		function callAjax2(){
			var a=2
			 $.ajax({
			 		type: "post",
			 	    data: {a:a},
			 	    url : "themeList.nhn",
			 	    success: list2,		// ��������û ������ ���� �Լ�
			 	    error: whenError	//��������û ���н� �����Լ�
			   	}); 
		}
		function list2(data){
			$("#list2").html(data);
		}
		
		function whenError(){
			alert("error");
		}
</script>

<!-- --------------------------------------------------------------------------------- -->
<div id="wrapper">
<div id="bs_header">
	<jsp:include page="/include/baseHeader.jsp" flush="false"/>
</div>
<div id="tl_contents">
<div id="tl_firstLine">
	<div style="float:left">Ȩ ></div>
	<div style="float:left">�׸��� �ڽ� ></div>
	<div style="float:left">${category}</div>
</div>

<div id="tl_list">
   <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="right"><input type="button" value="�ֽż�" onClick="javascript:location.href='themeList.nhn'">
                        <input id="readBtn" type="button" value="��ȸ��" >
                        <input id="goodBtn" type="button" value="��õ��"></td>
    </tr>
  </table>
  
  
  <table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
      <tr align="left">
        <td colspan="5">
    	  <input type="button" value="�۾���" onClick="javascript:location.href='themeWrite.nhn?currentPage=${currentPage}'">
		</td>
      </tr>
  	</table> 
   
  <table align="center" width="800" border="0" cellspacing="0" cellpadding="0">
   <tr>
   <td>
   <hr width="81%">
    <c:forEach var="list" items="${list}">
   	 <a href="themeView.nhn?no=${list.no}&currentPage=${currentPage}"> 
	    <table  id="table" align="center" width="650" cellspacing="0" cellpadding="0">
	   	 <tr><td>
		    <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
	     		<tr>
	      			<td rowspan="2" width="150"><img src="/wtg/save/${list.file_savname }" width="150"></td>
	       			<td><h4>&nbsp;&nbsp;&nbsp;${list.subject}</h4></td>
			      	<td align="right">��õ��:${list.good }</td>
			     	<td align="right">${list.readhit}&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${list.regdate}" type="date"/></td>
			    </tr>
	    		<tr>
	      			
					<!-- ǥ�õǴ� ���� ���ڼ��� �����Ѵ� -->
	      			<td colspan="3"><p>&nbsp;&nbsp;&nbsp;
	      			<c:choose>
	      				<c:when test="${fn:length(list.content) > 40}">
			            	<c:out value="${fn:substring(list.content,0,39)}"/>....
	      				</c:when>
	      				<c:otherwise>
	      					<c:out value="${list.content}"/>
	      				</c:otherwise>
					</c:choose>
					</p></td>
					
	    		</tr>
   			</table>
  		 </td></tr>
   		</table>
     </a> <hr width="81%">
   </c:forEach>
   <br/>
  </td>
  </tr>
    <tr align="center">
     <td>${pagingHtml}</td>
    </tr>
  </table>
</div>
</div>
<div id="bs_footer">
	<jsp:include page="/include/baseFooter.jsp" flush="false"/>
</div>
</div>
