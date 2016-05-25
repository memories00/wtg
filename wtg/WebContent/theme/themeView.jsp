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
  
	<table id="commentTable" class="table table-condensed"></table>
	<table class="table table-condensed">
		<tr>
			<td>
				<span class="form-inline" role="form">
 				<p>
				<div class="form-group">
					<input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="�̸�" maxlength="10">
				</div>
				<div class="form-group">
					<input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">
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
			var pName = $("#commentParentName");
			var pPassword = $("#commentParentPassword");//�н����带 ���� ���״µ� �����ϰ� ���� ������ ��¥�� ������ ����
			var pText = $("#commentParentText");
                                   
			if($.trim(pName.val())==""){
				alert("�̸��� �Է��ϼ���.");
				pName.focus();
 				return;
			}else if($.trim(pPassword.val())==""){
				alert("�н����带 �Է��ϼ���.");
				pPassword.focus();
				return;
			}else if($.trim(pText.val())==""){
				alert("������ �Է��ϼ���.");
 				pText.focus();
				return;
			}
                                   
			var commentParentText = '<tr id="r1" name="commentParentCode">'+
									 '<td colspan=2>'+
                                     '<strong>'+pName.val()+'</strong> '+pPassword.val()+' <a style="cursor:pointer;" name="pAdd">���</a> | <a style="cursor:pointer;" name="pDel">����</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                     '</td>'+
                                     '</tr>';
                                   
                                //���̺��� tr�ڽ��� ������ tr �ڿ� ���δ�. ������ ���̺� �ȿ� tr�� ���δ�.
			if($('#commentTable').contents().size()==0){
				$('#commentTable').append(commentParentText);
			}else{
				$('#commentTable tr:last').after(commentParentText);
			}
                                   
			$("#commentParentName").val("");
			$("#commentParentPassword").val("");
			$("#commentParentText").val("");
			
			sendComment();
                                   
		});
                               
		 //����� ����� �ٴ� �̺�Ʈ
		$(document).on("click","#commentChildSubmit", function(){
                                   
			var cName = $("#commentChildName");
			var cPassword = $("#commentChildPassword");
			var cText = $("#commentChildText");
                                   
			if($.trim(cName.val())==""){
				alert("�̸��� �Է��ϼ���.");
				cName.focus();
				return;
			}else if($.trim(cPassword.val())==""){
				alert("�н����带 �Է��ϼ���.");
				cPassword.focus();
				return;
			}else if($.trim(cText.val())==""){
				alert("������ �Է��ϼ���.");
				cText.focus();
				return;
			}
                                   
			var commentChildText = '<tr name="commentChildCode">'+
                                   '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                   '<td style="width:99%">'+
                                   '<strong>'+cName.val()+'</strong> '+cPassword.val()+' <a style="cursor:pointer;" name="cAdd">���</a> | <a style="cursor:pointer;" name="cDel">����</a>'+
                                   '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                   '</td>'+
                                   '</tr>';
                                                           
			//���� tr��� ã��
			var prevTr = $(this).parent().parent().parent().parent().prev();
			//��� ���� ������ ����
			$("#commentEditor").remove();//���⿡�� ������ ����� ������tr�� �� ã�´�.
                                   
			//����� Ÿ�� �ö󰡸� �θ� tr�� ã��
 			while(prevTr.attr("name")!="commentParentCode"){
				prevTr = prevTr.prev();
			}
			//while�� Ÿ���� üũ
			var check = false;
			//���� ��尡 ���(depth1)�� ������� ã������ next
			var nextTr = prevTr.next();
			//�ڿ� ���(depth1)�� ���(depth2_1)�� ���ٸ� �ٷ� ���δ�.
			if(nextTr.attr("name")!="commentChildCode"){
				prevTr.after(commentChildText);
			}else{
				//���(depth1)�� ���(depth2_n)�� �ִ°�� ���������� ã�´�.
				while(nextTr.attr("name")=="commentChildCode"){
					nextTr = nextTr.next();
					check = true;
				}
			}
                                   
			if(check){//���(depth1)�� ���(depth2_n)�� �ִٸ� �� ���(depth2_n) �ڿ� ���(depth2_n+1) �߰�
				nextTr = nextTr.prev();//while������ �˻��ϴ��� next�� �ѰŰ����� �ٽ� ������ ������
				nextTr.after(commentChildText);
			}
			
			sendComment();
                                   
		});
                               
		//��۸�ũ�� �������� ������ â�� �ѷ��ִ� �̺�Ʈ, ������ũ�� �������� �ش� ����� �����ϴ� �̺�Ʈ
		$(document).on("click","table#commentTable a", function(){//�������� ��ư�� ���� ��� ó�� ���
                                   
			if($(this).attr("name")=="pDel"){
				if (confirm("����� ���� �Ͻø� �ؿ� ��۵� ��� ���� �˴ϴ�. ���� �����Ͻðڽ��ϱ�?") == true){    //Ȯ��
                                           
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
				}else if($(this).attr("name")=="cDel"){
					if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��
						$(this).parent().parent().remove();
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
		
		function sendComment(){
			$.ajax({
				type: "POST",
				url: "/wtg/login.nhn",
				data: {
					name: pName,
					password: pPassword,//�н����带 ���� ���״µ� �����ϰ� ���� ������ ��¥�� ������ ����
					text: pText
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
		}
                               
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
  
 </body>