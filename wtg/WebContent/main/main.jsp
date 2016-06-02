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
<script type="text/javascript" src="/wtg/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/wtg/js/jquery.als-1.7.min.js"></script>

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
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 부드럽게 접고 아니면 아래로 부드럽게 펼치기
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
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 탑 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="header">
	<div id="info">
		<c:choose>
			<c:when test="${sessionScope.memId ne null}">
				${sessionScope.memName} 님 환영합니다!  
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
		지역:${state_ko}
		&nbsp;&nbsp;
		<div class="roll">
		<ul>
			<li>현재온도:${temp}<jsp:include page="weather.jsp" flush="false"/></li>
			<li>최고온도:${max_temp}<jsp:include page="weather.jsp" flush="false"/></li>
			<li>최저온도:${min_temp}<jsp:include page="weather.jsp" flush="false"/></li>
			<li>미세먼지농도:${pm10}</li>
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
			<li id="관광명소" onClick="locationHref(this);"><p>관광명소</p></li>
			<li id="데이트" onClick="locationHref(this);"><p>데이트</p></li>
			<li id="스포츠" onClick="locationHref(this);"><p>스포츠</p></li>
			<li id="쇼핑" onClick="locationHref(this);"><p>쇼핑</p></li>
			<li id="추천코스" onClick="locationHref(this);"><p>추천코스</p></li>
		</ul>
		</div>
	</div>
	
	<div id="slider">
		<div class="container">
		  <div id="slides">
			<c:forEach var="list" items="${list}">
			  <div class="images" style="display:block">
				<a href="http://${list.fileaddr}/">
				<img src="/wtg/adminImg/${list.filetime}${list.orgname}"  style="width:100%; height:100%; max-height:300px;"/>
				</a>
			  </div>
			</c:forEach>
		  </div>
		</div>
	</div>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 탑 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
<div class="dif" id="contents">

	<div id="search">
		<form name="search" method="post"  enctype="multipart/form-data">
		<input type="text" name="search">&nbsp;<input type="button" value="검색" onClick="test_Search()">
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
							코스를 등록해 주세요
							</a>
						  </li>
						  <li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							코스를 등록해 주세요
							</a>
						  </li>
						  <li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							코스를 등록해 주세요
							</a>
						  </li>
						  <li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							코스를 등록해 주세요
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
							코스를 등록해 주세요
							</a>
						</li>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							코스를 등록해 주세요
							</a>
						</li>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							코스를 등록해 주세요
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
							코스를 등록해 주세요
							</a>
						</li>
						<li class="als-item">
							<a href="/wtg/themeWrite.nhn?currentPage=1">
							<img src="/wtg/categoryimg/bt.JPG" style="width: 100%; max-width: 200px; height:100%; max-height:270px;"/>
							코스를 등록해 주세요
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
							코스를 등록해 주세요
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
	<div id="review" class="roll2">
		<ul>
		<c:forEach var="comment" items="${comment}">
		 	<li><a href="/wtg/themeView.nhn?no=${comment.board_num}&currentPage=1">${comment.content}</a>
		</c:forEach>
		</ul>
	</div>
</div>
<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 바텀 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<div id="footer">
	<hr color="gray">
	<div class="dif" id="link">
	<a href="http://localhost:8000/wtg/login.nhn">회사소개</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">고객센터</a> &nbsp;
	<a href="http://localhost:8000/wtg/login.nhn">사이트맵</a>
	</div>
	<div class="dif" id="company">
	company
	</div>
</div>
<!--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 바텀 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
</div>
</body>
</html>