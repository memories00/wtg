<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">

.hovergallery img{
-webkit-transform:scale(1.0); /*Webkit: Scale down image to 0.8x original size*/
-moz-transform:scale(1.0); /*Mozilla scale version*/
-o-transform:scale(1.0); /*Opera scale version*/
-webkit-transition-duration: 0.5s; /*Webkit: Animation duration*/
-moz-transition-duration: 0.5s; /*Mozilla duration version*/
-o-transition-duration: 0.5s; /*Opera duration version*/
opacity: 1; /*initial opacity of images*/
margin: 0 10px 5px 0; /*margin between images*/
}

.hovergallery img:hover{
-webkit-transform:scale(0.9); /*Webkit: Scale up image to 1.2x original size*/
-moz-transform:scale(0.9); /*Mozilla scale version*/
-o-transform:scale(0.9); /*Opera scale version*/
opacity: 0.8;
}

</style>
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
<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>

<script>
    $(function() {
    var a=screen.width;
      $('#slides').slidesjs({
        width: a,
        
        
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
	   
	   
	   $('.roll2').vTicker();
	   $('#pause').click(function(){
		$this=$(this);
		if($this.text()=='Pause'){
			$('.roll2').vTicker('pause',true);
			$this.text('Unpause');
		}
		else{
			$('.roll2').vTicker('pause',false);
			$this.text('Pause');
			}
	  });
	   
	   
	 });
	 
	 
<%
	String MyKey="5F5DC3B8-FFFF00AA9";
	//String XmlPath="C:/Users/user1/git/wtg/wtg/WebContent/main/";
	String XmlPath="C:/DATA/XML/";
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


<script>
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
</script>


<script>
	function locationHref(a) {
		var ty = a.getAttribute("id");
		location.href="/wtg/themeList.nhn?cate="+ty;
	}
</script>

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
				<a href="http://127.0.0.1:8000/wtg/login.nhn">
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
	<div id="menu">
		<div id=menu_box>
		<ul id="main_menu">
			<li id="all" onClick="locationHref(this);"><p>All</p></li>
			<li id="�������" onClick="locationHref(this);"><p>�������</p></li>
			<li id="����Ʈ" onClick="locationHref(this);"><p>����Ʈ</p></li>
			<li id="������" onClick="locationHref(this);"><p>������</p></li>
			<li id="����" onClick="locationHref(this);"><p>����</p></li>
			<li id="��õ�ڽ�" onClick="locationHref(this);"><p>��õ�ڽ�</p></li>
		</ul>
		</div>
	</div>
	
	<div id="slider">
		<div class="container">
		  <div id="slides">
			<c:forEach var="list" items="${list}" end="4">
			  <div class="images" style="display:block">
				<a href="courseView.nhn?num=${list.num}">
				<div class="hovergallery">
				<img src="/wtg/adminImg/160516010536c.jpg"  style="width:100%; height:100%; max-height:300px;"/>
				</div>
				</a>
			  </div>
			</c:forEach>
		  </div>
		</div>
	</div>
</div>
<!--�������������������������������� ž ����������������������������������-->
<div class="dif" id="contents">

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
							<img src="/wtg/img/${list2.m_image}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
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
							<img src="/wtg/img/${list2.m_image}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
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
							<img src="/wtg/img/${list2.m_image}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
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
						    <a href="courseView.nhn?num=${list2.num}">
							 <img src="/wtg/img/${list2.m_image}" style="width: 100%; max-width: 200px; height:100%; max-height:300px;"/>
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
	<div id="review" class="roll2">
		<ul>
		<c:forEach var="comment" items="${comment}">
		 	<li><a href="/wtg/themeView.nhn?no=${comment.board_num}&currentPage=1">${comment.content}</a>
		</c:forEach>
		</ul>
	</div>
</div>
<!--������������������������������� ���� ����������������������������������-->
<div id="footer">
	<hr color="gray">
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