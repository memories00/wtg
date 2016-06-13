<%@ page contentType="text/html;charset=euc-kr" language="java" %>
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
$(document).ready(function(){
 
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
	function move(name)
	{
		alert("�Ծ�");
		window.location="courseView?num="+name;
	}
		function locationHref(a) {
			var ty = a.getAttribute("id");
			var enStr=encodeURI(encodeURIComponent(ty));
			location.href="/wtg/themeList.nhn?cate="+enStr;
		}
		function goHome()
		{
			window.location="/wtg/main.nhn";
		}
	</script>
<script>
<%
	String MyKey="5F5DC3B8-FFFF00AA9";
	String XmlPath="C:/Users/user1/git/wtg/wtg/WebContent/main/";
	//String XmlPath="C:/DATA/XML/";
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
	alter("1");
	document.search.action="searchaction.nhn"
	document.search.submit();
}
</script>
	
  </head>
  <body>
    <!-- main coding strat -->
    <header id="header">
    	<nav class="navbar navbar-default navbar-fixed-top"  id="tf-menu" style="background-color:rgba(51, 51, 51, 0.7);">
    			<div style="float:right; width:120px; height:50px; color:white;">
			    	<c:choose>
						<c:when test="${sessionScope.memId ne null}">
							${sessionScope.memName} ��
							<a id="logout-btn" onclick="window.location='logout.nhn'">
								<img src="img/logoutBtn.jpg" width="100"/>
							</a>
						</c:when>
						<c:otherwise>
							&nbsp;<br>
							<a href="/wtg/login.nhn">
								<img src="/wtg/img/loginBtn.jpg" width="100"/>
							</a>
						</c:otherwise>
					</c:choose>
    			</div>
    			
			    <div style="float:left; width:172px; height:55px; color:white; overflow: hidden" >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					����:${state_ko}
					&nbsp;&nbsp;
					<div id="example">
					<ul style="color:white;">
						<li>����µ�:${temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>�ְ�µ�:${max_temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>�����µ�:${min_temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>�̼�������:${pm10}</li>
					</ul>
					</div>
				</div>
    	
    	<div class="container">
    		<div class="row">
    			<div class="navbar-header " >
    				<button class="navbar-toggle collapsed" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse">
    					<span class="sr-only"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    				</button>
    				<a href="main.nhn" class="navbar-brand page-scroll"><img src="http://192.168.50.69:8000/wtg/img/logo.png" style="width:550px;height:100px;"></a>
    			</div> <!-- navabr-header -->

    			<div class="collapse navbar-collapse clearfix" id="bs-example-navbar-collapse-1" role="navigation">
    				<ul class="nav navbar-nav navbar-right">
						<li id="all" onClick="locationHref(this);" style="cursor:hand;"><a>��ü����</a></li>
						<li id="�������" onClick="locationHref(this);" style="cursor:hand;"><a>�������</a></li>
						<li id="����Ʈ" onClick="locationHref(this);" style="cursor:hand;"><a>����Ʈ</a></li>
						<li id="������" onClick="locationHref(this);" style="cursor:hand;"><a>������</a></li>
						<li id="����" onClick="locationHref(this);" style="cursor:hand;"><a>����</a></li>
						<li id="��õ�ڽ�" onClick="locationHref(this);" style="cursor:hand;"><a>��õ�ڽ�</a></li>
						<li id="��Һ��˻�" onClick="locationHref(this);" style="cursor:hand;"><a>��Һ��˻�</a></li>
    				</ul>
    			</div>
    		</div> <!-- row end -->
    	</div> <!-- container end -->
    	</nav> <!-- nav end -->
    </header>

	<!-- main slider start -->
	<section id="slider" class="slider">
		
		<div id="main-slide" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators visible-lg visible-md">
			  	<li data-target="#main-slide" data-slide-to="0" class="active"></li>
			    <li data-target="#main-slide" data-slide-to="1"></li>
			    <li data-target="#main-slide" data-slide-to="2"></li>
			    <li data-target="#main-slide" data-slide-to="3"></li>
			    <li data-target="#main-slide" data-slide-to="4"></li>
			</ol><!--/ Indicators end-->
			
			<!-- Carousel inner -->
			<div class="carousel-inner">
			<c:forEach var="list" items="${list}" end="0">
			    <div class="item active">
			    	<img class="img-responsive" src="http://192.168.50.69:8000/wtg/img/${list.m_image}" alt="slider" style="height:700px; width:100%;">
			    </div><!--/ Carousel item end -->
			</c:forEach>
				<c:forEach var="list" items="${list}" end="4" varStatus="i">
					<c:if test="${i.count>=2}">
					<div class="item" onclick="move(${list.num})">
						<a href="courseView.nhn?num=${list.num}">
							<img class="img-responsive" src="http://192.168.50.69:8000/wtg/img/${list.m_image}" alt="slider" style="height:700px; width:100%;">
						</a>
					</div>
					</c:if>
				</c:forEach><!--/ Carousel item end -->
			</div><!-- Carousel inner end-->
			
			<!-- Controllers -->
			<a class="left carousel-control" href="#main-slide" data-slide="prev">
		    	<span><i class="fa fa-angle-left"></i></span>
			</a>
			<a class="right carousel-control" href="#main-slide" data-slide="next">
		    	<span><i class="fa fa-angle-right"></i></span>
			</a>
		</div><!--/ Carousel end --> 

	</section>
	<!-- main slider end -->

	<!-- Service section Start -->

	<section id="service" class="service">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-desc text-center">
						<div class="header-content">
							<h3 class="big-title">Search</h3>
						</div>
						<div class="searchBox">
							<form action="searchaction.nhn">
								<input type="text" name="search" style="width:80%;">&nbsp;
								<input type="submit" value="�˻�">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>  <!-- container end -->
	</section>
	<!-- Service section End -->
	
	<!-- Section work start -->
	<section id="work">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="header-desc text-center">
							<div class="header-content">
								<h3 class="big-title">My Course</h3>
							</div>
						</div>
					</div>
				<div class='row wow fadeInUp'>
				    <div class='col-lg-12'>
				      <div class="carousel slide" id="portfolio-carousel">
				        <div class="carousel-inner">
				          	<div class="item  active">
				            	<div class="row">
					            	<c:choose>
										<c:when test="${sessionScope.memId ne null}">
											<c:if test="${count<=3}">
												<c:forEach var="i" begin="1" end="${4-count}" step="1">   
												<div class="col-xs-12 col-sm-6 col-md-3">   
													<div class="thumbnail">
													    <div class="caption">
													    	<div class="caption-content">
														    	<span>
																	
														        	<a href="courseInput.nhn" class=""><i class="fa fa-link"></i></a>
														        </span>
														        <h3>��ϵ� �ڽ��� �����ϴ�.</h3>
														        <p>�ڽ��� ������ּ���!111111</p>
													    	</div>
													    </div>
													    <img src="categoryimg/bt.JPG" alt="portfolio" style="height:360px;">
													</div>
												</div>
												</c:forEach>
												 
												<c:forEach var="list2" items="${list2}">
													<div class="col-xs-12 col-sm-6 col-md-3">   
														<div class="thumbnail">
														    <div class="caption">
														    	<div class="caption-content">
															    	<span>
																		<a data-rel="prettyPhoto" onclick="window.open('http://192.168.50.69:8000/wtg/img/${list2.m_image}','����Ȯ��','width:100,height:100');return false;">
																		    <i class="fa fa-search"></i>              
																		</a>
															        	<a href="courseView.nhn?num=${list2.num}" class=""><i class="fa fa-link"></i></a>
															        </span>
															        <h3>${list2.category}</h3>
															        <p>${list2.subject}</p>
														    	</div>
														    </div>
														    <img src="http://192.168.50.69:8000/wtg/img/${list2.m_image}" alt="portfolio" style="height:360px;">
														</div>
													</div>
												</c:forEach>
											</c:if>
											
								          	<c:if test="${count>=4}">
											<div class="item">
									            <div class="row">
													<c:forEach var="list2" items="${list2}">
													<div class="col-xs-12 col-sm-6 col-md-3">   
														<div class="thumbnail">
														    <div class="caption">
														    	<div class="caption-content">
															    	<span>
															    		<a data-rel="prettyPhoto"  onclick="window.open('http://192.168.50.69:8000/wtg/img/${list2.m_image}','����Ȯ��','width:100,height:100');return false;">
																		    <i class="fa fa-search"></i>              
																		</a>
															        	<a href="courseView.nhn?num=${list2.num}" class=""><i class="fa fa-link"></i></a>
															        </span>
															        <h3>${list2.category}</h3>
															        <p>${list2.subject}</p>
														    	</div>
														    </div>
														    <img src="http://192.168.50.69:8000/wtg/img/${list2.m_image}" alt="portfolio" style="height:360px;">
														</div>
													</div>
												</c:forEach>
									            </div>
								          	</div><!--/ Item end -->
								          	</c:if>
											
										</c:when>
										<c:otherwise>
											<c:forEach var="i" begin="1" end="4" step="1">   
												<div class="col-xs-12 col-sm-6 col-md-3">   
													<div class="thumbnail">
													    <div class="caption">
													    	<div class="caption-content">
														    	<span>				
														        	<a href="login.nhn" class=""><i class="fa fa-link"></i></a>
														        </span>
														        <h3>��ϵ� �ڽ��� �����ϴ�.</h3>
														        <p>�ڽ��� ������ּ���!</p>
													    	</div>
													    </div>
													    <img src="categoryimg/bt.JPG" alt="portfolio" style="height:360px;">
													</div>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>								
				            	</div>
				          	</div><!--/ Item active end -->
				        </div><!-- Carousel inner end -->
							
							<div class="barrier-carousel-controller">
						        <a data-slide="prev" href="#portfolio-carousel" class="left"><i class="fa fa-chevron-left"></i></a>
						        <a data-slide="next" href="#portfolio-carousel" class="right"><i class="fa fa-chevron-right"></i></a>
					    	</div><!-- Controller end -->
				      </div><!-- Carousel end -->                          
				    </div><!-- Main Col end -->
		  		</div><!--/  row end -->
			</div><!--/ Main row end -->
		</div><!--/ Container end -->
	</section>
	<!-- section portfolio end-->

	<!-- Counter start -->
	<section id="counter-area">
        <div class="container">
             <div class="facts">
                    <div class="facts-wrap">
                            <div class="facts-wrap-num">
								<div class="roll2">
									<ul>
										<c:forEach var="comment" items="${comment}">
										 	<li><a href="/wtg/courseView.nhn?num=${comment.board_num}">${comment.content}</a></li>
										</c:forEach>
									</ul>
								</div>
	                        </div>
                    </div>

            </div> <!-- Conatainer End -->
        </div>	<!-- Fact div ENd -->
	</section>
	<!-- Counter end -->

	<!-- footer start -->

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="footer-desc text-center">
						<div class="logo wow fadeInDown">Team name</div>
					</div>
				</div>
			</div><!-- row end -->
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="copyright-info m20">
&copy; Copyright 2016 KH Class F Team 3. 
        			</div>
				</div>
			</div><!--/ Row end -->

			<div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top affix">
			 	<a href="#slider" class="page-scroll">
					<button class="btn btn-primary" title="Back to Top"><i class="fa fa-angle-double-up"></i></button>
				</a>
			</div>
		</div><!-- container end -->
	</footer>
	<c:if test="${sessionScope.memId eq '168456368'}">
		<div id="admin" style="position:fixed; float:right; bottom:0px; width:200px; height:30px; background-color:gray; color:white; text-align:center;">
			<a href="admin.nhn">������ �������� �̵�</a>
		</div>
	</c:if>
	<!-- footer end -->


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
</html>