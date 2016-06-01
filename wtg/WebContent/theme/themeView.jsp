<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
   <title>�׸�����</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link href="./bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
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
  
	<table class="table table-condensed">
		<c:forEach var="list" items="${list}">
		<tr>
			<td>
			${list.nickname}<a style="cursor:pointer;" name="pDel">����</a>
			<br />
			${list.content}
			</td>
		</tr>
		</c:forEach>
		
		<table id="commentTable" class="table table-condensed"></table>
		
		<tr>
			<td>
				<span class="form-inline" role="form">
 				<p>
				<div class="form-group">
					${sessionScope.memId} ${sessionScope.memName}
				</div>
				
				<div class="form-group">
					<button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">Ȯ��</button>
				</div>
				</p>
					<textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
					</span>
			</td>
		</tr>
	</table>
<!--
	<table class="table table-condensed">
		<thead>
			<tr>
				<td>
					<span style='float:right'>
						<button type="button" id="list" class="btn btn-default">���</button>
						<button type="button" id="modify" class="btn btn-default">����</button>
						<button type="button" id="delete" class="btn btn-default">����</button>
						<button type="button" id="write" class="btn btn-default">�۾���</button>
					</span>
				</td>
			</tr>
		</thead>
	</table>
-->
  
  
  	 <script>
		$(function(){
			//���� �ϴܿ� �ִ� depth1�� ����� �ٴ� �̺�Ʈ
			$("#commentParentSubmit").click(function( event ) {
                                   
			//ajax�� �����ϰ� �����ϸ� ������ �����͸� ������ �־�� �ϴµ� ���⼭�� �׽�Ʈ�� �׳� �Է°��� ������
			
			var pText = $("#commentParentText");
                                   
			if($.trim(pText.val())==""){
				alert("������ �Է��ϼ���.");
 				pText.focus();
				return;
			}
            
			var comment = pText.val();
			alert(comment);
			var commentParentText = '<tr id="r1" name="commentParentCode">'+
									 '<td colspan=2>'+
                                     '<strong>${sessionScope.memName}</strong><a style="cursor:pointer;" name="pDel">����</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                     '</td>'+
                                     '</tr>';
                                   
                                //���̺��� tr�ڽ��� ������ tr �ڿ� ���δ�. ������ ���̺� �ȿ� tr�� ���δ�.
			if($('#commentTable').contents().size()==0){
				$('#commentTable').append(commentParentText);
			}else{
				$('#commentTable tr:last').after(commentParentText);
			}
                                   
			$("#commentParentText").val("");
			
			alert("1");

			alert("2");
			
			var mid = ${memId};
			alert(mid);
			var bnum = ${dto.no};
			alert(bnum);
	
			alert("3");
			
			$.ajax({
				type: "POST",
				url: "/wtg/sendComment.nhn",
				data: {
					num: bnum,
					id: mid,
					text: comment
				},
				async: true,
				success: function(){
					alert("post-success");
				},
				error: function(){
					alert("post-error");
				},
				complete: function(){
					alert("post-complete");
				}
			});
                                   
		});
                               
		//��۸�ũ�� �������� ������ â�� �ѷ��ִ� �̺�Ʈ, ������ũ�� �������� �ش� ����� �����ϴ� �̺�Ʈ
		$(document).on("click","table#commentTable a", function(){//�������� ��ư�� ���� ��� ó�� ���
                                   
			if($(this).attr("name")=="pDel"){
				if (confirm("���� �����Ͻðڽ��ϱ�?") == true){    //Ȯ��
                                           
					var delComment = $(this).parent().parent();
					var nextTr = delComment.next();
					var delTr;
					//���(depth1)�� ���(depth2_1)�� �ִ��� �˻��Ͽ� ����
					while(nextTr.attr("name")=="commentCode"){
						nextTr = nextTr.next();
						delTr = nextTr.prev();//�����ϰ� �ѱ�� �����Ǽ� ���� ������ �������� �������� ����� �ٽ� ������ ������ ã�� ���� ����
						delTr.remove();
					}
                                           
					delComment.remove();
                                           
					}else{   //���
					return;
					}
				}else{
					//�ڱ� �θ��� tr�� �˾Ƴ���.
					var parentElement = $(this).parent().parent();
					//��۴ޱ� â�� ���ش�.
					$("#commentEditor").remove();
					//�θ��� �ϴܿ� ��۴ޱ� â�� ����
					var commentEditor = '<tr id="commentEditor">'+
                                        '<td style="width:1%"> </td>'+
                                        '<td>'+
                                        '<span class="form-inline" role="form">'+
                                        '<p>'+
                                        '<div class="form-group">'+
                                        '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" placeholder="�̸�" maxlength="10">'+
                                        '</div>'+
                                        '<div class="form-group">'+
                                        ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">'+
                                        '</div>'+
                                        '<div class="form-group">'+
                                        '<button type="button" id="commentChildSubmit" class="btn btn-default">Ȯ��</button>'+
                                        '</div>'+
                                        '</p>'+
                                        '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
                                        '</span>'+
                                        '</td>'+
                                        '</tr>';
                                                           
				parentElement.after(commentEditor); 
			}
                                   
		});
		
                               
		$( "#list" ).click(function( event ) {
			location.href='/community/notice';
		});
		$( "#modify" ).click(function( event ) {
			location.href='/community/modify/notice/${community.id}';
		});                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		$( "#delete" ).click(function( event ) {
			location.href='/community/delete/notice/${community.id}';
		});
		$( "#write" ).click(function( event ) {
			location.href='/community/notice/edit';
		});
	});
</script>
</div>
<script>
function commentList(){}
</script>
 </body>