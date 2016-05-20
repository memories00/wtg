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
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
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
<input type="text" name="search"><input type="button" value="검색" onClick="test_Search()">
<div>
    <ul>
        <li class="menu">
        	<a><input type="button" value="상세검색"></a>
        	<ul class="hide">
                <li>
					아웃터<input type="checkbox" name="check" value="1"/>
					티셔츠<input type="checkbox" name="check" value="2"/>
					셔츠<input type="checkbox" name="check" value="3"/>
					신발<input type="checkbox" name="check" value="4"/>
					가방<input type="checkbox" name="check" value="5"/>
					모자<input type="checkbox" name="check" value="6"/>
				</li>
			</ul>
		</li>
	</ul>
</div>
<br />
=================================
<br />
검색결과 :
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