<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
		 	        success: list,	// ��������û ������ ���� �Լ�
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
			 	    success: list2,	// ��������û ������ ���� �Լ�
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

<div id=category style="width:100%;height:30px;background-color:silver">
	<font size="4"><b>&nbsp;&nbsp;�׸��� �ڽ� > ${category}</b></font>
</div>

<div id="list" style="background-color:pink"><div id="list2">
   <table align="center" width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="orange">
    <tr>
      <td align="right"><input type="button" value="�ֽż�" onClick="javascript:location.href='themeList.nhn'">
                        <input id="readBtn" type="button" value="��ȸ��" >
                        <input id="goodBtn" type="button" value="��õ��"></td>
    </tr>
  </table>
  
  
  <table align="center" width="600" border="0" cellspacing="0" cellpadding="2" bgcolor=yellow>
      <tr align="left">
        <td colspan="5">
    	  <input type="button" value="�۾���" onClick="javascript:location.href='themeWrite.nhn?currentPage=${currentPage}'">
		</td>
      </tr>
  	</table> 
   
  <table align="center" width="1000" border="0" cellspacing="0" cellpadding="0" bgcolor=skyblue>
   <tr>
   <td>
    <c:forEach var="list" items="${list}">
   	 <a href="themeView.nhn?no=${list.no}&currentPage=${currentPage}"> 
	    <table align="center" width="650" border="1" cellspacing="0" cellpadding="0" bgcolor=gold>
	   	 <tr><td>
		    <table align="center" width="600" border="0" cellspacing="0" cellpadding="0" bgcolor=white>
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
     </a> 
   </c:forEach>
   <br/>
  </td>
  </tr>
    <tr align="center">
     <td>${pagingHtml}</td>
    </tr>
  </table>
</div></div>