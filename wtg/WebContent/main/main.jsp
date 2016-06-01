<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/CSSreset.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/als_demo.css" />
<link rel="stylesheet" type="text/css" href="/wtg/lib/example.css">
<link rel="stylesheet" type="text/css" href="/wtg/lib/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/yoonho.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/mainCss.css" />
<jsp:useBean id="Api" class="api.lib.Api_Jsp_Client" scope="page"/>
<html>
<head>
<title>main</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/wtg/js/jquery.slides.min.js"></script>
<script src="/wtg/js/vticker.min.js"></script>
<script>
    $(function() {
      $('#slides').slidesjs({
        width: 950,
        
        
        height: 300,
        play: {
          active: true,
          auto: true,
          interval: 5000,
          swap: true
        }
      });
    });
</script>

<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>
<script>
  $.noConflict();
  jQuery( document ).ready(function( $ ) {
		$("#lista1").als({
			visible_items: 3,
			scrolling_items: 1,
			orientation: "horizontal",
			circular: "yes",
			autoscroll: "no",
			interval: 5000,
			speed: 500,
			easing: "linear",
			direction: "right",
			start_from: 0
		});
  });
</script>
<script>
$(document).ready(function(){
	   $('.roll').vTicker();
	   $('#pause').click(function(){
		$this=$(this);
		if($this.text()=='Pause'){
			$('.roll').vTicker('pause',true);
			$this.text('Unpause');
		}
		else{
			$('.roll').vTicker('pause',false);
			$this.text('Pause');
			}
	  });
	 });
	 
<%
	String MyKey="5F5DC3B8-FFFF00AA9";
	String XmlPath="/Users/user1/git/wtg/wtg/WebContent/main/";
	String initRst=Api.Init(MyKey,XmlPath);

	if(initRst=="1"){
		char apiRst=Api.get_today("11010");
		out.print(apiRst);
	}
%>


