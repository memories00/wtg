<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/spring/js/jquery-1.8.2.min.js"></script>
<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
</style>
<script>
function test_Search()
{
	document.search.action="/spring/searchaction.nhn"
	document.search.submit();
}
</script>
<p><script>
    // html dom �� �� �ε��� �� ����ȴ�.
    $(document).ready(function(){
        // menu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu �� ȭ��� ���϶��� ���� ������� ���� �ƴϸ� �Ʒ��� ������� ��ġ��
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script></p>

<html>
<body>
<form name="search" method="post"  enctype="multipart/form-data">
<input type="text" name="search"><input type="button" value="�˻�" onClick="test_Search()">
<div>
    <ul>
        <li class="menu">
        	<a><input type="button" value="�󼼰˻�"></a>
        	<ul class="hide">
                <li>
					�ƿ���<input type="checkbox" name="check" value="1"/>
					Ƽ����<input type="checkbox" name="check" value="2"/>
					����<input type="checkbox" name="check" value="3"/>
					�Ź�<input type="checkbox" name="check" value="4"/>
					����<input type="checkbox" name="check" value="5"/>
					����<input type="checkbox" name="check" value="6"/>
				</li>
			</ul>
		</li>
	</ul>
</div>
<br />
=================================
<br />
�˻���� :
	    <c:forEach var="list" items="${list}">
			${list.ou}
		</c:forEach>
	    <c:forEach var="listou" items="${listou}">
			${listou.ou}
		</c:forEach>
		<c:forEach var="listts" items="${listts}">
			${listts.ts}
		</c:forEach>
		<c:forEach var="listst" items="${listst}">
			${listst.st}
		</c:forEach>
		<c:forEach var="listsin" items="${listsin}">
			${listsin.sin}
		</c:forEach>
		<c:forEach var="listga" items="${listga}">
			${listga.ga}
		</c:forEach>
		<c:forEach var="listhat" items="${listhat}">
			${listhat.hat}
		</c:forEach>
</form>
</body>
</html>