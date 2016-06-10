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

    <!-- script ================================================================= -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>

<body>
<!-- main coding strat -->
    <header id="header">
    	<nav class="navbar navbar-default navbar-fixed-top"  id="tf-menu" style="background-color:rgba(51, 51, 51, 0.7);">
    			<div style="float:right; width:120px; height:50px; color:white;">
					<c:choose>
						<c:when test="${sessionScope.memId ne '168456368'}">
							<script>
								alert("접근권한이 없습니다.");
								//location.replace("/wtg/main.nhn");
							</script>
						</c:when>
				
						<c:otherwise>
							${sessionScope.memId} 관리자님
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
						<li class="topMenuLi">
							<a class="menuLink" href="http://localhost:8000/wtg/member.nhn">회원 관리</a>
							<ul class="submenu">
								<li><a class="submenuLink" href="http://localhost:8000/wtg/memAdmin.nhn">회원정보 조회</a></li>
								<li><a class="submenuLink" href="http://localhost:8000/wtg/userstats.nhn">이용자 통계</a></li>
							</ul>
						</li>
						<li class="topMenuLi">
							<a class="menuLink" href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 관리</a>
							<ul class="submenu">
								<li><a class="submenuLink" href="http://localhost:8000/wtg/pageAdmin.nhn">페이지 정보 관리</a></li>
								<li><a class="submenuLink" href="http://localhost:8000/wtg/pageDesignAdmin.nhn">디자인 관리</a></li>
							</ul>
						</li>
						<li class="topMenuLi">
							<a class="menuLink" href="http://localhost:8000/wtg/boardAdmin.nhn">게시판 관리</a>
							<ul class="submenu">
								<li><a class="submenuLink" href="http://localhost:8000/wtg/boardAdmin.nhn">게시글 관리</a></li>
								<li><a class="submenuLink" href="http://localhost:8000/wtg/boardReportAdmin.nhn">신고글 관리</a></li>
								<li><a class="submenuLink" href="http://localhost:8000/wtg/boardReplyAdmin.nhn">덧글 관리</a></li>
							</ul>
						</li>
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
