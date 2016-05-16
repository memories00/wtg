<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
     <title>테마여행</title>
   </script>
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   <script type="text/javascript">


        $(document).ready(function(){ // 
	      $("#button").click(function(){
	          callAjax();
	      });
	    });
        
		function callAjax(){
			var a=1;
		     $.ajax({
		 	        type: "post",
		 	        data: {a:a},
		 	        url : "themeList.nhn",
		 	        success: list,	// 페이지요청 성공시 실행 함수
		 	        error: whenError	//페이지요청 실패시 실행함수
		      	}); 
	    }
		function list(data){
			$("#list").html(data);
		}
		function whenError(){
			alert("error");
		}
		$(document).ready(function(){ // 
		      $("#button2").click(function(){
		          callAjax2();
		      });
		    });
			function callAjax2(){
				var a=2
			     $.ajax({
			 	        type: "post",
			 	        data: {a:a},
			 	        url : "themeList.nhn",
			 	        success: list2,	// 페이지요청 성공시 실행 함수
			 	        error: whenError	//페이지요청 실패시 실행함수
			      	}); 
		    }
			function list2(data){
				$("#list2").html(data);
			}
   </script>

</head>
<div id="list"><div id="list2">
 <body >

   <table align="center" width="600" border="0" cellspacing="0" cellpadding="0" >
  
    <tr>
      <td align="right"><input type="button" value="최신순" onClick="javascript:location.href='themeList.nhn'">
                        <input id="button" type="button" value="조회순" >
                        <input id="button2" type="button" value="추천순"></td>
    </tr>
  </table>
  <table align="center" width="600" border="0" cellspacing="0" cellpadding="2" >
      <tr align="left">
        <td colspan="5">
    	  <input type="button" value="글쓰기" onClick="javascript:location.href='themeWrite.nhn?currentPage=${currentPage}'">
		</td>
      </tr>
  	</table> 
   <table align="center" width="1000" border="0" cellspacing="0" cellpadding="0">
   <tr>
   <td>
    <c:forEach var="list" items="${list}">
    <a href="themeView.nhn?no=${list.no}&currentPage=${currentPage}"> 
    <table align="center" width="650" border="1" cellspacing="0" cellpadding="0" bgcolor="#FAF4C0">
    <tr><td>
    <table align="center" width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#FAF4C0">
    
     <tr>
       <td rowspan="2" width="150"><img src="/spring/save/${list.file_savname }" width="150"></td>
       <td><h4>&nbsp;&nbsp;&nbsp;${list.subject}</h4></td>
       <td align="right">추천수:${list.good }</td>
       <td align="right">${list.readhit}&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${list.regdate}" type="date"/></td>
     </tr>
     <tr>
       <td colspan="3"><p>&nbsp;&nbsp;&nbsp;${list.content }</p></td>
     </tr>
    </a> 
    </table>
    </td></tr>
   </table>
   <br/>
   </c:forEach>
   
  </td>
  </tr>
    <tr align="center">
     <td>${pagingHtml}</td>
    </tr>
  </table>
</div></div>
  </body>
