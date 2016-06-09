<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<jsp:useBean id="Api" class="api.lib.Api_Jsp_Client" scope="page"/>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>Barrier- A responsive portfolio and business template</title>

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    <!-- CSS
  ================================================== -->
    <!-- Bootstrap -->
    <link href="sample/assets/css/bootstrap.min.css" rel="stylesheet">
     <!-- Prettyphoto -->
	<link rel="stylesheet" href="sample/css/prettyPhoto.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="sample/css/font-awesome.min.css">
    <!--Line icon font -->
    <link rel="stylesheet" href="sample/css/line-icons.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="sample/css/animate.css">
    <!-- Prettyphoto -->
    <link rel="stylesheet" href="sample/css/prettyPhoto.css">
    <!-- Template styles-->
    <link rel="stylesheet" href="sample/css/style.css">
    <!-- color style -->
    <link rel="stylesheet" href="sample/css/presets/maincolor.css">
    <!-- Responsive styles-->
    <link rel="stylesheet" href="sample/css/responsive.css">
    <!-- circle counter -->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    

<link rel="stylesheet" type="text/css" media="screen" href="/wtg/lib/yoonho.css" />

    <!-- script ================================================================= -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="/wtg/js/vticker.min.js"></script>
<script>

$(function() {
	  $('#example').vTicker('init', {
	    speed: 1000, 
	    pause: 3500,
	    showItems: 1,
	    padding: 4
	  });
	});
</script>
	<script>
		function locationHref(a) {
			var ty = a.getAttribute("id");
			location.href="/wtg/themeList.nhn?cate="+ty;
		}
		function goHome()
		{
			window.location="/wtg/main.nhn";
		}
	</script>
<script>
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
</head>

<body>
<!-- main coding strat -->
    <header id="header">
    	<nav class="navbar navbar-default navbar-fixed-top"  id="tf-menu" style="background-color:rgba(51, 51, 51, 0.7);">
    			<div style="float:right; width:120px; height:50px; color:white;">
			    	<c:choose>
						<c:when test="${sessionScope.memId ne null}">
							${sessionScope.memName} 님
							<a id="logout-btn" onclick="window.location='logout.nhn'">
								<img src="img/logoutBtn.jpg" width="100"/>
							</a>
						</c:when>
						<c:otherwise>
							&nbsp;<br>
							<a href="http://127.0.0.1:8000/wtg/login.nhn">
								<img src="/wtg/img/loginBtn.jpg" width="100"/>
							</a>
						</c:otherwise>
					</c:choose>
    			</div>
    			
			   
    	
    	<div class="container">
    		<div class="row">
    			<div class="navbar-header ">
    				<button class="navbar-toggle collapsed" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse">
    					<span class="sr-only"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    				</button>
    				<a href="#" class="navbar-brand page-scroll">I SEOUL GA U</a>
    			</div> <!-- navabr-header -->

    			<div class="collapse navbar-collapse clearfix" id="bs-example-navbar-collapse-1" role="navigation">
    				<ul class="nav navbar-nav navbar-right">
						<li id="all" onClick="locationHref(this);" style="cursor:hand;"><a>전체보기</a></li>
						<li id="관광명소" onClick="locationHref(this);" style="cursor:hand;"><a>관광명소</a></li>
						<li id="데이트" onClick="locationHref(this);" style="cursor:hand;"><a>데이트</a></li>
						<li id="스포츠" onClick="locationHref(this);" style="cursor:hand;"><a>스포츠</a></li>
						<li id="쇼핑" onClick="locationHref(this);" style="cursor:hand;"><a>쇼핑</a></li>
						<li id="추천코스" onClick="locationHref(this);" style="cursor:hand;"><a>추천코스</a></li>
						<li id="장소별검색" onClick="locationHref(this);" style="cursor:hand;"><a>장소별검색</a></li>
    				</ul>
    			</div>
    		</div> <!-- row end -->
    	</div> <!-- container end -->
    	</nav> <!-- nav end -->
    </header>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="sample/assets/js/bootstrap.min.js"></script>
    <!-- initialize jQuery Library -->
    <!-- <script type="text/javascript" src="sample/js/jquery.js"></script>  -->
    <!-- Wow Animation -->
    <script type="text/javascript" src="sample/js/wow.min.js"></script>
    <!-- SmoothScroll -->
    <script type="text/javascript" src="sample/js/smooth-scroll.js"></script>
    <!-- prettyphoto -->
    <script type="text/javascript" src="sample/js/jquery.prettyPhoto.js"></script>
    <!-- Eeasing -->
    <script type="text/javascript" src="sample/js/jquery.easing.1.3.js"></script>
    <!-- Counter -->
    <script type="text/javascript" src="sample/js/jquery.counterup.min.js"></script>
    <!-- Waypoints -->
    <script type="text/javascript" src="sample/js/jquery.waypoints.min.js"></script>
    <!-- Google Map API Key Source -->
    <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <!-- Google Map  Source -->
    <script type="text/javascript" src="sample/js/gmaps.js"></script>
    <script type="text/javascript" src="sample/js/custom.js"></script>
		
</body>
