<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
   <title>�׸�����</title>
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   <script type="text/javascript">
   function open_win (url, name) {
		var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=400,height=350");
	}
		var a;
		function callAjax(num){
			a=num;	
		     $.ajax({
		 	        type: "post",
		 	        data: {no:num},
		 	        url : "good.nhn",
		 	        success: good,	// ��������û ������ ���� �Լ�
		 	        error: whenError	//��������û ���н� �����Լ�
		      	}); 
	    }
		function good(data){
			$("#goodCnt"+a).html(data);
		}
		function whenError(){
			alert("error");
		}
		
	    function callAjax2(){
	    	var no= ${dto.no};
	    	$.ajax({
	    		type: "post",
	    		data: {no:no},
	    		url : "hate.nhn",
	    		success: hate,
	    		error: whenError
	    	});
	    }
	    function hate(aaa){
	    	$("#hateCnt").html(aaa);
	    	
	    }
   </script>
</head>


 <body>
   <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td align="center"><h3>�׸�����</h3></td>
     </tr>
   </table>
   <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td>��ȣ</td>
       <td>${dto.no }</td>
     </tr>
     <tr>
       <td>����</td>
       <td>${dto.subject }</td>
     </tr>
     <tr>
       <td>�۾���</td>
       <td>${dto.name }</td>
     </tr>
     <tr>
       <td>����</td>
       <td>${dto.content }</td>
     </tr>
     <tr>
       <td>��ȸ��</td>
       <td>${dto.readhit}</td>
     </tr>
     <tr>
       <td>�̹���</td>
       <td>${dto.file_savname}</td>
     </tr>
    </table>
     
  <c:if test="${memId !=null }">   
    <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
        <td width="200" align ="center" >
          <a href="javascript:callAjax(${dto.no });"><img src="/wtg/img/good.jpg" width="30"></a> <span id="goodCnt${dto.no }">&nbsp;&nbsp;${dto.good}</span>
        </td>
        <td width="200" align ="center">    
          <a href="javascript:callAjax2();"><img src="/wtg/img/hate.jpg" width="30"></a> <span id="hateCnt">&nbsp;&nbsp;${dto.hate}</span>
        </td>
        <td width="200" align ="center">
          <a href="javascript:open_win('report.nhn?no=${dto.no}','report')">�Ű�!</a>
        </td>
        </tr>
      <tr>
        <td width="200" align="right">
          <input type="button" value="����" onClick="javascript:location.href='themeM.nhn?no=${dto.no}&currentPage=${currentPage}'">
          <input type="button" value="����" onClick="javascript:location.href='del.nhn?no=${dto.no}&currentPage=${currentPage}'">
          <input type="button" value="���" onClick="javascript:location.href='themeList.nhn?currentPage=${currentPage}'">
        </td>
      </tr>
    </table>
  </c:if>
  <c:if test="${memId ==null }"> 
    <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
        <td width="200" align ="center" >
         <img src="/wtg/img/good.jpg" width="30">&nbsp;&nbsp;${dto.good}
        </td>
        <td width="200" align ="center">    
         <img src="/wtg/img/hate.jpg" width="30">&nbsp;&nbsp;${dto.hate}
        </td>
        <td width="200" align ="center"> �Ű�!</td>
      </tr>
       <tr>
        <td width="200" align="right">
          <input type="button" value="���" onClick="javascript:location.href='themeList.nhn?currentPage=${currentPage}'">
        </td>
      </tr>
    </table>
  </c:if>  
  
  
  
  <div> ����â
  	<div>
		<c:forEach var="list" items="${list}">
			<div>�����̹���</div> ,<div>�����̸�</div> , <div>�ڸ�Ʈ ����</div>
		</c:forEach>
	</div>
  	<form id="commentWrite" action="/wtg/commentWrite.nhn">
  		<div>
  			<textarea cols="50" rows="2" id="commentText" maxlength="6000"></textarea>
  		</div>
  	</form>
  </div>
  
 </body>