</script>
<script>
function test_Search()
{
	document.search.action="/wtg/searchaction.nhn"
	document.search.submit();
}
</script>
<p><script>
    // html dom �� �� �ε��� �� ����ȴ�.
    $(document).ready(function(){
        // menu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu �� ȭ��� ���϶��� ���� �ε巴�� ���� �ƴϸ� �Ʒ��� �ε巴�� ��ġ��
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script></p>


</head>
<body>

<div id="wrapper">
<!--������������������������������� ž �����������������������������������-->
<div id="header">
	<div id="info">
		<c:choose>
			<c:when test="${sessionScope.memId ne null}">
				${sessionScope.memName} �� ȯ���մϴ�!  
				<a id="logout-btn" onclick="window.location='logout.nhn'">
					<img src="/wtg/img/logoutBtn.jpg" width="100"/>
				</a>
			</c:when>
			<c:otherwise>
				<a href="http://localhost:8000/wtg/login.nhn">
					<img src="/wtg/img/loginBtn.jpg" width="100"/>
				</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="info2">
		����:${state_ko}
		&nbsp;&nbsp;
		<div class="roll">
		<ul>
			<li>����µ�:${temp}<jsp:include page="weather.jsp" flush="false"/></li>
			<li>�ְ�µ�:${max_temp}<jsp:include page="weather.jsp" flush="false"/></li>
			<li>�����µ�:${min_temp}<jsp:include page="weather.jsp" flush="false"/></li>
			<li>�̼�������:${pm10}</li>
		</ul>
		</div>
	</div>
	<div id="logo">
	<img id="logo_img" src="/wtg/themeImg/${logo}" style="width: 100%; max-width: 250px; height:100%; max-height:100px;"/>
	</div>	
	<div class="dif" id="menu">
		<ul id="main_menu">
		<li>All</li>
		<li><a href="/wtg/themeList.nhn">All</a></li>
		<li><a href="/wtg/themeList.nhn">�������</a></li>
		<li><a href="/wtg/themeList.nhn">����Ʈ</a></li>
		<li><a href="/wtg/themeList.nhn">������</a></li>
		<li><a href="/wtg/themeList.nhn">����</a></li>
		<li><a href="/wtg/recommendMain.nhn">��õ�ڽ�</a></li>
		</ul>
	</div>
</div>
<!--�������������������������������� ž ����������������������������������-->
<div class="dif" id="contents">
	<div id="slider">
	<table width="950">
	<tr>
	  <td>
		<div class="container">
		  <div id="slides">
			<c:forEach var="list" items="${list}">
			  <div class="images" style="display:block">
				<a href="http://${list.fileaddr}/">
				<img src="/wtg/adminImg/${list.filetime}${list.orgname}"  style="width: 100%; max-width: 940px; height:100%; max-height:400px;"/>
				</a>
			  </div>
			</c:forEach>
		  </div>
		</div>
	  </td>
	</tr>
	</table>
	
	</div>

	<div id="search">
		<form name="search" method="post"  enctype="multipart/form-data">
		<input type="text" name="search">&nbsp;<input type="button" value="�˻�" onClick="test_Search()">
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
					<c:forEach var="searchlist" items="${searchlist}">
					�̸� : <b>${searchlist.s_name}</b>
					��ȣ : <b>${searchlist.num}</b>
					</c:forEach>
			</ul>
		</div>
		</form>
	</div>
	<c:if test="${count==0}">
	<div id="theme">
		<table>
			<tr>
			  <td>
				<section id="content">
				  <div id="lista1" class="als-container">
					<span class="als-prev"><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						  <li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						  </li>
						  <li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						  </li>
						  <li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						  </li>
						  <li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						  </li>
					  </ul>
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
				  </div>
				</section>
			  </td>
			</tr>
		</table>
	</div>
	</c:if>
	<c:if test="${count==1}">
	<div id="theme">
		<table>
			<tr>
			  <td>
				<section id="content">
				  <div id="lista1" class="als-container">
					<span class="als-prev"><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						<c:forEach var="list2" items="${list2}">
						  <li class="als-item">
							<a href="http://">
							<img src="/wtg/save/${list2.file_savname}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
							</a>
						  </li>
						</c:forEach>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						</li>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						</li>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						</li>
					  </ul>
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
				  </div>
				</section>
			  </td>
			</tr>
		</table>
	</div>
	</c:if>
	<c:if test="${count==2}">
	<div id="theme">
		<table>
			<tr>
			  <td>
				<section id="content">
				  <div id="lista1" class="als-container">
					<span class="als-prev"><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						<c:forEach var="list2" items="${list2}">
						  <li class="als-item">
							<a href="http://">
							<img src="/wtg/save/${list2.file_savname}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
							</a>
						  </li>	
						</c:forEach>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						</li>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						</li>
					  </ul>
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
				  </div>
				</section>
			  </td>
			</tr>
		</table>
	</div>
	</c:if>
	<c:if test="${count==3}">
	<div id="theme">
		<table>
			<tr>
			  <td>
				<section id="content">
				  <div id="lista1" class="als-container">
					<span class="als-prev"><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						<c:forEach var="list2" items="${list2}">
						  <li class="als-item">
							<a href="http://">
							<img src="/wtg/save/${list2.file_savname}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
							</a>
						  </li>	
						</c:forEach>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							�ڽ��� ����� �ּ���
							</a>
						</li>
					  </ul>
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
				  </div>
				</section>
			  </td>
			</tr>
		</table>
	</div>
	</c:if>
	<c:if test="${count>=4}">
	<div id="theme">
		<table>
			<tr>
			  <td>
				<section id="content">
				  <div id="lista1" class="als-container">
					<span class="als-prev"><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
					<div class="als-viewport">
					  <ul class="als-wrapper">
						<c:forEach var="list2" items="${list2}">
						  <li class="als-item">
							<a href="themeView.nhn?no=${list2.no}&currentPage=1"> 
							 <img src="/wtg/save/${list2.file_savname}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
							</a>
						  </li>	
						</c:forEach>
					  </ul>					  
					</div>
					<span class="als-next"><img src="/wtg/adminImg/thin_right_arrow_333.png" alt="next" title="next" /></span>
				  </div>
				</section>
			  </td>
			</tr>
		</table>
	</div>
	</c:if>
	<div id="themeadd">
		<a href="courseInput.nhn">
			<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
		</a>
	</div>
	<div id="review">
		<ol>
		<c:forEach var="comment" items="${comment}">
		 	<li><a href="/wtg/themeView.nhn?no=${comment.board_num}&currentPage=1">${comment.content}</a>
		</c:forEach>
		</ol>
	</div>
</div>
<!--������������������������������� ���� ����������������������������������-->
<div id="footer">
	<div class="dif" id="link">
	<a href="http://localhost:8000/wtg/login.nhn">ȸ��Ұ�</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">������</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">����Ʈ��</a>
	</div>
	<div class="dif" id="company">
	company
	</div>
</div>
<!--������������������������������� ���� ����������������������������������-->
</div>
</body>
</html>