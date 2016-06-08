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
    <script src="/wtg/js/vticker.min.js"></script>
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
    			<div style="float:right; width:120px; height:50px;">
			    	<c:choose>
						<c:when test="${sessionScope.memId ne null}">
							${sessionScope.memName} 님
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
    			
			    <div style="float:left; width:172px; height:55px; color:white; overflow: hidden" >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					지역:${state_ko}
					&nbsp;&nbsp;
					<div class="roll">
					<ul style="color:white;">
						<li>현재온도:${temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>최고온도:${max_temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>최저온도:${min_temp}<jsp:include page="weather.jsp" flush="false"/></li>
						<li>미세먼지농도:${pm10}</li>
					</ul>
					</div>
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

	<!-- main slider start -->
	<section id="slider" class="slider">
		<div class="overlay"></div>
		<div id="main-slide" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators visible-lg visible-md">
			  	<li data-target="#main-slide" data-slide-to="0" class="active"></li>
			    <li data-target="#main-slide" data-slide-to="1"></li>
			    <li data-target="#main-slide" data-slide-to="2"></li>
			</ol><!--/ Indicators end-->
			
			<!-- Carousel inner -->
			<div class="carousel-inner">
			    <div class="item active">
			    	<img class="img-responsive" src="adminImg/160516010536c.jpg" alt="slider" style="height:700px; width:100%;">
			    </div><!--/ Carousel item end -->

				<c:forEach var="list" items="${list}" end="4">
					<div class="item">
						<a href="courseView.nhn?num=${list.num}">
							<img class="img-responsive" src="adminImg/160516010536c.jpg" alt="slider" style="height:700px; width:100%;">
						</a>
					</div>
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
							<input type="text" name="search" style="width:80%;">&nbsp;<input type="button" value="검색" onClick="test_Search()">
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
				<c:if test="${count==0}">
				    <div class='col-lg-12'>
				      <div class="carousel slide" id="portfolio-carousel">
				        <div class="carousel-inner">
				          	<div class="item  active">
				            	<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
											        	<a href="themeWrite.nhn?currentPage=1" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>등록된 코스가 없습니다.</h3>
											        <p>코스를 등록해주세요!</p>
										    	</div>
										    </div>
										    <img src="categoryimg/bt.JPG" alt="portfolio" style="height:360px;">
										</div>
									</div>          
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg2.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Sunlight Shine</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="adminImg/160516010536c.jpg" alt="portfolio" style="height:360px;">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="images/portfolio/portfolio-bg3.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>All Quiet Western</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio3.jpg" alt="portfolio">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>The GodFather</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio4.jpg" alt="portfolio">
										</div>
									</div>
				            	</div>
				          	</div><!--/ Item active end -->
							<div class="item">
					            <div class="row">
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio5.jpg" alt="portfolio">
										</div>
									</div>          
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio6.jpg" alt="portfolio">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio7.jpg" alt="portfolio">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-3">   
										<div class="thumbnail">
										    <div class="caption">
										    	<div class="caption-content">
											    	<span>
														<a data-rel="prettyPhoto" href="sample/images/portfolio/portfolio-bg1.jpg">
														    <i class="fa fa-search"></i>              
														</a>
											        	<a href="#" class=""><i class="fa fa-link"></i></a>
											        </span>
											        <h3>Creative Vision</h3>
											        <p>Effektive is more than your average agency.</p>
										    	</div>
										    </div>
										    <img src="sample/images/portfolio/portfolio8.jpg" alt="portfolio">
										</div>
									</div>
					            </div>
				          	</div><!--/ Item end -->
				        </div><!-- Carousel inner end -->
							
							<div class="barrier-carousel-controller">
						        <a data-slide="prev" href="#portfolio-carousel" class="left"><i class="fa fa-chevron-left"></i></a>
						        <a data-slide="next" href="#portfolio-carousel" class="right"><i class="fa fa-chevron-right"></i></a>
					    	</div><!-- Controller end -->
				      </div><!-- Carousel end -->                          
				    </div><!-- Main Col end -->
				</c:if>
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
                        	<h6>Reply</h6>
	                        <div class="facts-wrap-num">
								<div class="roll2">
									<ul>
										<c:forEach var="comment" items="${comment}">
										 	<li><a href="/wtg/themeView.nhn?no=${comment.board_num}&currentPage=1">${comment.content}</a>
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
						<ul class="socail-list list-inline">
							<li><a href="#"><i class="fa fa-facebook wow fadeInLeft" data-wow-delay=".2s"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter wow fadeInLeft" data-wow-delay=".4s"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus wow fadeInLeft" data-wow-delay=".6s"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin wow fadeInLeft" data-wow-delay=".8s"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble wow fadeInLeft" data-wow-delay="1s"></i></a></li>
							<li><a href="#"><i class="fa fa-rss wow fadeInLeft" data-wow-delay="1.1s"></i></a></li>
						</ul>
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
	<!-- footer end -->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="sample/assets/js/bootstrap.min.js"></script>
    <!-- initialize jQuery Library -->
    <script type="text/javascript" src="sample/js/jquery.js"></script>
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