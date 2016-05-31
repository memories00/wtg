<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
   <title>테마여행</title>
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
		 	        success: good,	// 페이지요청 성공시 실행 함수
		 	        error: whenError	//페이지요청 실패시 실행함수
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
       <td align="center"><h3>테마여행</h3></td>
     </tr>
   </table>
   <table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td>번호</td>
       <td>${dto.no }</td>
     </tr>
     <tr>
       <td>제목</td>
       <td>${dto.subject }</td>
     </tr>
     <tr>
       <td>글쓴이</td>
       <td>${dto.name }</td>
     </tr>
     <tr>
       <td>내용</td>
       <td>${dto.content }</td>
     </tr>
     <tr>
       <td>조회수</td>
       <td>${dto.readhit}</td>
     </tr>
     <tr>
       <td>이미지</td>
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
          <a href="javascript:open_win('report.nhn?no=${dto.no}','report')">신고!</a>
        </td>
        </tr>
      <tr>
        <td width="200" align="right">
          <input type="button" value="수정" onClick="javascript:location.href='themeM.nhn?no=${dto.no}&currentPage=${currentPage}'">
          <input type="button" value="삭제" onClick="javascript:location.href='del.nhn?no=${dto.no}&currentPage=${currentPage}'">
          <input type="button" value="목록" onClick="javascript:location.href='themeList.nhn?currentPage=${currentPage}'">
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
        <td width="200" align ="center"> 신고!</td>
      </tr>
       <tr>
        <td width="200" align="right">
          <input type="button" value="목록" onClick="javascript:location.href='themeList.nhn?currentPage=${currentPage}'">
        </td>
      </tr>
    </table>
  </c:if>  
  
  
  
<div> 덧글창
  
	<table class="table table-condensed">
		<c:forEach var="list" items="${list}">
		<tr>
			<td>
			${list.nickname}<a style="cursor:pointer;" name="pDel">삭제</a>
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
					<button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
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
						<button type="button" id="list" class="btn btn-default">목록</button>
						<button type="button" id="modify" class="btn btn-default">수정</button>
						<button type="button" id="delete" class="btn btn-default">삭제</button>
						<button type="button" id="write" class="btn btn-default">글쓰기</button>
					</span>
				</td>
			</tr>
		</thead>
	</table>
-->
  
  
  	 <script>
		$(function(){
			//제일 하단에 있는 depth1의 댓글을 다는 이벤트
			$("#commentParentSubmit").click(function( event ) {
                                   
			//ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
			
			var pText = $("#commentParentText");
                                   
			if($.trim(pText.val())==""){
				alert("내용을 입력하세요.");
 				pText.focus();
				return;
			}
            
			var comment = pText.val();
			alert(comment);
			var commentParentText = '<tr id="r1" name="commentParentCode">'+
									 '<td colspan=2>'+
                                     '<strong>${sessionScope.memName}</strong><a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                     '</td>'+
                                     '</tr>';
                                   
                                //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
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
                               
		//답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
		$(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
                                   
			if($(this).attr("name")=="pDel"){
				if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                                           
					var delComment = $(this).parent().parent();
					var nextTr = delComment.next();
					var delTr;
					//댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
					while(nextTr.attr("name")=="commentCode"){
						nextTr = nextTr.next();
						delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
						delTr.remove();
					}
                                           
					delComment.remove();
                                           
					}else{   //취소
					return;
					}
				}else{
					//자기 부모의 tr을 알아낸다.
					var parentElement = $(this).parent().parent();
					//댓글달기 창을 없앤다.
					$("#commentEditor").remove();
					//부모의 하단에 댓글달기 창을 삽입
					var commentEditor = '<tr id="commentEditor">'+
                                        '<td style="width:1%"> </td>'+
                                        '<td>'+
                                        '<span class="form-inline" role="form">'+
                                        '<p>'+
                                        '<div class="form-group">'+
                                        '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">'+
                                        '</div>'+
                                        '<div class="form-group">'+
                                        ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">'+
                                        '</div>'+
                                        '<div class="form-group">'+
                                        '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'+
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