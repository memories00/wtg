<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/CSSreset.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/als_demo.css" />
<link rel="stylesheet" type="text/css" href="/wtg/lib/example.css">
<link rel="stylesheet" type="text/css" href="/wtg/lib/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/yoonho.css" />
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
        width: 940,
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



<style type="text/css">
body{text-align:center}
.header {font-size:11pt;}
#header {height:140px;}
#info {text-align:right; height:35px; background-image:url('/wtg/img/info.png');}
#logo {width:950px; height:100px; border: 1px solid black; margin:auto;}

.menu {font-size:11pt; width:950px; text-align:center; margin:auto;}
#menu {width:950px; height:50px; margin-top:5px; background-image:url('/wtg/img/menu.png');}

.section {font-size:13pt; width:950px; margin:auto;}
#section {width:950px; min-height:800px; border:1px solid black;}
#search {width:950px; margin-top:5px;}
#main_search {width:950px; height:100px;}
#sub_search {width:950px; height:250px; display:none;}
#content {width:950px; margin-top:5px; border:1px solid black;}

.box {width:230px; height:320px; margin-left:6px; float:left; background-image:url('/wtg/img/box.png');}
#theme {width:950px; height:350px;}
.roll {margin-left:40px;}

.footers {font-size:11pt;}
#footers {margin-top:5px; margin-bottom:5px; background-image:url('/wtg/img/footer.png');}
#f_link {height:60px; width:950px; margin:auto;}

#wrapper {min-width:950px; border: 1px solid black; margin:auto;}

</style>
</head>
<body>

<div id="wrapper">
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div class="header" id="header">
		<div class="header" id="info">
		<c:choose>
		<c:when test="${sessionScope.memId ne null}">
			${sessionScope.memId} 님 환영합니다!  
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

	<div class="header" id="logo">
	로고로고로고로고로고로고로로고고고고고고로로로로ㅗ로
	</div>
</div>

<div class="menu" id="menu">
	메뉴
</div>

<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->

<div class="section" id="section">
	<div class="section" id="content">
		<table width="900">
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
	<tr>
	  <td>
		<section id="content">
		  <div id="lista1" class="als-container">
			<span class="als-prev"><img src="/wtg/adminImg/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
			<div class="als-viewport">
			  <ul class="als-wrapper">
				<c:forEach var="list2" items="${list2}">
				  <li class="als-item">
					<a href="http://${list2.fileaddr2}/">
					<img src="/wtg/categoryimg/${list2.filetime2}${list2.orgname2}" style="width: 100%; max-width: 100px; height:100%; max-height:100px;"/>
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

	<div class="section" id="search">
		<div class="section" id="main_search">
		<a>상세 검색</a>
		</div>
		<div class="section" id="sub_search">
		</div>
	</div>

	<div class="section" id="theme">
		<div class="box" >박스1</div>
		<div class="box" >박스2</div>
		<div class="box" >박스3</div>
		<div class="box" >
			지역:${state_ko}
			<div class="roll">
			<ul>
				<li>현재온도:${temp}<jsp:include page="weather.jsp" flush="false"/></li>
				<li>최고온도:${max_temp}<jsp:include page="weather.jsp" flush="false"/></li>
				<li>최저온도:${min_temp}<jsp:include page="weather.jsp" flush="false"/></li>
				<li>미세먼지농도:${pm10}</li>
			</ul>
			</div>
		</div>
	</div>
</div>

<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 바텀 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div class="footer" id="footers">
	<div class="footers" id="f_link">
	<a href="http://localhost:8000/wtg/login.nhn">회사소개</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">고객센터</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">사이트맵</a>
	</div>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>

</body>
</html>